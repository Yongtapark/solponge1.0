package com.solponge.domain.JobScrap;

import java.util.List;

public interface JobScrapService {
    // CRUD
    void insertJobScrap_company(JobScrapVO vo);

    void insertJobScrap_infoname(JobScrapVO vo);

    void deleteJobScrap_company(Long MEMBER_NO, String companyName);

    void deleteJobScrap_infoname(Long MEMBER_NO, String infoname);

    List<JobScrapVO> getJobScrapList(Long MEMBER_NO);
}
