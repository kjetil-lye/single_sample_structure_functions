CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T102509        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.5</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?����Ή�?������?��ξ�?�ƴ�B?�i���@��Er�2@�uѫ�@Qa�rS-@�u;B�O@����@����g@�t��h;@";�mH,�@$�h��@'|���@*NTD�@->�V��D@0'�@�@1���V�@3ba �N�@5C�4�C@6��"-{�@8����:@:~��FD�@<f�&��@>Z�ώ�8@@-�~��@A3��4ho@B?�/oU@CQ��xE�@Dh�ە��@E��hJܚ@F����m@Gυ�qH�@H�H��8�@J.(�U�8@Ke�ֹ0@L����)�@M᠚ur@O'%���@P8� ��@P�&v��@Q����*@R5��PB@R�=	��-@S��=Ȇ@TGt�.�@T�U[/�q@U�[�D�@Vl�Ӽ�@W'���+�@W�sq~@X�j.�@Ye�%�L�@Z)5��@Z�)}�@[��U�@\J���@]J��R��@^���^D@^��Y��@_���]'�@`EB]%cx        ?��]�X?�\�2)�>?�$���?���St@�l����@		�3��@�?� ��@Z�E��3@�H觼�@ K�.�@# S
���@&b_���(@)��	���@-����'b@0��b۲@2���pD<@4��k��;@6��1d��@9Cz�y�@;�񇌝N@>\jg�@@G0��@A�qRsݘ@B����@DAz�I��@E���Ĩ@Gt��!P@H��sn:G@J���
�@K��E�@M�v!�<@N���m�L@P'��k��@P����@Q���*z>@R�$x|�@S��(�@Tf<g�@UI��%f)@V0L�p��@WB/���@X_�V��@X��tL�{@Y��th|�@Z�#wO��@[�`�((^@\ֈdgu@]Տ=��@^�i;��@_�	`+h�@`q��n @`��/n[T@a}+��y@b�����@b��=�?�@c��։�@c�,j�vu@d/��`f@d�����@eL�#5�#@e��	^�A@fn%�z@g �bIyW        ?��@�u��?���r���?�a�t�?�F��Y@p�w�U�@	�N>��3@NA��@.�P��y@����@ �XG�p@#�D���Z@'W�B�A@*�g�֕�@.�B\�|�@1p/S�@3��#zz�@5�B���@8?a��\@:F�>�@<��1w(�@?��4bR<@A*�Dq[@Bz�&?��@C�Rw��@EU�FQ@F����d�@HWNw��*@I����W@K}��<�@M!��"�@N�C���@P<p0IJ�@Qg�ĦA@Q�us��e@R߅�l �@Sȅi�"�@T�c��GX@U�.Aw�@V�{�*��@W��N?�x@X�S��c@Y��x�mV@Z�v�~�@[��\gh@\�}��?,@]��w��%@^����~@_���T��@`t];e�5@at4A�@a���C@b Z!��@b� �?�@@cEox�x@c�C���@dp����@er���@e�ɠ�5@f<��Ű@f���=@gv�b�+�@h���<�@h��k�^�        ?�.��X��?��;�qH?��@��}�@~8��@�[=ECx@��^�@��0��9@!��"���@&d��@*ʞa�%@/�剺��@2�Jv�@5��e��@8���p�n@;��$�]@?,��@AW��ٯu@C+�S�h�@EM��R@Gkj�Z@In���@K(�;���@MQ~�F&@O���=N@P课�K@R�$	۩@SF�m�hA@T�u.�K�@U�YZrh@W	-��_!@XW��+d�@Y�1"Xz@[	$���X@\k��_q�@]�W���o@_C`�$92@`\I�m��@a��ϙ@aڋ�(��@b�T��@cd��p+�@d-�kӧ@d�O"Ψ@e�=ym�@f������@goCA
ii@hFm�rD�@i B6���@i���׹�@j��W��@k�\�π�@l�~Q!�@m�I�~@nq6�|��@o\���6.@p%]���Z@p��79��@q���@q��As��@rJ��q@r�8x)P@sO*:�@s���K0�        ?����*�o?�i�ܓ?����<?��Hv��?��>��@'rt�@%e U@��?��V@"�`%�@@)�ԆY�@~t���?@ �����@"�XI�i�@%��T@'��K�%@*��(�@-��,m�|@0M~��e&@1�ߵ;�d@3��S��@52;���@6�p��4@8��P�@�@:�.��s�@<g�# @>QW;K��@@#Q�F0@A#a�.��@B(�S��@C3K����@DB��ʖ�@EW��KQ[@Fq�_k@G�In�̿@H�A�6CB@I��e��<@K�����@L6��B�@Mk�W0�@N�����@O�|��-�@P��3�@Q4�0>�G@Q��SFU@R��1�]C@S)gy�V@S��P��@T�v@�.]@U.��/��@U޽��@V��Џ�@WC��f��@W�.�mv�@X���~�@Yh�ص�O@Z"��#��@Zމ��(4@[��:z9@\Z�\	<N@]?���m@]�*Z��-@^��,��@_eT��"W        ?���%b�?�Uӡ��?�Z�w��?�-��F��@U��[8�@	�ަ�M�@*8f�((@��r�q@M�K�UG@ ��P���@#� MmȀ@'
���G@*��@ս�@.`Y����@1+�}(';@3?t�ڴ@5j��5�@7����da@:�1ZFr@<r^=��6@>���g�8@@� f�.�@B�x3�@Cz�D���@D�s>�d�@FUm]|��@G�o�<�@IT?��'�@J���V�@Luu��v�@NyKpk�@O��/��X@P�=��f�@Q��F��@Rj��صl@SL�A��@T2 iys,@UA��$@V�a�`@V��5�@W�8���@X⏏)X�@Y���&�V@Z�0�i@[�ęx�@\�s���@]�/���@^���+��@_���C�?@`���sA@a��̇@a��3�i-@b%�b���@b�$(@cA�H�@c���"/@dc�y;e@d�j��@e��fJ3�@f���s�@f��rU@gN�h��*@g�х��        ?�����E?��&�'?�E�	�?�P��j�@���#�&@�n��@�PA�K3@E����@o�7v�@ 	T�H�E@#Q0@�f@&Ve����@)�O���J@-w A�7@0��s���@2��A&��@4�8�f��@6��b���@9A�F��@;�uE�e@>��W�C@@G��Ȯ@A��N��H@B���g�@DD)+^�@E��&ﴵ@G}ߕ"�@H�]gzȷ@Jl�VM&@K�}�掴@M$c�!,�@N��C^=�@P,��F@P�=o���@Qՙ��\�@R��$x!@S��>��@Tm�)F=S@UR7W�P@V9���0j@W$����@X�]@Yo��X@Y��J�o�@Z���=@[�:�V��@\�׸�@]�]���J@^�h�a@@_��HӢ-@`}�$��@a��o�@a��`��@bj�L@b�1� C�@c(C>~	@c�����@dB7�Y
@d�=?��@ea*��
@e�yb���@f����f@g�rT�        ?��� ��Y?�r坚Y?���kz�@7>t�@(1pQk�@|�		i�@H�=a��@!t� 8�@%��^CD�@*<���$@/(�U5��@24�,�@4�ߝ���@7�8���@:��t��@>2���g@@��̑�_@B�2�] @DK+@BU@F%,�сx@H���@J���7�@L	+%ha@N�XUsU@P���\6@Q2��_��@RN�C��j@Sp��T��@T���}x�@U�R�*@V��o}�i@X2sW�#@Yp� n�@Z�9�.w@[��V3@]J���@^�Јv��@_��|P�@`�9;װ�@aY����@bCgE.@b�q2��@cz���@d3�I��@d��SH�@e��N,�@fm�d���@g/ܜ̫e@g��3�d@h��W	t>@i����)�@jK27�b�@k�,�@k����4@l�����@m�唓[�@nV{a�43@o*�0�ܳ@p ^�h�@pl+�S��@p���^R@qF$L�-J@q�E���M        ?�o+��y?�/�\%rD?�ol�O�?�!�N�2?��,��4@9�ҁ��@A1�i�c@��k��@ALC�Ͳ@T�+=a@�Y$�!@ 5�p���@"�P��@%VM��@(��E%�@*��J��@.��%t?@0�8��@25��@3�K�`A�@5���]��@7l�����@9E,?���@;*�^F�@=�S��u@?��s��@@�,R]/R@A��E��@B���)�"@CƧ]�@T@D�#���@F�ޢE@G,o����@HYRq�@I�� !��@J��.���@K��eY��@M>Lu��@N�ǿ�� @O�����|@P�Nf�_�@Q7�����@Q���q@R��~٤@SA�1˰7@S󹥗��@T��M��@U^�)@V:���@V�X�	@W�aj ̊@XJN49�@Y
r[��@Y˱鳼V@Z���E@[TDo��@\0���O@\��cƺ�@]�7z(E@^zI�t�`@_Hg��@`���k{@`tD�-�Y        ?���Rܲ4?�8�{�?�m���1?�d �$BX@�h#��@�;,��@�����7@J���ӗ@uD �@ ���y@#��b�D@&\~L���@)�N����@-�L��g@0�I��oY@2��&�=@4����@7�5Ha@9O�I�@;�4K"�@> ����@@S�s�E@A�����@B�˘�_�@DVC�/@E��5Y��@G/ӵ�4@H�~��@J+|Ӫ��@K��-�a+@MG���@N�r�@PA�E�<@Q]�j>@Q�:8<H�@R�����~@S�Lկ��@T�o��@UrE�q�@V[�ǿ��@WH����I@X8��>
@Y,��@�@Z"a����@[���v@\5�(h�@]�����@^�M�AU@_�����@`P��@`��ڝؠ@aHhD"�@a�K9rv&@b0��޿@b�B��A@cG(}KD\@c�L���+@db�� 7�@d�3�`��@e��Q���@f�"۫@f��&!8@g;��n�        ?��-j�f�?�	�JB��?�,;���?�`�s!<�@��!ߗ@
iNS��@b���{5@I:�5�@�!t~@ �{gG9@$��N�@'sJ�<(�@+�q��@.�|D⅕@1���n�@3�y-���@5ߪ_ܻ�@81�[�pa@:�zi���@=��2�@?��
x
@A,`�3�M@B���>O@C�)x��@Ehn���v@F�R�=$@Hk��_¡@I�����@K�ygiu[@M4�3�(x@N�Wdp3@PH2�tu�@Q%J�^H@RWж��@R�A���3@S��}>�@T�b6ۊ@U�w-���@V�#�a��@W�V8�9@X��a���@Y�����@Z�{�b��@[�9`k��@\�8��6�@]�k��&@^����p�@_�=j�lQ@`p�eN4�@`���{��@a����@b�&�:i@b���p$�@c:�r��@cͺvb@dbC��PV@d�5Uz�:@e��aN/@f(Am`�@f�Scˆ@g]�~$|�@g�{�)�@h�����        ?ʏ�N8�?��EʁW?�-ܻM
 @͂�Cq(@�
�L8@)&B�G@8F���@"��R�@&z�6͊@+F� e>P@0:]���@2�^h�@5�]�K�@9ܵ�@<PR�4mq@?��䔈{@A�b��{@C�
���@EmnF��@Gj��C��@Ix��[�@@K��pt�@Mĳ?�~}@P �s�F@Q&�y1@RT;	�O@S����@T�{�(J@VK�_p@WO2�\'@X��n,�@Y�y��>@[P�Q���@\�����@^4s�U�@_�wCMs@`~�z*��@a;��2m�@a�>�fP@b���w��@c���N.�@dJ%f{�@eGXB�@e���~�@f� ��&@g��2��@hUj/@�@i+���[@j2�B�}@j���J@k�I�	@l�P#+tG@m|���	]@n`EPp�@oE�s��@p����@p���c�@q����@qx�,-2@q�:^�@ri�W�\@r�l��@s^N��k�        ?�����1�?��r��?�­f� ?���C�?�z<}e<@����5@Ɨ���@cnW@�OTY!�@�G#ک�@�P@�
�v��@",Yl��@$�=©`@'TU$��@*�ޜ�j@,��\�Zw@/�&�"��@1|�o���@3�P\@4��rfX@6_���w@8SJ?�K@9���Hȼ@;�)0Ə�@=�ڷ�e@?fOO��@@�ӨE�@A�r��~@B����{@C��3�@D��;���@E�jb90:@F�Q7�a�@G���@I	+�n�J@J(�FXy�@KL� -m�@Lt׫��X@M��K�O@NФx��@P*��@P���qx@Q;{;�)T@Q��]���@R|�*t�@Sp�fT@Sí���@Tj
��AR@U�g>�@U�� yzM@Vg)���@W��J<@W�Y�ԭ@XrH /x@Y#�`shM@Y֊�Q��@Z���:�c@[@hc��-@[�\g�ZV@\��4e�@]i('�n�@^#�k`xd        ?�&Ź��|?�u��J:V?�<���N?���D;!�@�q���@	%�azM@�w���@s�<���@��N|7@ (*�}{�@#6����@&|�
�U4@)�.����@-�23�`�@0��B���@2�ZDǫa@4�}�rWX@7�����@9`Co���@;��ڸ��@>/- L�@@Z�n�w@A�8I�z@B���]@DZ �{�@E�s[mL@G1c����@H�����|@J*;)e�G@K���|�@MB�W�>�@N�����#@P=
�Sz�@QI��{@Q�V��@R�P͠C_@S��h��>@T�!@Ud(�h��@VK��?�@W6=�	�@X#��Ns3@Y�6���@Z���h�@Z�U+�E@[��A��@\��4ѕ@]��S��X@^������@_�ɝ���@`��jV&@aŧV�@a�20v��@b��V��@b��,h��@c(4���@c��e_��@d@~��̓@d�}���@e]���@e�#+��U@f��ن+@g�5g�#        ?���T��?�ۂ�d?�8�z�)D?�D�;`�@����u@���� @��s�^&@3���@V��/@�&�I�@"�h�v�@&6���=�@)���{�@-C�@n&�@0���e7�@2�eD��@4��8�P.@6���~�@8��׎GJ@;N�����@=��@ڮ@@gL��z@AV�A���@B����O|@C�@�N	a@ES�^L7@F�	�~ @H#����@I�]�On@K��K_B@L��pGd�@N!~�_�@O�Y����@P��/�8i@Qn�7��@R?��>��@S�p��@S�S��B�@TłZH��@U���6/�@V�|}��@We.`A��@XJ��]�u@Y2��� @Z|���@[
�
!�@[���`�@\����CQ@]�5Zd @^��PS]�@_�I���@`g�R@�@`��n�@af����@a�JG8�c@bi��@�@b�����@cq9�U�@c�����@d} XƁ�@eb1�@e��1SD@f	��        ?�Z�x{|�?�Qi�	&?� E@`��@��j��@�IUZ�@ ٬A��@˥)�(�@!#W���@%A��A@)�&�2�Q@.�;N@�F@1��W��D@4���˚�@7d�sR@@:`�G[��@=}���@@]6��6@B
�w�s|@C�kC��?@E�PvK@Gg�z��@ILZ�5��@K=�k��@M;p0�.�@OE@�Tv5@P�lw���@Q���U��@R�"���i@S��ɲH�@UΚL�2@V7z�O@WbxI���@X��;f��@Y�?N��@[lf��f@\AU`��0@]��B(@^��>#�@`�x]�@`�Mh��@a_���Gi@b���o�@b�~D��@clN��G@dd
f@d��iB�@e�]� y@fB�(���@f��V@g�!	���@hv�8~��@i6��4:@i��95��@j���s@kE�B��@lEwk:��@m>6h`�@m֑�D/@n�i���M@om��nT@p�V�m@p�^ꅿ0@p�����L        ?�$2if3?�8=���Z?�#|7ݎ?�+���?��+�@B��O��@L<?I&�@E���@F�I���@X����F@�D%��@ 5r�x@"�V�m@%Q��`l8@(�\z��@*�e��@-�����@0�-��u�@2+!��c�@3�n��@5���gW�@7\�#��@92՞É@;�d�.@=�9��@?}s���@@���T=@A�҅R�%@B��K־@C�Õ��u@D�7���@E�/O,6@G�����@HDF��o�@Iu:>�&�@J�YP�|@K撆�'6@M&��!@Nl�^�)@O��2π@P�i�g�@Q,""c�@Q�"�UOI@R�`���@S6�ݽ`l@S�`�~�7@T��GX�@UTɠ �@V��@&�@V�G6m3�@W��0�q�@XC�߯��@Y�,1dn@Y�C�~��@Z�]_1�@[P@8�|@\�*�-�@\�D���}@]�WƧ]7@^y�PN�@_G{ �p�@`��3�@`t��8�a        ?��D:��?۾)~��?�=-�.?���~<*@�ow��@
k��<��@����w@�æ`h�@�E3�w@!�7!��@$K�k@'�6v�:�@+~xc,t@/l���bJ@1Ȉa�X�@3��i @6:�;Q��@8�fŴ�/@;��;�@=����s@@!9��@A~��v��@B晠N;h@DY�_Nc@E��uRn@G\�g�t@H����@J���|��@L)�qOc�@M��ѫ��@O��0��@P��^�M_@Q��୥�@Rm�L�o�@SX�k :�@TG�z$��@U:OC��@V0��_S�@W*��l�@X(v�DzS@Y)��!�g@Z.P��3@[6`3���@\A���tr@]P�O[w@^b���@_w��Z@`H���@`�ɢ��@ae,���@a��򘃈@b�M���k@c%^�i@c�sYQ��@dH3��z�@d�aB:R�@ey�+��@f�^��@f�L/��@gOwӖv@g�y�t@h��2
�@i0J��        ?�k�*H��?ڛrc�%<?�ߐ�S�?��?xK��@5S.J@	�/:�@V%}��@�qL��@6���0�@ �҃�,h@#��ӷ�@'��6�@*�D$���@.j�"s�.@15�.d��@3OP��@5�4�F��@7ʹD��b@:++u��x@<��Iѹ�@?.7�3]8@@�˽�`@BB�aP�8@C����p�@E7��@F�H?�8@H����@I���&3@K,��9�!@Lȩ��Ľ@Nl�nt|w@P�@��@P�ܚ�8�@Q�{��@R�E���@S�I����@Tw8��@Ud�ib��@VU�݌cp@WJ�(q�O@XB�SyJ�@Y>���_@Z>	s��@[@�=��@\F��z��@]OѲb@^\5�5iL@_k�`�i@`?-$-'�@`��Ѝ��@aVO����@a���9�@bsK%y��@c���@c��P�^~@d)P�(A@d��r�@eT��L@e�G�%�@f�+�T1T@gL��@g�U��GC@hU�^#6�        ?�}���-�?��/Ͻ�??���-��8@t|�@˃Y|�@ӄ:k�f@Ú#!8@"���}q�@'"��6@,�=��@0�/K	Y�@3�>�@6��
�"@9��jS��@=��M43@@A��x�@B�P�:@C�!�@E�{cf�@G�k[e:�@JI`�^�@L8���b3@Nr6���@P]�D�[�@Q�ןM�@R��W.1@S�3
��@U;����@V��@��@WՃ�M��@Y,�;�m@Z��Q��B@[���ѡ@]Y��"0�@^��.���@`!h.�@`߳Q�)$@a�]��r�@be�Ƃ��@c-j�60@c��5Ɓ�@dĶh:��@e�m��'m@ff��~��@g;�qfGx@h�ol@h��� "�@i�E���@j��IQ�@k���-��@ll(	�E@mQ~F�c�@n9�E2�@o"��d��@pW��O~@p~N��@p�I���@qoGY*x@q�AW�z�@rd5@�q@r���@s\�Pu5�@s�ʫ��q        ?���u�5n?�&gv��u?����?�4k�h?����)�-@<�{�I�@�+�"O,@V��^�X@3�;Q @
�����@.6�B>@��I��@!��4@$ į*@&����@)m���T@,A�x��g@/2,���C@1�,9�@2�����@4RsF/�@5��̓��@7�����$@9|7���@;L����@=(,o�@?���@@� E:�@A~&���'@B�\=�@C��P�ۥ@D��2�@E�!D'�@F�"c[�@G���q@H�GY�K@J!E׭�@KJɰ)C@Lx��%/v@M�_B[`@Nᣨ�t@P1T���@P���qV�@QN��^Q�@Q�R��.�@R��*���@S>���s@S�8?S�@T�/`���@U>�vW�2@U� U�7@V���P>@WM���A�@X	l�,@X��B�@Yk�5�S�@Z#�2�<�@Z��d{�@[��6_�@\T6���@]�I]@]��$@^����        ?�]�r*��?ںw���?���_�|?�Շ���@c���@	q�!�ƌ@� TL�;@��W��@��ZN@ j�\��[@#��2�:|@&�ahk��@*x�P㩥@.@*(��[@1��y@34F��@5bx_g�@7�8��ڴ@:�Z��@<v�5[�8@>���껇@@̈́qad/@B%�r�� @C�A��@D��iy��@FiF{E�@G���@Io1��P�@J�p�qd*@L�M;��N@N9��0/@O�!U�@P�^��@Q�"���@R�š�9A@Sl4"��@TTWa���@U@����@V/f�9d(@W",��~@XY��*�@Y��|@Z�滸a@[��ͥ�@\t��!@]��W��@^"�g�@_.�z�t�@`;�8.�@`����5"@a3s��L�@a�ȯ�Y�@bM�k��`@b�����@cmtm-j�@c��=R&@d���(�@e'��=��@e� ���@fU��ĩp@f�x-�Gg@g����f@h$Ḫ�        ?�����ؠ?ٸ����?�&���>?�%�FPM|@���E��@�[�l@}?i�8�@!~����@D%�ӳT@�@H鏲@"���n`�@&4�!q*�@)��\w�@-M�h��9@0�%yJ�w@2�3�G��@4�!d�fn@6�,⺑�@9$�y	�5@;~����@=������@@7WQ�&�@A�����@B�WEe�@D1Bls\@E�����@G��o@Hx4�k��@I�	���@Kyc
Ĉ�@M��ӎ@N��ío@P�h�l�@P�ݚк@Q�I��С@R��a��<@Sl���C@TI6���@U(̇H�.@V:B��>@V�n���9@W�XӮ��@X��yg@Y�=m.�@Z��鍐�@[�/q�@\����@@]~^a��@^x*џ�v@_tc�ʀ�@`9y	��@`��ˇA-@a;���@a�d�U�@bBK](�?@b�N77�@cMh��@cԔR�N@d\��^�@d��,�@epU��=�@e��#M�@f�م���        ?��c��B?䞅=m"�?��ƜV��@x���Ϸ@��R�$@�^��^@J���U@ ���0�@$�-���@)^�(@.)�w�&@1���G��@4]-�Ͱ$@7<&俫�@:@)aj�)@=g����@@X�V�T�@Bf;>�@C���2�@E�|p�D@G�V���+@I�9���	@K�a7�"�@M�kqï�@O�����@P�bt�@R���@S(I�`�@TPFp�@U}��8��@V�R�K�|@Wꭕo"�@Y)���L@Zn8�T[R@[�3�題@]�iȣ&@^\⹮@_��:\�,@`�PT��@a<15-�P@a����X�@b�42�� @c`;��q�@d�J�@d��g��@e��иС@fZ��h@g�0K��@g�8�,@h�}��_�@ivf�&�3@jB9�ӂz@k��@k�~U��@l��	�w@m��M�@nY)r��@o/ي%�@p(,�Ur@pq;zn$@p�"ŻǙ@qM�6�@q�]ǎ�q        ?��`,DƱ?��l�l?㽂�׾�?��7�W��?�c����@�r��ar@�ªfgC@m��q�@�&�^~@�� ���@K�î�@���-_@"D^A�M�@$��[@�@'�J��d@*L���N
@-7G�P�2@0d6�j�@1�`v�:@3Pl�to@4��J0� @6�@��@8|�4��@:N2��@<,>[��*@>� LH�@@��,!@A�#��@Bs��\�@C}�*�@D&�^dr_@E<-BD�@FV�mB��@Gu�k4@H� ��@I����z�@J�a^H��@L"^1�@MX����@N���'-3@Oҧ��\@P����Y@Q.�V�߭@Q�w�Sk@R|>i���@S%�{�@SѳY`�@TQޱo�@U.ҍ���@U�+�~� @V�TUC��@WHAkLU�@W�蘚r@X�=����@Yq5>�6p@Z,�aRg@Z�ܾ�=@[�xD��@\h��nb@]*�>P1@]��;��@^�2��W)@_v�C��        ?�*e8�D�?ڔ ���?��uq�?���rH�]@���Zof@	H"�'7@ע+[h@����{@�%����@ @���@#T�y�@&��#�@* 2>0hH@-��;�M@0�S�A�@2�^�4J�@57��@7>R�@9�.^�<@;��˞�@>_dy���@@s��d@A��2�=@C����@Du���%@E��iЂ@GLr߽M@H����0�@JC.)"@K� t�Qa@MX6~���@N���x�|@PET�l@Q�����@Q뾆��@R�CQ��@S���%��@T~I�y��@U`���-@VD�k�6�@W,�y�� @XBE+�z@Y�(a�@Y� U�@Z�E��@[�1�n�H@\���kˀ@]�A��l@^�Z�Χ`@_�%K��@`jOw��f@`�b�fi@aq���Z@a��$�@b~�m��@c��c��@c�S�	!@d"X�X@d�1$E@e4��#�@e�����@fR��/p@f�� �O        ?������H?������?�PgM`Б?�9&�lx�@g<lsI�@	咩��@Dmg_�&@!c��ʜ@��D7p@ �n�H��@#������@'DLy�@*�$�ϔ@.��;��@1^��.z�@3{Vq7\�@5�Q���@7�ˎim�@:`�	�'@<مW��@?h|��L�@A.�ZU@BbF*ZN@C�;,IOC@E7�M��@F��O�C@H2��ݧ@I�u� $@KP��fd�@L�D�J�@N��G��X@P7��&�@P�a�|/@Qը(!;�@R��EJ�@S������@T�@g�{4@Up�?�)@V_@:�@WQ�ˢ7c@XGV�*U@Y@��(�@Z;��˛@[:�<�u�@\<?6Q�3@]@��F�S@^G�e��V@_Q���	�@`/xY�p@`���8��@a?IN��5@a�A�Z4A@bTnϩ!�@b��RP@cnU��C @c����@d��� �@e�Ni�@e��+K��@fB��e4@f��,~S@gl%Ӗp�@hG�#�        ?�K���r�?��*�Q�b?�
���e@�B��M6@�$H	�@�DY�1@v� p@!�0�u�@&G΀�"@+'�k��@0��n�T@2ȿ��%@5��sr�@8�~��f@;�3q@?K���?@AemC�%�@C6�d¨6@E�mOpq@G�4�@I�Gf��@K!5����@MB�~�G@Osks���@P�4�@Q�Ĕs�@S-@����@Ta��(@U�a��7�@Vݹ�Z�@X%d~EΙ@Ys=@��@Z�!��@\ �z�&Z@]��ve@^��n��@`(J��;@`�jڅ�(@a�58j�$@bX���e@c��m7@c�	f�@d���@egL8�x`@f1��^@f��:E@g�aܰ�*@h���
:�@in��(&@jC��$�@kҊS�@k���q@l�;=[��@m�rH�.�@n��B �@ol��P@p'��ner@p�)�,��@qg���@q�����@@q�n�H�@rl.�a�@r����        ?�'�;�?���)ٷ�?���U<d?��'�L�?��AZR�J@��sߚ
@	�6���@d/�-@��/�`)@�E3c�@�VP^�@ �$�x�]@#SEEU��@&5�xkI@(���X�@+���l~�@/m�T�@1,YS�!�@2��vU��@4�sq~�i@6v�<4�$@8Y&�u`@:J�l��@<J�^0Ȁ@>Y7���
@@:����@AP4O.�@BlK,�@C�����@D��ZwW@E�@h��@GY|�@HY9H6K@I�}g�Cw@J�ր�\@@L23h��@M��|�@N��xC,@P m�\b�@P�a����@Q�6�
H�@RA��R�@R�i�P@S���H�0@T|�.��_@U@��Z�@Vt6��@V�O[��@W�#\u5@Xj�y`@Y;�9dy@Z%���@Z�8��k@[�ʲ���@\�տ��@]vU�v�<@^VG F�f@_8�L�s�@`�����@`�J�m��@`�}b@@al��v�@a��w�i        ?�U9����?��I0�WW?��N�V/?�� /�p@����@	kPnW� @�/��@����$�@�P���@ Z�5�+@#tWT@&��iwt�@*O@�
,]@.Y�o�@0��9���@3��@52�铍
@7o�;�2@9¡�x@<*���@>���Έ�@@�Up�z@A�<�1#@CJI5��@D�NOb�@FhB���@G�e���@I�@J�P�]ˌ@L,�0|�@MũE	h�@OfxK���@P�� H�@Q_�����@R;䬹��@S�����@S�4�Nq�@T�S���@U� '*�@V�,iAx�@W����|@X��p@��@Y�4-�@Z��b#��@[����k�@\�J�ų@]�`�l�)@^��T�@_���B��@`a�`�Z`@`ꋵp�_@at�o�-@b �{��@b�P�.�@c1��t@c���N@d?T���@dҐ�C�@eg:M7n�@e�L�?��@f�ã��:@g-�4%�@g��hzS/        ?���P�G�?�����d�?�+]����?���WT@M4�E�@	�T�@/	{)�@	?�/��@iΏ��Q@ ������@#�v|�@'=�}8a@*�:, ]@.���j�D@1f5�OC@3�5��J#@5È��@8XB���@:�����@=Ⱥ~w�@?�+�H��@A'IB�[�@B�����@C���JZ&@Em�Ğ �@F�I�N�@Hz&W?�@Jǁ5�!@K���@MT �/��@O���I@P^�,�@Q?�d	�>@R%F�h?@@Sڣ%[K@S����@T�m�P�@U�G�%E@V��D�@W�Ύ���@X�^��B�@Y���@Z�ݞ��@[��`�@]	47��@^Q4�}@_5"'f�@`(��.[@`�{���_@aH���@a�d�ߧ{@bo�1r�B@cAL��@c��w(Q@d7L���@d�W��@en�&��@f1�L@f��<��@gNK�g@g�&����@h���W��@i;d���Y        ?�3���8�?������?������J@�.���@�@*�),@��Z�s�@�b��}@!�ŬN��@&RM%@+��5�@0(r"c@2��p��@5��
K�@9JƬT+@<a�5�ͺ@?��_)�I@A��+K�P@C�b�1@E���M��@G�)�C�@I�� X�@LL9E�@NF:�X@PM¯���@Q��ݥ�@R�U�9L@S��(I��@UKzI,*�@V���6"�@W��7@�a@Y\���p3@Z��z�0�@\8_pJ�(@]�9x���@_1H�dd�@`\<��f�@a#]��_@a���'f@b��U@c��X<7�@db����|@e:����@f���T@f�}��H@gײ��"@h� :�c@i���[��@j�|I,�@k�W%��@lrB��(^@mg40W� @n_ ��Ĺ@oY�mo@p+�޻�P@p�5��l�@q-�sڊ@q�i�h@r5�1[TV@r��%�ז@sBֵ.#g@s�y@7� @tUr����@t࿽C>�        ?����>?����c�?��s����?�ࡧ�̝?������H@���<�@�@�Nۜ@tς�_�@�՘�k�@��T�Y@$�qp��@�ML��,@"I�\��@$�R���}@'��/jE�@*]��lM@-N�	G[�@0/䮸@1�TF&lE@3i�u��@5}d���@6ܤf�E0@8�9@:���F@<k��E[=@>_h��ZK@@/���h@A5�����@BAtM#��@CS����@Dj^p��@E�8���@F���NOC@G�6�ht�@H�*s���@J0ML�q@Kg�#�z@L���^@M��
�-�@O*�C���@P:�mAl�@P�
�@Q���Rh@R9+ %Y�@R��1���@S��7Q�@TK�f��1@U&�S@U����@{@Vr)��@W-�����@W�r$՜#@X�?X��g@YmIu�>@Z0�W���@Z��?��@[���(}e@\�S���@]S���3@^!o��o@^���T?
@_��,�c@`Jq��        ?�c�R���?ٸPߟM�?���9,C?���{r��@c)
�	�@o�D�܄@GS�j��@��c��O@�RP�0@h�wV�@"����S@%���oC@)?���9@,��H$�@0K�iS@2D:Yϳ@4R��t�@6v����@8�7g�R@:��U(c�@=[2Mo&n@?�z����@A(����@Bs�x�]�@C�xI�@E#TA�·@F�K�~+L@G�+�@If�6+X@J��I�%.@LdH�v@M��R8�@O~|�e�@P����ӻ@QZ cR�d@R,N��>>@S̡J��@S�g�+��@T�g+�@U��X)@VvC�!V�@WZ�Rmy@XA�1���@Y+����@Z����C@[��L�@[��Ք5\@\�]K��R@]�a�F^�@^��7e�@_�ˈ�?@`l�?�g}@`��:�&3@anc�X��@a�����@bt�x?��@b�� �@c��&m#@dȞ��e@d��n2�@e'%@|u@e�l���$@f-�3I_�        ?����M}�?ڹtR�*	?�*൘�N?�;�ù@M��}H@	�d� ^Z@-r�<�z@�(Z@`�ʔ"@ �|�;[�@#�!�/�@'*��sp@*�Z0�z@.��v��@1M�1�)@3h��+I@5�EK���@7��qH@�@:H(�M>�@<�GT��i@?K��X[@@�A�v��@BP�cjw�@C��]���@E"n���@F�6r��@H�S�h<@I�n�{\d@K2o���]@L�Ĝ,��@Nm<QN1�@PS� �@P��b�C@Q�R��,o@R�p1��h@S�0P�M�@Tk~W}C|@UVF7l��@VDs�`��@W5�~L@X*�fb�@Y"���@�@Z�tmq@[�R)��@\ދ�w�@] �� �@^'ʹ�g�@_1��6ޭ@`�3�+�@`��7�o-@a/���@a������@bE?�y6
@b��>�@c`,�%@c�I5��@d�k�n/@ed��@e�<���@f8B�@f�rN�q@gcɣ�9~@g�Ea˳D        ?�N�J;��?� ����?�	�/���@�� ��v@��~2We@ET�@��t�t@!-X޾p;@%Y|��E:@)����V�@.�š�z@2	��s-�@4��0<@7�zV%@:�SF�0�@>%eVW�G@@ň�Mi@B�"��>�@D`ʂv�@FF���L�@H=��_�J@JE����@L[�7���@N���o@@P[��ܷ�@Q}rE��@R���(�3@SֺѢ#�@UҎ��@VK�PWj@W�2�G�@X�3#��/@Z,�v�u�@[�'�w~@\��7�+)@^E�w�@_�>�S^G@`�Z?0�@aI�c�@bZ�OS@bǉQ�@c�u+P*�@dP�m�b@ec.��@e�UL�Xm@f����_-@g�5\{,@hS�U~�@i(��--�@j �~?'
@j��Xƍ@k�N�c9�@l�>{���@mw�����@n[%�H�@oA�0$@p��8�@p��(l��@q *���<@qw����@q��B�@ri����@r�R����        ?�#O�#�?�h/V2��?�J	eb��?�p���?��w���7@ze���!@?�n{D]@�T|��@n�U���@P�(ﺻ@Z��B@�B �}�@!�2���@$X��@&�ښY��@)�$w��@,��M|�U@/�M�@�@1L���t@2㫂S,.@4��&�4@68w�|(m@7��F\�2@9���`O�@;���&�q@=s���@?_E:��J@@��P���@A�XŨ?I@B��%@C����@D��۾��@E�}�8�@F����3@H6�a@I:����@Ja����I@K��\���@L�S����@M�Zp��@O)�G��@P2�c.�#@P��%$�@Qu�y"�@R<�`�@R����@Sf��s�j@TH�c@T���@Uh��$Z@V��]�@V��D{@Wz=�S�2@X.w#�\@X�Y��$@Y�>��i@ZR�r.Q�@[��#G@[��<Ǽ@\��P G�@]B��H�@^����p@^Å����        ?�!0�F?�ti|x�?�NN҇�?��\#R��@��	���@	-��3@�F\S�@~�x�f�@�|.)o@ 4.�\@#GV<3�@&�+Ԓ�*@*j�/@-�xv@0ՏP5]<@2���\��@5�κ;�@79i�๑@9��j5�J@;�!|�o@>`�,��@@u�)��@AĶ��.k@C<�1@D~�|0=*@E��C�@G[���#@H�0hH@JZ����@K��2~8@My-=�@O��:�@P[p��@Q/÷p��@R�Z���@R�l�"�@S��9dD�@T�6�b��@U��S�/�@Vs���Z @W`2�Y�@XO�r�/@YB"�&]I@Z7�vn @[0rk7lm@\,"1�UW@]*�<�}�@^,dv<�@_0�%{W@`~�@`�0H�"�@a'�Rc�@a�t��r�@b8���t@b�9'�@cN�"j
�@c����F'@djDPuYB@d����A6@e��I��@f�-��y@f��d�Ux@gDm���        ?���=no.?���k�J?�~fQ�
?�1-����@������@��&yd@�F�C7@-a
ɖ@@S[,晌@�P�c@#w�|^�@&C5�@V�@)�?��Р@-b���zM@0�����@2�Yf��@4�!��y�@6�F�@9=��+ʴ@;���9,�@>��,@@K���]�@A��b�.C@B�ؾ3U@DR�R�_@E�+�T��@G0�� Om@H�.���@J2P���^@K��h���@MU�)yS@N����?@PM���@Q$��-2@Q�㹵��@R�~�Z��@S�ό\R%@T�����@U�NV�Z4@V|]�Δ�@Wl�5(��@X`��<�#@YX*�$�@ZR�	�@[P�p)Y�@\Q�wx�D@]V���@^]j��N@_g��+��@`:��:A-@`����)@aL_�x�@a�e�d��@bc�W�h
@b�0@c��Wǝ@d Cń�@d�֫�R_@e5��!�Y@e�	���@f_y__@f��ge5@g��/�8�        ?��v�;�?��7���?��*R?�_@�hx�\@Y��PY�@�7�ZE@�٤�wd@ �ۛ��@%�1�d@)�f4x("@.gbr"@1Ƥ b�@4���	��@7b��z78@:hv��7@=���Q�@@m����@B#E��@C裣���@E�Cխ�u@G���Zf�@I�b艅�@K�	0��@M�"z��@O�_��w@P�0##cH@R	��^Y@S)�� u@TO^�y@Uz�6FǤ@V��_��&@W�x�C0@Yg4� @Z_��-�@[��C��@\�6ٺ�P@^Av���@_����O�@`x)��@a'_��P@a�ܠ�Q@b����@cBy�i@c������@d��PI2@ep�����@f.�GY�@f��r@g�-�y�@hud9@i:ڞ��|@je�gvS@j˲��� @k���ե�@lch���@m1��g�@n����@n� N:��@o�B���@p=M1���@p�F�d�@q��3��@q�^�!��        ?���V#��?�)�*Iu?���VB�?�+Ύͱ�?���-4@M����`@a��ZcR@7s��@b�Q@�|T @��Q�@ X�RӴA@"��8�5@%���E��@(WI�0EQ@+F�����@.V��_��@0�T �� @2j��b&?@4 ��}3@5�N0*�i@7�h��@9��"�Xi@;�X�@=��y�N�@?�b���Z@@����@A�6:n@B���ߨ2@Dȳ}��@E3�x���@F[����@G��2P/�@H�}u��@I��p��@K0�и�@Lsh���:@M��U���@O��^@P,~*���@Pצ�� �@Q�1����@R5�nq�@R�Ci�@S���peq@TR\�غ�@U4H�c@U�0��c#@V�HT_`L@WBp��?�@X�!�j@X��b.�@Y����Ҫ@ZR�K΄�@[ލ\��@[�B]@\�<�y�@]���/�@^Q�
j��@_#u�0��@_�㽩��@`e�8   @`�M�e�E        ?�i`�BI?���Nb�?�D��CA?�؛OF@M�/:|@	�����@(�ɽߖ@��c��@T����@ ��[��C@#���@'�V_�@*��9FC@..�=+@1?P	�@3W���DC@5�>��gH@7��4mܕ@:.b�(��@<��hF	6@?,����@@�.`i�@B?"vrk@C��D�@E�ݪt�@F�#Zm��@H�VfoO@I��^bH�@K )�ߧ�@L�Q[S/@N\�5I�@P۾ɵ�@P�N��%�@Q��+�@R���@S�x�YS@Ti�~�@UVu�@VF�H���@W:9/�P@X1ZG&�@Y+�JlZ�@Z)�dJ
@[+kF�9@\/sl��@]7�� �@^A��n@_O����@`0%߲��@`�+�S�@aE\���W@a�'���^@b`c�K�@b�
�W@c���@d��x@d�m��B@e<�`�|<@e�/��@fkc��@gF���@g��@7Z@h:��R��        ?���%�?��߄�ñ?�@5����?�L���U�@�	3�^@��Ip�@�q��@=�У��@dǢ\��@ �y��*@#
a���@&I�ɺq�@)�O&T[p@-cX���@0��t��@2��*��;@4��ͮ�@6�١<iF@9,Nm��@;��Ÿm!@=�ix`7@@8����~@A�G�k�A@B�ʘA��@D0"����@E�5jU}@G \tN	�@Ht�N	9@I�9�ES @Kur_���@MPh#�@N����}�@P�y���@P�FL@Q�*���8@R�-鑇)@Sp�¤+m@TO{�@@U1�����@V#�v��@V����@W뮓���@Xڢr�%�@Y̠H		@Z����t@[�}��@\�D<��7@]��^O��@^�F"d�@_�kN�ۖ@`]��a{�@`��pZ�@ag��iv@a�h�-�@bv�\�j@c �T�@c��jm��@d�-�(@d�ߥ��@e2<XG�@e�ǫ���@fR|F�F@f�T4n�        ?���s��?壻��_?���;���@qA*�X�@� 
}�6@�쿈�@��M@@!���xi@&=���&@*�\/5��@/�Dfm�L@2�F��=k@5���;U'@8��>5�2@;�y~鼺@?/�"��@AYcD�h�@C- ��n�@E<g��@G���)9@I�s�i�@K&��ټ@MMqJ�7@O���ۺ@P�M�R�@R��@S?z�E�@Tv�ݶD[@U�Ĩ��R@V�?��tc@XGK��%�@Y�ŞDVp@Z򋖀c�@\Q/�?@]��g]9@_!~A"n@`I+Q<�@ax�9�%@aJ�H�@b����@cG/_wN�@d�^��t@dևv�Z�@e��F�@fp?�7@g@�r�ǅ@h c�s@h銲�0:@i�v�J��@j��c�=@kxEق�@lW}T�@m8�B5@nB&B��@o ��)�@o�]@	@ph��r9@pރK��@qUB�4L)@q��WA�0@rE���/H@r�>-N\�@s9�`g��        ?�1}��?�Kq��]?�9�D}J�?�>��<p�?�"��E@X��w@j��ډ@<�=��/@b����@|$%��_@�$��=9@ Q(�Q+o@"ӥJ�v+@%zr_�@(B��?-@+-2��_�@.7����@0��>m�@2Tω�wZ@4��6~|@5��RG�@7�c�qG@9u�����@;`A �@=X)�@?\Χ���@@�G^1�@A�ث]�@Bک�Z+@C�^��)�@E��6��@F;��nb�@Gg�M�K@H��j\80@I�_�^�@K/詉�@LL3$i�l@M�U)%�@N݃�"@P�*`@P�[As�c@QnI��C@R�}��/@R�0a
3@S����<@T9-�@T�x���@U��-?��@Vh{���@W' RP�}@W�Α
��@X�|36�@Yo�!��@Z5�J��@Z�&����@[�w_��\@\���}@]b�wS��@^21���W@_���[�@_֦N�Qa@`U��. �@`��i��.        ?��d�Y^�?�D��(e9?셊�*�%?�S6�r,@s���E�@	�Bĥ��@I�W��@&xz�@���p3�@ �ؘ��@#�Y�Ť@'F�َ�@*�y��@.���H"@1`A��_�@3}�{�[@5�ز�X@7��)'14@:a�	/�@<�%p�@?i���c@A��k-�@Bb�<�H@C�p�fp@E7��I@F�����@H3?��~@I�}m��K@KR�����@L�5��@N�N�R�,@P ֆ���@P�����E@Q�R���&@R��ؾ0@S�{�n@T����2@U{�I]�@Vmb�i8�@Wb�Cތ@X[]K-�6@YW��
`@ZW8�zZ�@[Z2g^��@\`vT���@]i����@^v���Z�@_������@`L�Zq�@`���b-M@adXq�-�@a�g̀V,@b��3-@c�ϖ&�@c�jg_B@d9O6��]@dΞx�l@eeQ׌b@e�d��@f��X�4�@g1��U@gͥ�V\�@hk��^Q        ?��f�܆?��@9���?�[j\�M?�c_4d�@��b�G_@�xW0�2@�m],>@X!c�@���yI@ �}�f$@#(��N@&o8Q�@)�"��@-���e@0���(�t@2ɰ����@4��-�	@7#b�
�@9r��|@;֑VE�Y@>PS��8@@oh̲�7@A������@Cԣj@D� r$�@E�d�j��@GgG�^@H箠,�5@Jq1y�w@La*�s�@M�|�@OA�~��@Pv.�+@QO��0Y�@R-^�>�@S�X�W@S��2��F@T��a�;}@U�m��K+@V��fN�@W�.t�%
@X�@woe�@Y��Y�0@Z�w���@[��\F@\������@]����@^����ý@_�$*��@`hփS�u@`򓆠Cn@a}�U{�?@b
\��Or@b�^k�p@c'�-Wc�@c��H�4�@dJ���@d�%BE@er��5��@f	8�f@f�����:@g9?����@g�<X>9        ?����5`?�>C�/W?�����y�@aM��1@r4��X@�Epb@���@!�Bm���@&#�W��@*�Ʒ���@/�:S&S�@2���V�m@5� +�	@8����w�@;�P�|��@?#�j`7J@AR��o�@C%�Ӫ�p@E
K�Q@F���E�@IK	��@K����@MCz�!W@Oy�a	`@P�w��3@R	�&�9�@S:��1�@Ts{��@U���@�@V�R��Jj@XFZ� �n@Y��Y{f�@Z��R�ʕ@\T> �N@]����Z�@_'D.|��@`L���@a	�~�@a�L,��@b��	��m@cN�r
�@d�#>��@d���a�@e�kj��@f{�*��u@gMIv�Fn@h!vu��'@h��G��@i��-�@j�j��@@k�%C��@li�E���@mL#]dU@n0`����@oՠX�|@o�i�-�p@pu
�m@p�eJDX�@qb�Ģ��@q�ǟm@rTk��j�@rΰ��=@sI��vl        ?��O�,\5?Ҳ ��=?�Wz��?�7��w?�I��9+@���u@���=�t@5�KLO�@��?�/�@��Nx�@����@�JzH�@"-���@$��esۓ@'iA��_�@*7jB��X@-$m���K@0�J�0Y@1�än�~@3N
hSlF@4�/���@6��$�0@8�Ը
NL@:^����@<CY�3�@>4\�<N�@@�J��@AMBڜ�@B'���<@C7�D�[�@DM|۟�@Eh����@@F�N븵@G�>߄<t@H�m�U@J
�Y�p�@K@/�Ӏ@Lz�G�Q�@M��}R�@N�M���)@P#���9@Pʵl��@Qt��m�@R���{�@Rʹ.�H�@S}�Cg�@T0p4�|=@T�$�C9�@U�
޼U�@VU��^�@WW�i�o@WͲʜw@X�)�+M@YN�J�k�@ZT�+��@Z��3��l@[��2���@\iiM�/ @]5'A�(2@^����@^Ҡ0)��@_�Q��9@`;�]���        ?����m�E?�2��a:�?�kR(s�?�<-�*�@cU��>�@	��#�u@>\]�@��?�V@|��_�M@ �iKqs�@#ݽ���
@'F��_�4@*衱�K�@.��#��v@1g	坃@3���$�@5���଄@8�5��T@:x�y�n@<�m���@?�r�ܮ@A��E�@Bzy�k�x@C��C�@EW��:3x@F���]R@H[�0z#�@I�
�XWE@K�>�c�@M'K�Uԧ@N��tl�W@PB��C�0@Q =^��@R��� 3@R�2Pf�@S���!@T�S�Y��@U�G�U��@V�ۆAQU@W�����e@X����Tq@Y��=�n@Z�.KG�(@[���1�@\��X�@]�d�n�h@^��^yvW@_֗I)n@`v0U�u@a����@a���k@b 
�a�@b�PQ�=@cCr9e�@c�Y�=@X@dl�!"6@e7X�_@e��_���@f5]���v@f�m�{غ@gl���G@h
��X@h��Գ�        ?����"b?��JM��?�q�{���?�t� $�@΅	 �@	����Q@�Hy�|@bǂ<Ou@�����@ �rG�@#-���@&s��Er@)�2
���@-�Q{��4@0�>��<@2��E{\@4㧡̍�@7��BS�@9a�]�"�@;���Ğ�@>3�pm� @@]S����@A�_���X@C �S��:@D`F*��@Eȥn��o@G9�Z=ґ@H�tI�C@J4�Ѱ[@K�P�@MO���2�@N����@PD�F��@Ql68Q1@Q���!a"@R����@S�ÞwH@T��]��@Uo�o�J@VXo_�@WCpݨ9�@X1��`@Y#����@Z:��W@[��Mo�@\
_���@]��s@^��@_
���>@`L#��;@`�w���u@a����@a��2(�@b �X�ժ@b�r�"�@c4��:L@c�f2lv8@dMa��b�@dۑX D@ej�-b�8@e����Y@f�8���@g c��P        ?���L?�_b��|?�����f@FJ_s@A���-�@���A�@i���.@!���z�@%�#���@*pMJ�o@/ou��;;@2c�%-�@59�6��l@88���Ȉ@;^��7An@>���?:@A�zw~@B��qf�	@D�I)��@F�����@H�mٔg�@J�Y�9�R@L�
���@N�%3q#�@P��!!Vq@Q��fܖ@R����@T4��@UU~Jpa@V���2t�@W�e��>�@Y,�����@Z���Kv�@[�ŏ�lN@]><��
@^��Q~5@`	��Q�@`ûb!*@a��C��a@b@o���@c+9J��@c�ǔ��@d�:���@e\{��	@f*�z�9�@f�D�t�v@gθ���L@h���gʷ@i}��d�@jX�ŏ��@k6��j��@l3D̘T@l�D��@m�up�w�@n�@�պ�@o�uZJZb@pO�&)"@pƃCy|�@q?-g:FS@q�,">�@r4!��@r�'e�r�@s-p.��}        ?����m?�?6��L%?� �|ƿ??�P��'?��_0��@]o��jY@(kYs�@���+�D@U1�DƓ@2�q�q@[?���@��=� @!�����+@$8�*x��@&��f�;@)���"��@,X��r9W@/Fe��|�@1'��p@2���}@4T����w@5��n�w@7��^��@9q��ls@;<�S�@=�J��@>�l��@@n�N���@Ah�M�F@Bh��@Cl'���@Dt���$�@E�w@��F@F����o@G�!�|P@H�#��D�@I�zx�o�@K	�z��@L0��~F'@M\����@N�h�y@O�#_�N�@P{����@Q���n@@Q�}���@RZh'���@R��;��}@S�v��@TI�Z�y@T�td(�@U�xP=�@VG���@V�_���>@W�3I���@XS����@Yq �4�@Y��j�Rj@Zm�mG Q@[#���W@[�q����@\�p�Ok@]N���ݩ@^
pe�t�        ?��Ȑ�*�?����S?�O����?�K�85@��~���@׺Cܠ#@��>��@4���4@Ys�F�@�FP@#�}��K@&@�z�[�@)�q���!@-X8ݪ�e@0�����@2����@4����!H@6�ܟ|9�@9!���!@;y_O��@=�c|f@@1|X��0@Az���@B˖7<�@D%���@E��9��S@F�I�N%d@Hg�#��`@I�25�@Kf.�P��@L�ɯ�g�@N��u��@P���r@P��ꐲ�@Q�|~��@R�ZTd��@Sb�X���@T?�u�@U z�`��@Vx\��@V��P!7�@W�l�%B@X��8�a@Y�gj�1{@Z��X0@[��=��@\���*��@]�N�J�@^�,��\)@_����>@`D�$Y\@`���vO@aJ���@aϳJ�L@bU�"�[@b�/],�@ce���@c�l��M�@dzI�ҿ@eK瑪�@e�oh�@f!��#}@f�0�1&        ?��@��)?�Ąy���?�!:a>ny?�1渐@�@�q�B�@ǒ4r)@�l��L@)�5���@L��|��@瑵��@"�X*��@&7����c@)���5E@-L�3�r@0���>w@2�$z;C@4�KU�XY@6�V�V�h@9�&6�x@;sn�~E�@=�A[.�@@/B�A�@AxZ�J\r@Bʫ�N@D%��Y�@E���@F����a5@Hk�j��@I�q��@KnF��:@L�X�΂@N��ָ@P&a���@P���Ɖ@Q�E���@R� x7�@Srlzb�@TR8,�h@U5�h�]@VT���@W��&@W�O�b/@X��{�@Yӌ�F�@Z�䌜i@[����3R@\��m�e@]���N�@^���b˿@_�9T�f�@`b�����@`��r��@al���w�@a�x�;��@b{��ԥ@@c��t@c�.���@d�[�@d�W�"�?@e5X�`�@e�С��I@fS��m�@f�h�T�a        ?��珁��?�/��?��YW�t@}�!=g{@%�|@�����"@H?W/�{@ �P���@$�Ť�N�@)L��{@.#J@1��F�pc@4@�SL>�@7��X�{@:f���@=(�<���@@1�A���@A�Ƞ��@C���}L@Eē
��@G>�oXg@I%��n�@K��x�@M�u�X@O(ҫ1P1@P����Ѕ@Q��5�j@R͞
��@S�]*�+@U��eߒ@V:�c�1 @Wi��T@X�^��W�@Y��2�E@[����@\Z�:��@]��\Gx+@^�+r� z@`!���@`�45���@az�l�&�@b*��t @b���'@c�e��)Q@dG�lf�@e `�>8@e��f�5�@fw�6���@g6*�@g���<A�@h���@i}eyaJ;@jC��c�@kr�@�#@k�'k6��@l����@mmǝ$�(@n<�Ad�`@o!Z�`@o�B]i+@pY~Ӹ�@p�'�Ϋ@q/����K        ?��W��?�-HQ_�@?�KA2L?�"�2���?��-��(@:˕�-O@B���L@)	$N@?�/B�3@Qf���@��>~�@ 2(߫��@"�q�,#K@%PwYh�8@(����@*��\̟�@-���g%@0�53���@22Ɂ��h@3�Q=�7k@5�x���@7o���f5@9KxaQZ�@;4���e@=+���n�@?/���%@@�����'@A��� �@B��h�F@C��#N�K@E>�n�@F)�e�p|@GW����F@H��Ҿ�@I�I�=�@Ku�M�@LGtCY.@M�<y"�@N�\�G$�@P^�-K'@P�$|�*d@Qvt���@R(F�G�o@Rܒ��{c@S�R�J�@TLb`��@UPc��@U�){��@V�cu<uw@WI��6@X�Hc@X�E��=@Y��LL3@@Zj|1�^�@[8g�|\�@\���@\���?@]�.\���@^���DC7@_^[7w5G@`��h�4@`���-�@`�i���        ?�<6��Cw?ڟ7?��?��Z��?����rī@��vy@	T���%@����j@���R@���%`=@ P���@#j�RG�X@&�|7-�@*F�`U�*@.~0YA�@0�t=���@3!p��@53y=]v�@7r��k��@9�/*!��@<34�R*�@>�,ෟ�@@��}:�w@A��r�\@CUs&��@D�z\��J@F,�<��@G���%��@I'\��<�@J���(i@LC�w -�@M�lMtC@O�˹76@P�qD�/.@QnA�^�@RJ� �[@S*ި#��@T�"���@T��)_Ԕ@U�+�)Î@V�T>�@W�6��E�@X��ߙ�^@Y�4�#�F@Z�����s@[�̴?�@\��E��?@]����@^��/��@_��Mή�@`c=���@`��b�@at]3��t@a��[-g@b�	�Rr@cu�ʨ^@c�3�Σ�@d7E�(��@dȦ���z@e[Pc]�h@e�<��3T@f�g]���@g�$E��@g�g��V�        ?�"ꢁԦ?�X��,H?��kQ;�1?��	⟑@� _8@
^>��A#@��5|@�����@	�CG=�@!�y�@$C���V@'��Y��@+o��$�k@/ZDk^O_@1��>q5@3��J�4@6)"57�@8��b Y@:��`��@=~æ4��@@չ��R@Ai�p@Bͨ���z@D<v�Ml@E�)7i1r@G7��5�@H�;�H!H@JX!?�@K������@M����;@OK�~�@P�q�z�@Qa*~�\�@RD�@�@S,jh�*(@Tɒ�f @U����H@U���'��@V�(�א@W�,�o�>@X�j%@Y�\E�@Z�s4��@[��ݴ$k@\���ۑ@^QLR`�@_�&�D@`Gv��@`�,��w@a3��C��@a(�l^@bR�ڌoG@b��k�@cx k�:�@d���#@d�!�l�@e:�a��@e�s���@fm����@g	3'Y��@g�y�a@hD�sވ@h�t���        ?�I�B�L?������?��IW�d@c���@��<��Y@�l�^�@K�U]@"���f�5@'&�d�@,�~��@0�-7�nS@3��{�-N@6���>ڡ@9�z"s@�@=4����m@@_ѡm�m@B9B��9�@D&+�o7�@F&�:
�@H8W�D�|@J\���@L����U@N����}@P�+���@Q�k�(@S	�ۧ��@TNJ�T!�@U���k�)@V�d�ɴ@XIϗM�@Y��m���@[�O>ͮ@\����>@^ �#ɴ�@_��zd@`�!X[D�@aI���D�@b~����@b��	2�@c��4��@d�i�7�@e[ ��L�@f4�m�@gMJ]Z�@g���'Z@h�p�a��@i�����@j��O;@k�ҁ	h@lyԴjn@mjO�@n]y6��Z@oSLHz�@p%��n�@p�g&�>Y@q"7Ͱ]_@q�N�1@r#�[	�%@r�<㊥�@s*B@��@s�Ė�@t5W7-#�@t��E׎�        ?�&Op$=?�kX��.�?�N�,8��?�v�\q�?���ɢ�@�?UY�@N6�',�@̈́���@{�/�@aR�0M@�-�@0"�@!��[�0@$fBdWO�@'���g@)ùڬ��@,��9�@/��]O	�@1Sݩ��)@2��/�p@4�,<7X@6<�0�@7�[�P@9�ނ~I�@;������@=qnL���@?[	y�@@��~��@A�p��TY@B�^��98@C�{A�)@DŪ����@E���>@F���C'@H��	@I3"��Z�@JZ=]q�i@K�ߩ���@L�����@M�a~�oZ@O#h��r@P0J��	@PЌ��}�@Qs�m@R�n��@R�8uX�X@Sf��l�@T
�9�5@T�CՑ�W@UkPz�W@V'4�h@V̾��=@W�V��@X5�D��@X뱒}{L@Y���X�@Z]ς
�@[:�f��@[�1�$�@\����͉@]T���-�@^*8��@^����        ?�N�F�A�?ڰt3߮?��ܐ���?��%|��Y@֮���@	f� ~�Z@�Wﴤ@��G3�@�� ǋ@ ^��w)@#{�ɏ�H@&�T.v�@*_uuo)�@.!P��={@1
���$@3�e��@5Hi���+@7��f��@9� Nn@<O���*@>с���@@�/���!@B	�r��@Ch�Bb�@D�\��&9@FCM��B�@G�TJ�'@IB;�'�"@J�����@Lc�yGDY@Ng��
�@O�Y�	@P�e���@Q�8��^�@Rc��	Fh@SFv l@T,�4�@U�߆P�@V5�*�@V�Fê>@W��q�6�@X���6
@Y�����@Z۶s�(�@[ݟ�`|T@\��T���@]����S@^�����@`�K=�h@`�I�1�@a�pT�F@a�O~��=@b.��9�O@b�#�j�)@cM-�F�@cޛ�,)f@dqi@��=@e�eR��@e�+�m�@f1�}J4@f��� Dc@gcI�U��@g��'W�C        ?�����,F?��rM��?�T��p�?�^w��-@�v_`�D@����/�@�}?@e�@R���k�@�uQ�p@ ��<
�@#2�ʰ�@&b�>�@)ڕ�n�.@-�>Ea�1@0�TTyf @2�����@4ш*y@7��w�@9J�+�)@;�xj��@>z�@��@@M��@�@A�_�E��@B�W���@DLp�	�@E�vQpEy@G#2���K@H�ui��@@Jx��Y@K���<�@M5�e�@N�:f��|@P7=	` �@Q���@Q�^2�4@R��ʺY�@S�}.R:p@T~���@Ud!��$�@VL���@W9�f�@X(TF�S�@Y�&�5@Z&��@[�/���@\�o�5�@]&����@^<��R@_%���@`�.�wy@`������@a�N}@a�D!-;�@b"�c��@b�>){�U@c7��L�@c�m��Q@dRl4d��@d�<�D@er O��@f�w���@f��F0y�@g*����y        ?� c'O?垢��t�?���8�z@_f4�P�@h���a@����.�@�=6�@!�11e]�@%�Pu:QU@*�����@/�2�ڷ�@2svS�B�@5IR+:8@8F�6б^@;j gk��@>���(�@Ah��5@B�ˆ�Y@D���˷*@F�/�_�@H�2Oyy@J�'��&@L���]{�@N�]��@Px�q��a@Q��y�
@R��p���@S�K\��@U>$kI@VR^f��@W��O���@Xԝ�~��@Z����@[n^7�@\�A�1*�@^�8�@_}�'�*�@`q�U�5:@a&�VD��@aޣVz�Y@b��n��@cU��c�@d縥/�@d�|/��~@e�h����@f`���]�@g)$� �@g���y@h�� $�&@i���Κ�@jaB����@k4�\ZW@l
+�Q��@lᵏg&�@m�?�K�H@n�����/@ot/��O0@p)��@p�]�g7�@q�Q��@q~V_�i@q�/�c�@re�c��        ?�G%7G?҉���4?�q�K�/?����?�(Tq�5@�m�N@��ƮU@eğ�@�iÇ�@�a\��@���%@_@��D�@"}b�1@$�V^t�@'B���Ѥ@*O��E�@,����@/�p^�$@1�o��@3v�&(s@4����A@6r�N,*J@81��nKT@9�2'���@;�>����@=�pes@?�~�q� @@�r;"5@Aˑ�T�@B� V���@Cۢ0-�@D���&K@E��˙�@G̶p%�@H5b�(�@IV��em�@J|�ze�@K�%*��;@Lը��@NK��v@O>��9�@P<Рv�J@P�A��@Q}A�u��@R Op�)	@R�7��fO@Sk���p@T�����@T��MA�&@Uj��#�@V�"�j@V�Y[Y��@Wy�?;]@X,��#(�@X���'e@Y�D�0�@ZOw� �@[l�e��@[�Y��@\ϸy��@]=��|�@]�9d��e@^�b��z        ?��\n�?�I�V,G�?�|_���?�o�mۚ'@��Db��@�|�.�2@�sҾ�@N@vQ� @v��=z�@ n�Ǿk@#f�7#�@&S�#�	@)�O�f@-l�m���@0�UQlq@2�qX��@4� �B{@6�W/ ޖ@9-���Al@;���o�@=�����@@8���@A��b�[�@B�W,��@D/�,���@E�6�m @G �Pe8P@Hv#߿y5@I�`��@Ky)�܈@Mgŋ�'@N�uƘ"�@PVmV8@P�R�V@Qâ8*�@R���2s�@SyZ��'@TYOm @U<��࠯@V#�f?@W�`j#@W�i��Q @X�%hJ'�@Y�ѣ��@Z�]�C�@[ɻJ�P@\�ڽT�@]®B{�	@^�(,��@_�=�VN@`e�b��@`��\�@aoS�$��@a��l�]@b}�G�:�@cY,Am�@c�L0�2�@dY�)��@d�}Dj&�@e4� %�@e����N@fRG�/G@f�``)        ?��Q�N�?�l/��T�?��Gd�V�?����$)@a����v@q�
��N@I�/uO@�X��K@@��#q��@lU�u@"��۔kI@%܍��#4@)<�%͡
@,���|�@0F�N�D5@2=�l�@4I9��@6j5U�@8�e�MG�@:�OJc-�@=D:�e�@?��$�2k@Ah�aR�@Bb5����@C�q;�]t@E�	�@Fn;A��@G�W	]_5@IG�N��7@J��<���@L?�*�@M�=�x�@OR4�!��@Pr�3?qS@Q@U��@RWÝw�@R��h�q@S�X8o+�@T��[��@Upi�a	}@VO��Ӌ�@W1���ǝ@X�N�e@X��KI�L@Y��s�n@ZՅ��h@[���:�@\�l:��@]�os��@^��y��@_�K���@`J�8�@`�tmӹ�@aG�{�@a�tn���@bI���x<@b�x�v"@cO歷�x@c�[�xp@dY��zy_@d�Te��@eg<�ر@e�aUI˳        ?��T��?��ܗ	�?��y�au@�>a�@`·5@�rd�]	@��|� @!'&ϋ�@%7L�@)��(8��@.c�܂>�@1��^t�@4z�%�ž@7X$<��@:Y#pu�@=|O��"�@@`,wS�@B���@C�@�t@E�R��@G��0��@InT����@Kh}J��@Mo�%^/�@O�I� {@Pҟ^UP@Q�>g��@S�H�d@T(Z�X�@UP�aVD?@V~a�GD@W��Ͼ��@X�F��@Z(Ez�@[k
���@\��EZo�@]��Q͵@_QQ�2��@`S�,0�@a6G5PA@a��Ӌ_�@bb�v�DZ@c� �V�@c�M��.@d�N�kI�@e?�K�K@e�<z�@f���j@gz���n@h=_�%c@@i��NN@i�y@�X@j�2}��'@kZA�&@l&,����@l����@m�{��Z�@n���'��@og�u	��@p^~Y��@p��L�-@p��
�&�@qb�j3F�        ?��m!�;�?�8AO5O�?��
f?�Bű
i?���&X@D6^�?'@��$���@Y��z�@3d�0l�@
v�S�@-7/��f@�H=!�@!����p@$ .�h�@&�&���@)uvj��@,N(S:	d@/D\��k�@1+�]�y�@2���;J@4h&-!��@6�<�9�@7�
���@9�O�.�@;�IEh@=d(�4M@?U8�Kx@@���v@A�;-$�,@B�lw�7@Cƒ?��K@Dۃ��@E���b��@Gy��l@H:N�<�`@IdC{�`@J�@)S��@K�/�$�@L��dSx@N=���@O��)#�@Pc{�GP@Q	Nl�@Q�h��?@R[�m���@S[J��@S�'p,�@Th#���@UH��%@UБ��q�@V��n��:@WA}{��@W�.�|@X��I&�@Yz}�o"@Z<Ah��@[ �0*D@[��Nn�6@\�{���`@]W6r�@^"�L���@^��"��@_�M��0        ?�*���?چS���?�����"?��:%���@���@��@	H}v�f�@����\@��)��@�S>.W�@ Qt��p&@#nG�4@O@&Ĵn�)�@*R�Q��@.�)��@12�;@3=���@5Fo���@7���+DL@9�چYR@<TͲ!I@>�{���@@�ų��d@B�`�@Cq�*��@D�dj��3@FPS	<�@G�h�Q�@ISl�K�@J�&�;i�@Ly_��:@N��+�@@O��aJ�B@P�	�zdv@Q���)@Rs��x�@SVA��@T= ��M�@U'H"��c@V2t�@W���Y@W���-�@X���(@Y�����R@Z�r��@[���3�@\�q�P$~@]�5b߾�@^��x�ʞ@`�~4�@`���F��@a����,@a���H~@b,MS�sT@b���@cG����@c�1	{`9@df���3�@d�/jɸ@e���(��@f]�Ҫ@f�(�J!�@gIo>�X@g���r&�        ?���ʻ�?�>YB�� ?�1S]T?����w��@�E7�� @	Q�s�?�@⨎�{)@�pƈ��@��[��@ VR S�@#rԠ�|�@&�cc6$�@*T��ޱB@.��
��@1��q�@3����@5A
� w�@7�=B@9�;���k@<FX�^@>��*E��@@�*6�w{@BZE�!@CcOt�H@D����@F=��K@G��ܬ��@I<|�2}@J���#�@L^8���@M���S�@O�V<~�@P�|a �@Q�7��X�@R`��_@SC&��v@T)7�`�D@U�.X�@V <�zDt@V�R�e@W�e���L@X�"��O�@Y�:y�7�@Z֜Z<�X@[�9UkkV@\�ƻ�@]���A �@^��֬g�@_����@`��	y�"@a��
|x@a�� G�o@b)G@b�S	�K@cH$�7ģ@c�_�3B�@dk�/\�@d���Z�@@e�Y���@f,3Oq@f�{�@g]eH��@g�hq<�        ?�M�{ ��?�>�f�-U?�D�rOϰ@.�v�ic@�ٕ�J�@sчzH@��h�@ ��Y駙@$�	��B"@)"�d;|@-�JV��@1�D���@4A�Ad�@7$�\W��@:.�$m�@=\�r�a@@W�n�۵@B���z@C���*�@E�����l@G��K'��@I�;7�v�@K�Vc��@M̌��@O���X4m@Q{�	Q@R:Ƥ���@Se,�@T��4�~@U;��@WWh7@XP��s2�@Y�ă�@Z��J�@\D_� 9@]��(u$@_�1�q�@`6����u@`�Y_ ,W@a��X�(�@bet֠g@c%��b�@c�|{
-e@d���H.�@et5X5f{@f>��U��@gp�N!@g��u]bM@h��i��5@i��ʚ��@jX�|O��@k2GmYQ@lZ���O@l��>+��@m��"!_@n�D����@o���"@p?��J@p�٨č@q+?��@q��D6�7@rn\��F@r�0��L        ?���Du�I?�����?�	�n��?����2�?��)��Ų@2�b�z@:qj춛@ ��v�@=�52�@P��H+@��|�@ 2��F�s@"����%�@%Q�#�]=@(dŕ� @*�)��Q@-�L.��@0�����@2.pg6f@3ܸC��R@5�:���@7c�c*n@9:l�<��@;��(�@=�e���@?[楬`@@�}	�=�@A�;��h�@B���0?@C��|��@D����$@E�He�?�@G!  @@HM2\@I~6k=%�@J�v"vȶ@Kﰓ�f
@M/�p^�@Ntü�U'@O�s�7�@P�d�	�	@Q/�s@*
@Qے0o�@R���V�@S9�~1�^@S�Œ:�@T���8j�@UW)��<
@V����@V��t;�R@W���)�!@XF����H@Y�I5AF@Y�g���@Z�<y_Sp@[U���� @\��ߨ�@\� �%@]�^ּ{z@^�ox�"�@_SB2�,@`i�Xo�@`|����        ?�vcq�rp?�u�mcI?�G��� n?� 	\�D@M�C��@@	�F<wn@'�eXWX@����@Q\,��@ ����2@#�^BBa@'�>�A@*����@.v� G@19a� �@3P)g֙@5~�?cNI@7��"�$@:,^W�@<���`5@?�[7v�@@����Bo@B.��W3@C����f�@D���?�@Fl�-��x@G�#)�\@In<kn��@J��w��@L����p@N0����@O����C�@P­�'�@Q��"_�K@R|���@S_���@TE>�ǡ�@U.�oI��@V@?�@W�?���@X �T�@X�ˊh�@Y�V9S�]@Z�"��M@[�)�kv�@\�fY�.z@]��I�)@_nr%�@`
����@`����@aۖ��@a������@b5�@�؍@b�x��@cTȻ�@c�r˻e@dxT�%��@e�!��@e�Y^�w'@f9n��&@f��+�ds@gk��#$V@h�X0�        ?�x��bp?�CD��d!?��s?���gh?@����fn@	Eoֆ~�@�Ϸs@����@�M��w@ Gwy,n@#_i1��@&��bi%�@*4b����@-��"��@0줝��@2�lQ�y�@5va{�=@7[w@9�^�G@<�a��@>����^@@��y+�@A��QD1 @C:�.c�w@D��%�5�@F��an@G�k�ڪm@H��N�N�@J���y�a@L��3�@M��'M@OKaa��=@Px�U�R@QP 8�D@R*����P@S	N��@S�4���@TЅ�{<
@U�l��U@V����@W�V �}@X�;���j@Y~\C�@Zw�(�jW@[t ��B@\s�vE@]v@ԮY�@^{����@_�d%��@`G�v��&@`�"yAe�@aW��})�@a�Ѭ��,@bmJYݏ@b�,͟�G@c�xm��p@d)�I�i@d�;��<�@e;��9J�@e�p�uM�@fd��T]J@f�4�@g���&j        ?��K�$?��7�g?������@nO2�R�@�����@|o@�	QČq@!��D?2�@&	����@*��@f�]@/��"�;,@2�Vծ}�@5z5Kp@8���b@;���9@?}���)@AAa���@C+�S��@D�i�9@F���z�>@H�S`�;�@J�����@M�
q�w@O@E�tT@P��/Я�@Q��7Q�@SMN�@TD�K���@U��g @V���;��@X�3@YT]�k�G@Z��R�u�@\���)�@]a�J@^�b�u��@`��:�,@`��%��3@a��g�X	@bI�)Ѵ|@c	�%D@c��[��@d�E��@eZ@vF^�@f$��r@f�:�> @g� ߗVC@h��v|�9@ifتEP�@j=C����@k�pJѽ@k�碾W@l�~�A@m�`�R�@n��|z�@orl��ad@p,
ƻ�@p��c� @q�hS�m@q��)�w8@r|�ѳ@ryO����@r�by        ?��O�y?���Y_�?�l{�-�?� ��?��]E��@2��1�4@;�>\�@Y{�t�@B�Đ=�@X���8@�a�@ <�B@"��Ϯ{@%d�zC3@(-����@+��#.�@.$J:�RQ@0��D�H@2M4qi�]@4�<(@5Ĵ���@7�<�	F@9u�'.��@;cO��@=^N�:�W@?f�*̬o@@���-�#@A��[�q@B��$>�@D(d%�@E'�	/@FQ��(E'@G�����@H�-u;�Y@I�7.�o@K3��5�@Lz��Ha@M��ʚ,�@O�x#F@P7�}�@P���n��@Q�����@RI�`�Q�@R��{��	@S��E�X@Tr�d��@U/�8x�'@U�i��?@V�@�:��@Wud@�C�@X;ɏ��@Yg#��n@Y�3ޢ?1@Z�'����@[k<>�|�@\<io�!1@]�0�=@]�� �&�@^�<<��m@_��$�@`8],k�@`����X@ar1�Y�        ?��.��?۶�<�.7?��:x!,?����^V@��l@
e#�{J@��)��E@�$��z�@{�\�T@!�'��V@$P�s���@'���qʸ@+�)���@/|�|bS@1�J!U
@4���@6K�>-�D@8�V &�@;'Mh�@=��QSe�@@0{�W@A����W@B���i��@Dnmil8�@E�nGxH�@Gv�-���@I	���@J�|P�aO@LL��ͅ�@M��؆GJ@O�`���,@P��7��k@Q��Uz@R�tsWUo@Sx>�}�G@Tj)X��@U`8�i�@VZJ?��@WW��E�@XY��"3@Y^�r��`@Zh�S	)@[t�D1<@\�H�k2q@]�/�: @^����h@_�Q��@`t�j���@ad��@a���sp�@b+��g@b����#@cW�BA�@c�O�r8�@d�4��G@e%�u�aT@e�J��Ow@f`sT��>@f���vNw@g��}��@hC'���@h湈��Z@i��"j�h        ?�3�'��?�L'�2;s?����gA?��DqR�@�`�|x�@	L5~�@�bo�P@�teȓ�@��y��@ Ql$��'@#l�+}@&��샇@*MF�1f@.�#kR@1 �.�@3��@5=*�i��@7~QwZ�@9վ���@<B�^e*@>���p@@���$�@B���@CaN
���@D�F���|@F:I|Q�k@G��;�;@I6mgn��@J�P�Zd@LS�6g�#@M���w@O���݉�@P�s��q�@Qv �P�[@RRi*��@S27SÑ�@Tv+�1@T�K��@U�� |&�@V�	EJ�@W�Cr/@X���0$@Y�ߌ
�q@Z����~@[�5,FW@\�,��@]��LS�@^��zj=@_��?>c@`[��/z@`�t���@ah�q�<�@a��\�{3@bzSGƴ�@c�~w{@c��!.e@d�����@d������@e:��/>U@e�ڙ��@f\%��S@f��j�@g��/g��        ?�\"mL%+?�v69�E?�˛�d.�@R���8�@ܯ�ca�@�6��0�@���lw$@"�ӈ�b�@'σ�]@, �y/@<@0��!ڝ@3�rH�O@6�k��@9�F��0	@=!��@@U���@B-�>��M@D��&�@FF="�@H*�ǖ��@JN$Z�ZT@L�=)j��@N�|M��@P�>`nC @Q���L@R���J1@TCGD��@U��h�+�@V�`��@X;��c��@Y��RyQ@[��~#P@\v�r��@]��YI�@_k٪q�'@`xF�p\Q@a=����@b�ڬ�@b��-<�@c�5�w%�@dt���j@eI��+�@f"7l��;@f�z2���@g۟_�j�@h���5UM@i�c�8��@j��x� @kp,�)�@l\��&@mJ����@n;α�!@o/�2$��@p��t�@p�2N4�\@q���+�@q�~x|�@ri�\]�@r�|�l�Y@s�^˦-@s���ie@th�`��@t�┙U�        ?�96ę�3?�}@e�'?�c�5��?����y?����)h@�6#r��@r�$Y@����@����j�@�<\��@�7(L�@AqF;)
@"����C@$�D�/�@'*)f��@)���	L@,��SN@/�?���@1kI��`�@3w�M͵@4�J���@6Vj�n�c@8�Υx;@9�ax�&�@;��η@$@=�"���7@?u�ģE�@@��Dɷ@A�-M���@B���W�,@C�'���t@DХ0)`z@E���T�@F�?�X��@H:8[p@I:���2@Ja8�&S^@K��dX�@L����K@M�c]��@O'����o@P2!�ĶA@PҒ����@Qu��D@R��P�Z@R�f@��@Six��@T�ڂ$-@T�r1���@Uo
d���@V���0z@V���6A�@W��5+@X<���@X��&'�@Y�pP]��@Zh�U�+q@[%�ɥD�@[�[O��@\�	AMQr@]g4���@^+,�͎@^���nq"        ?�aU��c?��꧰��?� �Qj_?��>��@&���Z�@	��Ƈ�@��cx@�Q�<�@�cA>@ p"��@#��Ci��@&���@*x  �� @.<J~9�)@1�� ߗ@3-��s�@5Y-2�1�@7��4���@9����/�@<c[���@>�:L!�@@���M,@Bŷ�`�@Cu�'���@D����s@FQ�˄^?@G̈́@S��@IR,�	�S@J߁��r~@LuR$@��@Nn�im�@O��s��X@P���)��@Q���@Rm�zp�U@SPg��\@T6�O�Z<@U �.�@V#T��g@V�$�})@W�4\@X�qfg�q@Y�#r_.@Z�vSJu@[��[�DE@\���@]�u���@^��IՄ@`5L�x@`�����@au���@a�����@b0D�~/@b�/\4M�@cMg;dc@c��o�:K@do����@e���@e������@f,��H@f�!(J@gZ=g7��@g���й        ?��L��8�?��yw3z?�hJ5���?�p��pF@�(��@	/:%}�@��}��@f�m��@��;O@ #]���@#3��W��@&|3�Wx�@)��T�J�@-�D]ؘY@0�(���@2мz�C�@4�DY�>@7)#��l#@9v��HzV@;�vDC��@>Q���@@n_�1>@A�vp�!@C:��f@Dy�g�Co@E�R��|�@GY�F��2@H���uI�@J\�nA�@K�\ۺ@M��NEX�@O���@Pbt(�Ȳ@Q9?D_V�@R�ԙ&�@R����~!@SӴ�%@T���Z�@U����H@V����@W|�q>P�@Xo ��	@Yd�}z��@Z]���@[X�$B?@\WcЉE@]XV�li�@^\p#��@_cK3���@`6ms��B@`��ۘVo@aC��<Ϻ@a̝�9�@bV�5��`@b�6K�@cn5�Wz@c��m��R@d�i2bT@e\v˨@e�{��-@f=�4�#|@f�1�[4R@ge���,�        ?�R��4W�?����A�?�\�<#�@�N}�A@���^��@'����@�q}�:@!/G���@%U(�z�I@)؈�:w�@.�в4�@1�H�u�@4���Y�@7���OS@:��h��m@=ʊ�lb�@@��@.b�@BB��=
@D��H�@E��A�U@G�􉟐j@I�,�H��@K�V'���@M��3P�@O�)H[<@Q�a���@R
�@S=�)�`�@Tdp��w@U�6�r�/@V��mI�@W�U0�UZ@Y:y�Ŀ�@Z~7[77<@[�x<s��@]'��%@^j/�$�@_À���@`��1��@aB�*��@a�>gK@b�$���@cg�z�	�@d#V�*�@d��@e�$1�"=@fe����@g*C��e@g�-E@h�ujK��@i�a��C<@jU{�>4 @k%�O'
�@k��@l̟#��@m�8�m��@n{���B@oV�+��#@p��^�o@p�2A\�U@p��Y=� @qk#�� �@qݞ��R�        ?�M.�r/�?҆>�h�a?�i���<?��:.��4?�M7�@�#��R�@g΍Hoy@�Pqlv�@�>��}�@x��:� @����.@/9}�&@!�C�{�@$~=`�@'"4� U@)��(Z�@,�n�rN@/�S�@1mǮ��^@3�:!ky@4�վ#��@6b���a @8#C&�@9v@;���g@=�;dm@?��h�u�@@�kI��*@A�pm\k@B���7q@C�ǘ�2�@D��'��@FT�>��@G-��R@HPoh�6?@Iw���{`@J�xQ��@K���uX�@Mܝ���@NF�H��>@O�
�1�@Pe�!G@Q	H�B�@Q��u@RX�^5�@Sm�W�@S�|�;8�@T_�̆ć@U󯨆�@U�N��@Vy��!6�@W1]W��@Wꇩr�@X��v���@Yc>^���@Z"�2��@Z��q�@[�����@\k�3T�@]2�jc�@]��.�U�@^�+"&@_���
��        ?��&���?�%��_�?�\w
q�?�X�h��@��D��@��P|@��2Z�@N�0ِ�@���A�@ �٤"@#'�!�@&p��#��@)�dݰ�@-�SQk*,@0� S��C@2�`Y7�%@4��D�5@72��o.t@9�ӅD@;����@>g.-5�@@{�r2�6@A�	6@a�@C)�Uy.M@D�@�N{f@E�����@GuT�zބ@H��ĸ�|@J~w`=�@L�t��@M� �lO�@OJN��J�@Py�LFj@QR�r��@R.'*H�@S��;Ԕ@S�U�g'@T�L��H%@U�â"@V��p^$3@W���oT{@X���[�@Y�����n@Z���zf@[��_�U�@\�ce�^@]���N@^�q����@_� �JU@`V��{��@`����o@ah��n�;@a���!�@b�=[��@c�2u@c�On,h)@d-ܾ*�@d����]e@eR��j�@e�ZE��@f}�Y<@g��&@g�8��        ?�ݡ�L_?�/�rS?�q � ��?�w�n=�@���(}�@	A���@���W @q>�f'@�Ï�O@ -��	i@#AX��W@&�Rde:@*4��+�@-��S��-@0�]��	�@2�d+�#�@5�v|�@7?���p�@9��gJ:�@;��=x*�@>n�ye��@@~2�݌[@A��eK��@C)�J��@D��G�F�@E�'��;�@Gn����@H쒝���@Js�|�5@L�E�_�@M����M�@O7v����@Pn��ƥ�@QE�ܷ��@R �|8� @R��TpD@S����O@TŻ�YǙ@U�@���@V�o�4�@W�C�c�@X{W�`�y@Yp����X@Zi��}9@[d��O]@\b����@]d*���Y@^hN��17@_o@��@`<y�F[@`¬�u8�@aJ3&�S@a��!̼@b]!{�e9@b�}���W@cu��@d�^8�s@d�懓�@e"d$��@e�i�;T@fE��LT@f�u�Q�@gn"��        ?���a?I?�G��??��V��A@�I@7�s�|@ױ��e�@rժs<�@ �l�x�@%~��@)���b��@.U���@1�V�q�V@4z�qk@7\K;B%�@:c{�`4@=�.i�U@@m��mB@B$�b�^�@C�e�@E�HZ��;@G���T�@I�z�q�@K�K3��@M�"��K@OΡ}���@P�D�_@R�˹��@S<��Q��@Te�@�Fj@U�0�X��@Vʅ��$�@X���J@YF��)��@Z�z^Q��@[��&ǘ�@]+�E�*@^����G�@_ߠQu��@`���&��@aTVּ�@b
s�D*@b��ܓb@c~;�S��@d;�K�@d���tA�@e�E��]@f��VJ@gJJ�@hp�L��@h���W�@i��%gq�@j|��|�/@kO?��@l#d�o:@l����@m�x�N�r@n�,*�;C@o��x*+i@p4j&@��@p�����@q^K�T�@q��-.�@q�e�y�        ?��"Q���?������?�Ǿ�q�?�b�ό?����h�@�0��@�k,��@�b!���@�7�@��D�@��X�oJ@ �&5�Z�@#<h�o	@%�kPM@(��o��@+Ƹ8��@.�q6Bn@1�����@2�^��@4�k���@6O5���@8-/�ƚ@:�9��@<�$���@>�����@@��O��@A.��J�[@BH���Q@Ci5K=i@D�c��K:@E�BM�@F�3�x�_@H,�k�@ImQ��@J�'>/
�@L�s@MS��j�@N���br#@P�A1��@P��m���@Ql�/$5"@R$���@R�Qbچ@S��w���@T\����@Umd��|@U�ǘ 	y@V������@WwF�s@XDZ���A@Y��.��@Y� ]�@Z����@[�m
��@\j�8@�U@]Fbn���@^$]�+��@_�L�q@_�+�?5�@`e����5@`�mQ���@aM�ө��@aÑ�c�:        ?�feU�d5?��	���?�$��`?���r�ф@3e�0��@	�[CZ�Z@�����@�6�qWa@!f5�@ t�AOv@#��99��@&����@*z�-;y�@.=�M��@1�W��:@3-���~@5X�#Z@7���o��@9�
}�ԧ@<_�'֭v@>�p�d�@@��P�`@B[�m�@Cq�W�oA@D�c�z�G@FLm���@GǍ��4�@IK�@/^@J�\ʅh]@Lm�S�X@NzA*�@O�x��HH@P��\]@Q���E�@Ri�� g@SL<x�@T2���i�@U��Q��@V
x���@V�ń�4@W��b�@X��^�n@Y��%L}@Z�_�0@[����@\�w6�&@]�3)��@_ 
����@`xu^?�@`�lG5�@a��r�@a��X��<@b4�)F;@b��2�@cS\�cl@c�j�*@dw�����@e}��~@e��f�Q@f8��J�{@f�M�q�@gk���k@h/�?k        ?��i���8?��~��?�Kǽc�?�/��[i @]��1�@	Ը>��1@7Z��O�@�2y�B@i�j;�m@ �Qm7@#�q�i�@'+�mj��@*��R�@.�� Y�!@1K3���@3eZw��@5���团@7�P�(��@:A�� ��@<����@?C��v<S@@�G�T%@BL� ��X@C��/Ym)@E�Q7��@F���}�y@H*:I�y@I�6���@K0ߺ`	�@L��=�{@Nm)-8G_@P�.��`@P�2�Mc@Q�����@R��F�@S�J��%@TncE"@UYF���+@VG�Gzq�@W9�3���@X/*z2�U@Y'���|@Z#Ibp�5@["T>�@\#���L,@](j5�G�@^/����@_:coWj$@`#ʧ*�r@`�²��@a5�j^�@a��
���@bK����*@b��� �H@cgW�׽@c���@d��{�@e,N�&�@e���{}@fB����@f��׃f@gn��1Y@h���̚        ?�)���!?�÷��,�?���H�ĵ@�8�+�@�<���@��$;@ݽ���{@!ݒ]h�@&8�|a�@*�VӔ@0<�@�@2΢�iw@5��|j�@8ԀU'0m@<�s��/@?����0@A�����@Cf��T@ET����!@GV߸Af@Ii �'@K�z��.�@M��^@P��mz�@Q0S�^�@Rc�r�O�@S���ԌY@T� %-=�@V- �6��@Wpc;N$@X�T�zR�@Z:�B\��@[��b*�@]��R~_@^�iy�@`���@`��J;�@a�eoC��@bTYnDD�@c ���v@c�����@d±T=�@e�y���z@fqY��I�@gME��D @h,3�Z�@i�c̒@i��qˀ�@jڡ���@k�.��%�@l����E@m��~SXt@n�}P8�j@o�@s�`@pA�o��@p��{`&�@q=�!�}@q���Q�d@r>�(P@r�>'��@sD��r@sɼBS}c@tO���=        ?��r[�?�!��+BY?��ްe?���<?��TU���@8���*g@DN�]�=@t�Ϭ|@I��{�N@b�Ǹ`�@�O@�4@ E٭F�c@"ʃ/	��@%tI��9@(A�m��V@+2}����@.D�aX��@0�%@e�J@2e�n���@4�m�$�@5�&��@7��s;u�@9��.d@;����N@@=��Ξ*@?�x2@��@@��Ĝs@A��pSBz@C�s��@D@�p�D@Ek	O��@F�˥�Z&@G�����@I9��h@JS�h;1�@K�Q�r��@L��%59�@NB�����@O��#�@P�CG��@Q3G�&�@Q�n�S_@R��gh�@S_�R��@Tک���@T�o�bl�@U��qq�@Vj� l?@W4e�fD@X ��=s@XϚ��2�@Y�xj+"@Zu��@[K��{�@\$�'I�#@] =�1�O@]�45�$@^��W"�@_�W�(^@`C;��]@`���GՎ@a+�t�k�@a��G�E�        ?�3��?�P�_bs"?��&
s-?�y0��]�@�q�}3@	�9Ǜ@���X@Z�P3,�@� ��A�@ I�zk�@#&�l_�@&kZ �l�@)��D�e�@-�zx�s�@0�(zR@2�JѬ�7@4�Is�N@7T9@9[�	�(@;���ʣR@>+U%f�S@@X7<S�^@A�J8�@B�yS�@DV�6a
�@E�*�&�@G+����@H�q�=@J �#C@K�X%�n@M4�w��@N�M�-�@P2����@Q�G�H]@Qؓq�w�@R�����T@S���L@Tj'����@UK�!�l�@V0��N%@W�Ǩ��@Xۻ�x�@X�6�p@Y����|�@ZѢ_|�1@[���7@\������@]�W�&��@^�K�(�&@_��[�@`[�#�@`��yh�^@a`�0��z@a�Hλ��@bj�v�z�@b�%���e@cx�%���@d$C�<"@d��,��@e���@e�w��ܓ@f,�D8I�@f��v%�        ?�N�^�	?ۗ���<�?�d@�!?���;7�?@�����@
��]�1+@��4��@�Ӆ��Y@TyY7=@!3�8�@$|�\�g�@(� d@+�kO@/�� ��p@1���8^�@4)�{��@6u�@ll@8�3Wi�@;X���|@=� ^Z@@L�2/;�@A��iJi�@C��xM@D����P�@F����@G���D@I00�b�@J�J�N�@Lu�>9�g@N&�ĉ@O�I�D?�@P�fV��"@Q��m���@R����a@S���z�@T�ڑ]^a@Uv�6ɟ�@VqV��@Wn�c*��@Xp�[�{K@YvU>��@Z���,@[���aG@\��ȣ@]�+�U�a@^���[�@_��	���@`�)�y�Z@am���@a�����@b8�a��$@bΕ%��n@ce�Fg�@c�Ӗ\�@d�?پ_�@e5-�vi�@eҘ�]8@fq{��H�@g�U�b�@g��fБ@hV��^�@h�C��@i�, ��E        ?�n����?� H֌�O?�La��k@��#jr�@�b�Z@#n��� @5�Y�B�@"N�Ŷz@&���[t@+U��4;@0F^-'��@3O�=h@6��Um@93T8���@<�Sݞ�@@ �:��P@A��7S�@C���{7@E�M��~�@G��ܡ~@I�0���@L�C��*@NP'�YM�@PQ�p�P@Q�)�$��@R�ȘsNI@T�]4�@UL�X��@V�a�W��@W���]@Y\�̚pf@ZƩ���@\8J���T@]�Yub#�@_1�:�<@`\�
��@a$Ʌ�@a�N��b@b��j��1@c���2@dd�D�s@e=�\L*b@f�)��=@f�PNJ�@g�jfɰ@h��Ѳd@i�0�_�U@j���Vr@k��B@ly��ۀ?@mon�'�`@nh=���7@od����@p1w����@p�`�˚I@q4�eā)@q����4@r=�h�e@rČ,�Ύ@sL��2n�@s����W@t`�8���@t�*ʬ��        ?�l��sѥ?ҙ�	�Cr?�{1fȱ�?�+���8?�'G���@��Ơ�@@~�d��@�is@�;rUt@��BKN@�`��� @nZQ��@"#�<�{q@$���y��@'e����V@*8��5�h@-+I'>,�@0���Y@1�p��դ@3]��#�@5 �p�s@6��s!�@8����1�@:��d���@<n��X6�@>f���y�@@5�J3�L@A>v���@BL�;ճ@C`�<�L�@D{X9�9@E��z넨@F�f�:�@G���<
m@I1��A�@JT�2��@K�J?Rao@L�� Y�@NDAa��@OfӣH�@P\X�9��@Q�K���@Q�3J�@Rf�	��@S߮[ZO@Sρ:*��@T��(4	�@UB h3�}@U��?>?�@V���@WU)զ/@XC�r�@Y���V@Y���+b@Z�W�(`@[g�õ�G@\6Ebݻ3@]�j�ķ@]�i�Y|�@^��"�@_�{���@`.u.�u�@`�����g        ?��+kM��?�7�0�?�l�U2�4?�d�X\�@��ŀd�@��6Q�@������@S#��@�=G�@ 3��<@#'���lq@&p���(@)�6��rB@-�'zgg@0�`����@2�&p�;-@4���&@7.�iT@9T)�e�@;�=Oh��@>_���@@wu����@A�ǦN�g@C#��k��@D���J�@E�0L�w�@GkV��1@H�!*��@Jq_��X�@L �V�
@M�pe� [@O7��v��@Po�b���@QF�PKm�@R!����@S ���|�@S�	��`@T��+݃>@U�Z�@V�;��S�@W����z@X�5�w:_@Yz6��d�@Zt�T�@[r
�f�X@\r��z�@]v�|���@^}�tb�@_���TG-@`JZ8�5@`�X1*C'@a[� Mq�@a����
@br�YR�@c ���(@c��[Ǫ�@d�]n�@d��*�i@eD��K܂@e���=D@fn�?.�@gz=�E @g��V�<        ?��V��?�9��m��?�9�#a?��ùV@�.&�C@	8T��B@�F�.@����@���]�^@ @y�S�R@#WV5&@Z@&����w @*+ׄ��@-�).�wN@0�L��@2�2��,@5x:[n�@7W\�#6j@9�/�'@<L�>=�@>���g�@@���g׈@A߯��@C:ޝ��@D�E��@F��y�:@G�ǋ�%M@Im`ȝ?@J�c��.�@Lw�@M�tS+�@OM+q�R�@Py��dH�@QP�)~�@R+ ��@S	E�u@S�~\�˒@T�g`�6R@U���~BY@V�C��D@W�ue@X�,^�b@Yyd��m@Zq�~�f�@[m!��A�@\k��dR�@]l�$1@^q@N��j@_xg��>@`A-����@`ǈC2�9@aO<]�3�@a�Dש�@bb��S�@b�@o抽@c{*g�;@d	V_�@d��_?�@e)_�C	�@e�2��v�@fN3zHVJ@f�\�t@gw�Y�         ?���R�R\?亠���?��ZLqIw@���.V�@E��,@����@�g-�_@!��c��@%0�Q�a@)�WA��t@.� Ut��@1�JD��@4���X@7���2��@:�t&y�@>�П9�@@���	L@B�(���i@Da
	h�@FK+1G��@HF! �ԫ@JQ�S���@Ll���
�@N�,��\@Pia �w@Q�5�~k@R�o�Zw�@S��3��@U(� �<�@Vj.�V��@W����@Y%	:x@ZXLsG~�@[� PR�k@]�@��@^������@_���ɑ@`��C���@asl2�q@b5jJ��@b����
@c���pu#@d��)���@eZvҽ�C@f+>�I��@f����x@g�u���@h��B���@i��r�5�@ji÷8 �@kKNa�l�@l/�`GT�@mV/�f@m��],Z�@n붳I��@o�.��_~@pe�L
� @p�:���2@qZ�m�@q��V��@rSL�]��@rљ��2@sQZ�.        ?��O��\x?�Q���9?�7��_�d?�eoH���?���Zg��@tRW�t@:Hރ�@����?�@l&�a.�@M���_@zjN�lT@�	:@!�>��4	@$MTEՆ�@&��|kR@)��M�/@,n�U٥@/[t����@10љ61�@2�K��'�@4[Ò�sV@6܎�3�@7�A7oT@9r�9�Ġ@;:�����@=�8'@>鲘�=�@@h�ğ�@A`��?m@B\�z�'�@C^�6)@Dc�譶�@Em�z3��@F|=W7�@G���( \@H�a�H�@I������@J�uc�m@L ���؁@M&��0#�@NPWj���@O}�0�X�@PW�[�I@P���@Q��Q���@R*Y>%@R���N0@SixO~�+@Tv�(�@T�� t�G@USލ˖9@U�9n@V����G@WKo]��@W��8ҠQ@X�B�Y�P@YNL,�<r@Y���iS�@Z���&@[\��/d�@\����f@\��ފ�@]u��C��        ?��|0��l?�?�1�3?�v�	�/}?�mw"SH#@��֜c@��
6�7@�[z�{�@U�o���@�nH�@ ,z%�H@#"�
E�@&gQ��"@)�Vs�+ @-��Z%��@0�����}@2���?\S@4۱Hڐ@@7��w@9Y��$�'@;��#�@>+�pD,@@Y|�]�@A��k��@B�3�l��@D\��/�@EŨ�@@G7%��@H�4���@J3�I��@K�M���@MP����$@N����3@PF��EM@Q�!%&@Q�d?�7D@RТ3�A�@S�qC2�v@T��	��!@Uz|�)x@Vd���U�@WQ�me��@XB�'6�h@Y6l��A�@Z-]� �*@['c�j*�@\$r�G[�@]$}{���@^'w:vz`@_-T_	�@`LTF�@`��Ρ�Q@a'�C�Q5@a�c�B!�@b:9w�(@b�c�}��@cQ�n���@c߭9��@dnǢ`Q-@d�+�ӎU@e�ӖM�I@f#���sk@f��y���@gM2�^ڮ        ?��a&KA?�?��"f?맠�6��?��z�,�@�����E@	LmWK�@�N����@�<��~@�#�x2@ SO�}��@#oy%`�5@&��Z�h�@*Qt��p@./(��c@1)C)�@3����@5C9Mô@7�I�Պ�@9�-��Q�@<PK���@>��O:8@@�r�8B�@B$5A+0@Cq֧,�@D�G2`��@FR2���@G�\�g�f@IW��t��@J����@L�)y�k@N!0�T�@O�r79o@P�����s@Q�~9$�@Rz�~Y��@S_G����@TGOD+v@U2�����@V"F_i�v@W� 'w@XR!+IP@Y�^�N@Z���@[:P*�X@\��^j�@]^��'}@^!��Q�@_"��x@`c�My@@`�ȨI��@a-�|��W@a��xл�@bG��+R@b֘��@cf��2�U@c����/�@d���
��@e��ן�@e��ީ�J@fL?�wh@f�0�ܔ@g}N�R�R@h�dPaS        ?���r7�?䠶Q!��?��Hs:\�@�cJO�@^輤�@�J(M_�@S�����@ �F�'r�@$�Z8� @)ZO�4�u@.�:�@1���9�@4L���Y�@7#K�a#@:��}�@=8^����@@9��L�@A��ğ�@C��[�@Em>�.1O@GEn�R@I+��8�@K�9	'@M1����@O(�'�@P�Y-mT@Q��@R�v��l�@S�bq��T@U�;E��@V09�΁@W\�e�C�@X�}}V��@Y���x�o@[ ,.M�5@\@�agw@]�b��Lz@^�-�|�<@`$s��@`��d��%@a`��;d@b8��p�@b����]?@cl�ox:@d�>�l@d�W�ӊ�@e�y�p"&@fA[��/@f��Q��A@g�<B��7@hs&qc�n@i1�����@i�Dw@j�Lv1�	@kv]��@l:�%��@m �t.�@m�A_�j@n�4�S�@o[8]���@p_o��2@py˛g=@p�ܮm9        ?��7Kn.�?����Ϋ?�ڣa4�a?��{ 	?�����J�@�Aj�:/@�
hqэ@��Q��@��[��@��8b@LY'$N�@�˝�f�@"dX?xx�@$����@'��$��@*w��@-q��@0@B@�y�@1�2��̕@3y��Gk@5+6�� @6�V�w0�@8�UY ��@:��.��@<ox+l@>_��g@@-1x��%@A0�X�x�@B9����@CG�G�r@D[��t��@Et�2sEh@F����@G�K�5�@Hނ�s{@J�	�w�@K=c6q�@Ls�ؖO�@M��?'П@N�m6,�@P/$��@P�U>bR�@Qc�?&�|@R
��gz@R���R�@Sc1²@T�bL E@T�6�*�@Ut�1�@V);t�<�@Vߦ=;�Z@W��B�6�@XR3���@YL	��B@Y�@���@Z��B#�@[M�{�yI@\+�@\�>`�@]�0���:@^e�f�@_0O]��@_�t��q7        ?�#��0�?�j�}�v�?�1,�:Z?����
r@�n\��@	?��.E@�mK�M�@r�G}�@�З�
�@ ,�ZFT�@#?��[�@&�-ꞓ�@*s<��_@-����B@0�uΑ7@2�A�y1_@5k�B��@7=83���@9�����[@;���� @>kÒѢ@@|��*@A͖p=+�@C'�$���@D�~���@E�*p�@Gm�� ��@H���~|@JrV~L%|@LފM@M��>���@O6V�I�@Pn>�Y-@QE
փ5�@R{���@R�}26�@S�����@T��ɞ��@U�?��I�@V��ϥ)�@W��o%�@Xx�"D�i@Ymʏ�T�@Ze�-�p@[a2�m�@\_�L�@]`��0�@^c��\n�@_j�6�C(@`:���@`�"��@aG��H[�@a�gJ^.@bZ�����@b��M��@cr�iP1�@d ��v�@d��J�@e }�{�@e�6O�p�@fE"xM\�@f�>F\~�@gn����g        ?�N.��*?�^o�g�?��-�T��?��+�@����`@	Y�7�'e@�/h-��@�x1xM@��%uv@ S�&�}{@#l�ڄs
@&�;�?C/@*E.�#�%@-���Deh@0�ɓF+�@3��~A�@5(u)��:@7c����@9�"��`@<��5�@>�7P�J@@�73�`2@A�S�T9�@C9��K�@D�����@F�]y0I@Gzy0@H�3B.�@Jy��۽_@L�v�P�@M���:�:@O3�l�Ѱ@Pj�Qg�@Q?��O��@RՆ@:z@R�m�(1@Sґ@X�3@T�����@U��M�)@V��	�N@Wo���
t@X^�[@YQH ��@ZF���M@[?���@\:OZ�@]8���@^9�M��@_=q�0�@`"����@`����@a,��3�@a�%���Y@b<�0�W�@b���L��@cR^L�@cށ	�@dl4O�(�@d���t@e�5�Ƀ�@f{����@f����x@gB{N�        ?ɡ�T �?�G8�`��?�R�R���@ג0��@�kmdw\@W�z@�@	@![8�
��@%��8�@* �TR0n@/Qř��@2(�oڵ@4����:�@7��X�@:�J�R�R@>8�\o��@@˞��T @B����{�@D[���Q�@F;�2{@�@H*�Nʝ?@J(�q��#@L5e�a�@NP �&@P<-�x@QWér�@Rx�ɂ�H@S�[�)TB@T�s(:ݑ@V���@W<�!R�T@X|ϊ�@Y��@[��U�@\^�;�o@]��#U@_�B�d�@`8���O@`뻦��@a�G�� @bYSL3�@c�9mr�@c��OrI3@d���L�@eQ��Q�@f�ZM�K@f���!{	@g�ZA��@hov���@i;�1kO@j�]� @j�@p�Q@k��	��@l�n���@m\����@n6X��G�@ov�q@o�ő@pg�R��$@p؟M��~@qJzI���@q�O�h��@r1D��;        ?�
�{xx*?�V%3���?�:t�8?�f6�{!f?��"E�@t�X�@=sa���@���ʔ@vX��@`�ɀ@@�̲��E@ ���4�@!�}�^]�@$��x��@'-�~�@)�{���o@,���T�@@/�b����@1���9@31~$K��@4�fa@�@6�e !��@8q1 9W@:L���@<5��I@>*��+�@@��u��@AG9���@B,4��@C@���}@DZ�b4�@Ez�{��@F���^�%@G˧1+@H��K:�@J4+{�
@Kp���1�@L����@M��^��@OG��׮9@PM	�C@P���fQ�@Q�dܘ�@RXw����@S��:u@S�X�n�@T{��k�@U6gХw@U�4�H�@V�~k u@Ww?��f@X<v�%�@Yx��@Y�/{�fI@Z��$ '�@[io�a�@\:���@]e@]���@^�����@_��h��Q@`9-|��@`�}-��        ?���02N`?���p�L?�F�`���?�D�'��E@��L�@ӕ_��@�/8e5�@4C>5�@[�R���@��;��$@#���)~@&KjOo��@)Àp*w@-oI)���@0�|֞^�@2�w�s1@4��eϟ3@7 ��d�@9K�Q�k�@;��x31�@>"��u�@@U�c���@A����z�@B�_\@Y�@D_j�BR�@Eʶ�zB�@G?��@H�@ae�@JB ��#@KЅ��J�@MgFw���@O94o�"@PV�B�Ug@Q.(�}@R	]h���@R�~<��@S�\4�(:@T���*֝@U��#�@V������@Wz��ٸ�@Xo9�|��@Yg�&��@Zb8XhI@[`�Au�@\bB��@]g�I��@^n���y@_z��}�@`D.��@`̛�TX�@aV��"]@a�8��O\@boA,I�@b���c��@c��?%��@d!S���@d�����@eF>��?U@e��v`@fr���Ԅ@gf ��@g�*�ũ�        ?�Kd�?�.Z�cg�?쩧s�.?���|��[@�gXi��@
Ap�!��@����@x���*@��.�@ �>B�(@$:`��k�@'��[4�@+l
�?ӡ@/Zp�F�@1��vOX@3잚�O�@63(M�Y�@8���
gG@;
'�g�b@=�E
��,@@�bc��@A}��Pa@B��ʻ�V@DZ���"c@E�Ǆ��@Ga2���@H�kӛ7@J��I'@L5A��m�@M�b�	��@O��ܚ��@P�#�+&@Q�H��j@R}���E@Sk��F�A@T]�Қ��@UT"��&1@VN�A�4@WL�� �W@XO@���@YU~��@Z_�M0��@[mlPR��@\~�G��Z@]�3���@^���ƨ@_�c���(@`t�K:	@aH�u�;@a����Kn@b.�
Gg~@b�j��e{@c]���@c�Ȗ�S�@d�d\p�@e0��tG�@e�]�)��@fo���a�@g�3��@g�� �B�@hYՙ��@i 3v2��@i��z	        ?ɼ�=�F?�x�+1��?��\��@M�q�@V�l�@�6�\��@�����X@!�[���3@%�5��)@*�^݃go@/�7� �@2��z�}[@5��b׵�@8�䄟�@;ڨ5���@??��s�@Ae��/�@C>��nc0@E*@*��@G'�x��@I6�B��y@KV�՚Z�@M�����@O��|!o@Q�_FVz@R>�r�h�@Sw:6�Z@T��%s��@U��;�7@WO�St@X��(!@Z�A2D@[h� o@�@\�"h�@^H ����@_���xõ@`�;&��@ad�@\�@b+��ʍ�@b��:w4@c�c�2�@d�}��X*@eg���@f=��'v@g�R ��@g�E|U�@h�/}~|@i��~���@j�i��Kt@k��jL�@lpfTd�@m^�z��#@nO�M	:@oC����@p*�]y�@p���moF@q��	�
@q�[��%@r ��>@r�;Qv��@s��A�@s�h��m@t(u�%M�        ?�1O��~�?�yB��
?�^ԓ8��?��S|�#<?�]��*@��{��\@]w��b@޻��+�@��/'�@j���@��J�M1@n�mpW@!��(�r�@$e��W@'*�'@)���Z�@,�A��P@/��cP�@1Jneb(8@2�I�Z�>@4~Ģʹ@6+�/H@7�P|o�@9��% @;x��t<�@=Sv���@?9%\%�@@��\v?@A���� c@B�=��=@C�v��@D��W��@E�L�n�	@F;�&T@G��$��@IHX�LC@J):��n@KP�\���@L|��Q@M��O���@Nߦɩ�@@PƘ�=@P���M\�@QI�F�k�@Q�td���@R�6�oO2@S4�Aw��@S�d����@T��O��@U0���'(@U���S\@V��U[�@W=51��@W�uIA��@X�ke�ze@YYNe�@Za��,_@Z�X�or�@[�򲭥�@\@,��f1@\����@]�o9}F_@^~mSΓ�        ?��"�:Ȣ?ۋ~Z��#?��Bp�`?��U���@�n�C9@
AD,k�-@�K�CYx@r�6"�.@���*&@ ����J�@$0/�sw.@'�����p@+[���@/E_���B@1���·o@3�?Bk1�@6!	�� �@8}�}B�m@:��Q�@=}�;��@@"��ѻ@Al{�=�@BӤ� �|@DEX���a@E�Ug߷@GG[����@H�/k��$@Jp�;��@LUTn_�@M�9�_Ɠ@Ot�$@P����@Q{����@Rc7��jI@SN����N@T>'܏�b@U1����@V)��@W$@�$@X#E�l�c@Y&/��@Z,n��y@[6u�]�"@\D�@]U+e���@^i����@_����B3@`N�DP<�@`�� �@an��Yŵ@b����@b�©��@c+��O�~@c����}@d[�KPK�@d�y��7�@e��/��@f0O�@f�ڳ\s@go�tP�@h|�(�y@h��)3DR@iY��Im        ?��\�ȕw?�DD�	��?ꛄ�-�?��3KM��@E��ˆ@J���^�@0G��aY@���@�X@�ν�8@?��y��@"���=$�@%��M|�@)ֱ
\�@,��DK<@06a��&Q@2,�n��T@48뀏�c@6Z�y{��@8�<��)@:���FN@=:::k\�@?����@A�{p�@Bb�k��@C�n�?�@E��H@Fww&8 �@G�Z�M�@IY@��B@J����	@LZ`ક�@M�@<���@Oyp�R��@P����9@QZ���F@R.��|�'@S�(�@S��7D�X@T�����`@U�� }ap@V����@WkF'���@XU���0�@YB����o@Z2���'@[%��5@\O�KtC@]���K@^�'��g@_���h@`�P��@`��Љ�@a
�O>@a��+�@ba�o�h@b� �aA@c"��,b@c���;U@d6;OЦ@d��n���@eN[�bg
@e�)D�@fkĝ�         ?ɴ�W�T�?�hk�z[�?�z���zB@3^ʼ�@&=Lٹ�@~uu-@N�Ӱ�[@!{I7橪@%����@*Nkq�e�@/B�>��@2F<Q�V@5
�d�@8�:�@;"�h��h@>`�,�0h@@�r�B��@B�*�`:@Dq����E@FRb�l@HA����J@J@S���@LM��
�@Ng����@PH��p@Qb��iȦ@R�W��@S�	�f�@T��~��@Vᩐe�@WG�xN��@X����#^@Y��N�@[	��S@\h��ċL@]��E��@_��+�@`=HX�wS@`�#;jbi@a��俺@b]e�NU�@c�����@c�w�E'�@d���m�F@eUH�@fԋ��@f�܁3� @g���q�@hq�qG�e@i>!�s.r@j��~�@jݡˍ u@k�~@ڽ@l�f ߂@m\To���@n5D��'@o1�ԋ�@o��?��@pe���f�@p�U��G_@qG��6f@q������@r- �x�        ?��-c�?�bF���?�E,��?�n3�gJU?��z�N�@zN�s�7@@��1�@�P��@o��j��@Qp5T�5@~���(@��w�E�@!�_^R�@$Q�?��@&�w�,ե@)���p�@,y��>&�@/igɚ��@19�fXG@2�r�λ�@4icH���@6/o�dq@7�}y?�@9����`@;TR<Xn�@=*@�WMG@?
��<G@@zn4s��@At�ؼn@BsmO��@Cw5ig@D9�$�v@E��)wO@F��~l�@G��m�@H�5�( �@I�dy@K���@L2 ��w�@M[��aP<@N���KI@O��YC@Px��4��@Q#�=V@Q��È7C@RS���@R�2�y`@S���'|@T?���1�@T�j�N�@U�M@���@V;;���q@V�ޏ��I@W�00�m�@XF*Ȥ��@X��*�z@Y�rX>!@Z_�3L@[E7�e�@[�>�!ɩ@\�Æ�>y@]B���@]�Y0W��        ?�����H?۝5�2-?�����X?�����Z
@�@�Jg@
D:1�k�@����r@qdW_Z@��W�/�@ ����"I@$'��(�<@'�-�H�;@+IIL��@/-Evl�@1��=9�@3ȺK��@6G�GJ@8]̕Uu�@:˚�sG�@=P�� @?�s��@AMN�%V&@B��em6�@D}�S�(@E�-N��4@G��B�@H�� 4@J0�d��d@K�j�Q-�@Mr�9�V2@O!�<@Pk�v:f@QK��3]�@R/^Ty�@S5Z!g�@T�Z@T������@U�N(EN@VݠVf�@Wئ���@X�S�<@Yٚg�g�@Z�l�d��@[��9���@\��ue� @^��s\@_YU�l@`%���@`�D����@a4���@a�gWW0@bVa�UE@b��6w�/@c<��@d�U�(�@d�P�[@eG�D�@e�7�.z�@f�
�$�@g\s�@g�(����@h_l$.��@i#��4        ?�s�n�?�I؁�?�VgT�d?����Q/�@?M�O��@>���K
@&u��@�@��{@��}��@>�-�@" Q��@%�[��#n@(����B@,z�h�c�@0�v�"�@2쮋@�@4�ٲA�@6
�[��@8H�#oe�@:����V@<�+DG�=@?6uݝ�@@�� �ً@B�3S٫@C]��"n @D��9lk�@F�K,8�@Ge�'��@H�Л�n@J8�6�+�@K�7���@M&%�|��@N�['��@PXU=t�@P܀�1�e@Q���b��@Rq�mj��@S@<,�/�@T�8�L@T��Y�b�@U�q�]@V��'���@Wq[F�*@XOx˔�@Y/�Y;�@Z�ģ]�@Z�դ��@[�$K�?�@\ȠD���@]�:e��@^����Z@_�����@`A�����@`�l!Ө@a6-?\�!@a�ݳ�X@b.yp4�@b����H@c*]E��@c�� yvd@d)�8��@d�����@e,R��)�        ?�p �r�?� �CZn�?�*:��%@�͒8r@��[��b@,�`9�X@��Hм@!0�$���@%U�x�H�@)�y�,.B@.�%���@1��J"@4���;��@7��i��I@:�?����@=�YӬ�@@�Tv�@B8�,�K@C���yy�@E���4S@G�����9@I��Ƅh}@K���s~�@M�P�ݜ@O��z�@@P�t'@R�����@S B?�%A@TB���ܢ@Uj�}��@V�t?SiT@W�f��f'@Y�}�~.@Z@�T��@[�:?��s@\����@^�@p�p@_g���U@`^�R�Z�@a���LI@a�����0@bl���v~@c m�nF1@c�n�&��@d��%7@eH���Q@f?�_��@fóm�>�@g�4Øq�@hF��F�@iL��z@i����B@j�`�-��@kd�Nu�I@l1N*�@l���Bk@m��]W�@n��ޤ@ov%�y�y@p&L�Ɔ@p�ۿ��@p��Zi/�@ql5�3��        ?�����?��,���?�աW?�ĉG���?�h2]%@�ljŌ�@�^Uy@Qp�/Fs@��a�5�@�V �b4@~FmT�@�a=iĸ@"-7=�[�@$���l�@']���i@*$g�Z3@-�\�@0����@1��m�5�@3,�;�u@4�=��e�@6�w!6�@8Hړ�>@:䫟2@;��\�6�@=��q�vM@?����v@@�_��b'@A�f!�@B��8w��@C�W?��@E @Af�v@F����J@G/��l*2@HN���@Ir��@J���u9�@K�,�pR@L��O<@N+}�"@Odk�`��@PP�z��7@P�<���1@Q���w��@R8&au�r@R�z)��@S��hd�@T0��ڀ@Tܕ2_>@U�=�;��@V9���@V������@W�ƍڲ@XRc�uA@Y��6@Y�����@Zz(�M��@[5O�y2@[�	�E�@\�M���@]pZ�� @^1RQ\��@^�:�        ?��T��Z>?�'���[�?�dS���?�5���G@\��@	ϮU�̙@2��:L&@�Oj��@_����@ �<�8�C@#�X@�T�@'��<�@*�U$��@.�س�-@1>Fg(��@3UL݂@5�\��S�@7�h�#�Q@:#z6��0@<�����@?s��@@��[�@B/�Z2d@C�i�\s@D���8Yg@Fj�6+�@G�+�9@Ih�b��@J���e�.@L�]M�.�@N#�nj�@O�C���@P��^��J@Q��ʗ�@Rn|B�/W@SNm�D��@T1��_�8@U<�*̴@V�#�@V�H/��@W�n��xG@X��R�@YƮͮ5@Z���nz@[�0�97e@\�	����@]���yaR@^��@��@_�M�O�@`d�n�2�@`����5@apz�3�@a�1�#U@b��w'�0@c
��� �@c���|�@d!����)@d��'C�@e<�,��~@e�K�!@f\7��m�@f�T�a@gj@�{�        ?�����iq?�'Y!��t?���q?����m,e@�T��r@	,����@�g�Y��@��1�v@���Ͽ@ 7�n�J�@#K���@&�#�/1@*��@-Ϝ��>@0�{(�L|@2�2��H3@5
(�ڈ@7C�^H3@9��#�H�@;�/2�ć@>p]���@@~m�8�(@AΌ)�Bl@C(!~��@D��</l@E��m9�@GkY��%@H���)�@Jn*Q�,-@K��B�@M��^�r@O/�rg=�@Pj�2�@QA�"g�`@R�D��@R�A�QV�@S�ۏx�@T���`x@U�s�
��@V����/@W���(K�@XyƜ[2H@Yp>�\eB@Zi��\�2@[f���`E@\g%#���@]jyMN'@^p�#�@�@_zo���y@`C}��B7@`�B��c@aT~̈��@a�.�4�|@bkLAp�H@b��y;W@c��Lu�d@d�P��@d���ܾ@e<x����@eЪ�b!@ff �9��@f����@g���=��        ?ɥ`�f��?�X�&�yr?�hH�m�@",�8��@
�9#n@i�	�@0,@�QT@!f�9�I@%��pE�@*+ֳ��@/�}�w�@2,A�H3@4����@7�v�:�W@:���.-~@>0ay��G@@�
��@B�PX7�@DOy�(ɫ@F,
�^��@H��|�@J��G�U@L����@N/�]�!�@P)`����@QA|��%@R_�cVL@S��G]�@T�?��|s@U�ѕ�c�@W%1���@XR����@Y��}�&�@Z�Z[�[�@\&q�}�5@]w��nr@^���ye@`�Ȳ�@`���A�@aw_,�@b,J�g��@b㍃:��@c��cw]@dX�:,@e����@e�>]���@f���t�Z@g^&A��@h$�Ҷ	�@h�b��-�@i�����@j��"ڳ{@kSe��@l$,a�E@l���Y��@m���E�@n�k�-ќ@oy��1Zg@p)ۏ�D�@p��y���@q����5@qvK/��J@q��Ȋ4m        ?�	g��4?�!�9��?���p��?�G���?���9@7w�RCQ@?6��@�G~G�@<�ա�@K�r�L@��	���@ )MT�-@"�2uu�@%:�@��Z@'�����@*�;���@-�Ok�q�@0l��g
@2�0,xO@3���6@5\vL*g�@7�}�d@8�j�hY!@:�*p�)@<������@>��&�/N@@E�K�w@AHf��*�@BP<�]�T@C]?ʊ��@DoL�=q<@E�@�A�@F����4�@G�f}�;3@H�`|`�q@J��+��@K>�xV�`@Lp�$���@M�6L�5@N�o���@P�7�f@P�&	Q�@QTM�w@Q�]^�{�@R�N�Wo�@SIi��@S��@T�6z�@UNK���|@U�5mjg3@V��c�3@Wc%�"�@X
���2@XΖ�j�@Y�����@Z@l�!K@Z���ʷ�@[�o�HX�@\v��K�@]6t��|l@]��[��@^�X��^�@_~rz��M        ?�?߰�b�?ڥY(5F�?�����1?�ƀ�ecL@	?-��@	[k�Tf�@�v��;�@���E��@�ux�A�@ OH�}�@#f��3@&����z@*:.���6@-����3@0폙:?@2��M��@55}�6@7V���W@9��C:��@<	M���@>�#��0�@@�?s�G@A�fU}�@C-��X[Y@D�F\��@E���33@Gkv�z��@H� ��b@Jh���@K�C��½@M�T.Z��@O͞b��@P_���g%@Q3��s��@R�.�@R�Ĵ1��@S��W<�0@T�6�Kk@U��)W��@Vq}���g@W\Mo���@XJ&�-/�@Y:�J���@Z.�8�o@[%[`���@\�sY��@]�.FIr@^�/�6@_z�ml%@`���@`�?[��@a�4�\@a�� G�^@b$��6|�@b�]1Y��@c6�o�@c��nM��@dM�$	�@dڌ�@�@eh����;@e��v3�@f�!q���@gu.n�        ?��� ��?ڧ��-B�?�)VB�?��>cy�@<�r��k@	�wa_pP@��G@�`�3�P@9<��w�@ ��H�@#���$w@&�4b�/@*�>�ռ@.N��U]�@1!�|Q��@33{P7�@5\�`9@7�̝��-@9𨢺%H@<Z`�<�C@>�J�|!@@��&��!@B��9�@CbhoV��@Dƛ`�<@F3b��U<@G�|��T�@I%���<@J��C۱@L7Gh�2{@M�K����@Of�ʔtp@P�`���@QX�+���@R0� @S����@S�	V�@T�X�44@U���#w@V��"���@W��[�@Xn �>�@Y]����@ZP_���@[E�_�Ƞ@\=R��~|@]7�j���@^4�K�W3@_3�8J��@`�O��@`����V�@a @GG�@a��ٗ�5@b*CoA=O@b���f#@c8��kv�@c��y�@dK�Q���@d֓�Ja�@eb����r@e�;�@f}�F���@g�O�uh        ?����+�?�㳂$?���\ e@FK�y�@B$t�S@�fl� @f�;s��@!��;��@%�Γ@��@*aP3ID�@/V� ٜ�@2P��v�@5�`���@8���@;,��� @>i�DY��@@�J���@B����@Ds��s�@FR�yP@H@ܻɗ@J<�h\��@LF�����@N^���	�@PA��p�@QZ�(�'�@Ry���{9@S��pi�|@T����@U����y�@W1+�r_@Xl����@Y�)�W�@Z��tf�v@\@f�� @]��$`��@^����ڀ@` Ӊ�@`�d�T��@a�
˒�'@b4�o*L�@b�c�yS@c�I�=_�@d]����J@e)�&��@eس����@f�B�w�^@g[˖�.i@h D�Ÿ�@h楹\�%@i��`���@jx�j"/@kD֦�@l{h�޷@l��W��@m�����@n��Gͪ@oZG=H,�@p5d�%�@p�"�M@p��r���@q^GYzT@q̏f��^