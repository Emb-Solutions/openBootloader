-include ../make_config.mk


#################  Configurations ##################################
#-----------------------------------------------
#          Device sources based on MCU device ID
#-----------------------------------------------

ifeq ($(TARGET_MCU), STM32F429VIT6)
DEV_SRCS += \

endif


ifeq ($(TARGET_MCU), STM32F401CDU6)
DEV_SRCS += \
./stm32_f401xx_irq.c \
./stm32_f401cdu6_system.c 
endif








devices_build:
	@for p in  $(DEV_SRCS); \
	do \
	echo ; \
	echo Compiling ... $$p ; \
	echo ; \
	$(CC) -D$(TARGET_MCU)  $(DEVICES_SOURCE_LOCATION)$$p  $(CC_OPTIMIZATION)  $(CC_EXTRA_FLAGS) $(CC_INPUT_STD) $(CC_WARNINGS) $(CC_TARGET_PROP) -o $(OBJECTS_LOCATION)$$p.o ; \
	echo "$(OBJECTS_LOCATION)$$p.o" >> object.list ; \
	done
	
clean: device_clean

device_clean:

.PHONY: device_clean

