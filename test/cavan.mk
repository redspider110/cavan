ifeq ($(BUILD_ENTRY),debug)
LOCAL_LIBRARY := libcavan
$(foreach fn,$(call search_all_files,*.c),$(eval $(call build_as_execute,$(fn))))

LOCAL_LIBRARY += libcavan++
$(foreach fn,$(call search_all_files,*.cc *.cpp *.cxx),$(eval $(call build_as_execute,$(fn))))
endif
