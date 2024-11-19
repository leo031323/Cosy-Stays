package com.unam.poo.services.Province;

import com.unam.poo.models.Province;

import java.util.List;

public interface ProvinceService {
    List<Province> findAll();
    void deleteProvinceById(Long id);
    Province getProvinceById(Long id);
    Province saveProvince(Province province);

}
