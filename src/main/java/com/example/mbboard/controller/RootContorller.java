package com.example.mbboard.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mbboard.service.IRootService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller

public class RootContorller {
	@Autowired IRootService rootService;
	
	@GetMapping("/index")
	public String index(Model model) {
		
		Map<String, Integer> connectCountMapAll = rootService.getConnectCountAll();
		Map<String, Integer> connectCountMapToday = rootService.getConnectCountToday();
		log.info(connectCountMapAll.toString());
		log.info(connectCountMapToday.toString());
		model.addAttribute("connectCountMapAll", connectCountMapAll);
		model.addAttribute("connectCountMapToday", connectCountMapToday);
		return "index";
	}
}
