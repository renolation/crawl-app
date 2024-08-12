// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'echo_main_stat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EchoMainStatEntityImpl _$$EchoMainStatEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$EchoMainStatEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      atk: json['atk'] as String?,
      atkPercent: json['atk_percent'] as String?,
      hp: json['hp'],
      hpPercent: json['hp_percent'] as String?,
      defPercent: json['def_percent'] as String?,
      critRate: json['crit_rate'] as String?,
      critDmg: json['crit_dmg'] as String?,
      healingBonus: json['healing_bonus'] as String?,
      glacioDmgBonus: json['glacio_dmg_bonus'],
      fusionDmgBonus: json['fusion_dmg_bonus'],
      electroDmgBonus: json['electro_dmg_bonus'],
      aeroDmgBonus: json['aero_dmg_bonus'],
      spectroDmgBonus: json['spectro_dmg_bonus'],
      havocDmgBonus: json['havoc_dmg_bonus'],
      energyRegen: json['energy_regen'],
    );

Map<String, dynamic> _$$EchoMainStatEntityImplToJson(
        _$EchoMainStatEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'atk': instance.atk,
      'atk_percent': instance.atkPercent,
      'hp': instance.hp,
      'hp_percent': instance.hpPercent,
      'def_percent': instance.defPercent,
      'crit_rate': instance.critRate,
      'crit_dmg': instance.critDmg,
      'healing_bonus': instance.healingBonus,
      'glacio_dmg_bonus': instance.glacioDmgBonus,
      'fusion_dmg_bonus': instance.fusionDmgBonus,
      'electro_dmg_bonus': instance.electroDmgBonus,
      'aero_dmg_bonus': instance.aeroDmgBonus,
      'spectro_dmg_bonus': instance.spectroDmgBonus,
      'havoc_dmg_bonus': instance.havocDmgBonus,
      'energy_regen': instance.energyRegen,
    };
