include $(TOPDIR)/rules.mk

PKG_NAME:=wanmonitor
PKG_RELEASE:=20180423

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/wanmonitor
	SECTION:=net
	CATEGORY:=Network
	TITLE:=WAN Monitor & Failover Connection Manager
	MAINTAINER:=Rafal Kupiec <belliash@codingworkshop.eu.org>
	PKGARCH:=all
endef

define Package/wanmonitor/description
  WAN Monitor & Failover Connection Manager
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/wanmonitor/install
	$(CP) ./files/* $(1)
endef

$(eval $(call BuildPackage,wanmonitor))
