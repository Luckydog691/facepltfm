package com.jeesite.modules.test.service;

import com.jeesite.common.service.CrudService;
import com.jeesite.modules.test.dao.ClientDao;
import com.jeesite.modules.test.dao.facedatabase.FaceInfoDao;
import com.jeesite.modules.test.entity.Client;
import com.jeesite.modules.test.entity.Face;
import com.jeesite.modules.test.entity.facedatabase.FaceInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ClientService extends CrudService<ClientDao,Client> {

    @Autowired
    private ClientDao clientDao;

    @Autowired
    private FaceInfoDao faceInfoDao;

    public List<Client> findList(){
        return clientDao.findList();
    }

    public List<FaceInfo> findFaceById(String id){
        return clientDao.findFaceById(clientDao.findClientById(id).getName());
    }

    public void save(Client client){
        Client c=clientDao.findClientById(client.getId());
        List<FaceInfo> faceInfos=faceInfoDao.findByClientName(c.getName());
        for (FaceInfo f:faceInfos) {
            f.setClientid(client.getName());
            faceInfoDao.update(f);
        }
        super.save(client);
    }

    /*public List<Face> getFaceListByGroupId(String id){
        return clientDao.findFaceByGroupId(id);
    }

    public List<Face> getFaceListByClientId(String id){
        return clientDao.findFaceByClientId(id);
    }*/
}
