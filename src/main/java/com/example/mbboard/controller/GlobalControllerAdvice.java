package com.example.mbboard.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.mbboard.dto.Member;

import jakarta.servlet.http.HttpSession;

@ControllerAdvice
public class GlobalControllerAdvice {

    @ModelAttribute
    public void addLoginMemberToModel(HttpSession session, Model model) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember != null) {
            model.addAttribute("loginMember", loginMember);
        }
    }
}
