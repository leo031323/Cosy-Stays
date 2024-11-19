package com.unam.poo.services.Province;

import com.unam.poo.models.Province;
import com.unam.poo.repository.ProvinceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvinceServiceImpl implements ProvinceService {

    @Autowired
    private ProvinceRepository provinceRepository;

    @Override
    public List<Province> findAll() {
        return provinceRepository.findAll();
    }

    @Override
    public void deleteProvinceById(Long id) {

    }

    @Override
    public Province getProvinceById(Long id) {
        return provinceRepository.findById(id).get();
    }

    @Override
    public Province saveProvince(Province province) {
        return provinceRepository.save(province);
    }
}

