package com.environment.mypuls.mapper;

import com.environment.mypuls.entity.TEquipmentInfo2;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author niuchen
 * @since 2017-10-27
 */
public interface TEquipmentInfo2Mapper extends BaseMapper<TEquipmentInfo2> {

    List<TEquipmentInfo2> getTEquipmentInfo(Map<String,Object> map);
}