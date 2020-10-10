find_package(PkgConfig)
pkg_check_modules(PC_LIT QUIET lit)
set(LIT_DEFINITIONS ${PC_LIT_CFLAGS_OTHER})

find_path(LIT_INCLUDE_DIR lit/lit.h
	HINTS ${PC_LIT_INCLUDEDIR} ${PC_LIT_INCLUDE_DIRS}
	PATH_SUFFIXES libxml2 )

find_library(LIT_LIBRARY NAMES lit liblit
	HINTS ${PC_LIT_LIBDIR} ${PC_LIT_LIBRARY_DIRS} )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Lit  DEFAULT_MSG LIT_LIBRARY LIT_INCLUDE_DIR)

mark_as_advanced(LIT_INCLUDE_DIR LIT_LIBRARY)

set(LIT_LIBRARIES ${LIT_LIBRARY})
set(LIT_INCLUDE_DIRS ${LIT_INCLUDE_DIR}/lit/)