package com.solponge.domain.jobinfo.impl;

import com.solponge.domain.jobinfo.JopInfoVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class jobInfoDAO {

    @Autowired
    SqlSessionTemplate sqlSession;

    public List<JopInfoVo> getJopInfosearchlist(String SearchSelect, String SearchValue) {
        System.out.println("===> Spring JDBC로 getJopInfosearchlist() 기능 처리");
        System.out.println(SearchSelect);
        System.out.println(SearchValue);
        Map<String, Object> param = new HashMap<>();
        switch (SearchSelect){
            case "all":
                param.put("SearchValue", SearchValue);
                break;
            case "JopInfo_COMPANYNAME":
                param.put("SearchValue", SearchValue);
                break;
            case "JopInfo_FTAGLIST":
                param.put("SearchValue", SearchValue);
                break;
            case "JopInfo_WORKTYPE":
                param.put("SearchValue", SearchValue);
                break;
        }
        return sqlSession.selectList("collection_of_sql_job_info.Searchlist_"+SearchSelect, param);
    }

    //CRUD
    public List<JopInfoVo> getJopInfoList() {
        System.out.println("===> Spring JDBC로 getJopInfoList() 기능 처리");
        return sqlSession.selectList("collection_of_sql_job_info.list");
    }
    public List<JopInfoVo> getJopInfoNewTop8List() {
        System.out.println("===> Spring JDBC로 getJopInfoNewTop8List() 기능 처리");
        return sqlSession.selectList("collection_of_sql_job_info.list_new_8");
    }
    public JopInfoVo getJopInfo(int infonum){
        System.out.println("===> Spring JDBC로 getJopInfo() 기능 처리");
        Map<String, Object> param = new HashMap<>();
        param.put("infonum", infonum);
        return sqlSession.selectOne("collection_of_sql_job_info.infonum", param);
    }

}
