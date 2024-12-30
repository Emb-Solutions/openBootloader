-include ../make_config.mk


#################  Configurations ##################################
#-----------------------------------------------
#          Device sources based on MCU device ID
#-----------------------------------------------

ifeq ($(TARGET_MCU), STM32F429VIT6)
DEV_ASM_SRCS += \

endif


ifeq ($(TARGET_MCU), STM32F401CDU6)
DEV_ASM_SRCS += \
./stm32_f401xx_startup.s


LINKER_SCRIPT += ../devices/stm32_f401cdu6_FLASH.ld
endif








devices_asm_build:
	@for p in  $(DEV_ASM_SRCS); \
	do \
	echo ; \
	echo Compiling ... $$p ; \
	echo ; \
	$(CC) -D$(TARGET_MCU) $(CC_ASSEMBLER_FLAGS) $(DEVICES_SOURCE_LOCATION)$$p    $(CC_OPTIMIZATION)  $(CC_EXTRA_FLAGS) $(CC_INPUT_STD) $(CC_WARNINGS) $(CC_TARGET_PROP) -o $(OBJECTS_LOCATION)$$p.o ; \
	echo "$(OBJECTS_LOCATION)$$p.o" >> object.list ; \
	done
	
clean: device_asm_clean

device_asm_clean:

.PHONY: device_asm_clean

