package com.solponge.domain.jobinfo;


import java.util.List;

public interface JopInfoService {
    // CRUD
    void insertJopInfo(JopInfoVo vo);

    void updateJopInfo(JopInfoVo vo);

    void deleteJopInfo(int infonum);

    JopInfoVo getJopInfo(int infonum);

    List<JopInfoVo> JopInfosearchlist(String SearchSelect, String SearchValue);
    List<JopInfoVo> getJopInfoList();
    List<JopInfoVo> getJopInfoNewTop8List();
}
