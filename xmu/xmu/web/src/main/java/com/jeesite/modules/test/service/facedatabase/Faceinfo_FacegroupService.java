package com.jeesite.modules.test.service.facedatabase;

import com.jeesite.common.service.CrudService;
import com.jeesite.modules.test.dao.facedatabase.Faceinfo_FacegroupDao;
import com.jeesite.modules.test.entity.facedatabase.Faceinfo_Facegroup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class Faceinfo_FacegroupService extends CrudService<Faceinfo_FacegroupDao, Faceinfo_Facegroup> {
    @Autowired
    private Faceinfo_FacegroupDao faceinfo_facegroupDao;

    @Transactional(readOnly = false)
    public List<String> findByGroupId(int groupId){
        List<Faceinfo_Facegroup> faceinfo_facegroups=faceinfo_facegroupDao.findByGroupId(groupId);
        List<String> faceinfoIdlist=new ArrayList<>();
        for(Faceinfo_Facegroup faceinfo_facegroup:faceinfo_facegroups){
            faceinfoIdlist.add(faceinfo_facegroup.getFaceinfoId());
        }
        return faceinfoIdlist;
    }
}
