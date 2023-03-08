package com.solponge.web.view.main;

import com.solponge.domain.JobScrap.InfScrapVO;
import com.solponge.domain.JobScrap.JobScrapService;
import com.solponge.domain.JobScrap.companyScrapVO;
import com.solponge.domain.jobinfo.JopInfoService;

import com.solponge.domain.member.MemberVo;
import com.solponge.domain.member.impl.MemberServiceImpl;
import com.solponge.domain.product.productService;
import com.solponge.web.view.login.session.SessionConst;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/com.solponge")
public class HomeController {

   private final MemberServiceImpl memberService;
   private final productService productService;
    private final JopInfoService jopinfoService;
    private final JobScrapService jobscrapService;

    @GetMapping("/main")
    public String homeLogin(@SessionAttribute(name = SessionConst.LOGIN_MEMBER,required = false) MemberVo loginMember, Model model){
        model.addAttribute("member",loginMember);
        model.addAttribute("getproductNewTop8List", productService.getproductNewTop8List());
        model.addAttribute("getproductpopularTop8List", productService.getproductpopularTop8List());
        model.addAttribute("getJopInfoNewTop8List", jopinfoService.getJopInfoNewTop8List());
        try{
            Long userNo = loginMember.getMEMBER_NO();
            System.out.println(userNo);
            String id = loginMember.getMEMBER_ID();
            System.out.println(id);
            if(id !=null) {
                System.out.println("비교시작");
                List<companyScrapVO> cvo = jobscrapService.getcompanyScrapVOScrapList(userNo);
                List<InfScrapVO> ivo = jobscrapService.getinfoScrapVOScrapList(userNo);
                Map<String, String> params_company = new HashMap<>();
                Map<String, String> params_info = new HashMap<>();
                for(companyScrapVO c :cvo){
                    params_company.put("response_"+c.getCompanyName(), c.getCompanyName());
                }
                for(InfScrapVO c :ivo){
                    params_info.put("response_"+c.getInfoname(), c.getInfoname());
                }
                model.addAttribute("JobScrap", params_company);
                model.addAttribute("JobScrap2", params_info);
            }
        }catch (Exception e){
            System.out.println("오류발생");
        }
        return "main";
    }
    @GetMapping("/join")
    String getJoin(@ModelAttribute("member") MemberVo member){
        return "member/joinForm";
    }

    @PostMapping("/join")
    public String postJoin(@Validated @ModelAttribute("member") MemberVo member, BindingResult bindingResult){
        log.info("member={}",member);
        if(bindingResult.hasErrors()){
            return "member/joinForm";
        }

        combineString(member); //문자열 합치기 주소,이메일,폰

        Long join = memberService.join(member);
        log.info("joinedMember={}",join);
        return "member/addComplete";
    }



    private static void combineString(MemberVo member) {
        String address = member.getMEMBER_ADDRESS1() + "/" + member.getMEMBER_ADDRESS2() + "/" + member.getMEMBER_ADDRESS3();
        member.setMEMBER_ADDRESS(address);

        String email = member.getMEMBER_EMAIL1() +"@"+ member.getMEMBER_EMAIL2();
        member.setMEMBER_EMAIL(email);

        String phone = member.getMEMBER_PHONE1() + "-" + member.getMEMBER_PHONE2() + "-" + member.getMEMBER_PHONE3();
        member.setMEMBER_PHONE(phone);
    }




}
