CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            h/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_75/N2048       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-030          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190901T132507        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
8513978368         /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1733500        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             20         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_py            �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_75_dash_N2048_dash_euler_fbb_DOT_xml           �<?xml version="1.0" ?>
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
          <value>0.75</value>
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
       alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?��y
�u�?������?�ݠv�a?�ٳ��?�([Dݳ ?�$��@;�?��8,(�@ l��c��@tտ��j@��r��@���M=@`8���@}@��h��@��pg@+��0M�@ =��l��@!�xwG	�@#����:@%�V����@'�gwq_�@)z����@+���f|�@-�X�P
F@/����
@0�a��b@2 wn�@3<K<]�@4i�
�o@5�^�q�f@6����@8��B2@9[y�B6*@:�Mϵ�@;�	���@=P���s�@>���?�b@@^$�i@@��4\}@As���i@B-22��@B�XHN�@C�sV���@Di�`���@E.<"�@E��?��7@F��?Z@G�tح�@HW���x@I(Z? 0@I��^�@J�6Svy�@K���إ�@L��-ؠB@M^)kz�@N<ć��Y@O���
�@P d���@Psg*�@P��^v�@Q[�Q��W@QѦ4�Q+@RH�`��e        ?��W��:�?� ��E�D?�7�z�U?��>;.�?�,����?�AZ=��}?�c6�js@8[���(@��0�T@�K �W�@m�K��@C�r��@H����@{���#}@����Ӕ@ 1u�݌�@"
���C@#���s��@%�7DE'@(�.$�+@*2"W�ؚ@,j����@.���= .@0�Fr�@1��`o�L@2�m8Yk�@4Df3 ��@5�o�j��@6�d�X�S@8I#���#@9�����@;yg~@<�њ�QE@>y~���@?�V����@@�'���@AX$�e��@B$����@B�l���[@CǞ@�@D�-�2�@Ew�0w]@FT�,m@G5%��L=@H�n���@H��F�@I�kp&�@J�Fا��@K���w��@L��hG�@M�&��#�@N���)�@O��%6�@PO��r�@P�0r"a�@QR#$+� @Q�{�p��@RZ8l�|�@R�W*k��@Sgՠ.H�@S𰚲�"@Tz��1O�@Uo�c�[        ?�֐B�9?ǐC�j=�?���؂�?�Cn�:w?�.�H�h?������"?��>��@������@g�Q�L�@�Av��@��N2o@�A�FI@	����@����r@*G"��9@!�6���@#�cąc�@%�v͞�@'��c�0@*/�s�@,m��k@.��"܌�@0�8j��@1�9�\�@3Q��I�@4�H^�@6Rux7@7�{�l�U@90�9�@:����@<���@=��]Z)@?Q��
@@}��@AU����V@B2`�i�@ClC�@C��t�@D��Dv�@Eϊ����@F���@G���@H�*�<�n@I��sgl�@J����@K��+ۭR@L��h�1�@Mɑ��t@N��Z��@O�]zB"@P������@Q�Ʀ��@Q�#~eA@R1rD��@Rĉ0�m@SYf�@S�; (&@T�g)�h@U"����C@U�Z#JO.@V[�S/�@V�!k���@W�2��        ?��9�X.r?�aע��{?�=q0�{?����e?��,w��T@��׿@�J,�@��X�@Y�,�@�	5@ �|b��@#�	Uei@&��ѿ�@)���9�@-L�i�'�@0o�[�d�@2MP��@4=�_{_@6@�b=b@8V<�#�@:}'2��c@<�.�%\�@>��
3�@@�mVGq3@A����@C��@D_��&iR@E�-���&@F�ɱ��@HW�E���@I�t[�W@K F�jV@L���V��@N]�֎�@O�nz4�1@P���Qל@QF����@R�&�9@R�m��ں@S�=s�.w@Tw�#�h@UJ�L�x�@V!����@V�.���@Wפ�Pѧ@X��K��x@Y���ͨ?@Z}�Ʊb�@[ea�r3@\O�а
@]<���N�@^,4EM%@_p~�@`	�2��@`�[�ZG@aZ�?y@a��l���@b %���@b��ЇMm@c�5��Z@c�`�n@d
�X$@d���nJ        ?��U���?Ý}�0��?Ԡ���?�R�_?��X���?��B�ls�?�S���^�@ C�Ɛy�@A�o9J@��;���@X#^̀@3���x�@�=\��4@�O|s1@�n�)�@�3���@ �Gyv�@!���{��@#��lDT�@%[0�l=�@'>fސ�@)0pH�@+0�K 
@-?u-���@/\E-�Գ@0�]�%-@1�D��$@3���@4*��}�@5Y�u�P!@6��K�AB@7���|�{@9
���,@:Q�QX,*@;�:�_�@<�:mw�@>G�,��@?�{`��@@�I��S@A6�'G�@A�#��^j@B��x@Caн��@D�b���@D޼�f�O@E�?�E-@Fe�\S-@G,�k�oZ@G�q=6�@H����4�@I�-��@J_
���@K1�L}�@L;�B@Lۂ��(|@M��FѫP@N�J�e�f@Oj��XΚ@P$�$�@P�ДsΑ@Q!B��@Qx*S3�@Q�E�>��        ?��U��2�?�ʎ�B"?��;���l?�vao� �?��D���?��W�V�?�LYS�z�@���I�.@l$��@�@x}{�<,@���p�@����$2@c��c@T��s@�}��iy@ ���خ@"��OZ}j@$����@&� 1�I@(��p²~@+��B��@-i����O@/��-��@1]~��@2bAE�d�@3�vb�k@5��u��@6_�U��@7�eh���@93_c��m@:��ܔ[@<'�J^�o@=�.�2$�@?<_��u@@i+[ŎG@A7���@B
����@B�����T@C�QNl�@D��{�@EzU졣�@F_l��=@GH��@H4Z����@I$!Ć�@Je>��@K:yB&@L1��m@M�_ 0@NcG�p�@O
h��ۓ@P�uk�o@P��qq9@Q���@Q�E�c�@R'85ɂ�@R���ո�@S?�wȈ�@S�A�C�u@T^Gݔ<@T�ȃ���@U�����R@V*H��        ?����89?Ŭ0����?��C~�;�?�H��
?��̉��?��;�\��?���S?�@�k�}�A@Q6G�Y�@����@&��B��@S�@� ��@K7Z@P�����@Ą͜"�@!��nP�@#��xq�o@%��oD�@'���~U>@)�¾%K�@+��M��@. ��@%@0$�-ݘ�@1Q�C6A�@2�p��@3��g�/@5(���@6R���Jr@7�لkn@9 ���7P@:b2H�h_@;��[�f@=:�)�o7@>�L�eB�@@]P��@@�pd�J@A��V���@Bg�G�hl@C3m)J0�@D��@{�@D����^5@E�>a+ʪ@F����V{@G^N�^�O@H<���@Ipq���@J����@J�]��ɷ@KԪ���r@L��Hn��@M�ĥ�#@N��A�td@O��Ք$ @PIkD�@Pƌ�P_@QEW���@Q�v���M@RF�\`�u@Rɤ4��@SM�����@S� '5:�@TY��Xg        ?�/D����?��C&\�?���˓1?󡢬E�w?�ὤi�@�����@(���-�@Q$�Kh@��(�@`{Aǟ�@ P $G�e@#��x1�@&N$�:�@)F���)@,���q`>@0
��I�-@1۲O�Pe@3���S{�@5�t�Q�@7���ū�@9Տ�̢g@;��ǚ1@>8K���@@@��H@Am>O��J@B�>��mu@Cܩ[�.>@ES	���@Fi�"�h@G��U�zJ@I4���d@JoJ����@K��:8��@M>�9�R+@N���S,p@P�����@P�J.YC�@Q��7L@RXu���F@S��=%�@S�,��.@T�@0�[�@U�S�9@VY�ԞB@W.ǿ�z*@X���@X��2���@Y���Z>�@Z�2/gd@[9�v�@\ca�,R�@]J J�oK@^3D<�h@_�#��@`K� ��@`~[��@`���S@aq�/q@a�Dw0b�@bi�0N@b�U֠Gw@ce����@c���-        ?�
�m���?�4p��.?��d̲�?�-�@i?�q�0?�\�j2�?��;��:5@ ��{�!-@��7�ef@	?�:@ .���@�r}{	�@y!�4'8@nk?{�w@�����L@Ҏ�`e�@ �K�-�@"g�Xf�:@$B4�ל@&-��P�@(*�J]�@*7��v@,T�aϮ�@.��]y��@0^�&��;@1�k�>��@2�>qP;�@3�>����@5 K��@6bD�.�@7��V�@8���Ϣ@:P�{��e@;�".q5)@=Z�D\@>y>���@?�c�G}@@��i��@Al�d�5>@B-p!a��@B��t��(@C�geD��@D����Q@EL�����@FA�Me�@F�U�4�@G���|�@H�%[��@Ip@��pb@JKݻ]�@K)����@L
{�hS�@L�n��ʚ@M����@N�w�?-U@O��ՠ�@PHk@ %�@P���i^+@Q8+��� @Q�� gw;@R,c]p��@R�$K-h�@S$��d�        ?���F���?�jk��?�-�[Ǖ?��f]�@?� 
5�?�8P3���?�U���@.�i��:@�S��/�@�(/��@a���$1@3���F@4�\�@aѫ�2�@�	Bn��@ ��}��@!�P��9@#��U�@%���2�@'�;.N�9@*h��3�@,3[ ȵ@.t�z���@0c~۵|�@1�����@2�2��E�@4iz�VU@5XS[��@6�ʦ�f@8 ���>u@9_�79��@:�3Y��@<3��7�m@=��ݚ@?#�<��@@R��F@A�%�=@A�O*�&�@B�FW��@Cv�]�s@DG�4��@E�>�@E�9��@F�[;:�@G�rXy��@H�u�һ�@Im\��§@JS)Y?@K;�nVɘ@L'3zN`@M,���O@N
U���@N���ȕ@O��b���@Pt\��@P���e$@Qq�|��@Q�d��1�@Rr��+�?@R�����@Sy��y�@S���}Q@T�h�o�        ?�bR��F]?��$�?�-Ю�6?��Ll�?��L??�3 �so?�������@
��@���cO!@�:��>@-�$��@%���s@N���$�@���7�@/��k0@ �Y���O@"���"u@$�����@&����m�@)*�����@+j��l�@@-����g@0����@1Md7�4#@2��+�{@3�o�Z�[@55H���E@6�vb�@7��(=@9hA�']x@:ޤ_���@<\���|@=��V��@?p���D�@@��Ȓ��@AQG�d��@B#\:�J@@B���@C�uE�T�@D�b�Uέ@E���:��@Fs�D�Q�@G[7ɪ�@HFN�@I4Sjőf@J%򨦰4@K�1 �@L(�[�|@M�r�Q@Np��9@Oi�i�H@P
I
���@P�qS���@Q*B�¤@Q�p�Ni%@R$A���@R��p�.@S:w��[@S���$�@TV�8�Bt@T�up��@Uxݟ�w�@V&p�`�        ?��^C�)C?�l�vL�Q?���BG�?�2HT5F?��4@V@���8�F@-��Ł@��tp3?@@�O��@Kêp@&@ �=�nʊ@#�HZ�I�@&��o)�@*A�w�=@-�Z~��@0��eu@2���ݐ�@4��V�I8@6��;L.@8�E��K@;rs^"�@=[��b�@?�U���@A�I�1@BT軬�@C�Ii�@D�]��@FE.#�@G�~@#�>@I��VD�@J}$���@K�8�Y��@Mr��6;�@N�H6�B�@PB�	�@Qcn�6�@Qٴ�q�o@R�j�3s@@S~w{�`�@TU�\�0g@U0Z�|@VsF@V��v���@W�؄"P�@X�Ž)��@Y����A@Z�p�y�S@[��S�C@\r��Q�%@]g���U@^_�-P��@_Z%���?@`+����@`�����@a,ˌ��@a�F%b: @b3mN�.@b�۹B.@c>B4;&�@cż�9tB@dNp�	e@d�[�h�@eczf���        ?���r�?��-�?�����?�����?��`��b�?�A	رy5?�a'�Y��?�IY>|��@wn���@��7~)	@$MS��@z!Hܒ�@�E+�@�Uw
�@���7}@�h�ߺ8@��^��0@ �B-��@"��j�0g@$;��K�a@%��#�;�@'���Y��@)�v��ͤ@+����c@-~wv	�p@/|gQ��N@0��,���@1�����f@2܉�8�a@3�tÉ�W@5��mK@6*�`<)H@7OK0�+B@8x�X۫[@9�֠p<4@:����.@<�>:B@=M撁S@>��q��@?�;�W�@@�	�ׄ�@A6$Sm�@A�b�le@B�����@C8%����@C�*��@D���X@ELl"���@F��`K�@F���ɼ�@Gr r�8J@H,�m���@H�/�+�@I��{Ǒ@Jh^#N`@K)ص �7@K�X᠙�@L���A��@MyS(��C@NA�d�>�@Oܚ���@Oא/0s@PRo�8��        ?�T��z{?��sU5�?���^��?�V���~?��:���?��d��?��ך�K@�,��.@R����@\�:-H@$̆�1@�B��@݁����@���"s�@Cp�:��@�E�P`H@!���*�@#�R~:�@%sj��@'u�MO<@)�%����@+��U�t@-ⷩ���@0i��#@1>�� #�@2q#�5>�@3�W�I�@4�&:�"�@66uTY�@7�)̻9�@8�+�~�@:>a�ۃW@;����|�@=l&�@>�c���@@ ��i��@@����*@A� �v�@BM�1-�@C� !W�@C��_���@D�#dZ&J@E����8@Fd	N��@G>���@H��>I@H��E_N�@I��#8@J�(N8@K�j��@L��-��@M�f�6�O@Nz��w�j@OnzP�@P2{�#�@P�tw_@Q,�9{ @Q�����O@R,J�CA�@R��<��!@S0�'���@S��~��^@T9�W�qC        ?��e��y?��d*\�?�����?�ʿ��!?�6�"�?�!�G�?��j��)@<C��"�@q8j���@
	nE��@���t�@&��^dW@�a�@��Gi��@�"ˁ�@]w���@ �xR@"�`vz�@$���c@&mor��@(fY��@*n�;�@,����f@.�͹�@0q��G�@1������@2�ޮ�@3�GC{��@5 "p:]�@6\|���q@7�5>o=@8�- p!�@:7DB��@;�Y��rP@<�N�,9�@>HP�u6@?�b�s��@@�$���-@AE��(�@B*���@B�'ز�@C�'�$@DB�I�v�@E��\7@E�ɁO�@F�sF�n@Gh��q�@@H8�_��@I	�1H�@I���$@J�c@�L@K�z���@Lg�)�@MD��K��@N#�=$�@OO�l�@O�eS�x�@Pf�أ�@Pڔ���@QOK"g@Q����b@R;��K`T@R�a�s:l        ?��E���?���^n�?�	X0p�}?��A`a?�����k@8��e@��k&@T4��@�ON�e�@/W�=D@+��V@"@׀��@%�Z�P�@(3��@+/�$�Q@.tG+�H@0�S���@2��7g:�@4�ꤐRP@6f�H�@8V�*�C�@:U��_u@<bf�o�@>|R%X�@@Q�|���@Akc���Z@B�^��O@C�l=��@D�m`�4C@FEK���@GF��	�@H�
}�O�@I�Êma�@K��}'@L\i,ҹ�@M�&��ă@OPR��@P2 L �2@P��*b�@Q�f2�CY@RL<o�� @Sqr��@S��2�m�@T{�[y�@U:��p�!@U�/)CE�@V����@W�D��k@XL��H@Y����@Y�� ��@Z�`d�R@[�#`.�@\Qԋ)u�@]%l�Υ�@]�勰�t@^�9}i�@_�bR��@`C.���n@`��%��o@a ��.�,@a�
��@bt��        ?��Hm�F?��,��7?� xd�?���V�?�`̪]�?�N�>�S�?����x@ �|�J�G@��D ?@	&"��!@��rx�@�o��|p@_K|c�@N�J�j�@f��-��@���N?�@ �5�d]�@"I�^�X�@$ $.7�@&���@( (���@*	E>e�@,"���@.J�璵�@0A�3h!@1e�Cmji@2��v��@3ßv�P�@4����T@6>��p�X@7�ቀ�@8�I���i@:,Vvr@;�!�Q6�@<�ӟ�@>V�Z�1@?��bX@@����λ@A]c�K�_@B�.�M@B�w�e�@C�:Vw��@Du��D�@ECH?tv@F�z'��@F��{�F[@G��:|�@H��a8�@Ip�
�@JO�]U~@K/�K.N@LV��u�@L�^A��@M���	f9@N�"^��y@O��fp
@PU�	�ٕ@P���&�@QIa*Z�(@Q�$ ��@RB�/g@R�<��-Y@S?�kI�        ?��Ls��?ǐeT�?غ�2�?�%� �<�?� �)��?����-�^?�I1Ps�@r@ bd@8�n�9K@s�ݞ2�@������@���.��@��-n@D� $CU@�=]!@!W��5q�@#T�8E��@%g;����@'�����@)�X��@,�
@.�1n�ϫ@0{�ѤL@1���Y�@3��]��@4g*<�j@5ǥ(��Q@70�3�	�@8�Ċ��@:%�h��@;�瑇f@=*�x�xI@>���@@,�l��@@�No�@A����oh@B�K��/�@C����l�@Dk�t�h@EP]��-^@F8�Yl�@G$ڍ,��@H��=
@I�2�'@I�x�=�~@J��y���@K�o~�[�@L���R�p@M�F��@O��ڲ@P�{
O@P���:�@Q��o��@Q�.H��@R.F6���@R��X�T@SK7�A�k@S�9�k\@Tnm���@U[�[:�@U�ի#��@V.�b��@V�i�c�k        ?��.v���?�gPg�ja?ט"�o?�3Y0��?�zH/'�?���"�`�?��A�˝@�(�{@%޾[�@#����>@�,O���@��B~f`@��&@ڷg�_@w��Q6�@ �jϺ@"n$p��@$fc­S@&r��Kah@(�^�F�0@*�,G"�@-
��,0t@/bN���@0��d���@2#�ǆT@3i��Ĉm@4�j�t�@6hbc|@7n�-�@8����
@:D���@;��u{�@=:�����@>��旔@@'9w+�@@�*�@A�����@B�U��<_@Cfj�<�@D>�|R��@E�VD@E�债@Fܐ4Ԍ�@G�I� �:@H�.J]�@I�1r\'l@J�F�,V�@Kxa�/�@Lmv�W��@Mez�c:@N`a�𤋮@O^"6��@P/Y���@P�Ki��@Q4���f@Q�~��e)@R>A#�0�@R�X+��@SM���c@S�v��,�@Tbw��� @T����@U|P>���        ?�l��c?֔;�M�s?���u�?�V�7^�?����Dx�@׿�ڽe@4��(,�@��Fi]@b��T�@r��q��@ ��69cU@#�ռ�@'	�t�|@*[sҩ��@-�iVP��@0�j�@2�,*>D@4�D��l�@6�J3;/@8����@;��ᮿ@=jŋ�@?ȣ,���@A r��E@B\���=�@C���5@D�7KA�@FP��p͡@G��ͣn@I��U�@J���R��@L�v��@M�2��!�@Oܠ!��@PP���4w@Q�r��@Q���E�@R��;�$:@S��~,�@TnZA���@UKF+C)@V+|�=t@W�R�:�@W���p@X�h<z�@Y�XaTu�@Z�^k�3@[�n�#1�@\��A�
@]�����P@^��i>#@_�b���@`M���#@`��S�@aS�
"�@aؔ�@�@b_�#t@b��b�C�@co�R�Zj@c�i��,�@d�0�@��@eD&1&�@e��jND�        ?����!W?�ϥ�-?��Ѳp��?����:�#?��6H��?�&PF�b?�@�L��?�$�wK��@d-�q��@��҃�@S�yB�@t期	�@��Z>V@��S�e@���.@��VP@�B��;�@ �@d�'@"�{�R�~@$d����+@&0���@(
S؀�@)�⬺|q@+�أB�@-��ɂ^C@/����@1	�
w�<@2a�`m�@378���<@4V��!@5||��d�@6��&�)@7�xd�~@9��r7�@:Ja�mR�@;�T��+w@<�~��Y�@>��/�I@?m(���f@@aA��!@Ac���@A���� @Bo�y�@C$9���Q@C��o�R�@D��k9%@EO�V@F~!�!W@F�*U5��@G����@@HR����@I,|胫@I�i&9��@J��㏷@Kw!�-@LEp�T}@M�@�Cb@M�%�:*@N�s$��N@O��,��@P5o)�A{@P�y��^@Qw�6E        ?���]k?ō�ZFV�?֝��3�?�U�e���?�fE�5}^?��/��uT?��#˽��@�}%�V�@pw�@
�?���O@����@�0@��c@��څ)l@�H�DE�@��f �@wJC	Z�@!��mѪ[@#`����@%Oa�c��@'O���ْ@)aN�'�@+��� �@-�@b�Q�@/�މ@1'ԋ+�@2X��5�V@3����^�@4���y"@6�b �@7h�=�~�@8���k@:2|�p@;٩\��@<�eI��@>[�٪�@?�I`�@@��<�U	@Ak	 ��i@B0}�l'@B��co@CĻ���@D�n�a�
@Ee!�8ڌ@F9ː���@GaN��@G��tqQ�@H�/�d|@I�[T�h@J�U@Krfܩ:@LZ�:�@ME�"�J@N3��P>@O$����@P����@P��pK@Q6ؼ�@Q�ʎ�Ϧ@Q��
��7@RȂ(�@S,:��	@S��q<�@T�� ��        ?�M�`L�Y?���L0e�?� ��t?��U����?�
�鬫?�8E�}�/?�W�Ģ@0���K>@�-M~VE@��M*��@d���@6����{@7x�Zy�@d�]�."@�L,hi�@ ���f�@!�|E��@#�ܦ�6�@%�c��@'���,h�@*V
(c�@,6k�~�@.x�$S�@0eϕ�X�@1��j�5@2�D�u@4��z�@5\G5p@6�9_�32@8���n@9e?jP$�@:�	_���@<9��gkz@=�{�?9@?)���-�@@U��0>@AR��@A���/�@B����02@Cz�3���@DK����@E����@E���Ax�@FгU���@G��
�?@H�~s�8@Ip.��S�@JU�,_�B@K=�18�@L)ܖY@Mͣ]�7@NJY�H�@N�u�h�@O�H4`�@Pt]+i��@P��)�@Qp���@Q��_ΖX@Rr�K7�@R���BM�@Sx{&*��@S��ۑ��@T����        ?�A'��b�?��DFwz$?��n�9?����	��?���s@9O���0@@��@Y�wҁ�@�A�m�1@A�~�]z@H�iR�@"U���~v@%2M��-@(8����V@+f��7�@.��w��g@1��,�e@2�����@4�s���G@6�i/�g�@8��=y��@:�R�)��@<�v~\�@?�����@@���#�!@A��%f@B���MF�@D-�1)h@Eg�<i@F��d�1@G祖Q��@I=��P@J���p�@K�br;�@MJ*��@N��i-@P�Ha�@P����@Q�����@R?�$B@S �W�5:@S�;��ڻ@T��p9�@@US���N@V M[@V�D2�i�@W���h�~@X�9�Ȟ-@Yf�;1�$@Z?����@[���Z�@[����XA@\���<Ex@]�&�6�@^�Uꃐ�@_�h��'@`4ش���@`���n�@a i�Co�@a��x�dw@bK7٣:@b���~�8@ck���k        ?�s�F��?ÈJ��(?ԋq�	!?ᗣ�]J�?�ɜ
S�?�����?�E
M:�@ <��s�@=P����@����@]�B!�@:��n�@��z��z@����RP@�'e��@삦�@ )02�@!��eG@#��~�@%�2�C��@'t����@)p�q[@+z�����@-�|� @/��A���@0���@2}���@3F�&0@4vaL�SB@5�{���2@6�8։�F@8/�-�:�@9z;;v@:�S��Sy@<"���<�@=�E�6,�@>����@@&ة%�@@ްJ�@A�w���@BW%r�[�@C�Ѥ�@C�
*�k*@D�.�n@Ej�=@F5�S2@G�1ڧ@G���i@H�b�f.@I~w�@\�@JW�K`@K25�_�U@L�Zp�@L��a��y@M�R=ȯ�@N�+����@O�^��n@PC�q@P���'��@Q0݌�Eh@Q����u@R"3h@F�@R�y��[q        ?��2�8��?��-�۟F?�%��l?�k���?�n���k?�(�d�?���f3)@����@�Qd�t�@��V�$,@/���/c@*�B��@W����@��w�@AV��q@ ���S��@"�i���L@$��Dک@'�)H�w@)Gz\��@+��݂�\@-��
^|�@0(���@1h��@2�v?�@4�M0Z@5[�=x�@6�i1��@8)vP�+�@9��~A.p@;E`d�@<��eJ��@>'!q��@?�)�i��@@�ogH�t@A{��@BP[�F @C(���7�@D��8@D�i0��I@E�r)��9@F����@G��k`�y@H�ܾ�^�@IuF��	>@Jhꟸ�B@K_���X7@LY�1j��@MV���	c@NV�$�*�@OY��L��@P/��P�@P�q��h@Q:Z}�͒@Q������@RJjt�ϣ@Rԇ��a@S`�I@S�ӫ;~P@Tz�m@U
j���Q@U�(��j@V-,�O�        ?������?�@Le3(l?�ngaBq?��,���?��3�?��Z��D?�� �-��@u��K��@���X��@��{�@���Y��@��MӢ@��:g�W@�DŖ�x@5���&@ b��R�B@"?��\�2@$/�SK�@&3HN�)@(H�K	�8@*p�O��5@,�]^�yM@.�4YY�@0�{S��(@1ޥ�F��@3�ӝx@4c4 �<@5�J���{@7|��2@8da�r�r@9���4�@;5'V>h`@<�bY�A@>"��AG@?�*��c@@�s[ �@A]�u�R^@B(�.�@B��ӧ`�@C�;F �=@D�����N@Et�w��@FO��E�I@G.6G���@H�J�@H��x��H@I��Y?�@J�]'��@K�����@L���~W�@M�o�h�*@N�#?f�6@O���cl�@P?w�9��@P�~��F!@Q>�Sm&�@Q���b;�@RC�D�@R�-TuE�@SM�ohl�@S�F��@T]l�$��@T���3`        ?�fJ �v?��'(H�#?�"�",�?���M�?�+Ǽ��^@H�$�@�@v����W@Jf����@�$Q�@�_{`q@ ���Ѳ�@#gR%�*�@&t�V���@)����@-D�Y[@0T[CBb�@21v��4 @4"HpP�@6&3�L��@8<�p��@:e5x4_"@<�[����@>�`�@@�n� @Aپ]��1@C!��@D^p��.@E��ɝ�@GC�[�@H_��j��@I�0�v�@K0&08�@L�J|W�@N�]b}@O��� ��@P�h�i�@QZ�Z��K@R%���w�@R�o�W@S���Z�*@T�|YI��@Uq'���@VK��VA@W)Ξ~�@X
�¿�@X�}��^@Y�q��O�@Z�3��Q�@[���Nm,@\�K`�B�@]��zR�.@^���Gh�@_zN_���@`:]�L�@`�玲"c@a8��V_�@a���o@b<P*	Y�@b��,s'@cD�#���@c��̤�@dRf�
x@d�����e        ?�:�%.�?�2�n�D?�@*W7
�?�4:�lb?���Lz?��s��?�3��v�s@ � ~%}[@��%��@	������@��r�g�@�M`+�@�5�b��@�| G�)@����@a�P@ ���&�@"Ƹ����@$����ZD@&�ҮVlw@(�0�λS@*�?�S�'@-�O��v@/C%�>q!@0�6f���@1�J�\@34/u�ȧ@4uK�Q��@5�[c�F,@7F��2@8g���(@9�^��#Z@;0b��o@<��T
H�@>�)絑@?�>���@@�ks��@AS��>(�@B�EϪ`@B�(_�c@C����@D�Q�-PM@Eg���A_@FB�g}�<@G!9�YQ@H��*~m@H�p�)��@I�KŤ�V@J�@���@K�Bp/9�@L�EX$��@M�<ȼ�#@N�i��@O}�Z
�p@P=2�b�q@P�ݦF�<@Q=�R�1@Q�O�k�@RD4V<�@R�"��@SO�.F�`@S�@Ր��@T`C� �a        ?��>H�Z?Ǫ�N]��?��xF���?�C��?�?�,���-�?�Ͳ�~9�?�x����@��<�@@a B遨@��Y�[@����6�@�9��'V@��`Y^@t����@ُ��@!v־��W@#we�G{@%��#y�@'��{@)�"��1@,P�^�?@.�w:e��@0��R �X@1�s_���@36|ȳ[&@4��b`@5��;���@7d�؝!@8۳�HgE@:[��{�@;�P�@=vI#˦�@?��,��@@Y��p�@A/g�X�@B	?	�;@B�8�F�Q@C�JG��@D�i�)�M@E��Vy�'@F��S�[@Gy�^��k@Ho��y�*@Ii\�s0@Jf�1�@KhFk0��@Lm^���@Mv.'�c�@N����?�@O���OcE@PSFY�l@P��4���@Ql`;��@Q��Y�@R��rw��@S0��L:@S��r�A,@TI�Dl��@T�{}�@Uz���@V��/�@V���
\*@WQ0p,.�        ?�C��U?Ǟyq9cM?��J��?�H��|c4?�4����e?��y
��h?��"�F�@����ԣ@�*��f9@�P�h>�@�c�+�@��Y��@?��v�:@�,�c|�@�:�ە@!�����@#�]\{i@%���S@(+/�*ZM@*�=��@,����@/m����@1�%���@2YOٞ�@3�Xuii@5%�#D�1@6�Z;J��@8G���z@9�=��"t@;9����@<�˷~\�@>~.���@@����@@��!�Z@A�ٛ@u�@B���b�@C���A*@D�����@E���@F��80#@G�H�m�@H���Yj@I��ڏ�@J�[f���@K�����@L����Z@M���24@N�ﱭ��@P�0��@P��&��W@Q)v(�1�@Q�(n�>~@RV��5��@R��gUL@S���l@T)�=
�@T�([{J�@Uj���wy@V�I��@V��5@WZ+�T@X"jH�@X��*�x�        ?�H��fr?ֿ���r?��o�L�?�i���?�?f��O@@a���@�����@��NUM@���Qc@���L%�@!;�r���@$?	o_}@'vjۧ�l@*��qa��@.y��o�@1!f]��@3�D�7@5-̇x@7T�ET�@9�E-��N@;�z���q@>D� ��@@^T� m'@A��{�e�@B�'�K�@DK��ivK@E�J��I�@G#�_��@H���z@J�����@K�E쿳@M|��Bs@N�I��͒@P)JD�@P�!�p�@Q�!��@R�<TY�'@S�hZJC@Tu�� �@U]����@VI���.G@W9�����@X-wx+�@Y$�|� @Z .p�b�@[�Ό@\!���j�@]'�1��^@^1-V��@_>0ٻ��@`'L��'@`�-U�@a<��?�@a��x.�@bX�[�+�@b��1D*E@cz���=�@d(�AL@d�o��v@e9�!>\
@e�kJ�@fj�+�5@g�LR        ?�^}bb�&?�}u7�!/?ԁX���?���R�?꿯�d�(?��;�8?�@�B^@ <E`�s�@?��.�@���d��@k&!n�@E����`@Ѻ��@�k�TH�@����E�@.W�]j�@ E��+�@"�<u�@#��@%����gP@'��"(6@)�'NS^
@+��djM�@-����4L@0Ǆ3�@1=�"`A�@2i)݀�@3�H�iU@4��T2P�@6j��=@7b���h�@8�,�%�@:
�=߹@;i���>@<ϝ�°@><I�=@?���<?@@��,uF;@AUNE�7�@B��1D�@B�ľ��@C��Z/�7@Dv� #�@@EG9�%ݼ@F��/kp@F����@�@G�m'Y�s@H��ˢJj@I�E�U�@Jh�KpI@KM�?�@L6'k^[�@M!F]}��@NF���@O "&�
@O��ck>o@Pu*XW��@P��<�J�@Qoػ��@Q�AG��|@RpM��@R�'+��@Su����B        ?�xj��7B?����?��G��� ?�L4G�?�聿Ժ�?�!�D��?�'#�&�g@���1@�í5K@[�bHU�@M����]@�֛�@0K}�@J�}��f@� X6Pc@ ��W_@!��Ψ�@#�8�v��@%̀ȫ"@'�jF8H<@)������@,0Z��o�@.t�)wx@0d�uy�@1�����@2�V���@41i��@5a;�U��@6� ��(�@8[ dK�@9p'��I{@:�C�9�3@<I���Ɯ@=��8��@??A�^�@@b7��,@A(-��@A�s(�r�@B���z�@C���r��@D`�f{�-@E6���0�@F���^�@F��*H@G�A��7@H�rG��@I��TO�@Jz���}+@Ke���)@LSo�:3y@MD6���@N7�<=��@O-�ж�'@Pc�H�C@P�?S��@Qs�#C�@Q������@Rډ[��@R��]�@S}R�%@S�;�4�{@T'>��L.@T���v        ?�nBJ�b�?�	 G�K?�B�ۍ	�?�Ɲ���q?�WKV?�L����?����E@#�Ȥ�@�����@ �j=I@J����Z@J3ݣ�@{����@ީI���@pr��	@!�U���@#�ц�D@%b��@'9O�w�@)m���@+�~����@.����@0@�[5_O@1�ϝ��@2�>��@4L�5ݢ@5{��@6��I���@8N@|��@9�z@��:@;C^�v�@<��[@>YI]��@?�%v���@@Ǒ��:L@A��N#!s@Br3���N@CM=��!@D,!�c�@E��qW@E���%v9@F�`-�@G��Bb�,@H�����@I�T:.@@J�L�5u@K��",�@L��OR_�@M��G�;@N�dICW�@O�Qf�e�@P`Dº�z@P��-��@Qq[f�@Q�LW)�C@R��9̕@S�%6�@S�~�R��@T7���j@T�E�M.�@U^h��Ur@U�㯓y@V�T�VM        ?�ip� ?շg�R/�?���5(�?�v��?�?�����@z����@#�t{�@I�T��@����A@v��.R@ c��5��@#>�eޫ@&J���:4@)�����y@,���$�V@0A�6�@2 ��ݞ@4��`m@6��J[1@88��u��@:g��CX!@<�����@>��0|)@@�+
3�@A�	��@C2ʽ���@D�%5�'�@E����P�@G4+S�:�@H���u�@J	3��@K�?C�M@L�U�i��@N���,}@P	_E���@P�6�yq@Q����@Ru��O@SKc@T$���`*@Uգ���@UⅠ��@Vƴ
T�@W�W�ڙ�@X�h�3I�@Y���@Zy����@[n�q�@\gK$@]c��3H@^b �L@_d=!ZF@`4�SZ�|@`�&�\=	@a?�ހ@aƅ��A	@bO��W"@b�$@8�b@cfC?�6�@c���4@d�|b@e�ri�@e��E�M�        ?�_�N�t�?�w߮5�?�x�*���?ᆚ�c�?���?���Y���?�'ߙr�@ )��f@#,l��?@}o�x ~@3eW��@ m��$�@�����@�����t@�s�3=@�J�Y�@ 	�tD:i@!��=Q@#�BD7�@%Y�2��@'?L���*@)3�eZb�@+7��m�@-I�G,,�@/i�0�n�@0�zq��@1����Q@3��H�}@49ԣ��Z@5kr�|�@6�c���Y@7�T���@9%�#���@:p(��'A@;�i.� �@=�I	L@>rd�eG`@?���=��@@���0�@AS��e�@B�O�@B��=��@C�s��u�@DH�A&�[@Em��Y�@E�̗m9@F��H�@Gg!Ġ8D@H5�T@IY�{Ա@I�m�@J�(ی�i@K����~@L^BH��V@M:3Z��Y@N[qfd�@N��0���@O�/i/Q�@P_�o�@P�>��n�@QG��L�]@Q�^��@R3k�$�0        ?��Hf�?�'D���?�=5@
I?�݋�%��?�4!�jI?�F�vOh(?�i0���9@;91,@��d,E�@��L��T@l��F,�@@p닞&@B���'@r q�/2@�j����@ (!��@!� ����@#���{@%���r @'���{@*2�Ke@,E73�d@.�D�5@0m��s��@1�G~4@2�e�Z�@4�P�@5e��~�@6��9��@81��>|@9o
�R��@:�)�B@<D1�S*z@=�F��~@?59�j@@[�+e��@A ��BY&@A�� Cx@B��j3@C�uo��@DT,����@E){��@F#o��@@F�V�6Ho@G��^1C@H�t��@I��=CJ�@Jh�̀�@KR�	f�@L?��%�@M0Z���@N#�����@O�e�K@P	kk�)8@P�WH_zc@Q���f@Q�au�d@R	{b%�	@R����s	@S͵W�\@S� ��@T���@T�k̸�W        ?���%�?ś��[�R?ֻ;i�x?�r����q?�:<Pf�?��ܺ�(?�ϻ�mK@�[�m|D@3N4@
�bsy��@Ԏ*M�@�QuMU�@�����L@��t�@q�A�@��NA1�@!�N�vz@#eRCٵk@%Rg �\@'QA呯@)`�&g^@+�c��a�@-�P��J@/�PO�@1"�	��@2R5fO9@3�����@4�SǑ�.@6��8@@7^���@8�O$�.@:�/F@;r�i��@<�%n=��@>N*���6@?��X"�@@�$���@Ad���e�@B*?��Q@B�.c�,@C�����U@D��{ɍ%@E_�v��V@F4��i1@G�_8�@G�&���@H�]�SQ@I��7�b@J�QA=h@Ko�ҳї@LX��>��@MDQR	i@N2܌d�g@O$&��A@P�,w�@P�ty.@Q,�B�S@Q�>��@R�=*@R�e��JW@Sv\:+8@S�׍���@T��:�        ?��-��?ծ"l��v?�˘�k�?��W�W?��� ZC�@�k.�D�@D�_��@�$g�"�@kT�A�-@Ckb�Pi@ @�MD@#;U>��@&+���@)8}�9@,�Z�SR@0��@1�%�ˆ�@3����8@5��z���@7����@9�"9��?@<aγc�@>D�捌@@HzSP��@Av�*@B���Z�L@C�E ��@E//&>�N@F{Y�<��@GΤ��E!@I(�Ou׀@J�C349@K�|l��@M`�lP�@Nթiό�@P(���?�@P����@Q��?��@Rtٔo��@S?���P@Tj�J�@Tܷ[��@U�����@V�*�8Y@W_=��@X;*X̽&@Y�.3hP@Y�g!�[	@Zߢ���@[ƍxe��@\����@]�F��6k@^� �
�@_|AQ�R	@`7��tG@`���N�@a/_����@a��t��O@b+{�ʱ~@b�E�?� @c,2v�,�@c�=p��@d1b�k�(        ?�c��LD?Â����?Ԇe�E�a?�ە!Dj?���rO�?���8EW?�8yS@ 3��d@.U~mB@�^,��@?�&M�@&B=}@�7�J8@�ۘ�@��J�*f@��a�=�@ 	���3�@!��j2Y@#�X8ȣm@%V�^kri@';*��n�@).��H)�@+0�#?'@-A`���@/`Z�E�@0�A�Og�@1�6���=@3��Xk�@40����@5a$/��(@6����B&@7�s�dwN@93.��&@:_���>@;�l���@=��B4�@>\�����@?�I�~e�@@���&S@AE�]<`@A���0�@B�bq���@Cu�	���@D53���y@D�nv�@E�-�
�}@F�kז�@GM$%���@HQ�_M@H��в�@I���p�@J�yy�#�@KbZ���@L:�^�Ƃ@MD'���@M�E�_�@Nѡq,��@O�RS��@PK��@h@P�В|0@Q3�K�@Q�~"�A@R�P�s
        ?�lZY�w�?ƴ��r?��42w}?�b����?�t�0�?��?#B�?�/�tJ�c@�la�H+@T��i��@[���`@���˥N@Э:��L@��u�~�@5�@#�@�r�ذ�@ �[�ظ@"��a�O@$�0L���@&���W�@(���z�@*�~�@-5&��>F@/��N��@0�SSPt�@2<��>^@3�a��f�@4�P
��@6+�/n�s@7�iN6�@8�\��2@:fp��� @;ߋ��D�@=`��Lu@>�kx�V]@@<�5��a@A	�$�@A��V�t@B�c�Ĕ@C��{f�P@D^3��ˠ@E<i�SU�@F���Y@G7��M@G빗bɳ@Hו/8K]@I����bx@J�89f|�@K���:@L�欂�@M��L�@N�wx��@O�
'�4X@PU��[@P�U���;@Q`X����@Q��ߎ?�@Rq��@R���@S�윪:@T���/�@T��[��P@U5���@Uǵ`��        ?�#Q&�M ?���_�?�&��9~�?�Ҝ�&�B?�)��8�?�A�$@��?�d�*Am@9���H@��7"?�@��0�ut@k|f�@?"�8�@A su?4@o��ލ�@ȴ8�@ %�6��>@!��f_�4@#���K��@%���@��@'���Q�@*	~2t[2@,9=5�.@.y�U��@0e#���@1�8��o�@2��/�@4p���I@5S-���@6�%U��@7�6�ro@9RDQ��@:�0c��@<�( k@=�6�>d@?��x@@A����7@A����3@Aȥ�MP�@B���C�@C\th�@D*]��V�@D����R@E���� 4@F�A\��b@G�j16�"@H^q\L�@I>O�F��@J! #��	@K|=t��@K�2"�N@L���r	@Mǃ���@N�iq@O�;�դ@PP���� @P�����@QJ�2���@QɆ��l�@RIԞAqC@R�q�_h�@SN[lD��@SҐ ہq@TX�W8�        ?��=�z�?դ0'��?�Ğ�2�;?�~�u)��?���ZF�@�-����@�re΃�@�W���Y@b�r\@7v����@ 8z�17�@#M���@& ���n@)&��@,wZO�g@/�"^@1�h@�zm@3�cA�u�@5��&;�2@7��g&I�@9���D�@;螌|��@>!�\�:�@@5kO �@Aa��=H$@B���@C��{ߨ�@E���u@F]?��q+@G��O�@I�U��c@Jd�}@K����@@M4�yW�.@N��]S��@P���"�@P����ys@Q�g{��{@RV޸��@SQ�bО@S����@T�����@U�fyԪ@V^-�5�@W4�&�
�@X_W��4@X���^�@Yɰ�@Z�qA>@[����@\w��%�@]`而V@^Mh� �@_<���/`@`*	o�@`�\#��@a��~^@a���'xe@b��_�@b�	��E@c���k�@c�n|#�g@ds�R�        ?�m��@?Ì�6H��?ԓ�OPI;?�A,��??��au��?���>D�?�P�)�@ C��^�@D�qh@��u��q@a�c�X�@:ݻ�p@��t@���V��@�h��)@�`ԢVD@ =�Zt�@!Ҹ΁��@#������@%n5�I�-@'S9?0;�@)G.m�b@+I���mg@-Zt��@/y�yX@0ҭQ���@1�u=�;�@3��ɴ@4<wQL��@5lu�_�A@6��p.�P@7��m��@9!$� �x@:iN�S�@;�M�	-@=_2�`@>dw⨄�@?Á�'[�@@�,_(�@AI��u@B �P3&N@B�VyHT@CxvmԀ;@D87
�f]@D����M@E�xw\W�@F���@GP��b�@H<���@H���n�@I�PՍ�@J���@Kf�=�B@L?.��@M�ȽY�@M��}�'@Nզ0��/@O�눏�+@PM/D �@P���R�@Q3�uX��@Q����Q@R�S��2        ?��Wl$]"?��V<��N?��3��?䟀���?�c?Q�ds?�!�Dy9�?����V�=@��s�@��>���@���m��@.�ɐ<@*�`��@Y QF�@���@#@GŜP��@!o�&e@"�X���{@%�<a@'!��r�@)V��UI@+�t��@-�1�R��@06.&���@1wˑ:��@2��`ZK@4�k�a�@5t0@��#@6�V꒭�@8IB�jDG@9�љ�o@;@�xC�@<�U�Q�@>Z�K#q@?��T=h�@@��&];@A�U[�{�@Bv�-��@CR��^�@D2�#h2�@E�yց�@E�Y{�{@F�r��@Gب$�)�@H�JQ���@I���8*�@J�P��@K��A��@L�h�M�5@M��E���@N�Ft�*@@O�I���A@PoR��@P�*�hDd@Q���I�@R�F�'p@R��S�m?@S+���4@S���RAY@TOmw3@T㏝��"@UyD�j@V��ϳ�@V�Z��n�        ?��}�R�l?�^|w[��?׍��4�C?�*fvT~`?�-@R��?�������?��,i��@��ҹ�@�x��X@c��	~@���[_4@�	�@2�@���!�<@��<�P@j�1�@ ����@"eN���@$[����@&e�Cj�@(�V��"�@*�}����@,���;�m@/JA��6@0�BΟ@2��6j@3Wz)e7@4���GN�@5�� ��R@7T
�S��@8��)(��@:#��?@;��P�s�@=�#RU[@>���Ub�@@��/��@@Ւba�@A����\@Bo��=��@CAŲsy@D)䱦�@D�̧:�.@Eˢ���@F��R�\+@G������@Hq�G�r�@IZ8��)@JE{˜�@K3�����@L$�"(�@M�$� �@N�� �@O	N�N<�@P�f��@P�jn�@QS,��@Q���i�@R	 ����@R� �c2_@S-�e@S��X���@T$Y�=7�@T�R)��<@U9�H�ʵ        ?� �ͪ�?��"��t?����CC�?�D@��|?��U�F:@;T�@<��t�@$�/*�@�����@}��,T�@ cF���2@#8����@&<u�3@)lא/Z@,��^b�@0%��r@1�a���@3��Z�(�@5�Ѳ��$@7�o���@:	E2�B@<7����o@>v�#.�@@bӍ%�-@A��>f�@B��-�
@DH+o�@EL��I��@F��DN�:@G�˗�fO@IH�nQ�@J�o6
��@L��P@M�
��@N��L �@P9��#D�@P�3[V��@Q����@R�$@Y�@SQ�ҍZ@To<�b�@T�#2+j@U��+d�@V�yJ��@Wt�<�@XPx�L�{@Y/��E(�@Z�ͯ@Z��;z�@[�;fQ��@\�}-���@]�f	L6�@^��w�@_�����@`E�Q��@`�q[
�3@a>H:�@a�Y�4T!@b;��o/@b��R�@c=��&�@c��?���@dD�f)�        ?�~9��?� �'���?�a[�?���Y�{�?�c2��F?�O�nS~w?�όlo<@ �ý}�@�Ȭ\�K@	����@����@�����@N{���@8W�`<m@I�{)k@����Py@ n.���@"-�^�l@#�ji�lE@%��WI�@'�V3y�:@)ҳ�N�@+�{�'��@.W��%�@0�:R�@17�va+�@2]8���I@3����@4�y���@5��d%�@78� ��
@8��i�̛@9κ��'n@;#["���@<~XZ��@=ߝ��@@?G�!�@@ZZ��N�@A2¥'>@A�Hl�@B��xv�=@CS�j=@D5<�*@D��X@E��h�r@Fz�W��m@GK�R��@HA�[�1@H�f��w@I�+���@J����/e@K�p7��O@Lg�f��@MJ�:��@N0�'�@O�8u�%@Ph:�@PwRP~#�@P�Ŧ��@Qgb;���@Q�$���@R\
@��@R����        ?�u��`?�`��tb?؀$~/�?����&j?���#�n?�q�l1�/?��}��:@BP����@�E�Ն�@-�9��@eς�@j��$@��J�@
�v,e�@�$����@!63 O@#0�T}+�@%A�胀t@'hS�2�L@)�>�U"@+�{p�@.Y/��A@0h�DϷ @1��l2�y@2��	��@4W�+d'�@5�?ƱrV@7%�!82s@8���;}@:e�f5V@;��Ro�@=.U?���@>�PcWSh@@3i���@A�fXW@A���B=@B�VZ0=A@C�:���I@D�-@�
�@El!�ܞ}@FY{п@GI�r��@H>�9	�@I7+E�@J3�;�t
@K3�R-B@L7��)u�@M?5�1��@NJ���J@OY��F@P6�q�@P�5>ܬ@QN#���@Q�ڊ�@RmVwo�=@R���Q+@S��K��f@T)HN�o@T����m@UY��-@U��K�@V�'4�G�@W/J��I        ?�]X�fo�?��oNw�?��SvW: ?㨘s�"�?��Ӿ�s?��|R�z?�����@&0@kXT�@9KZ�E�@4�h���@��xd:@��;��@��O��@V�#&=�@Ɛє�R@!�9�X��@#���QFa@%z漼5�@'{z��@)���;S@+��2ې�@-��0zL@0�2u8�@18�ҷCx@2h����@3�ü�G�@4܅���@6!<H�$@7l�ٖT�@8�6�@�@:�d�i@;wM��V@<���@>I~'�4@?�V|S,�@@�����@AX���@B���[@B��d���@C�����f@Dr3>��@E?�|X�@F�Q���@F�8��@G���"3@H��y���@Ij&���
@JGP9�/�@K'��>�@L	<��J�@L����@M�+�t�@N��*�xR@O��gPi:@PLli]�@PĹ��@Q>,�p,�@Q��-�P@R4s��I�@R�?���3@S/!���d@S��ދ�        ?���^XJ?�_
�k�i?�F���F?��5}��?��x�@�@�n�b@ސk��\@�����@Pz.y�@��(�@ �X5%�L@#��?|@&���kj@)���i�e@-e�>�@0cF�@2_��0�X@4S��O|@6[t�1 :@8u�UxP@:��]��@<�hY�P@?._����@@��0?@A�2��U�@C?b��bV@D�|�Kk@E�_�%@G.銀�2@H��S&%�@I�1B��@Kbh�{ݶ@L׋Q��@NSהGs^@O�7j�K�@P�ɦS��@Qyi�$�)@REpY��p@Sӷ���@S�ǖ�J@T������@U��B�?@Vs( ��@WR��� |@X5i8žM@Y'Xۮ�@Z�P(@Z�|B�/@[�L�k��@\��	E��@]�9���@^�jTβ@_�_
Dg4@`Yq���@`ع�C7@aY���;�@a�45..@b_�-a7v@b䱙���@cj�k�Z�@c�^��e�@d{���@e ���        ?�l�n�S? t��G�?Ӓ}\MJ?྅��?�yy�� $?��	��$�?��L&_��?��8�}w?@(5'!�@D���m
@�![e��@:D���@�i��~@h���@2�L[��@,�
D@&�Nwp�@ �ˌ\D�@"HwVB�*@#�ϨEK@%�_��s�@'}��Gj�@)S�!ً�@+5X^A@-"��uC@/��S��@0���"�K@1�|��K@2�R���@3�b��@4͓�R�E@5��d�>@7
��f�9@80���Qw@9[�iA�@:�7T -@;�F��1�@<��M5@>4�D�9@?vj邆~@@^ v��@A2���@A�f�ƽ�@BS�Zr�@B��N Q@C���8�@D\q�@Ey�^� @E��dR@FvD��m�@G-��T�@G澃��@H��A���@I^�%��@Ji��r�@J���Ȫ@K�3\aF�@Ld@"��?@M*��g@M����@N��Pk�@O��1���@P)M.xq�        ?���@�l<?���V0?�$��sT�?��w2-?�� 5]��?�E�"�8?����V�@^U6�K@��Ub2�@
A��v@E�n�#@R�ǣ�=@-�{�Î@2o���w@_�l|U@�YEU@!�\P��@"��P��@$����}t@&�ҙ|�f@(�`}��@*�?�c"-@,��\�P@/х�g@0�G@��@1�p@�Í@2��U@�@4/��`1@5j_�3E@6�u�NV�@7�C>w)`@9D�7�*�@:����@;��/�b@=Y�Gt��@>�Fh�@@DOa&�@@�sMΝ@A���&�"@BR�"89�@C�\�2�@Cݦ��@@D�j#@Etj�sl@FC��V@G�u��@G�����@H���G@I�t��Y@Jz,����@KY����@L<M����@M!:'��@N�2�H@N򟓙��@O����@Pf�[�(�@Pߒ��@QYes��w@Q�e�4�@RP�[b߹@R��S��@SLW��nT        ?��ͮ���?Ÿ�;��?����8�?㐊���7?�ì�?��5�G��?�5C�6@�6u:�!@`�$`�@@0����@1\٧�C@�"g��@�-�" �@�����@\�
��@�s�fx@!�xv"&@#��I��{@%�9�Շ"@'�Z��@)����@+�Z���@-�ۙ )@0�L,�@1FN���@2w�b�Jn@3�=d��@4�d& k@66���j�@7��K�Z�@8�q�-^@:4���^@;��"م�@<��t�U�@>mDɹq�@?�����c@@�e���
@An�|�d@B22f�f�@B��@u��@C��{�O@D��%Y6�@E\�S!�H@F.�{�g@GR�O@G�7wB6q@H��t�vo@I���+��@JmQm���@KNZ�.�@L1ӏ M�@M�u���@M����@N�n���*@O�6��I�@Pcm�6@@P۲���@QU]. �u@Q��6�j@RKۅ�Җ@RȨ{d2Y@SFz��L{@S�NN�4        ?��3m?Ը)�B?������?�/�!?�V�_�	Q@��e7@
��L��@�O�@PCN&E�@�����@��W�@�@"���@$���HN<@'�C�*i@*�5g:@.*���@@0�$H3�@2��r��@4W��Se-@67���ӆ@8&VI�x�@:#=�&�=@<-���@>F��,�@@5����`@AN��n#@Bm��9n@C��Q`!@D���^�@E�
�n��@G%����@Ha��]c@I���Λ�@J��Y]A@L7/o�Έ@M�����@N�f�+@P�V�j�@P��g�Ɩ@Q��x@9�@R5��!��@R�z�U@S�q�^��@Tc�Y�+@U"[��&�@U�>����@V�aV��'@Wk�=x�@X3E5T	@X��7��@Y�̮b�@Z����@[f���b�@\8���`V@]���k@]��S	v�@^�Ἱ��@_��ǵ%�@`8`�2$�@`�LB���@a-d�u@a�醔P@a����=        ?�����x�?õ�y�A?Թ]��&?�Z%�?�c?0�?�W�ԮO?�yf@��@ ^'�m�@fa���@���w��@�7D�p�@]Ć[�@��a�@�ȵ���@tD��@A���@ M�B"Ԫ@"�{40�@#�"F�ui@%�ޤ�:@'�^��@)�Az��|@+�/����@-�֑e��@0� ؉@1.���'@2V��n��@3��6+�@4�/�uA@5���V��@7=�K�)�@8�����K@9ڨ�>tU@;2��
a@<��T�o�@=��/%r�@?b���1@@i��g@A%��̇	@A�C"J#�@B���+�@Cjy+�%@D1�G�H�@D��)v@E���y�@F�����@Gj��s�@H?��R�#@I(�VE@I�/��n:@Jͼ�UX�@K�ȵ��@L�M�1J�@MrE��@NX����@OAu]#r@PO��SZ@P�`�M�@Q��Ai@Q~	4��[@Q�:%��,@Rs�lA(@R���4        ?�?��:?ƒ{�Bh?׳���?�E!��Xt?��s:� �?���İg?��1G�(@��|c@9;��k@<i-�@�(,b�@���	@��.@$l���.@�mI�
@ �L��S@"��j��n@$���@&����b�@(�ֆ�>�@*�K�Μ5@-:�4��#@/�!�'��@1��b��@2B�
޿�@3��STS@4���Rm?@66c��W@7����/@9���>@:s���:@;�����@=n@�\�X@>��6��@@C�R���@AE��dj@Aޖ�pJ@B�qzk]@C�� #��@Da�ؘ��@E>�NC�@F1��@G��z�a@G�A��@H�F���@I��g���@J�B�FN-@K��]l@L��v�+@M�YOxK�@N��pXR@O����y@PJ����@P�l���@QQ���Z,@Q�5��}@R^6�,#@R�ѣ��@Spbe׶@S��	�@T�=�ւ@U�/�+@U�,!Z        ?���py��?�$E��?�a�0Df�?��qP��?�ˀߪ'�?�k����?�����U�@@��>6�@��E��@.�)[@g;TK�@l+���@��\� @X0(W�@�����@!84��@#2�HY�D@%Cg�Sc@'imh��@)�Pf;UW@+󑯱`�@.V�+Bނ@0f���"@1��ɪ��@2����b@4Qd!�]O@5�����@7�T�D@8����@:�/]�@;�C�8g@=��E@>�5wk�X@@$:�ӿ�@@�a�{ָ@Â� �@B���6	 @C��7M�@DfY��@EK��:�F@F5b���@G"�>�@>@Hf����@I�|8|Y@J ��ݿ@J�����)@K�8��z�@L�/F1�@Nc���S@O'I_�@P����@P�����@Q�����@Q�qR"��@R8�ˤ@�@R�xr<D@SW�2���@S�۾�@T}b����@Ur���@U��c�@VA�DD@Vڮ�Z�.        ?�͏���?�U�W*��?�}��f��?�|R��?���llRk@�*~S�W@����}�@����Ö@"��*ʔ@$���t@ �˾-!�@#�.K�K@&�r=9��@*����@-�����@0�H�i@2}T�j@4x����@6��P@8��3�*�@:��*Y7#@=%}{y�M@?8B� ^@@�Z܆�@B3˳"�n@Cz��'"P@D��Ɯ�@F!�#]U@@G�)��@H�]��@JW�O�8�@KΙ�@ML�!�&@NҤ���t@P/��H:@P�ڱ���@Q�i�}A�@R�k�Yv�@Sl�Ѵ@TD��.@U�s��@U��Y5�k@V�,)�hl@Wó��y@X�O]��@Y���1�@Z���?�@[t, �/@\g�с��@]^ �J@^WFS�+@_SLs5�@`)�0�@`��C�X@a+��à@a�cː	�@b4)�CZ1@b�;�-J5@cA�]ֶ�@c�2tc��@dT�Y�h@d�&˪9@ekv�3C         ?�����U?��rC��?�g���G?�6�~��?�5g��6G?�|�,L=�?��E��?��_e��@��J�E�@��
{�@�0(�@�I�Kր@����@N�Q�|@C�ӿA@]��s�@�ǡ���@!~$�RL@#?9��>�@%�ֺ,@&���b�@(�;�u@*�X���@,�}����@/;�<��@0�#����@1�+A���@2�?�@4	��#�s@5:�RK�@6r���)@7���ax@8�w��@:@0f�9@;�yC��@<���ҷ@>D�n���@?�c%�|�@@����u@A>���33@A�Ι���@B�j?`�D@Ct��^�7@D6�ـ�@D�k���*@E·���_@F����)@GY�*k@H(��c�@H����2@I��P;��@J�U'�#�@K}\���Z@LXӈ~��@M6���߈@N����a@N��a�@Oދ�yfB@Pb�n@`@PׯX6�@QM�I�a�@QĜ��0�@R<�Th��        ?��/�U�.?�Fv�R�?�`�%�?�����K?�g�h/,?�m"���_?����(�Y@`!$:��@�)���N@оhL�~@��4wpP@p]��G�@|�C�@�Aqvr#@����t@ W���5@"5)A�xW@$&¬ ��@&+����@(DJN���@*oI���`@,���x8@.���:�^@0�1qI@1��s��@3(��	D@4q�5���@5����@7F� �@8}[{�]�@9�r��n@;V;�B�@<��5�m@>L�hi�@?ҋ��N@@��{φk@Ay�[nt�@BGL���@C�" �@C��oia@D�F��k@E��s�E�@F{���}�@G\���`�@H@�����@I'��xq@J��Q4�@J�-<�n�@K�U�n5@L�l5��@M�f�D#t@N�<}��@O��BI�{@Pe�;~�@P�EnXM@Qh=l��&@Q�}bu�@Rp8;g�@R�3�k��@S}}�J�@T���@T��e��@U���        ?�h�\��?����DA?�>�[��?��c����?�E�!Z҄?�V7RN[?���MU�@M*�4�@ʩS'�F@�lZ�:]@��ɂD0@\�z��@f����@����.�@f͍��@ G�I�0@"#�����@$�K�u*@&6-�Q�@(-�I&@*W-���@,��nd_@.��o@0�tV�f@1�sl���@3�EM�:@4`�2(`�@5�T���@7
g"3�@8j�a��@9��C��@;CPQd�@<��b�O@>9{8��I@?����$�@@�{E��@Ap��ë�@B>P麇�@CcCPJ�@C��}N�k@D��{K@E���J�Q@Ft���^F@GV~f.�%@H;,EX��@I"��Cl@J�/Z#@J�˖�u�@K��@K�@L����@M�|�U@N�9�01�@O��#� @Pf�<�[@P缊�`@Qj;=�E�@Q�]�k@RsO�0�U@R��K��p@S�����@T
궢4#@T�ait�@U!.?        ?��3�a?Չ��� ?��?�b�E�?��D�Fr;@��v}}�@��Csq�@���@J��E��@R�D��@ *��ؚ�@"���k�@%�촓X@)�5x@,oC`�@/����@1�zUi��@3�L���@5��e�
@7�� �u�@9άю�6@;�ތ��J@><��`�@@E�t�9@Au���@B��ȵr@C�)�e@E4��ƌ_@F���t$@G���߶@I7_�e5X@J�ۀW�B@LQ/��S@My��G$@N�-c��@P9>J�n�@P�g3a"<@Q�����F@R�ca�k@SYy�L;@T(�.R@T��+oz�@U��uw��@V��a.�>@W���I9�@Xeh׽)@YG�#�@Z+��H?�@[v0��@[�CE�tm@\�@>2@]� K�+�@^�|%���@_��,��@`\<-�@`�5���@aX���(�@a�c�p��@bY�h���@b���yd@c_|_;�@c�S۞��@djbTg�        ?��֟3��?�T���?�[21?�6o"2Ht?�1�����?�w����?��YxjH�?��O34%�@�)����@��}Pa@�N�
X@�9U�@Mvh�.@
�K|d@����Zl@�8suJ@��3��@!)�`��@"��'`Zy@$�O=�@&d�$G��@(>�����@*&_���@,�&e�H@.�y�|@0��u�O@1!IBjX�@23�6u>�@3LZ^�:�@4jw�u�@5�) ��@6�UkY�;@7��6��@9��#}S@:R���5�@;����N,@<� ����@>	�\0�@?h�	E�@@]?�{@Aa��j@A�ҹ�R>@Be���&=@C|92Bw@C˥G�+D@D��R��@E:~���@E�#�	�%@F��J�p @Gp�vv{�@H1�k�00@H�y[��@I�Ws�<E@J�*�Q(9@KH��7YS@L�Peb�@L�#�Ē�@M��G���@N~�U.(�@OP�;?p�@PV��P_@P}#|q�@P�����        ?�>K	{0�?���[ ?��t�Pj	?���3�_?���g�5?��b??��c�ސ�@�>�j@Ff\�$6@=D�*k@����@��tlq@�6���@ޚ�N7�@TuP �@��E#�@!�FI\@#`'��f}@%Iu3c�@'C�v@3@)N6d�
5@+h����@-���c�)@/��/�@1	�7��_@25I'�I@3g^�|�j@4���]�z@5��H�,�@7'2����@8tb꒕@9� ���@;!�`�@<�	�G�s@=�;(��@?Tc�f��@@c4@Mv�@A=��@A�Һ`n�@B�Yd��O@Cc����@D*�����@D�d�k�c@E��= w@F�޻}p`@Ga���:Z@H5���.U@I�7ʱ@I�/"mJ@J�"8�A@K��R���@L�qE�e@Md��D@NJn�ꂛ@O2}�u�s@Pq�|�2@P���VnJ@P�Mc��@Qt�a��@Q�o*��@Ri�Q ��@R叢��Y@Sb���@_        ?���.�:?��O!0~?�6��a�?��կN��?�nƯ%?�.s[q`?���o"/�@G���@VK��W@
��8�@�ޱ=�@2}�Γs@Q�A�u@��&R�@&�̆��@pm�D��@ �;z�@"��\�	�@$�����@&|"�>��@(v�˟��@*�H�?�@,�CS���@.�j�P@0~8>&��@1�����9@2���Eu:@3�n�//@55��0`)@6tٲ��@7����A@9���/�@:Yg�[z@;�[�a��@=���oJ@>v�!F��@?�J��&�@@��)\�9@Ae���Ė@B$��%�@B��K@C��v~�j@Dq �?@E:��`f�@F��"@F����6@G��§��@H}iw`cV@IT����l@J.��xf@K
3l]g@K�hxX@Lə5�6�@M��O�5�@N�m1k��@OzL��4@P270q�[@P�eZd�@Q��4@Q����@Rt;�#k@R���ڔ@Sh�jA?        ?�L}�}Ls?�"d^~�?�<�5�?�	7NN�?��KӕC�@k�Z��@GӬ-c�@�{G<k$@˞)�b�@y�XEJ@��2���@"w9l���@%UШY�C@(]�t�@+�%ˁ��@.�F���@1*z+x+@2��N�d@4���x�@6��q
(@8�����z@:�D��@<�2��i2@?
`���@@�<�;S�@A�����@B꒙M�@D�s�@EN���@F����n@G�Ki��@I:��@Ja�u��@K����f@M?�{=@Nl�Έ�v@O�'.	�@P�]����@QT�(�x�@R�G,�@R�u�h��@S�����]@TLE�@Ue��!�@U���N�@V��{c�@WkKn�@@X95�,w@Y	
f��@Y�^�C+@Z��z�T�@[��i��@\_�a�@]:���@^PhK��@^��)*%�@_�@�z�}@`^hٯ��@`�5�b��@aE�D+�@a��8�!D@b/�����@b�^��[        ?�0�~W�?�~b�~�2?�t��?�B��?�a5~sj|?���LTk?��[�_�Q?����@:[/��U@iڸe�@�;��KJ@i!}`|@۹60�@��� `@�h4`c�@��2�X@�"uN�@!"���@"�2�%U@$�3Ɲ\@&����7@(v(���)@*sw��@�@,�M��7@.�m���@@0c�W�@1��]��@2�5:0â@3�΍��@5�_�1�@6=[����@7~$��=@8�Ӽ@:V-��a@;i���;@<ŏ7��@>(%� J<@?�M;�k�@@�zL��W@A;�u��@A��1�#�@B�"�BJ@C�˜&@DGAU/Q_@E��t�@Eߥ�TW|@F�a�cߐ@G�Ag��@HZ�`j:@I4{�A��@JC�@J���+�@K��Uɠ@L�7Go�@M�L�ޝz@N�3���@Ox� �]@P4����@P�Tc4[@Q)V_��V@Q���yZ@R#um~�@R���        ?�i���?��h��(?�����)�?��� %}?���6��?��i�_�?��YO�@��.f@s:̅�^@HE�Ө5@A0�	�@�*�{@
>�j�@2f�j��@�\2b�@  ���]@!��]6@#�;�0x@%�[���@'���>�@)��v�G@, �&�@.BZ�+��@0H�l*qk@1xm�i@2�i�>�8@3�����@55���)@6����m�@7ٷ���@96�ߣ�@:�H�;w@<{ƴ[�@=x���R@>� ��t@@9R`V@@�z�ۺ�@A�.u�q�@B�*^�A�@CZeD?@D*��U�@D�pe���@E�.�f�@F���\�@G��]�v�@Hk��Þ2@IN�%=O;@J4�j�,�@K�D��@L	�rz6Q@L�W(���@M��KiM@N�dZ��@Oա-��@Pg�v��]@P�0����@Qe�[���@Q��O|�@RiX�4v�@R��y]�@Sq�X:�{@S�%Z�Q@T���@(        ?�ӊh\N?��烵?,?�*Y1o��?��7'd��?�5��	#Y?�M_�s�?�xע��@Ihi�W@�t3�k�@��c�h�@��mٱ�@aU�7�@m���@����'@W�e��@ Q�"A@"0]Q��i@$#o�9��@&*m�Am�@(D��h��@*rCqi�F@,�;��  @/d����@0�2�y�@1���`	1@32V����@4~-WsX�@5�V�#G@7.����@8��^�f@9�z�B��@;s���@<��<r�@>s-��(@?��,�r�@@�&A�e@A���#�+@BeHhp��@C9):[3*@D�X��A@D�RِK1@Eɇ�q{f@F�c�@G�f���@Hx5�+F@Ic�Wp�V@JRd�-�p@KDL���@L9]�`�V@M1���<�@N,ر��`@O+/),j�@PD`��@P�m���@Q�Dw�@Q�#�=`�@R'�\�*@R��jn�2@S8�\ �t@Sý#y�@TO��|x@T�l��o�@UlQ��~�        ?��-l�B�?Ծenх?�҄��\	?�!��_I?�y��f/$@y�r��@
���z�@L��@�ߵ	�@E�@[��@\�YCl@"j����@%Vp��@(na�ۦ�@+�9���@/ 0:��@1[�Q�`�@3:̈́� @5-x�V�d@73
��i�@9K��z@;u8����@=���"�@?�u!��@A.~���@Bf;]��@C�QY��@D�]��@F?zOy�@G�����@H��(�l@J`)Y4Lu@K�"2?|B@MG�AQR�@N��o)@P&��F�@P��a�o@Q��3�@R�''bZ|@SY+~e}�@T.�h�S@U�q��0@U�N ��@VĢ�\��@W�0����@X�'�b0"@Yy��5@Zg3�G�(@[X=Ư&�@\L�;雏@]D<��N�@^?#{�i{@_=E13:�@`M&%ɲ@`��+]�0@a%b����@a��*�#@b1�r6��@b�@͎�@cDNMko@c�䔕��@d]�-W@d��W��        ?��t�6�?�8(%�X?�6�5�(U?�Nl�=�2?�Y8���?�i�1U?��[ �
�?�븽~�[@�޹3�@.k��j&@��>~�a@硛�n@�1	�1_@[�2��@O��>�@ff��@������@!~E_DT@#<�Ҝo�@%
�k�+�@&��]%�n@(���5%�@*ѯ�kx�@,�����@.�[�kn@0�~6���@1���x=@2�*��h@3�W��n1@5�Oq�@6P�zw�@7��W���@8ʯ��1t@:����w@;\i蘷@<����h�@>0�}@?b�i{�@@b7����@A+j�i�@A�د�@B�:���@CBJ>%�@D����@D�`��`�@E�[Z���@FL��0@G>���@G�4�0@H����8@I��Kl@JS�B�@K)p�ǒ@L��wջ@L��
�@M�繥��@N�*n�dh@Oy�Z���@P.��r�@P����@Q?yw
�@Q��'��@R3��        ?�TU��?ƒ�`i�?׮�?�@�M�?��a���3?��0-�^�?��T?��@��`Z@4b���@6�din@���l9@�ͤ�@@�H�p(@���'�@��y6�@ �fs3��@"�Q��~?@$ ¯��@&��6��5@(�v/x@*�=@ Vd@-2˟���@/���V�@0�W���2@2>%�ZW�@3���9�c@4כ�G��@60��#6l@7��+�-O@8�9�y3j@:m߱6>@;�^���@=h�_*�@>�v��g@@@�5��@AӰ��@A�cL��j@B���2@C�Nu���@D`��*�@E>_����@F��?�F@GV�I�@G�v��~�@H����!@I����0_@J� �91�@K��S�i�@L���@M��@b�@N�rFf]&@O�J���@PV5�e@P�唧��@Qa5Y @Q�!�:��@Rr�Gr�$@R��=|1`@S�}��l@T�HEB�@T��ec_@U9�&1�	@U�ϓs�        ?�>*�T�)?���y��?�j��\?����/��?���&{I?�-D�[�?�I��J��@(\�@��X]@xh��O�@]��c1E@/����@0	�e��@]'�7�@�I@�'@ y���@!�j�	@#���]@%�Qڽ�@'�;j:)�@*(��J�@,3�����@.v^y�c�@0d����@1���@2��8�@40	`@5\�BI]@6�Cж��@84U�E@9g�7���@:�"8��@<=�uEm@=��CS�@?0qk��@@Z ���V@A&иh�@A���@B�c!F�Z@C�g���@DT��j��@E*<���@F����@F�4�p��@G��z�@H����5�@I�.�B�j@Jj����@KU>̋l@LB�����@M2Ť���@N%�`�P@O�RQ�@P
����@P��h|@Q����j@Q���dO�@R�i��&@R���9�@S����@S�g�bB@TDͪx@T�j�+��        ?��qr��o?�yC�z9?�߾ҿ�?�Uz%�j?�ofB�@¦�;Ƅ@�*��OB@�)!���@6���6@o+�|v@ TPڍ=@"�<�>��@%־���@(�����@,B�5�-�@/���޺@1��g%@3�����1@5y����@7}z! f@9���j��@;�g�>�@=��4@@���+@AE�$��@BxY� s@C��<��@D�F�簓@F=&Ku�@G�ܵ��@H���F�@JA��Z@K�L e�@MiWg@N�sw43�@O�H_� k@P�6`��<@Q~f�(*�@RC���G@S�[��@S�N*N@T����z@Uv闤�O@VK%]�B@W"L��@W�YQ��J@X�C��
@Y�M*�O@Z��B�@[��.@\i�d�%@]S�F
|@^Av�E�%@_1��$@`I`#��@`�
�6�@a	D`��@a�r�xx@b}z\E@b���^@c)�I�@c���2@dH���        ?�8� �?�S��DS?�R`r�v?�ek���G?�{u�p�?�6�(�?���[��@ ��1{�@�{˲I�@K@�-�a@��I+�@������@�d.�@yh��H@q�,A�@�<�x	@�{[@!����$@#[�=��@%.���7@'�3��j@)��lB�@+KjV�@-�%n��@/0�n��@0��2koE@1˛�_�b@2�]�^Z@4N1�o@5K�>��@6��@RX�@7����@9���=@:Q����@;��̲�2@<�9,�Y�@>W�v�W@?�ðo�@@��(	@AI\B�.@B����@B�]O@C��P	��@DCN�v�n@E�تm@Eп���@F�z3g��@Gh�A��@H8�N3M @IUt��@I�ie{��@J�:a�w@K�)�cA@Ln����@MM��K�@N/N��@O�S��@O��=��@Pṕ�m�@P�8 P�@Q\� o�e@Q�}�O@RMQ{l��        ?��^A��?��Ԁ�&#?��?��Z?�J0;��?�MY��?�W�kI@?�y���@�cC�x�@��!�<@�7��k�@g��9!@.'�>�@5E�`�@�#�{�s@�y_@ ��d$@"�6�{�^@$�Ƈ��m@&�=���g@)#V��@+e�3z��@-�I|��@0�O�/@1Q�Ff@2�b|�#L@3�����@5B7X[A�@6�es��w@8=?�W@9����	@:�k�.��@<��8us�@>�v���@?�>��e%@@��g�@Ar�>�@BH�3�@C"K�f@C��9ՙ@D�wJ���@E��=�=�@F��/w;�@G�XD��@H���4}�@I�V��a�@Jw��(@Kri���'@Lp�����@Mr<6�H@Nw5-4�q@O�pD��@PE���
@P��p��@QU�I�@Q��?o�@Rl�*M\�@R�h|4��@S���l*@T_��@T���8W�@U@O4p��@U�y���X@Vl8�|�        ?���SP[g?ƀ�r@�?׭�H�C�?�D��V �?��L<F:H?��Wӥ�G?�&�V��@�F䩲=@=`Z`d�@A00�@�rEg��@�8X�@�M�,@�@$q=b�0@����3f@ �x7k�@"����5@$����@&��Syw�@(�|��ښ@*�u�0�N@-0K9^ @/��)�_�@0����@2<9C&%x@3��F���@4յ�W�V@6/<{4��@7����@8�-�!g�@:mYL�v@;���V@=i�0�t@>�U׶ar@@Be�Qə@A�ُ��@A�!��)�@B�
�7j@C��rN��@De�ޛ-f@EDm��v�@F&��~ @GZ��8J@G����c@H���~<@I�t��@J�\�k�6@K���$@L���@M��Jݪ@N��P/'@O��q�@P^�)��`@P�O^�2@Qi�]��@Q����@Rzڇr��@S�N�.�@S��4��@T�3��@T�𝈦@U?�wTc�@Uя��mn        ?�J�w�x?�ݯm\��?�����*�?���
?��cU&@!��w�@?iA�@%���C@��'\�G@���`@ e��p@#;vt��@&@��P{r@)s�U�@,����h@0-2�@2i��^�@3�_��x�@5�^���@8ߢCx�@:%e�8V�@<Z�&�@>��E&�@@{�,P��@A����@B�5���@D/zw��u@E{�P�E@F�j���@H)Iu�3@I��u��x@J�B&{"s@Lf(?�@�@M�6Z���@O]U1�@Pq�b�@Q82�~0@R�.�4@R�P��v@S��0�e<@Ts���7�@UJ��*!�@V%����@W|���@W��c3l@Xƴ��Ek@Y�h]ZmA@Z����@[��Z_�@\sv�$Ƈ@]ftOr@^[v�tj@_S`��@`'q��@`�fr�?�@a&�,}�X@a�qw��y@b+�r�^@b����@c5��@�@c����C�@dD�"BN�@dΉB��        ?���X�^6?�2}T@_?�]�p�?�[�# �)?��%բ|L?�.'-�&?�g��P�?��[�@��HQ4@���pC�@:����@��i5�@Cri�W@٭�m��@���і�@g��I@]R==��@ 8���@!ϟ�-G�@#t���:�@%'��Ǯ@&�rUݪ�@(��b��.@*��� �@,q�R��@.bЈ��q@0/��u�v@13ä3��@2=sװ�@3L����1@4a^p��_@5{g��7�@6��n� Z@7�0-:G@8��R�@:W���@;J���@<�.����@=�D���@?
ȡ�@@$/�"�H@@ɟ���x@AqJ�%@B'��c�@B�1w��@Cub4�-@D%�Y���@D�#\��L@E���IS�@FC=G�@F�ڟ)M@G�z�x@Hsn⴨@I1�ڇ�`@I���g@J�x�;��@Kx�g��1@L>�+xD@M����@M�>&��@N��)uUk@Oh��@P�� �        ?�	���?�wC��{?փ���[�?�? �� ?�C�gb%�?����,�?�����+@���*�@�}?$�@
��(��@����b@��)���@�Q�J�@���T�e@혚VL�@V��D�@!sg��}�@#N~�p�
@%<ow�m@';��"b�@)L�)�У@+oW��x@-��A���@/�+l��@1�q��@2N����4@3�r���@4��x#�@6�t�4@7a88�&*@8����@:���X@;z׮�Y�@<�~��\�@>X���ܾ@?��2=`�@@���ܑ@Ak����@B1�S`3@B��͋��@C�J�x3�@D��X]��@Ei!,s�>@F>�翔@G����@G�R���@HДeB�@I�����q@J�����@K|��'�@Lf:�3?@MR���v@NA��
@O3�R
ؙ@PL��Y�@P�M��@Q���@Q�x҂E@R2(�Ĺ@R�;�L��@S���@S�2Ck!@T�aR        ?�JȞ�y�?�@MD��?�`��$?�'y�t<�?�"x�|��?�$�>�?�g0=2�@�q�!0�@����_@
��?5�@��23�@��7�S�@i�l��@v �ƫ�@������@!�Ci�@!C~���N@#UW�@$��jF�@&�3哅�@(��&�8@+
����u@-0A@ @/e@o�:1@0ԫ�ʂ	@1����i@3.��2��@4f�A/&�@5�k!,8c@6���	@87�
�Ö@9��B!zF@:�b�zs@<D����@=�5���@?%�j�e@@E�$;�m@A]o�q�@A�%9 �j@B��zU�@CJ�>�%�@D�v�$�@D�h���@E����@Fz�4�@GS� �Oh@H*΃%�^@I�t@��@I�,r�&@J�oD;j@K�`����@L������@Mn7��=�@NX�IX=@ODjN�D@P�%�Ʈ@P��|��@Q��!�X@Q��(l�}@R2���@R�޳ޟ@S �ՁO�@S�����:        ?�M��mN?�6�;�Q�?�=r�+��?�+-�e�?��%�-�;@w�&���@	����װ@���@�q3J@0�vT�%@�+*�j�@!�:�2@$F��Gs�@'%t�3@*(�+m�@-O:�>�@0K��pG@1��7�F@3����@5����@7y��o@9it ��@;g�[�&q@=t
��Z@?���iu�@@�*��C5@A���/u#@C���@D:w���w@Ef�(��@F�g�wި@G�Ŏ�3@I��p@JṢ�S3@K�B��@L�7���j@N@�ǜa.@O�@���@P|��㩂@Q.�r��R@Q�-�*w@R��mTX@SS��NO@TiC(AI@Tͫ"��e@U�Le��Y@VQGQ*�@W��9̓@W�1IpU@X�i�@Yt0��T�@ZB�Zs	@[�W��@[��l@\�c�q��@]�/��3�@^j�֜@_D�y�@`��(��@`��g@`�d(�[@aa���'@aӶ�t��        ?���'�%?í� �?Ա�~%�?ḃ6�n?���cA��?�
9�)�?�w2E�@ ]�ۊ��@gnɖ8�@ӃF�ߘ@����]�@a�`c�@>yH��@�	�N�@W���@G�N
4@ P�؈b�@"$�!�"@#��6o�@%��\�}6@'��\5v�@)�#�ǩ�@+��>�B9@-��i_CH@0מC��@1'�����@2M��+n@3zt���z@4�S>�1{@5��?��J@7*RI��@8r9��[�@9�����b@;VB2	�@<p[)��@=ѐ��	7@?8�7�9@@S!1e�@A�N� �@A�m}el�@B��|�@CKf<F9@D�i.�	@D��lʞ@E��2�<L@FqC�C�@GA��ӓi@H��5^P@H�07�$@I�k,�q@J�8J>x�@Kz�r��,@LZd���8@M<��,T=@N!l���"@O�hp��@O���v@Pn�7�@P�a�_@Q^6����@Q׍���@RRF5�4@R͓|�`        ?�����?�G��ٱ�?�a����.?��u�dVk?�i��?�o���O?����Gm�@d�E�@�U��K�@ݽ�KQ@�Ph�5Q@~m��_
@�T$D]Y@�N֘�:@?�m��@ m3���6@"O�9��@$Gfe�>@&S-�2�k@(r�V/"K@*�����H@,�s�Μ�@/C�N�8@0�%�R�@2R��U�@3\B�ӌ�@4��^@6����@7d77e'�@8��8T��@:=]4�@;���(�>@=6-�t�@>�!�@@&χ���@@�B|���@A�[.�]4@B��Ub�@CjG
v��@DD |�c@E!,����@F��$�@F�|�-�@G��{�@H�y}x�>@I�<|tƔ@J�1'F�@K�M�t@L���Xf>@M{�D#ZP@NyH���@Oy�D#z�@P>��q�u@P���"@QF���J�@Q��Q��@RT�	��@Rݲ� &.@ShL`\�@S�Uk���@T�˸�w@U�Y�I@U���        ?��i�?ƪ�9
?��
S�?�kYa*�W?������?����Ħ?�HOb�m@�^���@m��@}&g���@��i�E7@샭&�-@~�p�=@_�K���@�>���@ �o�g�N@"��;�qv@$��5Z`�@&ŏ� @(��O��@+)�x*:@-x�N�@/�7>)s@1&�%���@2i�H���@3�%��O=@5	F!S�@6e�[��@7��Ons@98"��1@:����	@<*�}I��@=�p.�@?=,|@@h��G�@A6�L��\@B���Z�@B���Js�@C���xg@D�֢�{@Er����s@FV�-�@G<�i|'�@H&G���@IK-#��@J��U)�@J����[�@K�[oQI@L���"@M�q�yi#@N��t��@O�b, �
@PuYV��@P�m�w�f@Q~�xh��@Rʖ<�@R�	=�a�@S����@S���T��@T.�.c�*@T�b��)@UK;�x�@U�[���        ?�_S�<�?��J��?�~���<?��>"�%?�(�m��@8�+||h@b
�t@>CI?�@�;;ݩl@���ڴ@ �`*x�@#^���@&l^�\t@)��L��L@-���V�@0P�)�<V@2.��Y��@4 0/�OW@6%�4�.@8<�Ac�E@:f����C@<�T�B�(@>�z��s#@@��`k��@A�9vZ@C˯)8G@Dea�.�8@E�Ջ��L@Gr���@Hj����@I����o@K>���c6@L�qK���@N/d���`@O�^ob}@P�"^=�@Qf���e@R2AO�@SX��@SӼ����@T�c'�l@U�C�@V^V|���@W=��Ď@X�~�;@Y]j�L@Y��!�\�@Z�]�@�m@[��b��	@\�I$(*!@]��%c!�@^���!@_��4���@`M�C�]@`́����@aN�wc4�@a��x�@bT�B��@b��=��4@c`!�B�u@c����@dp��/t�@d���nx�        ?���["�?Ėp���?թ�!���?�?4��?�G�|�-?��PrX]O?��ʩ2(@1Y�#W@t��6@
"�~ԿB@7��X�@W��XgZ@C���}N@]�?3��@�\~��@f�Y��@!YIy��@#;����@%2n�9�@'<}FZH�@)Y�1Fd�@+�_�S*@-�omy@0�x�p�@1B�©�2@2}�c$�@3��II*@5��1�@6b�p��@7�/�N@9#����@:�缺��@<� pْ@=����R@?ñ]ט@@F��-J�@A���b�@A�"߫��@B�<||X]@C۠��@DV��Ƴ@E1�!��@F{W�{�@F���64@GՂ�^�,@H����x@I�ɏr�@J�Q��@K���BR@L~��1@Mv+(W�@NqtKj�6@Oo�UBI@P8�:S��@P���[�@Q>�����@Q����s@RJ�|Yw�@R� ��ʃ@S\���Z@S�,r<^@Tt�x�@U�m��0        ?�$�z���?�JL_�t?�r���3�?�����=?��q�/\?�j����?�����r�@;�"
��@�ڶ�I�@"��݆�@^�i�Y@`����s@��%��@�%7q�@��c��E@!*�4�| @##͓�@%1}I�@'TR����@)�A���@+�cBf�@.8<ñ�w@0U����@1����z@2��n�P<@4:9o`�Z@5�k�p)�@6�Y1�p@8n�/���@9��dx<{@;f�b}t8@<�H�%*S@>���J@@���@@���(Ҍ@A��}���@B��GL4@Cb.�\�6@DAD�J/@E#|�0�1@F	�#傚@F�m���@G�YW7l@H�xq=״@I�M�<�@J�~�E��@K��9�;@L��*B@M���O�@N��#�@O��+���@Pe���{ @P�S]̏,@Qt��~-�@Q�k�%��@R����o�@Sa���?@S��_C��@T4
��9@T���5�@UWC Yס@U���`�@V�|Ѝ-        ?��/�h�V?�TjJ���?،�7}��?�pJ0�?��^̀:?���⻴�?� �Z�@U@YA�^�@���b@P.��@z�^��@�g�.	�@���xO�@'��bk�@á�Ҕ@!F��3b)@#B;]!B�@%S����@'z
��u@)�TN�<@,�j�*@.hHw/[�@0o�^IM@1�p��]@3��f��@4Y��ѫ�@5�C0�*�@7#Z��$@8��͙X@:V^��@;��$��]@=���8y@>���1Wo@@%O\	��@@����*�@A����U@B���t9@C�	��@Db��}u�@EG���@F/����@G�u��@H
�bW@H��F�#�@I��(C@J���9�&@K�����@L��F$@M�n���@N���(�@P �.�@P�֓@N5@Q=�W�@Q�7-��r@R$�����@R���d@S@bd%�}@S�v<�
�@Tb�&a�@T�	��x�@U����i@Vfb��@V�����Y        ?��l�?����֋?�*����?���j�i?��T����@D�R��@�UWa�@,�rS�@�ZE���@#H�ڵ@!f.�ѿ@$q��Pu
@'�*h�@+%�z=�@.��9k@1P^�@3Q�\h?�@5j�����@7�*\0}}@9�Z}'�9@<6���0@>�xdKbT@@�DD�*<@A�2E&�@C2��|@D����w@E����+@Gi3�8k>@H��23=@Je���cv@K���a|=@M���aP@O!x��EI@Pc+Ec��@Q9��&��@RYc#@R����D�@SՑ�x3@T�D�,F@U�i�_TB@V��{�i�@W�|���@X|!f��@Yuu��Xo@Zrp�$-@[s
G���@\w9�/��@]~�gƻ�@^�7��Vg@_��M|v�@`U�ĉ�@`�h���@al��)jp@a�)�=�1@b�{�L�@c����@c��zt�j@dD�Z 7@d��}u@es%���@f��T��@f���A&�@gD�3?s�        ?���n~Q?îM�>h?Գl?#?Ṃ�̯0?��B9�V�?�
7��_?�v����O@ ]i�2v�@f�@��*�@���?t@a�rm�$@ v+�@�;��@����q@Q�t�@ W�32Ȉ@"��+W@#���N�@%�>��y@'ŋ��o�@)�l��@+���N@.�d�P@0�e�l@1A'���@2kFL�@3��e�@4�ݎ�HK@6(/8�9@7]����t@8�L��]T@:�٤~@;^�`�@<����@>,e���8@?�a�U�y@@�~�#�@AI�8�hY@B�PQ�@B�e��fc@C��!��@De�ҟZ�@E4���{�@F�_bC@F۔�a|*@G�}D��,@H�Xܣ��@Il!n�@JL�!��@K0\"��@L����W@L���b�[@M���+*/@Nڸy�o\@O�1hB@P`-�!Ը@Pۘ��@QXTse�@Q�_�>�A@RU��k��@R�WK�R@SX>V���        ?������B?�ĝOr?�4�a�?��e�䷵?�,\���?�B*q��?�d�� �r@9j�O$�@��A|n<@�ee��P@n,���@C����@HG$nQ@y|[�H@�XT�.�@ .�J*@"���@#�I���@%�~g�� @( 6v��e@*"�E:��@,WM�Ԑ@.��V�?@0y�E��@1���	�@2�>h�em@4+��w�@5v�RU�i@6�e�]@8#3i/�@9��l���@:�FT3o8@<]}�@=Ӹo9؝@?QEH�P @@j�ҲS�@A0?�ޭh@A����J@B���A�@C��=�@Dfev���@E;��{��@F$��@F�{#@G��w���@H�`&�t@I�Ĕg)@Jy����>@Kc�����@LP �$lE@M?[�r�@N0���@O%\�B��@P4h�{V@P��Z:-@Q	��_@Q�k���!@R���y@R�Ǵ]A@Sʼ	R@S���j�@Tp;�3�@T�G58�        ?����)G�?�p6���?س5<�8�?�(B��4?��.��M?��We�Z&?�[��<�m@�e5�@KkG[d�@�����@��⌻�@�?�qyK@�O�(@__��@��c@!i�)U��@#h�&'@%~+�F��@'�Λ`#�@)�Os�Ȅ@,<2
��@.����@0��)lx@1��Q��@3'mN��@4�)Suj
@5��d;�@7O��m�l@8�᚝I�@:@֜���@;�H�@=Tqo�2@>�,�bu�@@D3Y��@AU�L��@A�p2+��@B�wE2�.@C�_�� @D�5`8@Eq��Y,@F[���@GIɷ���@H;RXzh@I0l��)�@J)ĸ�@K%%�)_�@L$��;�@M'��7�@N-��&�s@O7����@P"9E���@P�N�0�q@Q4"�&@Q�OG��@RL2���A@RکԤ�)@Sj��
�J@S�DR��F@T�a�Z�@U$�U��@U�-O���@VQ���@V��r���        ?��{�L?�R����?�{�p9C?�Ħ���?��;�H`�@��_@t%@��$a<@��D��@&Qs}�@*��ŀ7@ �`����@#��"@h@&�s�ǏG@*!��6�@-��Yč?@0��!�pK@2�6�o�1@4�J�n�@6�u6ڎ�@8�, �7z@:��kO0@=>Tw��@?�����@A�KSgi@BD�ۛ>@C�,?�\�@D�.ox��@F7��Hm@G�!���@I���6@Jt���%b@K�4Sa��@Mo�A�@N��Q@�Y@PD����>@Q�./�@Q�R��B@R� �B9�@S�2<�:�@Te���@UC���G]@V%��֡d@W
�`݈@W���6�@X޿�zh�@Y��T�A�@Z��U@[����>@\�:��_@]�Q,��@^��R�ߞ@_��|���@`W�<��@`��I!�q@aacǚ#@a�R-8��@bp��Ƒ@b�����X@c��~\U0@div%w^@d�v�V�V@e/��$�>@e��˟��        ?�"�R�v�?�9�*�9�?�7�?,��?�Q6<ߺ?�a|t��?��R�er?���SK[@ ���5@�+Ud�@V����Z@!�}�~@1��@ē���@���䍎@�����L@�*h��@ I���@!�R�6�@#�,�{��@%~cu�*@'n�!��"@)o9��l3@+�Ki�?@-�����@/���Q�@1EM��@2/{���@3^�%ۂ@4���j�@5Ф2�e�@7r}��%@8_#2�@9�xԦ%�@;y�.�@<f����@=��H�
@?7.�ƞ]@@TV�'9�@A*3��@A��x�+@B�鎊1�@CU·��@D���!@D�;�D8�@E��4�ۻ@F�-s�q@GY[J�@H/IaѺ@I�{K�@I�De�W�@J�?��>�@K�١9SA@L�
�V)@Mj��oy�@NS�^��@O=�r@P��'t@P�~�[�f@Q�5ƥ&@Q��h��@Q�Z�9@RyN_�@R��gI�        ?��nW{?���ް��?�?��T?㶨dM?��$6T��?� (K��?�8S'�5@��@���I��@k(w�q @V�(�q@(�l�@)@v�x�@V���@�ѭ�A�@ Nj@��@!��79v�@#�>䐝�@%Ԣ^��b@'㞯��@*�ۑ�@,7��f�@.{��5�@0h��cp�@1��у�@2ֻ�~��@4��l�z@5eaCR�@6�(�O@8��]S>@9t�8��@:�m��yT@<On��<@=ǴJ��I@?G%d>��@@f�b��j@A-�姲�@A��4�^@B�U��@C�B�3&�@Dj}�u��@EA���̇@F��o��@F���)�@G۷��&�@H����@I�@ż'�@J��t�@Kp�1v@Lo��+|@Mb���@NYW��}@OR��2�*@P'o�P��@P���.��@Q'�
^��@Q�O�1B@R.ߖ�+@R�=�&N@S9�x��@S��]�d@TJ�k��y@TՌ���D        ?�A�p�7y?��
�>�?��k"��4?�}�9�I�?�0q�m�?����l��?�d��
y�@�wt�@��v#��@���<�=@@�	Ł@��M�`@-Dk�ۛ@��H��@
�}�)@ ��>��W@"��	Iz�@$��jj@&�A�bq@)+���@+W!��.@-���9�@0�ې�+@1C̼49�@2���ؒ�@3�e�pD�@5,�ȏs@6��CFb�@7��?��@9bk�O5@:�^��nE@<X�|`(�@=ߪcA�@?nY�V)�@@�J�>j,@AQ!���@B#� �'I@B��2X�@CӏZX�&@D�����@E�����@Fu��@G]�(��F@HH�
nN@I6����@J(����@K[�j3[@LP~a�@MaXO�]@N�mV*�@O��� @P	�g�B$@P�~9g��@Q��$�@Q�����@R �]�L@R�N�B�@S5"��@S�J����@TN�Ƙ
�@T���w�@UnQIZ��@V �v@�        ?��{�6l?Պ��zu?��=<?�h ��E�?���M���@ެ��
@����I@��̞�@g�Ϙ�@G�T(Q5@ H�%%L�@# K�3Ԏ@&(y
�|@)_{�0(�@,ë��[@0)�@D��@2�}7��@3�jV���@5��?�T@8�� @:B�u�@<�l�Q�s@>�
��u�@@�3^���@A��2��@Cy�y>�@Da@m?�@E�A�|Q@GY8��@Hre`a�D@I�D��@KOՕ���@L�����@NK���{�@OԀ	�n@P�T��J@Q}�Ͷ�1@RM��j@S�����@S������@T�*Ě�@U��Y��$@V��<��@Wo+k�-@XU����2@Y?F���@Z,
��;I@[�0� @\�gif>@]�Ͳ�O@]��(�"�@^�f^vg@_�&4fv�@`|�t��@`�$�b�_@a��p�ԓ@b�&�)�@b�I,ҟ@c���u@c�41�L�@d)�hycN@d�m���@eB{�XP�        ?�L0��a?�t��c�k?�zQG�i�?��D�~�?�%*	?���1N?�,j���@ *��t��@#]J���@z��c��@,2�}w@��ro�@�����@�����@�e|Fi�@�i��4j@�AQ��@!����\�@#eN��#�@%4��ʻ}@'����@(�jn@*�Q;���@-�dR��@/�|Cc8@0�L�]n@1�BD%@2ع�z�|@3�����@5*�OwUn@6]'؁1@7����A�@8�
#�@:i�5��@;b�-")�@<����A@>ETO�x@?c�)4^<@@b5�\�@A`^R+@A�@L�f@B��ˀL�@C>����@C�È�u@D��}�@E����2@FEQ�Ҫf@G#^���@G�d�E!7@H�A�@Is�s@JDwI{�@K'��:@K�"���[@L�a����@M���*�@N}��`|@O\��8�.@P��f��@P����F@QJ�u��@QwR;s@Q�����        ?���Gry?�3���?�N�3���?��\s�?�N̖�H?�Y�#6�?���FpQ@K\�BX	@�=BFړ@����|�@y����@N��t�,@Q��O:�@�����@���w@ /�Cx@"/@#���|^@%�KB"��@'���:U@*o��T�@,GC*NV@.����@0mǀ�V*@1�."�[@2ؗLJ�/@4ܿ���@5bڴ]��@6�o	�@8yyI�g@9j�ϒ��@:�xx�׷@<?31:!�@=��'O�@?/�c���@@YY�U@A��a]�@A�J�I�@B�üN�9@C)��Z�@DP�>��@E%]�Ҙ@E���@F��֝�x@G�mJ��5@H����@Iy��n�@J_�;˝h@KI
\�@L5�N�W@M#�)���@N@��Uv@O	u5y*�@P .��q�@P|�Rޘ@P�>�*@Qz�c|�E@Q�d�l]�@R}����@@S �)Hp@S���:E@T���jS@T�� �$        ?�L7�W�?���zk 	?������M?�//��I?��%�>?���gÙ?�" �GB�@e�rd@x�؂q@K�(_�/@A�0���@;�.�
@l��U{@+d���@zvE��@����I@!�{�I��@#���,�@%��$��@'���j_@)�����@+�Ӿ�G�@.!��)@05��[�a@1b���C�@2�Y��@3�6����@5�ܺ�Z@6a{�[ �@7�U}C�K@9"��@:k�R��@;��vs@=?	����@>��3��[@@=�@@�j�[1@A���c4@B`?�ɚ@C)�@�Ҋ@C�{s��@D�)�F�@E��?u�@Fn;	@GG$�M@H"�����@I �t�|@I�'Q=�@J�*��l@K��?	� @L�t`S{�@M��:���@Nqt���@Ob�s��@P+j�a�C@P��9f/@Q#$:�:t@Q��'.�@R�4�A�@R��=�$@S!0����@S����@T';g�Â        ?��7y?ը��r��?����.�?�+�v[?�� �ΘG@�0~@�/��@�f=|#:@j���@@�-�-@ <�x@#	Q�@&�Cyk�@)'�_�g�@,vq�Kt@/��@1Ğc���@3�S���%@5����@7��k.d@9�tg���@;Ս�F�.@>
��"ܽ@@'��K�A@AQ���@B�f���@C�ilk�:@D���	@FD$��@G��T�a:@H��G�p@JDK�6߀@K�@���@M�@n@N����@O�w]}hW@P�1�aQ�@Q{�)�^@R@���@SWw�<@S�/D���@T�p�0�@Uq��kt@VE����@W�b�@W��z�7�@XѼ���1@Y����8@Z�m��s�@[vӘ�;�@\]���
�@]G��oQ�@^3��(�@_"�ܹ:@`	��z��@`��޾Uh@`�鱘;@a{v#{}|@a��|@bw�@b�����C@cy8%��\@c��F�ȿ        ?�uz�cD?É��i
N?ԋz���?�8���K?��ݏo��?����ў?�:-3�G@ 3t��E@.�R�@�@S|@=H\�w�@$}(�G@ӹ�&�@��9��O@�v��W@���;H@ ����O@!�F6�@#~@Ӧ�a@%RP����@'6	%�:�@))�t&\@+*�d�@-;o����@/Z.3+o@0�n{�7S@1��i#��@3sR%�q@4.�}�@5_���@@6���`u�@7�^�/��@9��Y��@:an�|'�@;��r��@=!��#@>a!k(@?���X7�@@�/���@AI�$ֽD@B�N�]@B��a�$�@C{�.B|�@D<n�i��@D��|��@E�J��2I@F�zy�D@GX�v��@H%)7��@H���g��@I�Uw�3�@J�b��	@Kp����@LIE,#��@M$Ö�@N �:
�@N���8�@O�1uO�@PR6�h�@P�ׂC@Q8x�Y��@Q��%o�@R"�$.b        ?�����R�?��O��?��;y�@?�+��h�?��5�c�?�%�϶Tk?�=�,�Ւ@��&��@��tZ��@jC�V�H@U
�M�@%x�8q�@$p��db@P*n�9Z@����/@ �W�6�@!�;ג�@#�@7B��@%�M�y3@'����@@)��(�j�@,)��b�~@.l����u@0`�p��@1����@2�EItq@4f�D��@5X\��>�@6�	� ]@8O)W�@9d�X�	@:�.�%�@<;�"=��@=�/8�y@?/�:E�@@Z�^b;@A��D��@A����[@B�^優�@C�&C�u@DX5Ig��@E.�\Px@F𹢰@F�*�s�@G�}ԄY@H�d�޿�@I�\��R�@Jv\�*8[@Kb[����@LQO��@MC,�_-}@N7�:aʺ@O/��嶖@P�m��i@P��ʔ�~@Q��M@Q���s�@R����@R���=I@S!�}�@S���y�@T/�k�A�@T�Qi�V        ?�|5�8�%?�!$���?�F߃'S�?��9��v?�L�a*^�?�Y����?��]�7T�@Mvx!�@��;�_@��3B��@~a�F�o@U���Q�@[�xz@�%�ߋ�@������@ ;c
�P@"=]f#P@$ �g�<@& ��@(�Aȷ\@*9͸!�@,pjܼ�@.�d�|e @0�׹�WQ@1�|j�@2�y����@4C�ѩ�1@5��'��Y@6�,�W@x@8FB���@9�i���@;� ���@<�~J�Dy@>
�m�;@?�����@@��xKNG@AU�5�,@B"@
y|@B�=��`@Cŧ�"�@D�s��@Ev��fXI@FT��ZI@G4���>7@H����u@H��I	�@I��}Y�+@J�Iy�Y@Kǳ�aW�@L�)�y�+@M��v�ļ@N���]9@O�~l5�|@PShZS[�@PԂ�,$@QWͽ2�@Q����(M@R`D��w�@R��o!r@Sn��P@S�V+z�~@T�8g,�@U y>�        ?��G�(n?ժ,@��?���ůM�?�/�?�?����@��0�@��@�@���/ԝ@_�dK��@2�_w� @ 4�%�~�@# |��@%��h(܈@)�9�,X@,m�3���@/�9X=�@1�����@3��ۥ��@5���c�@7�&d�@9�m�K8�@;݄�pqK@>֘6�@@/EW�/�@A[]��@B��6�u@C�[��KJ@E��쒕@FV��j�@G����ѻ@H�m�6@J^��a�@K�cߎ��@M/Q�ѹ�@N����A�@PCg>8@P��W�}�@Q�p�|�X@RU$�=@Sܕe�@S��F��@T�3o��!@U����?�@V^$g�Z@W5[�c�P@XZE���@X��=_�@Yˀ���@Z��U�@[�Eud)@\y�KI#@]cS�-k�@^O�N�7{@_>_-(�@`�p:�@`��1�f@a�6��@a��X\C@b��&F�@b�J��߯@cȽ�R�@c�]֪�X@d
��A        ?�׮��&�?�M�}�X?�	�c�?�)�S���?�#�h�1?�q��3)�?���fA?��wݡIi@īs���@�y��N@�����@֧0�Ѐ@~#
�a�@M�u>I�@C��,��@^�2��u@�s�4�b@!m�BX@#@�ƛ�@%�ޮG,@&�fY��@(��"YK@*���v@,����I@/�2(�@0�,L�@1�0l3@2ߩ�;:�@4
���@5:��A9�@6rF�{�9@7��֔�2@8�ߦ裑@:=�y�@;�	�W�@<�#�}<@>@)M���@?�	��#@@�ڷ�T@A;��}�@A��m�0@B�rCՀ@Cp��!�@D2u���@D�%��@5@E���W��@F���<�@GUF=v@H$� �E6@H���D�r@I� �p@J�>��"�@K{��Ya,@LX��h@M6��G`�@N�xZ[�@N���_FC@O�k'�V@Pe�ö�@Pڈ��@�@QQ*'DjG@Q��&�@RA���         ?��l�!kD?�%q�n��?�D+3��?����|�?�I��ד?�Z*Q��+?��Jz��@S�U[7�@հ�Q�@�T0�@���;��@mF5n�P@|Hc*�@��rx$�@$�-X�@ ]��z@">/��Q@$3X%��4@&<�MӝP@(Y�V��@*��I�,@,̖Xqp@/!�E��@0Čg@2 V��4@3F DU@4�ǵ�Fp@5��KR�T@7H2)�G�@8��O�b4@:d,��>@;���.�@=��V�@>�E��@@���D(@@�x�/D�@A�*�3O@B�q��@@CUΖ0�@D/���`\@EB����@E�vX�2@F�Fx��@G���X��@H���.B@I�߈�g@J��h�M�@K�Y���@@Lz!�g�F@MwK��A�@Nw�k�V-@O{��_�P@PAf#K��@Pƚ��)@QMlc@�u@Q�����@R_���H@R�o��Ь@Sx�-�!8@T8�&n�@T�fN��@U)�<��@U�AYBɍ        ?��w�	?�J�9B��?،w���?��Ng?�9�z|?��mc �?�2Ѥb�H@f��ψ@-�.D�A@iv�@��#x�@@����@�`�z�@F���'�@�6oO!@!\P3�8�@#[F��C@%pa��5 @'�K��>@)�πp�@,/!v96@.��8��`@0��G���@1ѲD���@3# p'�@4}�)�u�@5ျi@7Nb� 0�@8�)��@:B�F���@;��}���@=Yqo��@>�l^�`@@H�R��;@A�~_L@A�#�U�6@B�@����@C�D�P�@D�&���x@E|ۆ�Y�@FhZ.e��@GW��Cŝ@HJ���|@IAA#%[�@J;��L�i@K9����"@L;@-���@M@{��E@NII%��@OU�S�
Q@P2Æ��@P�u���@QG�l��@Q�wsrM@Rc�~ 	@R��'��@S��`^�X@T�$��@T�}vD��@UGΑ�|@U��b`�c@V{ay��@W���<        ?�3��]N?հ(�u0j?�ұ�)��?���Hf�?�ǳ�8�@��a @����@���sM@���=�@j��Z�E@ Z�[�&�@#2��߇@&9E3@)mԜ=�@,΀ŀ3�@0,��L�{@2���ۿ@3�R�Ⱥ@5�"35`@8�G���@:.��@<e@��L@>�����@@�~<��@A�d�GS@B�_�_E�@D:EΠ�@E����%@F�1�m�G@H6�y���@I� ��{n@KG���
@Lu��~�@M���ɥ�@Om;O{��@Py����@Q@*ؠ[@R	�F�1@Rֹ����@S����A@Tzg�o�5@UQ�s��@V*����@W��"X@W甆�l@Xʌ��@Y���7@Z�y]�h�@[�^����@\t/SM��@]e�i�@^Zr��@_Q����@`&��d@`�����)@a$`\ ��@a�����@b(.��#@b�Q�V�@c1V����@c��w=��@d?��T�@d�ڶfv�        ?���j�Ii?��A%YZ&?��
(�F?���`K;?�ۢ�@o?�:�:��?�\.��x?�GD��=@x���v�@����\@/C��@�I��4P@����@̷�	�!@��*���@�=u�\�@�®��Z@ �
��V @"�
�{�@$bb�o?'@&*�2��@( e�}�[@)�K�(r�@+��R�@�@-�0Jΰ@/ב�#V@0��9O�-@2�%��@3��o��@46�^��0@5W�[��"@6}�r��@7����x�@8�G�� @:7Y݊}@;K:�m�@<�<2:�@=�%���@?�|��@@42�?R@@��Q�O@A���<�8@B7��G0@B�1�k%@C��o͆�@DOt��/P@EK���@E�<L&�?@Fz@1���@G7R�s@G�nY��@@H���{
@Iz���GD@J?���5�@K�0���@K�{��h@L��ը@Mg��:>\@N6�����@OV����@O��L<�@PW���@P��L�/        ?���*η�?��4�[�?��1z��?�{PlM\?�S���^?����G?���EE�@��xB @��Κ�@���ȉ�@![�J��@^� �.@C�r��b@��sEh@'0��O�@ ���1�q@"�+�r@$���! �@'��]��@)2��z`J@+v�ES�@-Ο+�e@0�m2M�@1[�4�@2�өޤS@3�XD�@5O3��.�@6�'OyU@8�<�?@9������@;iR�>�@<�/��]�@> M�(@?�t�S*@@���A@A{E��O�@BQy��Y@C+����@D	P��r@D���C@E�U6�@F��L��@G��Ez@H��W�)u@I�e�R7�@J��(�f@K{V�Pd�@Ly��j��@M{$<��@N�)��JT@O������@PJ%G��m@Pѫ{��n@QZ�(� #@Q塆�M�@Rr
cD��@S ň��@S���UХ@T ؊�;@T��d�@�@UG�2|x@U�˰�]v@Vu6i̷z        ?�3!P��?�n�?�0�H���?���s I�?��U�Z�?�[��NA*?�0�? �R@s���@����@
d	��5@petW@l��J?E@M�#�d�@Y'I5�L@����j"@�vOc)@!6 '�@#	��bB�@$�W��%�@&�u�ٝ�@(���@+=���@-0C��@/h�K@0�]x��w@2��Xo`@36���na@4qG�{�M@5��T/��@6�D�i��@8J��#@9���2�@:�>y4�@<bQ��@=̈�?�Q@?=�-Jj�@@Z�k',�@Az���8@A۠�@B��rԓ4@CiNۼ��@D4�x�.�@E?vAL�@EԹ�$ m@F�*	o=@G��!~�t@HZÐ_n@I7�;�{@J��.N?@J�d�5H@K�����@L����i@M��&J�@N����@O�
1�@PANFט�@P��<�@Q7�Ƴ[�@Q��w*�z@R2�Jx��@R�zC��@S3&ϥ;"@S���{        ?�Y2*V�o?�#z��C?�<¬�?�
&Cu,?��c[�.@oUe�.@NHz�Ǩ@��X�X@�ߋ���@��;%K&@��xO�@"�K��J�@%dNk�@(n���@+���-@.�=��|@19�@�@3vW�uu@4��U�@6�,$��@8�o�+y@:���\�@= ��F@?+ñ`j@@�]�[��@Aիg�i@B��l��J@D0!��@EgA��@F�)��d�@G�w�e��@I0��#�#@J��3e@K�=��,@M0!Z\�w@N���r@O���[v+@P�A�.Q�@Qi�q\�Z@R%�M��@R����T@S�@W�"5@Tf3'`۰@U+�8�F�@U����@V��]��@W��JG�L@XY��@Y+9-ms@Y� Π�w@Z���@[�m�!`�@\�	#��@]d�}� �@^C��@_%87�s^@`S ,8v@`w)�a�@`��h�@Y@a_�;�an@aհ|	*@bL���"@b�qby+        ?��{�姬?�'^u�b?�C!�F�?�'�'r�?�$Ȅ��?�g S � ?��{���?��ת�97@�o55|�@���`@sn����@�� =}�@E��_�@����@�N��a�@�Dr2�@���3@!.}-hMd@"��,]@$�9�@&u	&�cl@(T1�ؑ@*A1H�@,;��9�@.CUq1G�@0+��9c@1<�_�H@2S@:[�R@3p��j@4�����@5�_r��`@6����@8wd��@9V���x�@:�_�/y�@;�9����@="5��s@>p=l�*�@?�<�V@@����.�@A;�p06@A쥁=�@B��.�aH@CU�� v@D��-yR@DƢĦ��@E������@FA�si�@G�S�i�@G�6%|��@H�󟝋�@IO���@J�x���@J�i�P@K�b�q�w@L5�g��@MO��n��@N"���N�@N�3}���@O͜� ɴ@PR�N���@P��?e$�@Q-�#��0        ?��p�;I'?��p��?�6ɇ2�0?�ؘʝb�?�-1��p.?�B?P�|?�c����N@7�����@���;�@�.B�U@j;�"r@=����@?|�!U[@n�Z�@�~�;gF@ %-�=�R@!���F�@#�th3�|@%�6�!R@'�!�bo@*�p�Q�@,=����@.����@0ic��@1���X q@2�E�{@4uT6"�@5^Ez��@6�����s@80H��=@9e˞Z@:��	b�l@<7ȳʚ@=��,�]1@?%��	-m@@S��o�:@A]����@A�i-4�@B���`tT@Cu�x��y@DFd�!ڋ@E����L@E�J�T8_@Fɫ�-<@G��b�RH@H��>��@If���.@JK��@K3:4@L@?�@M
�I�~@M���޸�@N�WFC�@O�2�Og@Pk�.!�B@P胅��@Qf�Dj�=@Q��͟�@RfV-<�@R� R�j@SjכZ�@S��dܾ;@Tt�>�        ?�t��!�?�Bg�Eoh?�[37l!?��q���?�%�0Cy?�| @;C?�YN&Aޒ@�Rf(G@�pj���@
�����@��Mˑ@}D:�
�@]��ڂ�@gݵ�@���%@�4�l�@!8?D���@#	K�_�@$�Y� ��@&ބ{�D�@(����@*��J@��@-ͦH�l@/K
J�Ԑ@0� ��uF@1���OF_@3O���G@4Qȃ���@5�����@6ЊH�Z�@8����@9h��9�@:�!l�O�@<x{/f[@=z�b��9@>៿N�"@@'v�@@�/_�eT@A��bkO@BZq�U)�@C�B\u0@C�%���@D�I����@Em��Om@F8�o�j�@GE� ��@G����@G@H��W�HY@I|.>�V�@JR� @K+G��*@L���R@L�'.�@M���d�@N�<ԇ@O�g�[��@P5�}�@P�_ι�t@Q�e�7@Q�r�#g~@R	��5�&@R�O���@R������        ?���@gL+?�<�gY�s?�Q��8�?���t?���a=�@}h��f@`��z�@��#��@��E��@�ث� �@��ј@"���4�@%t�R7�@(���)c�@+��O­@//A��@1MbZ�}�@3 � Fi�@5����@6��T�S@8�}�bg@;��)A�@=9���&@?lv*��@@�9���@A�Y��@C.tDz�@Ddf�a}�@E�=���@F�EH�0C@H-��Z��@I}�X���@J��u�&�@L0%����@M�4�Z�@N��_�@P3�F�Q@P�a��4@Q���me@Rh��f{�@S*c�3@S�8D�o@T��QX
�@U~��F�@VJ�8�@WG�rgx@W���+�@X�W9�%@Y���>T@Zj�f!��@[E'��,�@\!�k��@] |~�?@]�}�PW�@^Ĭ���c@_�YE�Y@`H��A2,@`��H2�@a3O�p=3@a� 1e�@b!�4��@b���o�b@c�N���        ?��A��?�5]!��h?�-�.��}?�B��>�?�A��{�?�6P�7?���Gw?��s�G@���^@�AX�m�@�ԗ�@���sJ�@P�#��@��,b@�Sm�@�l��q@u���@!+�veyU@"��:d�@$�]��y@&g
˥@(AW��n@*)�z�@,��)$@.�{�@0e��9�@1#J��@26�D�@3N�1Y�6@4l�J�+@5�l��!@6�y";�@7�ʹ��@9G%�s�@:S�\���@;�b�5'@<����q�@>��@M@?gʞ�h@@[�x��@A�G~�Z@A�~z҅w@Bb���^@C�Q�@CǑN�g�@D}E^b�W@E5�[�@E��G@F��o��@Gi([��@H)?�I-�@H�T�n��@I�_�|'/@Ju[R|�^@K=@M���@L�8��@Lҫ
�@M�"}ȡy@Noe� �?@O@m�I@P	�@M,j@Ps�bC��@P��e��8        ?�REGP�?�<�@(��?�N�)�	?��/��"r?�E[ѣN?�Q_E��?�v?h�@B��Χ)@�m���U@����x@r+>�;a@F�gg��@I�(*:@y�=mm'@���:8@ ,�X��@"�6{@#��/��@%���tK@'��F���@*!,�j@,OL<�/�@.��f��@0t]C�M@1�&���@2� ^r�@4$�['�{@5ok�m�\@6���n�!@8���Q@9|�$ 4~@:�Q�Ԙ@<T�C3A@=˟0DC�@?I)�_0�@@f�4��@A,B8�m4@A���OX@B�*8/�@C�}ZLْ@Dc�}b�@E8��II@F~�.�x@F�\VA@G�>����@H���@I��1���@Jz�U��@Ke�^N�@LRu9�o�@MB� %�4@N5e1\I@O*���@P�M��@@P��!&'�@Q��vH@Q��8Q�@R�U��@R�e��h(@SRF��@S�A`'�@T 55��@T���h�        ?�#i%?�۠�0zH?� ͍�(?�&w
�?�� ���?��xzpj?�/e���@�m1�X@���O��@\�	���@L�ԥ�E@�S��@�p3@B��S!�@�[|�ذ@ 
�K�i�@!�ЊS��@#�WLl*t@%���~��@'�w�vQ�@)��@�@,���%@.V!/�1@0Sg5e�@1��hr&@2�Z'���@3���H$�@5D���{`@6�3��@7�2�[X@9I~�
�@:��DL�@<tsLc�@=���3�E@?	*T��@@Erُ�@A�L�8@A�=c/A@B�bj?2�@Cg�b���@D8�G͊�@EQ;�@E�&Iӵ@F�}� +@G��b��@Hy��4�@I\�F��@JB1Կ�@K*�ܯ�]@L1ʬ��@Msp���@M�����@N�M)�7@O������@Pl���b@P�x�v�E@Qi��Tp\@Q�Q,�dp@Rl/�mh@R�TF �z@Ss�k͙�@S�a��Z@T�D�	8        ?��\`.G�?�[�͜�?�p1L�.%?�1�I5�?�2�YblZ@�F��0�@{0!�Fs@����u@�>u?gb@�b�{�@��+(tA@"����v@%|���6K@(�����@+�S�x*�@/b	~�@1K@��@3����@4���e@6�I��;@8�wM`�o@:�����@=^��jA@?MK�s�@@Į��;�@A�Bl@CF�I@DG�ۭ�6@E�)^'@F�ަtC@H0+���@IOI&�W@J�D֘@K�PU�@MSlR��@N�e�g�@PkiN��@P��-��&@Q}�71@@R9����@R��b�?@S��f��a@T{ƙ���@UA�q��:@V	��y�@V�A��թ@W�:kk��@Xp�\�}�@YB4����@Z#���;@Z�Q�ʖF@[ķ�d�N@\�M�@]|
�t-�@^Z���}i@_;��*0@`p�hC�@`��3�@`�t�A@ai�����@a�W�o~�@bU��]�\@b��i#�        ?��a$6}?��ߩ(��?��M�A�?���X��M?����J�?�6��b�)?�U�hF??�>-�� @r�H�`�@����@$E\�@|{ a��@M=�Ͷ@µ�$�@� 
�K@��_^�@�J3�}@ �\r�n�@"�pzI�@$W���@&I�	�@'�6r >@)�KH� @+�*�[�@-�{�
@/��r��@0���Ɛ@1�2�܁@3���@4,����@5L� �rt@6r}�
�@7��V�NX@8�;�s��@: �֮&�@;:z;[ob@<x� ˴@=���&c@?�	s��@@($P�ko@@И�]9@A{D K>�@B(#P@B�dhk�@C�,��6�@D;Rx#�@D��q��@E���j�n@F`̡��@G�ŗۂ@G��4�6�@H��VPE@IX3���e@J�8O1@J������@K�ݎ��8@Ll�U�kR@M6�#B@N=:(��@N�� �@O��bV�@@P6Ps1�@P�(؁        ?�<;~�?ůQ�(e�?��=1z�?�t�̠�?햒��?���<�w�?�ؕ&Ȉ�@ߜ���@A	�)�@ff5�@��ݿ@��Lj@���9�k@����U@E&0X!"@�K���@!�~h��@#��pD{t@%4����@'��:��@)���_��@+�^��y@-��`3@0$���Oj@1Q�^���@2��O�p@3år�5@5s���@6T�J��@7�O6�_8@9�h��_@:cK��q@;˶j��@=:�h8)�@>�ǔ��7@@����@@��U@A��� �@Bdw���@C/V����@C�@�~��@D�)�(�@E�Ƭ�C@Fx�j�Z@GRhP�K@H.�ǈ&�@I	����@I��0Շn@Jԗ�$��@K�ߖ��@L�ğio�@M�=I"k�@N�A�W��@Or�,���@P3h�\�D@P����C	@Q+�V�|@Q��l ��@R'��W��@R����	v@S(�Ő�@S�>��y@T.�R�        ?��gA{B?�mK�T?֎�h��?�Oj�ɥ�?�a',?�?���16��?���ApI�@�9�c�@�T��@
��vS@��;���@���#�@��*�C�@��n�8�@�[��@s��j1�@!����@#_=��U�@%Mǚ���@'N&>ԙ�@)_۶���@+�o)�]�@-�m�W9@/�o�@1%��qJ@2V��r4@3���6[@4��oغ�@6��ʉ@7c��F5@8��!�6@:�`���@;w� @<��D]i�@>O\ͻ��@?�fft�@@�5�́@Aa�yJ�q@B%�g4�)@B���:@C��&��@D������@ESD���|@F%��.G�@F�1sH�@G�E�P��@H�!�H�@I�k羳p@Jke�[A@KM�OIl�@L2��<@O@M\���5@N7Ą�a@N�p�7�@O�����@Pg�0�@P�vL�@Q\�m+�@Q��n�"9@RT�2�T�@RҢ\�)N@SQ�zt�@SѠy�b�        ?��"�?�����?��jW���?�̗����?��f��@*+_���@
�ȓ7?@KII�@�:w�{�@'[ 3r@&hz@"?.�Ǡk@%��<��@(١��.@+:`h} @.��Q+f�@0�*k��i@2��x��B@4�&��O�@6�3N�x@8x��O�=@:~�޴�-@<���\D8@>���μm@@s�_V�@A���ȸ�@B��xcT�@C�KўQ@E�?^#�@FOH�:R@G��κ��@H���qO�@J��ǣ@Kk�[k�@L��J)�@N���'�@O{�a�?@PpyJ7��@Q%�j֤�@Q�n�N�@R��<^�@STW�v�C@Tl�3R@T��,}%@U����-@V^��{�@W&���/�@W�e���@X�	K*6D@Y��]� @Z]�I�$@[0���u�@\��?�@\�tD�@]�^w݀@^�9a5,�@_l��J�C@`%�@�1@`��4�@a=Q�$�@ayL��@a�>]!��@b`�O8�