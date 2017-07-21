//
//  ViewController.swift
//  STOMPwithStarScream
//
//  Created by Je.vinci.Inc on 2017. 6. 20..
//  Copyright © 2017년 Je.vinci.Inc. All rights reserved.
//

import UIKit
import StompClient
import Starscream


class ViewController: UIViewController {
    var cs: StompClient!
    var ws: WebSocket!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://192.168.0.33:8080/chat")!
        let url1 = URL(string: "http://server.jevinci.io/FootPrintMaps/")
        ws = WebSocket(url: url)
        ws.headers["jwt-header"] = "eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6WyJST0xFX1VTRVIiXSwiaXNzIjoiY3AiLCJleHAiOjE1MDA1Mzk5OTgsImVtYWlsIjoiaG9wZWNoaW5nc0BuYXZlci5jb20ifQ.U0RB2KKulEOFoqLG03X80lohw_r-Bpen68UrBUh20qU"

        cs = StompClient(url: url)
        ws.delegate = self
        cs.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func first(_ sender: Any) {
        ws.connect()
    }
    @IBAction func second(_ sender: Any) {
        let scribestr = "SUBSCRIBE\nid:sub-33\ndestination:/topic/chats.12\n\n\u{0}"
        let bye = "SUBSCRIBE\nid:sub-33\ndestination:/topic/locations.12\n\n\u{0}"
        ws.write(string: bye)
        ws.write(string: scribestr)
    }
    @IBAction func third(_ sender: Any) {
        let str = "SEND\ndestination:/app/chats/12\n\n{\"nickname\":\"\",\"content\":\"송형수천재\",\"lat\":\"127.0111\",\"lng\":\"37.1121\"}\u{0}";
        ws.write(string: str)
    }
    @IBAction func fourth(_ sender: Any) {
//        let bye = "SEND\ndestination:/app/bye/123\ncontent-length:15\n\n{\"nickname\":\"\"}\u{0}"
//        ws.write(string: bye)
        let disconnect = "DISCONNECT\n\n\u{0}"
        ws.write(string: disconnect)
//        ws.disconnect();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: WebSocketDelegate{
    func websocketDidConnect(socket: WebSocket) {
        print("connect")
    }
    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        print("get data")
    }
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print(error)
    }
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("get message")
        print(text)
    }
}
extension ViewController: StompClientDelegate{
    public func stompClient(_ client: StompClient, didReceivedData data: Data, fromDestination destination: String) {
        print(data)
    }

    public func stompClient(_ client: StompClient, didErrorOccurred error: NSError) {
        print(error)
    }

    public func stompClientDidConnected(_ client: StompClient) {
        print("success connect")
    }

    
}
