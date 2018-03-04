package com.environment.mypuls.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.environment.mypuls.entity.TEquipmentData2;

import java.util.List;
import java.util.Map;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author niuchen
 * @since 2017-10-25
 */
public interface TEquipmentData2Mapper extends BaseMapper<TEquipmentData2> {

    int insertSelective(TEquipmentData2 record);

    //查询设备,用最新的创建数分组设备
    List<TEquipmentData2> selectEquipmentData(Map<String,Object> map);

    //分页查询历史数据
    List<TEquipmentData2> selectSEquipmentData(Map<String,Object> map);
}