package com.example.mbboard.service;

import java.util.Map;

import com.example.mbboard.dto.ConnectCount;

public interface IRootService {
	
	//Map<String,Integer> 반환
	//모든 전체 카운트 (누적)
	//멤버 접속카운트(누적)
	String getConnectDateByKey(ConnectCount cc);
	int addConnectCount(ConnectCount cc);
	int modifyConnectCount(ConnectCount cc);
	Map<String, Integer> getConnectCountAll();
	Map<String, Integer> getConnectCountToday();
}
