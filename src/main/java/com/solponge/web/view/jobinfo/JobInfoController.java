package com.solponge.web.view.jobinfo;
import java.sql.Date;

import com.solponge.domain.JobScrap.JobScrapService;
import com.solponge.domain.JobScrap.JobScrapVO;
import com.solponge.domain.jobinfo.JopInfoService;
import com.solponge.domain.jobinfo.JopInfoVo;
import com.solponge.domain.member.MemberVo;
import com.solponge.domain.member.impl.MemberServiceImpl;
import com.solponge.domain.product.productService;
import com.solponge.web.view.login.session.SessionConst;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;


@Controller
@Slf4j
@RequiredArgsConstructor
@RestController
public class JobInfoController {
    @Autowired
    JobScrapService jss;

    @PostMapping("/scrap/company")
    public void scrapCompany(@RequestBody JobScrapVO jobscrapvO) {
        System.out.println("컨트롤러: " + jobscrapvO.getCompanyName());
        System.out.println("컨트롤러: " + jobscrapvO.getMember_No());
        jss.insertJobScrap_company(jobscrapvO);
    }

//    @PostMapping("/abandoned/tag")
//    public void abandonedTag(@RequestBody myData abandonedAnimal) {
//        System.out.println("컨트롤러: " + abandonedAnimal.getMyData());
//
//    }
}

@Data
class myData{
    private String myData;
}


