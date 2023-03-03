package com.solponge.domain.JobScrap.impl;

import com.solponge.domain.JobScrap.JobScrapVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class JobScrapDAO {
    @Autowired
    SqlSessionTemplate sqlSession;

    public void insertJobScrap_company(JobScrapVO vo){
        System.out.println("===> Spring JDBC로 insertJobScrap_company() 기능 처리");
        System.out.println(vo.getCompanyName());
        System.out.println(vo.getMember_No());
        Map<String, Object> param = new HashMap<>();
        param.put("MEMBER_NO", vo.getMember_No());
        param.put("companyName", vo.getCompanyName());
        sqlSession.insert("collection_of_sql_job_scrap.insert_scrap_company", param);
    }

    public void deleteJobScrap_company(Long MEMBER_NO, String companyName){
        System.out.println("===> Spring JDBC로 deleteJobScrap_company() 기능 처리");
    }

    public void insertJobScrap_infoname(JobScrapVO vo){
        System.out.println("===> Spring JDBC로 insertJobScrap_infoname() 기능 처리");
    }

    public void deleteJobScrap_infoname(Long MEMBER_NO, String infoname){
        System.out.println("===> Spring JDBC로 deleteJobScrap_infoname() 기능 처리");
    }

    public List<JobScrapVO> getJobScrapList(Long MEMBER_NO){
        System.out.println("===> Spring JDBC로 getJobScrapList() 기능 처리");
        Map<String, Object> param = new HashMap<>();
        param.put("MEMBER_NO", MEMBER_NO);
        return sqlSession.selectList("collection_of_sql_job_scrap.selected_scrap", param);
    }
}
