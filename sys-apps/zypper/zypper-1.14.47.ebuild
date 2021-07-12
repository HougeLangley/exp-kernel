# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake ninja-utils

SRC_URI="https://github.com/openSUSE/zypper/archive/refs/tags/${PV}.tar.gz"
KEYWORDS="~amd64"
DESCRIPTION="World's most powerful command line package manager"
HOMEPAGE="https://en.opensuse.org/Portal:Zypper"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND="
    app-admin/augeas
    sys-libs/libzypp
    dev-lang/perl
    sys-process/procps
"
BDEPEND="${DEPEND}"

S="${PN}-${PV}"

src_prepare() {
    cmake_src_prepare
}

src_configure(){
    mycmakeargs=(
        -B build
        -G Ninja
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CMAKE_BUILD_TYPE=Release
        -D LIB=lib
        -D ZYPP_PREFIX=/usr
    )
    cmake_src_configure
}

src_install(){
    cmake_src_install
}
