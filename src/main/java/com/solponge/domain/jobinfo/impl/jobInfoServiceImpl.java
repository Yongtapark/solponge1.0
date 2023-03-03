package com.solponge.domain.jobinfo.impl;

import com.solponge.domain.jobinfo.JopInfoService;
import com.solponge.domain.jobinfo.JopInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("JopInfoService")
public class jobInfoServiceImpl implements JopInfoService {

    @Autowired
    private com.solponge.domain.jobinfo.impl.jobInfoDAO jobinfoDAO;

    @Override
    public void insertJopInfo(JopInfoVo vo){    }

    @Override
    public void updateJopInfo(JopInfoVo vo) {

    }

    @Override
    public void deleteJopInfo(int infonum) {

    }

    @Override
    public JopInfoVo getJopInfo(int infonum) {
        return jobinfoDAO.getJopInfo(infonum);
    }

    @Override
    public List<JopInfoVo> JopInfosearchlist(String SearchSelect, String SearchValue) {
        return jobinfoDAO.getJopInfosearchlist(SearchSelect, SearchValue);
    }

    @Override
    public List<JopInfoVo> getJopInfoList() {
        return jobinfoDAO.getJopInfoList();
    }

    @Override
    public List<JopInfoVo> getJopInfoNewTop8List() {
        return jobinfoDAO.getJopInfoNewTop8List();
    }
}
