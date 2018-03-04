package com.environment.mypuls.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.environment.mypuls.entity.TEquipmentData;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author niuchen
 * @since 2017-10-25
 */
public interface TEquipmentDataMapper extends BaseMapper<TEquipmentData> {
	// 分页查询历史数据
	List<TEquipmentData> selectSEquipmentData(Map<String,Object> map);
	
	List<TEquipmentData> selectEquipmentData4Chart(Map<String,Object> map);
}