// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'echo_sub_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EchoSubStatImpl _$$EchoSubStatImplFromJson(Map<String, dynamic> json) =>
    _$EchoSubStatImpl(
      id: (json['id'] as num?)?.toInt(),
      hp: json['hp'] as String?,
      atk: json['atk'] as String?,
      def: json['def'] as String?,
      hpPercent: json['hp_percent'] as String?,
      atkPercent: json['atk_percent'] as String?,
      defPercent: json['def_percent'] as String?,
      critRate: json['crit_rate'] as String?,
      critDmg: json['crit_dmg'] as String?,
      energyRegen: json['energy_regen'] as String?,
      resonanceSkillDmgBonus: json['resonance_skill_dmg_bonus'] as String?,
      basicAtkDmgBonus: json['basic_atk_dmg_bonus'] as String?,
      heavyAtkDmgBonus: json['heavy_atk_dmg_bonus'] as String?,
      resonanceLiberationDmgBonus:
          json['resonance_liberation_dmg_bonus'] as String?,
    );

Map<String, dynamic> _$$EchoSubStatImplToJson(_$EchoSubStatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hp': instance.hp,
      'atk': instance.atk,
      'def': instance.def,
      'hp_percent': instance.hpPercent,
      'atk_percent': instance.atkPercent,
      'def_percent': instance.defPercent,
      'crit_rate': instance.critRate,
      'crit_dmg': instance.critDmg,
      'energy_regen': instance.energyRegen,
      'resonance_skill_dmg_bonus': instance.resonanceSkillDmgBonus,
      'basic_atk_dmg_bonus': instance.basicAtkDmgBonus,
      'heavy_atk_dmg_bonus': instance.heavyAtkDmgBonus,
      'resonance_liberation_dmg_bonus': instance.resonanceLiberationDmgBonus,
    };
