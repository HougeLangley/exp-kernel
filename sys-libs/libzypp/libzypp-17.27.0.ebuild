# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake ninja-utils

SRC_URI="https://github.com/openSUSE/libzypp/archive/refs/tags/${PV}.tar.gz"
KEYWORDS="~amd64"
DESCRIPTION="ZYpp Package Management library"
HOMEPAGE="https://doc.opensuse.org/projects/libzypp/HEAD/"
LICENSE="GPL-2"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND="
    dev-libs/boost
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