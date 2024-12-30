-include ../make_config.mk


#################  Configurations ##################################
#-----------------------------------------------
#          MCAL Source files Based on architecture 
#-----------------------------------------------

PROTOCOL_SRCS += \
./main.c \




#################  END Configurations #############################








protocol_build:
	@for p in  $(PROTOCOL_SRCS); \
	do \
	echo ; \
	echo Compiling ... $$p ; \
	echo ; \
	$(CC) -D$(TARGET_MCU) $(PROTOCOL_SOURCE_LOCATION)$$p $(CC_OPTIMIZATION) $(CC_EXTRA_FLAGS) $(CC_INPUT_STD) $(CC_WARNINGS) $(CC_TARGET_PROP) -o $(OBJECTS_LOCATION)$$p.o; \
	echo "$(OBJECTS_LOCATION)$$p.o" >> object.list ; \
	done
	
clean: protocol_clean

protocol_clean: 



.PHONY: protocol_clean

