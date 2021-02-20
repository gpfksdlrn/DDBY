package com.cinema.ddby;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{

    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    //웹 소켓 세션을 넣어주는 해시맵
    static Map<String, WebSocketSession> map = new HashMap<String, WebSocketSession>();
   
    static int num=1;
    
    //전역으로 지정해줄 정적 변수(관리자 측에서 답변할 이용자의 웹 소켓을 담는다.)
    static WebSocketSession ws;
    
    static String trash_id="";
    
    //메세지를 보낼때 생성되는 맵
    static Map<String, WebSocketSession> m_map = new HashMap<String, WebSocketSession>();
    
    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        if(num==0) {
        	//가장 먼저 들어오는 웹소켓 세션은 키값이 gwan(관리자)
        	map.put("gwan", session);
        	logger.info("관리자 연결됨", session.getId()); 
        	num = 1;
        }else {
        	//웹소켓 아이디값을 키값으로 넣어서 등록한다.
        	map.put(session.getId(), session);
        	logger.info("{} 연결됨", session.getId()); 
        }
    }
    
    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());

        //메세지를 보낸 세션의 id가 관리자의 세션아이디와 동일할 경우
        if(map.containsKey("gwan")) {
        	if(session.getId()==map.get("gwan").getId()) {
   	    	 if(ws!=null) {
   	    		 ws.sendMessage(new TextMessage(message.getPayload()));
   	    	 }else {
   	    		 map.get("gwan").sendMessage(new TextMessage("존재하지 않는 세션입니다."+trash_id));
   	    	 }
   	     }else {
   	    	 	if(!m_map.containsKey(session.getId())) {
   	    	 		m_map.put(session.getId(), session);
   	    	 	}
   	    		 map.get("gwan").sendMessage(new TextMessage(message.getPayload()+session.getId()));    		 
   	     }
       }else {
    	   session.sendMessage(new TextMessage("상담시간이 종료되었습니다."));
       }
	     
    }
    
    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	if(map.containsKey("gwan")) {
    		if(m_map.containsKey(session.getId())) {
    			map.get("gwan").sendMessage(new TextMessage("===== 퇴장하셨습니다. ====="+session.getId()));
    		}
    	}
    	m_map.remove(session.getId());
    	map.remove(session.getId());
        logger.info("{} 연결 끊김.", session.getId());
    }
}