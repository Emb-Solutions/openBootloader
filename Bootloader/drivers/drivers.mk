-include ../make_config.mk


#################  Configurations ##################################
#-----------------------------------------------
#          MCAL Source files Based on architecture 
#-----------------------------------------------

ifeq ($(TARGET_MCU), STM32F429VIT6)
DRV_SRCS += 
endif

ifeq ($(TARGET_MCU), STM32F401CDU6)
DRV_SRCS += 
endif


#################  END Configurations #############################








driver_build:
	@for p in  $(DRV_SRCS); \
	do \
	echo ; \
	echo Compiling ... $$p ; \
	echo ; \
	$(CC) -D$(TARGET_MCU) $(DRIVER_SOURCE_LOCATION)$$p $(CC_OPTIMIZATION) $(CC_ASSEMBLER_FLAGS) $(CC_EXTRA_FLAGS) $(CC_INPUT_STD) $(CC_WARNINGS) $(CC_TARGET_PROP) -o $(OBJECTS_LOCATION)$$p.o $(STARTUP_SRC_DIR)$$p ; \
	echo "$(OBJECTS_LOCATION)$$p.o" >> object.list ; \
	done
	
clean: driver_clean

driver_clean: 



.PHONY: driver_clean

