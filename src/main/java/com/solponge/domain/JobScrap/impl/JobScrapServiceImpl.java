package com.solponge.domain.JobScrap.impl;

import com.solponge.domain.JobScrap.JobScrapService;
import com.solponge.domain.JobScrap.JobScrapVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("JobScrapService")
public class JobScrapServiceImpl implements JobScrapService {
    @Autowired
    private com.solponge.domain.JobScrap.impl.JobScrapDAO JobScrapDAO;

    @Override
    public void insertJobScrap_company(JobScrapVO vo) {
        JobScrapDAO.insertJobScrap_company(vo);
    }

    @Override
    public void insertJobScrap_infoname(JobScrapVO vo) {

    }

    @Override
    public void deleteJobScrap_company(Long MEMBER_NO, String companyName) {

    }

    @Override
    public void deleteJobScrap_infoname(Long MEMBER_NO, String infoname) {

    }

    @Override
    public List<JobScrapVO> getJobScrapList(Long MEMBER_NO) {
        return JobScrapDAO.getJobScrapList(MEMBER_NO);
    }
}
