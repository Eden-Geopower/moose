ifeq ($(ENABLE_LIBTORCH),true)
  app_non_unity_dirs = %src/surrogates %src/transfers %src/reporters %src/controls %src/vectorpostprocessors
endif
