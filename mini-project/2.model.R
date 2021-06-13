

library(mlogit)

crashdata = read.csv('mini-project/filtered-data.csv',header = TRUE)

crashdata.wide = mlogit.data(crashdata, shape = "wide", choice = "MAX_SEVERITY_LEVEL")

summary(mlogit(MAX_SEVERITY_LEVEL ~ 1 | 
               
                 AGGRESSIVE_DRIVING +
                 MC_DRINKING_DRIVER + DRINKING_DRIVER + 
                 
                 PED_COUNT + SMALL_VEH_COUNT + MEDIUM_VEH_COUNT + LARGE_VEH_COUNT + 
                 
                 HIT_BRIDGE + HIT_DEER + HIT_EMBANKMENT + HIT_GDRAIL + HIT_GDRAIL_END +
                 HIT_POLE + HIT_TREE_SHRUB +
                 
                 CROSS_MEDIAN + SV_RUN_OFF_RD + 
                 
                 DISTRACTED + SPEEDING + UNBELTED + FATIGUE_ASLEEP +    
                 FIRE_IN_VEHICLE + OVERTURNED +
                 
                 REAR_END_COLLISION + HEAD_ON_COLLISION + ANGLE_COLLISION + SIDESWEEP_COLLISION,
               
              data = crashdata.wide, reflevel = '0'))



# Combining 4 into 3 (MAX_SEVERITY_LEVEL)

library(mlogit)

crashdata.combined = read.csv('mini-project/filtered-data-combined.csv',header = TRUE)

crashdata.combined.wide = mlogit.data(crashdata.combined, shape = "wide", choice = "MAX_SEVERITY_LEVEL")

summary(mlogit(MAX_SEVERITY_LEVEL ~ 1 | 
                 
                 AGGRESSIVE_DRIVING +
                 MC_DRINKING_DRIVER + DRINKING_DRIVER + 
                 
                 PED_COUNT + SMALL_VEH_COUNT + MEDIUM_VEH_COUNT + LARGE_VEH_COUNT + 
                 
                 HIT_BRIDGE + HIT_DEER + HIT_EMBANKMENT + HIT_GDRAIL + HIT_GDRAIL_END +
                 HIT_POLE + HIT_TREE_SHRUB +
                 
                 CROSS_MEDIAN + SV_RUN_OFF_RD + 
                 
                 DISTRACTED + SPEEDING + UNBELTED + FATIGUE_ASLEEP +    
                 FIRE_IN_VEHICLE + OVERTURNED +
                 
                 REAR_END_COLLISION + HEAD_ON_COLLISION + ANGLE_COLLISION + SIDESWEEP_COLLISION ,
               
               data = crashdata.combined.wide, reflevel = '0'))


# Try chisq-test for remaining variables such as weather,road type, 
# intersection type,... (got p-value < 2.2e-16)


cols = list(AGGRESSIVE_DRIVING ,
           MC_DRINKING_DRIVER , DRINKING_DRIVER , 
           
           PED_COUNT , SMALL_VEH_COUNT , MEDIUM_VEH_COUNT , LARGE_VEH_COUNT ,
           
           HIT_BRIDGE , HIT_DEER , HIT_EMBANKMENT , HIT_GDRAIL , HIT_GDRAIL_END ,
           HIT_POLE , HIT_TREE_SHRUB ,
           
           CROSS_MEDIAN , SV_RUN_OFF_RD , 
           
           DISTRACTED , SPEEDING , UNBELTED , FATIGUE_ASLEEP ,    
           FIRE_IN_VEHICLE , OVERTURNED ,
           
           REAR_END_COLLISION , HEAD_ON_COLLISION , ANGLE_COLLISION , SIDESWEEP_COLLISION)

a = c()

for (i in cols){
  for(j in cols){
    
    chi = chisq.test(i,j)
    print(chi$data.name)
    print(chi$p.value)
  }
}

