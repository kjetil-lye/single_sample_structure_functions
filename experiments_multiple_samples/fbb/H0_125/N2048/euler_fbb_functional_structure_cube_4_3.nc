CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T105143        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py           �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml          �<?xml version="1.0" ?>
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
          <value>0.125</value>
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
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�.l?���l-��?�W��?��|5N,W?�&l��:?�[uH�@)Lܨ@2���3�@�p��o�@l�Y��@�g�/'�@ ĝ5U�@#�8��$
@'�T�p�@+P�܁@/p
w"H@1�9�>^@4NqF���@6���`�@9��d�@<^�lR�@?`rB���@AE��,G�@B�����@D�'�b�L@F�QZ>dr@Hs���$)@Jv�O�&�@L��7d�@N�����@P�$�Ŋ@Q���f�@R���`a@T8F�ZB�@U�f�x8J@V�"�8*�@XTh���.@Y�#�{��@[K<#�QO@\טs�#�@^o$�S��@`����`@`��k=�@a�_�+��@b����Ѥ@c���okE@dt���@eik^m�r@fd�m�Z[@gfd8�@ho9�Gr@i(��@j�PF{K@k��|���@l���1SC@n?2)�j@o=flbn�@p=*�a��@pߙV<@q�E���@r0�R���@r߇��>�@s�~�� �        ?��b3"�?�'�P��{?�5.f�+?�-���s?�WSg��8@5�i�%u@,���@'����@ A]�@'�;�@0?�<V_@5�����>@<��5X=�@B�Ŏn�h@G�L�P��@N
�I�@R�QG~Dc@V�Z��@[��
�@`�ݚ���@cᶤױ�@gr;���@kn����%@oܱ$fK@raDOz7@u��_�@x��R@{=Hmjٶ@~�1�cb�@�A��	@�J=.��:@�z*��@����w� @�Ry�^��@���׿��@���QYK@�iO�E{�@���T�@��KLг�@�q�D@��@�M�k?�@�A���@�NU˷�$@�sf���@�X�=�H7@��ZY�E@���NI�!@��倘�@�S�:��@����.s8@��mߜY@����$e�@�5��:b@������@�O/��@��]�]{�@��"��g�@���y7�@�����\@��c�RR�@�� ����@���Р��@����+ր        ?���A�?���O��|?�o bM?���m?�H)4�?���פ�@E05���@R^���@�i^!d@!Gp9�I�@'tK�J��@/(�Iq1�@4N�p)�;@:�"���@@j��[@Dl��3�@Iy��@Nr&�x�@RE��Έ@U���yj@Y�L~w�@]ί+��@a>3��1@c��YF@@f���f=n@i��OI2@lĊ��~�@p댃3@q��=o_�@s�K�~��@u�f,��i@x	��}4@zJͦD�N@|��lFB@8�il@��jni�.@�/h�]�.@��$A
Ks@���ZG�@��i�P8@�B���@��x���@�[�ل��@�2�dd3@��� ��3@�X#�R[
@�J"���@�C�����@�D�%��@�MpJ��Z@�^�]�@�vՓ�c@���$T�r@��_׹�@��͑��@�-A_�@�p��?�@���a�@�/��#�@�8n�}g@��{c��@��Og� @�b�<;M�        @UMw���@0C 2�W@H��jw��@Y��7��@fi���@qL�����@x�.��h�@����ka@���cI�X@�ݑ�	��@�HX�#1@������@�=f��|t@���K���@�~��'�@�I���U�@�TWG MD@��8W	�@�+���i(@��+p�MP@��p@�0�V:�@�|�%�t@��:�f.I@�{s�F��@�-�n��x@� �G�è@�{�b���@�O-g�@ţ�RI,�@�P]�m�@�8B<@��Ɓ[�@̸���T@Υ�zb@�P�&x�s@�V�����@�d�0�ȑ@�z4'�@ԗ,ɠ��@ջ�4;��@��H�2�R@�x�n�@�X��yv@ڜ��L��@��:�;P@�>9�7��@ޜ
��2�@�|�NZ@๤���@�v���`�@�8���	@���-��@�˻e�@�H�8�@�tX���U@�Q�~9@�3�4�@�c�/ �@�Z��~@� ǔ+s�@���6���@��K(W��        ?vO��s"?�����3�?���5C8?�>Bg�?�[^}���?��'�l?��� h&?��Jo�&@L]�r�@�B�k@�%n���@��MLC�@#��#��@�=���@!���HUL@$k��>V@'�
�|�x@*�׾�B�@.�.���@17IѪ[@3Q�M[F-@5�G��~@7���F�3@:���Q��@=T���g@@ us��@A����P@CNW�	�@E*��8@F�\Ti�@H�s�X�~@J���ں�@L���{٦@O��V@P��3G�i@Q��|�@S"z(���@Tpp�Sy\@U�6��@W6�uE@X�uZh�b@Z5�����@[ˇ�@]p�Ku��@_%:l��@`t�k��w@a^eg�@bP��d@cI��#�@dKVe�x�@eU9�;�@fgkLQN�@g��5�7`@h��c�?@i���T@ku�8I@l?D�c-�@m�x� ��@n�'��S@p��x�@p��B��@@qt��q@r,����@        ?h���?����d�?��ߓ��?�]ž�R?���'0?�;k �?�C��	�@�&�@1[P�/~@��>�j@�쇘��@%C�R�2�@+�&Rڰ�@1煞N��@6���P�@<+$吕@A7f8�@D֩�)�'@H��@M�Y�^�9@QY��;W@T3v�5c@WW1BHWO@Zǖ1=�@^�2��[4@aLCa�Z@c1��@@e��0x@hg�hs'�@k AB{�@n�F���@p���Jc@r4D5D��@s�+��4c@u�]�I@w�v'�v�@y��{�@{�b~�LD@~9
��R@�M��4��@���O@��	&��@�;�^P�h@����@6@�('�@����ٖJ@�V˳ܭ@�nxj8�@��%�JW@�����h@��u7G��@��I¾4�@��fI�3�@������@����ɯ@�	�?7��@�5@�*�@�jb���@����8A@��Ԗ�7�@�F(�-.@����`��@�Z�s�        ?c�>3_�?�����^�?��~֧6�?��tJ�?�g�FVRj?��Ҷ�?�8dy|��?�Y�&���@P�֞�@A�A6�@ʓ���@""��W]@(�����@0Zĸ��X@5D��Q�@;)&���@A�j��>@E~�N:U@I�So)@O)���{@R�ߍ<�@V84���@YϬ�Y-�@^�jȉ�@aR5VǼ�@c���
�\@f�;�S�@i�~�}2@l��3�@p*��e@r	2sr�@t�l U@v)���@xlӝjhF@z�^���@}\���i~@�l��?@�n��-��@��,@��@�y�G�@���a@�ώ��@���q��@�s��X@�cz���@�gLz)@����-�@���Ϡ@���IF*@�!��'�@�W!��@���;8x@��7�C@�7�J�@��{<Y@�ӑ;�@�wa�S�@���5bO-@�Ar#N@�mZ��@���x'�@�����O�@����$B�        ?�HP�@@M�F��@0%��R��@B<'J���@P��R�D�@Z�Zr���@c����O@k4j4ė�@r�,2?!@w.��h�@}���b�@��Ds1S@�ms�"lr@�v��3��@���B�@�_�5�@� �[��N@��;L9J�@�홄2��@�=᧠�2@�g3TIE@�Q>�*�@�^z���@���b��@��'3�:@�a��1@�5���(@�f�@��@�� �! U@�m�l��@����@����ͫ�@��"���@�~�r���@�{�4��w@��>��� @�^J��@���=�X@¯�H1��@����Q@�4�Ł6n@Ƌx���@��}�C�@�b�;�I@��>
:Ҹ@�r'P��@�V$�U@Ϻ�[zM@кL�:n@ўXz�&@҉��[�@�{���@�u2�;p@�u�=yn@�|��-�0@׋]����@ؠ�@Ϙ=@ٽ�S��@��J���@�
��Er�@�;� ���@�t��ڿ@߳-�YO        ?�H���?�Y�����?��K�`^�?�ǆk��]?�*젩TM@ �͘.@X�E��@��0@�i/�o�@�N+�;@!3"�p�@$����@(�dz�@-9���W@11sQ��@3�Ҝ���@6gYj6S�@9d5�z��@<�Վ�Pb@?���y�R@AƎA��@C�ϒ��@E�D��0�@G�D6?@I�Y�~�o@LHD��1�@N��}�[@P�o%Y�@Q�Vޛ$@SIk��@T�<��@V/���@W��e��@YM4dy@Z��#c�@\�1�65b@^ex��@`��ە@a�_�װ@a��];gV@b����@�@c��%t�@eSO�@fߠC9�@g7���@hXlt�
@i�dJ�P&@j�~?yy:@k��U -�@m#3<���@ngߔħ@o��,�Z@p��u�+�@q0�mq�"@q�}�X�@r�I+�K�@sN���0�@t
��7�@t�T���@u�с���@vU^��@w �=��@w����        ?w��g*�k?�ʰda�?���lE?��O��??�?=?��?��qN�w�@��z���@[��c��@�[/-%@��18\�@#�����@)�BҶ�Y@0����,�@5�en�@;M�Oa�_@@���@@D�tou@v@I(��d^@N"���4�@Q��K�@U ���6@Xz)!v�Q@\O*�iB@`Ah*̺O@b���@e� <֟@g�� � @j���P��@m��a^f�@p�N�@rJz]��@t,{z@6�@v+��s�G@xI�AD�@z���5@|�&�e@]���FF@��C�A��@�\x�L9@���7�o�@�N���rj@��C<U�H@����B�@�@H#n��@�T�x@���0�@��$n�@��(q��@����|��@�Rdx�@�4	�b@�^�Po�@����/@��q�ا@�'��@�q7 yg�@�ϥ��v@�8t[���@���l���@��bn��@�؋����@���|�r0@�o�[��e        ?��*?�L�?�T����|?�y���@?�<fs��?���MW�e@�Ғ��@x9́�@���@�NI�j�@"����E@(��jS@/��b�?@3� :���@8����`q@>
��a@B+P�� @E�I�5��@Iζ �t@NZ�Cv�@Q�D�3w@T�+��<@W�8��@[l��M�@^���E��@a\�3���@c���f�@e⣬^o@hhA��'@k9F�I@m���@p�Gy���@r+�S�@s�y@u�f�ҁ@w���؟�@y��v ��@{���x1@~!��ֶ@�@8b��@�~"�k�@���^�@�&`�z��@��3���@�|I���@��v����@�/]wD��@��h�R	�@��ͭ�{@�^����q@��2�dwp@��ygp��@��G��{@����Dix@��ϓ�]�@�²;9�@��oK6��@��{%a@�BǸ���@��� Y�@��nR��@��<��@�l�(�;@�Μ�y�        @	��<��@6h�c�x@Q�Xc�ET@b艣��@p�F��F@y���p8@�c�l	�@��&�@�*��R=a@�[t�{�]@�ϰ$��@� R���@��K���@�� i�E@���Y��@�����z@�C�Y��@��E��]�@��8 ��@��ա�"�@�#A�Iŗ@���p:m@���f�5@������@�;C��м@«IWta@�*�g�	�@Ź��@�Yl�ȹ@�?�ۤ�@����:��@̗�
�[�@�x����h@�5Q @�6"���:@�?��+@S@�Q�m}Z�@�l<˶�@Վ�t�B�@ֺY�!��@��JXy�;@�*���@�o�şc�@۽�ĸ��@��x��@�s��^�@��� ?�G@९�H9@�bW��)I@�#h���@���#�1�@���Y�@�3BSē@�T�M�.@�+G'7�o@���*�n@��&���@�����V�@��:�5;@�VƩ��@�V(}�g@�Ӫ���@�ӂ�w\        ?�F���?���#���?�Z�N"�a?�8;�X�?�.5���?�*�Ψ<?�M�n��@X6��@�+4u&�@9���S@��*�'@��s�z�@���^�@ VJ���l@#!�1�@&.���{7@)ym�yb@-��o+@0zdձ%�@2�����@4��Q�b�@7,��h�@9�LZ���@<iB�
� @?E���	#@A&K}���@B�5R}�y@Dm��;S@F2�E�]�@H��V@I���͗@L�2��@N$����@P,vq���@QQ�z��@R���E�@S�"�_�i@UEn.��@V[>G��@W�/��\@Y&��9�@Z��H���@\"7W	��@]��]��@_M7@jMQ@`z[�#�@aT$]xi�@b3�D�'@c���@dct6y@d��E-ox@e��+@fꫯtf@g��E��@h���ɠ�@j,�C�@k�3IUA@l-Dqs@mKC�d�@nn�T�.@o�?
4��@pc���"@p�&:Q!�        ?f���y�t?��οRN�?�y��e��?��v���?���x�(�?��^;?����y@�YN�GX@hT0Wj�@�p4�-�@!ޟLGK@)���@1M��10@6�ZT B$@=R�z�7�@B�Ԍ|n�@GY��[5�@L����b�@Q{�ID��@T����@X� �@�@]TK�l~@a�t��@c�E���@f���@i��=��@mh���
@p�o`Z�@r��w?�(@t��'�C�@w!}d��8@y��YQ^�@|F�4��@�"��c@�
���@���7{�~@�K�A>�@�O�{R@���@ؑm@�����iS@����8�$@��z�E@����N�@�FMR�/�@�{C��X@��u$�#@�	��U�@�c�T��@��rH_�@�;�q���@���$�~�@�D9!U�@���dy�@�}b?�@����}�@�s`X{�g@�V�]-,�@�@��{�@�/D���K@�$q0�]@�����d@� joK��@�'#�&s        ?x{�����?��_}��?�QN۞�?����&w�?�W�j�?�"?��Oy?�_ȩ��@\`3@"x �5?@�LҶ<@"6P��@(ʵ�	@:@0��\(�@5��,8nN@;����@Af��q�@E��^`�@J�k{4�@Pɠ�	@SB��jus@V�F���@Z�E�W1�@_V��+��@b!{4N�a@dԾ*��@g�(e���@j���|@nqR�@��@qw�-�@s�Rd;g@u=e�U�f@w�m�0i�@y���Z�E@|�e6^��@S;j`��@�����@���i-�@�H7> ��@�����_@�ɻ5��@���߻�/@���bQH@���.��@��^�O�@���r
J@�@mK-�@�z��D�\@���e)@�N�ޕ�@�w�<��0@��.A<�@�b
�-��@��Jȉ�v@����#}@�&7ਡ:@�l j���@�K���<�@�26V2DL@���a}D@����@���m��@�Q~�$1@���        ?��P���@��'��@4�J���@FF Q�5g@S�	c��@^����"�@e�k�<@nD��2�@s�r��I�@y�b0@8R��T�@����|@��[!�@�6�����@��Df�a@��P����@�g�����@�}��Z��@�ֻJ{�@�tI�١3@��@w��L@�9<�L@���.2��@�]ٷ({@��ʖ�a�@���L''@�0�d S�@������z@�<F��M�@�޴-Q�@��9t���@�\�aK(@�8��"��@�'�VTu�@�*cgA�;@� h����@�5��9��@�U�d��@�~��f�@Ĳ9%�
E@�����;@�7��|@ȉQ�@�����|�@�J%�x�r@̹Bg�B�@�2���b@ϴ�����@РlS`�p@�k>
p°@�:���v�@���N@��hoi[Z@�Ă,H@զi��@֌/?O�@�v��Y@�e~F�9�@�X�ؓ��@�P�4�	�@�L�4��\@�M�x���@�S���        ?�����?��n�?��F`Wh?�T��#?�h�z��?�����4@E���@	ձ:�@ѩ�>��@?~9^�P@5ߏ=OU@�����t@"��h&@&/�N݇�@)�ȯ�X@-��8f��@0�\�e�@3k2��0@5}ʩ:�@8آē�@:��s|�Z@=|[{�،@@9�f�=�@A��'�#@Ck��<�@E";Ж@�@F�θ��@H����@J�uK9@L�!�2@N�U�GB@P����m@Q�wRp�]@R�گ�@T�9��k@UT�D@V��H�)�@W��q��@Ya�Y��@Z����l�@\M�M�@]��X�@_h��&�@`�2w@aZ[E��#@b6�+�4@c␠ @d\^���@d�S��KD@e��2�B@f���W@g��G�@h��]��@j;,��u@k���"@l8��Y'@m\���)@n�}n�.�@o�y���@px��kc@qs����@q���ޟ�@rbiR>�d        ?d�SgZ��?��C!�c�?��jh��?�<���V�?�Tww�'y?��
��V<?�A�+3�@�	�![@_,d
�@X�}l�@   �ŋY@%�x���a@,��Ȁ�@2mv�@7bQU�t�@=;����Y@BS�@E����@Jy�Y9��@O�q��?@R����*�@U�.�X�@Yu���L@]f�)[�@`��Y]+@c;��%i@eΙ�=��@h���+�@k�<��f\@n�t3�b�@q*��~W�@st`�@ulw�{,@w"�&�M@yb�l�Os@{�!WV�@~MoB�i@�|�}��@@��T!rO�@�c_<R7@����Γ�@����}?�@�V���J@�(G�:1@���-l@��2"��@�"�Q J@�,?YG�@�P��Ths@��V ?�S@���Q�!�@��{�N@�f7��@��=E	Ye@�Bu���@����v��@�W��]�f@�����@�T<J�@h@�3�mH&@�����]@�
=m�@�:b�!�        ?oQ��P?��[�#�?���m`?��s��?�P잁�?5f?��XZ��i@A�� f�@U�$��@���@�*ޅ�A@"�����	@(W���K�@/UGݚ'@3�S`o�@8�q@��@>do�`�@Bvʊ5D�@F0��"(s@Jhwt!G�@O%���@R7�M!�@U%\��@Xa��@[�j3B��@_��K��E@b�#)�@dL1��P@f�&/tE}@il�w��)@lG.���@oU$Jq@qK�%w��@s��@t��>��@v��C���@x�ﰵVU@{λ���@}f#kaJ@Ӓ���@�0a,}yr@��-&Y�@���N@�f�"�e�@��>�I��@��a����@�8�;.@����@��~�b��@��	��R@�Ԉsy7_@������@��xEI@�/^�6@�+A��S�@�Z�<���@��@V@���Q9}_@�)�6�\@���[�'�@����ׅ�@�\:�@��ɔ��K        ?�z�w���@#�牐i@=q�xI��@OD�7�'�@[�G�W�@e�Բ��@oh�����@u�P�3�@|_ö�@�:��@��
��2X@�nl�Z�@�rS�$O@�s��
'�@��mH��a@�P�{�C@�0	Be\\@�.q*�i@�l�4���@�����@�ek&'@�"�i4�@� �J�@���n�q,@�2䣦G�@��Ε���@��ɘ��#@��F��@@����J@�ɢKc@� �m�V@�(�4�0�@�_:/Ϸ@¢а̬I@��sLJ�[@�T��@����R@�=���,@������&@�`r���@�����@ν�����@�A8��x�@�+I�58J@���9@���5?�@������@�"m��&�@�4�IuTz@�O�(Z5@�q�$��@ٝW�=�@��9v��@����d@�R��e�S@ޠ@`�8@���'(�@વ�m��@�^�#���@��n�@��C���@�=q�L@�Y���o        ?yӴV�?�����2?�󮼵�?ҳ��
��?��	�+��?���ib�?�mt�?�V����@*�خ�q@b׆�-@]����@@��Џ@��6�x@"Bͩ�@Ց���@" i"�� @$��D;u�@'�X��Nm@+9u��R@.�DfV�P@1R�mR�@3`�4M�@5�.6T@7��:�@:\&��&@<����@?�-6�$�@AP7^p|@B�U�Q�o@Drn+�r@F"(U�@G�ʛ��@I��P��t@K�T�D?`@M�Z�/s%@Oր]?�S@Q���@R-��!I@S`>���`@T�6L\@U�����@WGB� Ӷ@X�o
�"<@Z%����}@[��/�_�@]>	�,(�@^�M�~�3@`H�V!@a)��>@b$��6@c ��B@c���!�R@d�d�Ԑ)@f K�=��@gn:�sx@h(���c+@iI�G�@js �n@�@k����'V@l޵7g�@n!�K�I@ok�fl�@p_R�'(,        ?w�u�?�C�R�Z?�4���?��u!32?�v�Sd3�?�ɜM�H?�{���Z�@eƚ�@4%��@q��1L\@ �U�0�@&�M��"�@.P^WA@3q�ZF@8ǲ	�P]@? !�-�@CJ��h�<@G��L�.&@L�3��@Q)���|_@Td�^��]@X�Ai%�@\��P�H@`M�d�ْ@b�'�r{@e�&Ȯ�k@h�a����@k�~�t�@o\1��@q�gP��@s�%���@u��έ�@xG2��B�@z�@v�`@}�)�
,�@�9�ՕKj@��n���@�f[`0�L@�!Z��i@���ʸ�@���]�@��+C���@�����@�R-�م�@�׵쳩�@�M��@�aQJ兂@���~Z�@�(5}�>@��oz0v@�.��?@��� ��@�x"�.@�6u�V�@�.|��!@�����9@��aYZ7@��L��X@����C�@���/�@�3��X�@�]8��S�@���[�q        ?o��WR�?�8r�}y?�<�X�R�?Ԯp��8�?� O���?��^T}&@�U� @��L#%@�{_3�@t��x�@%<����@,��� E@3���pm@8��oOC�@?<œ

�@C�;��8�@H�ةU@M&��4�@Q|%r"�@T�%��o�@X_����@\`�>}�@`b���t@b�a8�|=@eb�EO@h1"m��@k6��U�@ns� -��@p��ø��@r�I�D�@t��]���@v��ˎ�@y���T�@{XS�f�@}�t��)>@�-t��ؖ@���x�}�@��q�4�@�k1�0�p@��gqȌ@��}:��&@�C�����@��\�v,@���(s�@��߽5ż@�[_�?�w@�aow�x@�qF��b@��
$+��@������@����t��@�&�%�@�W�ՋP�@��vȼ�@������`@�_��"�D@��MtnZ�@�E�m�^E@�dԚ���@�,Ig�@��]����@��dX�@�����p�        ?�Q���@��� P@3���~@E�dV2@S�G�|:�@_P��ۡ@f��,yN@o��V���@t�� �@z���%dE@���[\�C@�m���q@��U/�@�'��FyZ@�L����@�Շ����@��4N���@��Af�@��r^��@��
�D�/@���@��@�����}j@��#�@�c�9@�퐻eY�@��P��[@����V@�8D[�@��t1+�L@�q:]-�@�,��A@����nC@��I��@��K�t@��}� ��@����x��@���dd�@��'K�@�݋��@�^��ƀ�@Ʋb��@��@�!�@Ƀ_'3ݙ@�-���@̍�崞�@�(��t@��P$�C�@�Ɔ�ra5@ѫ'ܒ�@җ�_��3@ӌ
wG�@Ԉr�6@Ռ���!@֙�2�M@׮I��5t@��KI�ju@���j��@�
���@�S��͆A@ݑ���E�@�׃�%5�@����]�@ྲྀ��p�        ?����n]�?��2�o�?܀R{:�?�e�@q?�[�_� @����B�@�[�_��@�Q��
@F~7޶�@#n?fk@(O���pR@-˝6��o@1�U�� �@5N�r���@8�l{��u@<�tF^��@@��gz�>@B�WT"B�@Eot�� @H��Ci@J�1�1 @M�೿�@Pv"�<@R[2qw@S�Ӏ��@U���Ÿ�@Wv M�?�@Yh�ؙ@[p�7�@]�(���p@_����F�@a�O�n@b1$�M�@ci�n��@d�~"���@e���S�@gT��TП@h�7��S@j&np�@k�D��&o@m �K�@n���,@p!�8=�@p����`@q�[џ�@r�����@s��X�`@td�"�O@uMD��X�@v:��
(�@w,S�.��@x"��'��@y�#��@z�lf�@{GA��@|&�Cb�@}2W��[n@~B~�M*@W��}�@�7����,@�Ƴe��@�W�3�I@���+/w)        ?�1F��{?�.X/g?��bϤ�[@�����@
K��Fn@�n�_�f@#=�`ƾ�@+	�����@2=�o#�@7܊���v@>y����@C�հG@G�oA�\@L��~ֽ�@Q,�.�@TkErE�@X�uG�D@\�P_��@`K��R@bý؟q@ey�@hp7.�p�@k�_&�@o&�&<��@qvE��<@s}`^Ye)@u�����,@w���L�$@zz�ף�)@}�?��@@�RE:@�t	�2�@��L�!�@��7��{@�n(�@�D*�i@�0��w�@�5dQ�%@�Q����@�B�1���@�i8ij�@���0�ّ@��c��4@�&��8�@����2�@��8}�uv@�W�쮂i@�׷�f�0@�d�nO�^@��T�]~�@��N�՛5@��n��@���s�_@�x�
�\�@�hc�G@�^�_?yy@�\OI�
@�`�%��@�l�B�x�@�yZ�D]@���xՠ@������@���3�J        ?�������?�I�?Ш�T�]&?��SC��?��%����@ ,�`K��@	��72�@c/�A@��ۆ;@#���g=@*��O`h
@1��@��@7`�����@=�C�f �@B��D���@G|çь@L�:>U@Qn���@T�"�Ru@X�3�)_@]���@`��Z��M@c��	��@fh��J4�@i��|6�i@l��П�@pH�Ay��@r>�Y]��@tX��?lc@v�"�gT@x�eV�@{�T��w@~8��~p@��<�3@��(�@��/��q�@�S�"C�@������@��ɨrV�@���sS@����-�@�ΗDU@����X�@��ϔ{@��+��@�V��@�����x@�
ҩ*@*@�yR�vi@����~�W@�~�7��=@��/���@���g@�7ӏ�@��i%�@��h�S�8@��?�t�Z@��LA�ǘ@���ds�@��D��H@��Q9��@��/F�O@� �n'�!        @
��-W@<��9:@W_v"�[C@j��TX@wlMdݩ@��qޔ�@�:F"U@��u��My@�p7h�X�@�)g����@�^v�C�@������@�>��t��@�������@�p��>��@�o:�, �@��a$��@�{-c�@�a���$@�TeZ�<@�c�����@ƐFfL�@��{2��B@�?s��}@��< ��@�1%��@я���a@��®ڰt@�x��g�i@�-{=�@ל0_�I�@�CӐ2R@����~DR@ܾ�ŀ@ޑ�����@�9�o�>�@�1T�"�@�0N��H@�5�F�L@�B,��_�@�U+��@�n��WR@�^$���@�B�o��@��!��@���-�u@�I"{F�7@���X�@��6���@��h�#@�/R�[3@�W	�&YT@�[��j�@�8+>@�`0�k��@���i3@��_���]@�~q<Q8�@�7֫�@��ؤ�@����zdk@�rBɧ�@�5C��fl        ?�%I�΂{?�B����l?�	G��g?�O"�t�@�?)�Y�@�r
�@�b��ҷ@O+^�d@"�� ��@'u��Ñ@-upD��@1��Q�A@4�L��@8����
@<����@@�1�F��@B�%�}G�@E^S�y!@H�S[x@J���]l@M�y�J4@P��M��-@RL}�ʆJ@T�����@V �|�@W�r�4P�@Zv��"�@\?TN{��@^��٬6�@`mI��+�@a�����@b�$�$�@d4<q�@e�Ֆfx@f��J��%@hY�=��@i�B�=�@kP�W���@l�*Vd?@no��d�@p/�>��@pۑ=��@q���]�@r�n��<@sv�;hT@t^���@uK����@v=iof@w3u�@x-��R7�@y,٘���@z0���@{7�7L֡@|C��K�}@}S��u>B@~h\Xވ�@�di!��@�Om�6�@��a!���@�s��,�@��{-Q9@��|o�Iz@�::C�A        ?tI�`�?�4�q��?��+�L?�r��?��Io5?�����A@�b����@�Q��n@L�w�@!��M���@)�r��d@1�<r�5�@8Ö�*�@?��&���@Dk�P��@Iծ��@P�*��x@S�GEaP@WΛ��!�@\nd�m��@`�%T�.@c���/�s@f��'w�:@j!�Y�@m�*ǖ��@p��;P�}@r�9b�P�@u;q�]�@w���5� @z'��՝�@|�0���@�F�Jo�@�M����@�ے�ڂ6@�|����@�0륐0T@��\@��~���N@��v_�P@��l��Ѽ@���
4R�@�}�:-�@�0.W�<@�_#����@���ڱ�s@��m+���@�0�k�$@��;~q��@��M
���@�lF��+@��@��`�@�zT�n�@�	���@�܄u���@��YSH8�@��D���@�y>���@�d?�6/@�U>�f5@�L2��A�@�I�C�@�K�샦@�T����        ?���\+�j?��g�q�?�����J?���~Q�@��(m@Q��<��@�Z�kE�@��Ӱ��@%�3b�*T@,o�ZZ9F@2VtN���@7@h�TR�@=���@A�0�Kk^@E�ګR�@JM�B@O`����:@R��8!&@U�����F@Y@Fp�$�@]!��ʩ@`��T{�.@c �5۴�@e�[�m1Y@h3�R��@k�rz�1@n/���@p�@��=�@ry���N@tOjI��X@v=`0�Q@xC�E"�@z`@l��w@|��u�,@~��Vƞ�@���7<��@��0�9@�(^7��@�}u�}�5@�ލp2�k@�K�s|��@��<��Su@�K%���@�ݴX��@�}#bF��@�)�yOX�@�q՟��0@�U�=p7�@�@��k��@�2�_&9�@�+�� ܦ@�,��E�f@�5�T�0I@�F:MG�@�^�1}D-@���!��@����[$�@�ڸ=)@�&
�8r@�X`9�K�@���K"i!@�|����@�, ?��=        @w	�p�@G!%N�p�@a{'����@r_�D-@���k@�g�v�	@�^�D�@�n�����@�`�t��@��G���@�r��̷@�8@���@���]s�@���Ͽ,R@��"fG�@������@�<��&D@�sa��@�er�!/@�s���@Ơ���K�@��r�I�@�T�|ܯ@�����}@�@�P=�@Ѡin�(�@�iy)�D@ԉ����@��O�\�@ץ�cJ}J@�E�8y�:@��h&���@ܨ2�h[@�iޕ}K@���&@��N��@��1Y,@����k@��HX+o@��ĄS2d@��ϣV=@���ZOk0@�
X*z@�����@�:�PJ �@�Z�환@�����@���R*O@��!����@��	G@�[�g@�By��U6@��9�۶@���.�@�.��e,@��k설�@��& +�@�0��1@����O�@��_ϥ�@�Hl��F@���a��o@���A�-        ?�@�Oi��?�1c��;?��6�
�4?��^G��?�� B�?���{�?�x�t$�N@�:w�j(@	,��@�υ�W@$ȭ��@���-?�@�ʻ�	@!�K�Y�@$��0���@(K��� E@,Ñ\r�@0����!@2@M#ەY@4�X܃�K@7.C�Q@9�l���@<֑�Qj@?�I�1@A�7��z@Cb/q~��@E=3.�U+@G2���@IC9�Q�@Ko:�@M���Ý�@P$�v�@QM-Dm�A@R��<�pG@S��`���@Ud"ڣ/@Vޤ�6!�@Xh.Vf@Z ܘ��@[��s�eK@]_��M�@_&�JBz@`}��qLl@ao��-R/@bi=Z�q�@cj	~��@dr�l��@e�l�(+C@f���e�@g��s�GY@hڣ1v~\@j��΁@k:1	�.@lt�S��^@m�6!0GT@n����@p'��ٗ�@pӝ���@q�m)� @r7+�<k�@r���5k�@s���0��@tjV�B�        ?q)H�*?�e�c��?��	��??�RKj'w�?���/�%?�ϴ�m�?�?���t�@ ��ȉ�]@�*sà�@��y��@�K9Ձ@ ����@%���+��@,}���J�@2���@6������@;�����7@A
��Կ4@D�4=B��@Ht�����@L߂&�m�@P��?��@S��C�b@V������@Y���c@]����9�@`��m9@b���7@e5@~/�@g�� G�@jb��B�N@mCn�,�@p+�	�@q�^/[��@s�E�9�@ulO "#�@weMN|=@y|� ��@{�|n-��@~WH�Jv@�=�#���@������@���|��@�Q�Wz�x@���xĩ�@�a�92��@��W:A	@��G8!3�@��
ah�G@�_6��޲@�'��~w;@�)�P��@�5��2$@�L���X�@�n8�@�@��M���@��x3��@���Յ@�aq(bT9@���� �V@�|�8L�@��Ax�yM@����Y        ?{��p�1?��K�ya>?ª4���?տ{G�|?���ʯ.?��rA#Z�?�K�)Ԃ�@2{�t0�@yL�C0@37M� �@�|pF1�@#]kSc@(�=œ"�@/y$ys�@3��X�@8�'�ʌ�@>��`�@B.N��--@E��j��n@I�ΔU@N����S?@QܕXh �@T��媜2@W�#f{h@[t}�@_P-�N�@aË�?*@d�O�/@f�>�&�i@i;xi�ND@l!Gz�@o>��7f$@qJ���9�@s.B���@t�R<5k�@wC��&@y,���X@{wm�8h�@}���!�@�:���C@��%�!�7@�\suD@���J��E@�vm��@��1"�"@�zAPm�@�K�E�@�0��<�@�,m�"@����p�j@����ź@�ѾƵUt@��H�d!@�2l^��@�tO_���@��a�D@�ԝ�
�@����g��@���B�D�@�r9�eǖ@�����"@�J>�a�@�A0`�x        ?�v��=�@ �f���@@9���WV6@K�vAK�@Xe���̥@c*�u�@k� �C@r�<~��@x�M.�>@�H{)p<@��81��J@�%*�N@�A���@�0Ŭ�{<@�$S�b�@�^r�L@���:�֘@��]i���@�g���@��䜓�@����|�@��D��@�B	�V:�@�%:8���@����7�@�:z->@"@��6M�@��44!{!@��Hn�<@@��j���@��	�zA@������@�$&�m�#@�Xϓd\�@��Yx@��|�:�@�G��֦S@Ʋ��I��@�+K����@ɱ��b1�@�E��Y1@�籃�g@Η$�n4E@�*����@�J]��@��7��4@��Ѕѩ�@��_���@���B��@��.�ұ@�����{�@�����@�)��~�@�J5`0�K@�r��ٰ@ܠ�����@����Y@�l�Z@�@�*��@�@���!�@�x��Z@�%�2:�@��Л�I�        ?mc)���?�ؾ�6��?�X>O.�[?�ł5kA?�������?�5G�nR�?�%�E�Ť?�)z�o��?�i�u*@p]���@M�q�@�d�{t@����@�����w@�%LlH�@�L��ff@ �.க�@#I>`Ç@%�Ȼe@(�0Zh,0@,�o��@/n@����@1��]��i@3o��@5yE�:Y	@7�w���@9��'��@<\;-&҇@>�|�� @@���L��@B@�N�9,@C�8��R@EZ�wwi�@G8Qh|@Hɕ�/r@J��K�n@L�
�b�4@N��+�H@PY���h�@Qs�>M@R����.�@S�e4�?@U	��C@VRҷؚ�@W���֪M@Y
�K�T@Zy[x��@[�Ba�a@]{�3��c@_K��{@`W��c[�@a-Ʈ�&�@b
N��@b�o�'��@c�`tx�@d�$�ۊ@e���@f��:&@g��)���@h�D^^@@iҦ�D�@j��&�@l<s�        ?Z�ZC�]C?�;��|?�v�:O\�?ǽ�:Dq�?�e ��|?�^6+�I?�����@�	��&@[���m�@���� �@!�E5�D�@)����,@1(z0��@6�ON2ɮ@=�����@C/�G�@H8`��	�@N$�'�\�@R���^@V~e���@[	t�4Ӳ@`I�	\]@b�aEʱ@f=���M@iپ(��@m�"�Lb�@q1���7@s����B@v!'��)�@x�.f+�@|1��p@R�~[��@�mϚx�%@�QGp�R�@�ToB�L�@�w��)%t@���=��@� �z��/@�����j@���+cX�@��E�g�@��u�[@�
YƴpE@���wl72@�LR�\�m@�*�r)�@��TI�?@���O7�@���m�M8@��I]�@��s����@�낊�U)@�~�W\�@�*o1e�@�WV|�� @��4염�@��>l��@�Ɯ'n�@�dhs޵�@��ޅ�@� J��@���ݗ>@�@++NG        ?kd��<�?�+椒�?�N[���?�M���"?����)�}?�+F"�g?�����@9�jZ�x@Q��9@G��@��bg�@#����T@*9Qҍs@0�7Qoxv@5=>��pi@:V�*1�@@���jF@Ch��vȝ@G"�0f#@KJ���<i@O�DSD@R|hM��@UD���J�@XNf^.o@[�g=��@_1�(G)�@a�`�/�8@c�s,~r�@e�kO��@hC�ja'7@jՙRZz�@m���D(7@p?[��.�@q�5�Kt@sp�g@u-�W���@w�X,-^@x�i�%Y�@z���S��@} z�j�Q@^��-��@��P� �)@��=�
@�_j���@�� {��@��;t�P@���N���@�� �w@����"�	@�>聏��@��ʙ�@���#�5@��̛��p@��\�~3@�����:@��o��@��g�R�@��SW�e@��c�٪4@��8���X@���[d,@�*5?�y�@�]^�u��        ?�r�ζ�3@D�Y>"�@(_
����@<y#�K�@J�� n�@U���09@`[4{S��@gH���@n�fZ��@t(t��\@y�i�(�5@��L!��@�RY��@�53im@�����gc@�#��þa@����ƍ@@����_@��vV��@���\��@��R�S?�@��"��A�@���sr3�@��)�`��@�Ot7S!�@�ǈM�a@�dHia�@�`]B�5@��ڇ@�ѐ��@��L�'�@�a�_F@�)��.I@��L�@����v��@�`L��@��|�U�@�5�ۖ�@�_-Mx��@Ô�Sܨ@��y(�-�@�$?��@�~.�Im@��Q�5g�@�V���w@��P���c@�`7[7:�@��a�C�@�Mb�,]r@�%&�� @���>@����@��gV��0@��j��B@յ�����@ֱ3A���@ײ�/�7[@غͲU@���\f@��ԗ�	S@��7v$~@�[n��@�D_P�	�        ?��ڥ�F?��S	F��?Ҁt�׈?��\���?�B����?�r�&v�@�qɐ��@
�v�#�@�O�K?@%<�?*@G����(@ w^�!l�@#��S���@&�Y@/�C@*~��G�@.\�l��@1?W)��@3r�[�6w@5ɼ� �M@8DO�q�A@:�8sA�@=�-ҩ�7@@I���D�@A�OA�Ŭ@Cn�]E�@E5��^&@F��p�1j@H�8����@J�f��@L������@N�S��,@Pz����6@Q��\�m�@R�}Ζ�o@TH%� �@UD�A@�@V�+[�&@W����@YOm�e�@Z�qL
@\9��f@]��b�@_Q`OEX�@`v�t���@aJi�Oj@b#E���N@cKR�`@c�W�f	(@d�KNC{"@e�^�8@f����}@g��5z"Y@h���	��@i�ֶ��@j�����#@k�$�-@l�xP��@m�Ί�i�@n�di�@p ��0=�@p��AY<�@q%���Hr@q�����        ?u��-�?�U�`�F?�:��r-�?֟�c"�?��'R�Q(?�I�?��|~���@%�+�@�C���@=ǌ|��@03f7�@$�{ž@*-��@0�3,		�@4�[���@9��{peE@?�
�<h@C�W/*{@F�X�	@K�6�,�@O��Ct��@Ry����@UY���Qx@X�J/�GY@[�䞨��@_��}Bw�@a覴�*�@d�2�	�@f�ѧ'F@i�$I�@k�f&}c@nƫ,���@p���{@r�$Ylo@tj���(�@vN~<� @xNLt�<�@zkK��@|�z�&D#@~�7ٌ�@������`@��Ҙ @�b���zD@���Ym��@�L&�3kY@��jq�}�@�z��@�+O��"@��w֑m�@���:W=�@�U�#�)�@�R�؂>@�Y�s0�@�j ���~@���Ë@��_�ܐ@��1b��@�{Co@�Q$-+�=@��U����@��8���@�X�H+��@�ƪ���        ?�
T�t�.?����u�1?ѭ���?⛮�O�?�N�	}4$?��~h��@&��O	%@A�
@��<&�@E
�e�L@ �z��@%�<�@�@+[���`@1'Y�4��@5<E�V�<@9�g{�@?s[���@B�0��4�@Fc<r�Hh@J^��n�z@Nҩ���@Q��Xu�@T�t=�@W�d�/b1@Z���$�@^�ߘ�]�@a9�EN�@cX�y���@e�>�c<@h�b�T@j����O@m��T`]�@pO���@q�&Q�K!@s�5.���@ut���@wa�X[&9@yj�k���@{�%���@}қ$>@�W����@�XzYj�v@���ç�@�=)�@�s����@���WZa@��s����@�!ծ��@�Ӕ6i@���F��,@�lmv;�@���x���@��]����@��D�0@��vW+�@���3-@���п�@�!��W�@�W��@��)�V��@���-@�1�v�@�����ά        @����xP@/��@r��@HCT6^�v@Y�ʞ�;�@f$���"�@p�:<~@x
~�X��@�!��Ex@���SM��@��!��@��d��D@�	�FI6@�sfmʄ=@� �Оex@��Ep��@�"ю�{�@�^}��@���u�z5@�;Z�(�@��s��@�������@�D��q�h@�ʀ���1@�b��z��@�/�.@�ʅڮ�d@���힊>@�~�(q�@�v)r`n�@���^��@�QJ\\��@�l7#�@�����@�v�G�@��F7���@�E�4,M@ǖ���t@��!��k@�\uLН@���Y#�@�N^��@�ץ���Q@�5���n@���ƫ@���>��@ұr���@ӎ�N�H@�o�}�;C@�U��@�>+�XH@�+wf�@��U��+@�/.��<@���2��@��w��G@�Mtb��@�	·0Oa@��·�@����@���8k@ࣳ� ��@�11�B�@��'NN��        ?��YGy+�?����?�%� �ո?�5���?�q�2��?��_1|�@�Qj���@	���+��@��\H��@�?��Z�@�r��@ f����@#��o�ZT@'P?��4@+K}E 3@/���Q/@2,�P
�@4���@C@7sR'*$�@:^�7�KA@=z(�Ox$@@bd��ϥ@BO)���@C�[:{�@E��e��O@G�z���j@J#����@L=Dl,@N�/�<@P}��mO1@Q��a�L@S|���@To�����@U۹��I@WU�O�7@X�ŝ�O`@Zt�@\��n %@]�@ݜ|�@_�7Me�a@`��Z���@a�QcVsb@b��<J�@c���^@d��v��`@e��.���@f�afs�@g�']��@h�A��=
@j��  @kC~	��@lz�V�B�@m�C�_�@n�Q�t�@p&n�a(@p���$��@qDB�ko@r1Z�a V@r�?���J@s��:��@t^�i�y@u +ZDƋ@u忹Z\        ?t�T'�	?�6)ӷ�?�i�i�*?Խ���H%?�?��p��?�(?��'?�����@:�}6��@�k�:@�vE�@dh��=@#�u{I�@)}��}�@0O�S�9@4�I�`�a@9x��$@?,+��i�@B׀cL�E@F�G�Y�/@J�vB�@O?��7�@R)�т��@T�[2�(@W�`��M@[M�}��4@^���Rx�@a_���@cr��"B�@e���i�^@h�|�@j�L� ��@m5W����@pQsni�@q�/zg#@s�M��;@t����G�@vq@ٖ�@xA��)�@z'�kX�E@|$Kk@�S@~7�G��@�1C@RP$@�R�f�<�@�����@���Ws�@� C�,��@�S��TG;@��6�\�@�"@4z�@���[��@�'�#���@������Z@�f�"/J�@����vX@�px�(�"@�Z�\���@�L�=��@�F��tb@�H���)@�Ss�+@�f����_@��zB�3D@��;�h�J        ?vs^�S�?��T��f�?�Ɂ�:�P?�����?㙝���?�Ƿm˪?���tXC@!��&�@�j��A@�S�@5��zL�@$I.��@*�~|@�@1,qʪ��@5�w���@;��'�c@@��]m�@D88 ��L@H@��e@L�|LK�@P��6f�T@S���W\@V�{KЋ	@Z-T.��]@]�����@`�|b{�8@cA��|�@ei8V�/�@g������@j����R�@mv�K ~*@pB�A��@q㔨�i�@s���Bܞ@urzɸj:@wboG�@ym�.@{�`�̆y@}؁o��@��q�1@�\��j�@��N�K�I@�h�{��@�z�.<��@��Fe��4@������~@�,F�I�@��F����@��cMm�@�z�i�m@����K@��կ�e�@���@�4@���Ϻ��@��E\蔿@�Zs&o@�46�;G@�k��6�@�����X@��Y���@�O=�qV�@��d�Y�@��b͎9        ?��Ph��@+�3��D@E��	.��@Wa��l�@d��'O�@pE���@wCcӛ�@��~�@���>�O@�z��C�1@�m�S�t@��]��@��"���@�L�O�d@�� �%@�"��^q@��J���@��cY6ҩ@�D�!0��@�Źq�Ӗ@��V��Oo@��&X��@��d��oG@�R�w̦@�l�[J�@��ڐT�@�z��WE�@�w��/T@<�$<5@��ġET�@ň%��4@�"z]:��@�����n�@ʇwP3��@�Rb=C�@�-��.@�۸��.@�/�¡@��zλ9@�!^���@�8���G@�X�w�@ց.�J��@ײI�^�@��wm?@�.l7�~�@�y���@�͗�bl@�*rx���@ߐ7��Y@�z��[@�;]U�$@��˶�4<@��� �|@�p��D�@�X�`��@�+��5�{@�R�Dק@�ߣ%l�@���%0��@�?;J�@鐊��(@���3�V        ?����?�B��E�?ʑ-l���?ݻw8z��?���Ʃ?����]�?��ef7~@���%@9�v��@��&T�z@tm`��h@����ܰ@!L�
@$�ӡ/�=@(�P��S@+�Qyf�@/�6�)�@26���N@4�J�Y��@7�a*6@9����)m@<���@?�sv�Bl@Ay+q]��@C,v����@D���l
�@Fۮ�@H� C��@J𑎯s@M#W�3�@Or3��s @P���[=�@R3tS?u@S��?�9�@T�]�5@V[Ʋ5f�@Wݼ(㈑@Yo�BH�c@[)���D@\�-ƯKv@^��9��@`/	݃Q�@a"/l<�@b���@c"����@d/�O���@eE�s3^@fd��θ�@g���.�@h� ��T�@i��̔"z@k6*�#�@l�N����@m�2zؗ#@o.߼�2�@pI��7��@q Y~`�m@q�u���@r{	�MQz@s?#��f�@tΦov@t��Ί@u��H&�        ?����]�?�3ÒP�?ޘը¶?�бܼ��@^��H@8b�t��@>8�6{�@!���	J�@(�@+`��@0�.+�y�@5��E�n�@< I�T�@A��k�X@FM��S�@J��ըp@PK���	�@Sz=�_؅@W�T}m@[���@_h	�)`@bT=��@d�;���!@g��q@j�pUƝP@n#
��;`@p㉤%�e@r�u���@t�}�Q@w0��8�@y�����@|#�4N]@~�-�@�߷��@�h�|M8@������@��7��v@������@�wڎ��@�z9��P@����UD�@�ͣ2O�@��!��@�F�t��@����×�@��?cI>J@�AUW�X�@��[г/�@�2�#�I@��S�	H�@�a�V,d�@�[�^�@��4��m@���ɠ޾@���I@���Ռ�Q@���>��@���i�:s@��=�f@����8�H@� ��R-@�Q�Kڡ�@��� �jE@��8��sr        ?e��+8P?�A����n?��r�W�?� 5�.�?ߴ�i�D?�1�Rs?�7YG�7@?��Q��@Q�����@�	a8�e@ ���枕@'Sm����@/)#S�y�@4Sq���6@9��K�|@@J����m@D/wZ�@HzP�@��@Mh�J�@QwI�pr�@T�Q�k@W�̚�x@[������@_��j&~@biϧ@d\�Y^��@f�0l��>@i���3��@l{?cA�@o���R)�@qf�j	�#@s�8Ij�@t�ؼ���@v�(���@x�ţ��@{R�;�@}=X�|"^@�"����@����@�K��G"@���@��7@���s��@�}�ԫ�@��3u
�@����<@�<�^�@��r�J7@��ל��3@�H&�5@�<��� @�9��agY@�?��oY�@�N���$S@�g?��@����3�@��V��D�@��C����@�$y�P;�@�j�����@���_-"�@�� �@�v�N<�@�p��U��        ?���/7@#����tX@A_��og@T����m@b��$�#�@n��6YJ@v:D�R�@~�7r���@�w�B�� @�=�8 �@�`��p�C@�1�E�C@��/�@�l�G&��@��.'�".@�/���0@��-f�/@��83�@�s*"s�@�p!�"O@�~�x��@�^���@�Xo^�B�@�l��c@�@�����m@����E@�N跲R@�i�Br~@��1���@��m�7�@ċ�J�@�K�')@Ǡ�,07@�Ds���d@��� �R@�É��v&@Ξ�G��@�F��P��@�GX�=oh@�QҼ=7�@�f%D��@Ԅlj}aF@լ��XJ@��6��#@���I�
@�b��c@ڳ� ﮔ@�!�^�@�t����@��"��o@�.ئ=��@��2��:@᷈�
*@�w�r�@�T��MY�@�*�r	�@��>��@�����)@��l;sW@緥�-�@�p���N@��6���@ꛂ3R�I        ?���Ǟ�?��!G�;v?�'��,ʻ?�O�?h?�mv[	�$?�v?ZFu�?��D�h�o@o��;Y@Jy��5K@ ,,�@J���ß@��66�@:��5�@ ���@#��,�@&��P�.@*��=��@-�3M���@0ъW�K@2���^&@5@f���
@7�A�Z�@:S½�dx@=c��	�@@��a&@A�w��@C<a|o	�@D��,e@F�v��@H�0���o@J��c��k@Lϖy�K@OL	<��@P�.��T@Q�J��@S+=�Y@Tg�/7�w@U��iuO@W,.*ާ@X�����@Z*Ȍ5"�@[���z�@]e�F���@_��4@`n�r�}@aX���S�@bJ*_�+@cC���qo@dD�Q��>@eN4nlN�@f_iyf�@gx�xs�@h���ݸ@i�0W�{"@j��F@l.~�њ�@mp�+��@n�	Q���@p�߰E�@p������@qfR�A�@rG#F�x@r�c��$�        ?Yk���-�?���,ꢺ?�=X!�(?ĸ�A4�}?�0�|�?���W?�8�í`�@ ��7V��@
:#u��@��>>�@%���+�@#��٭�k@*ueN�:@1u���pI@6�I��@<���bL-@A�+�}m�@E�;�w2�@J�MgU@P�`�x`@S����@Vfu�-!@Z"��I��@^@����@ab��@c� CQ@f��ZW�@ij�݃�@l��T��@o�-)��k@q�%�B�@s�wh�@u��z� @w�Us\�Y@z)��i��@|���� w@,�F��@��D���%@�`��L�@��|�%U@�u�(Z�
@�: ��@��U_�9�@��E��A�@��@e�{@��w�§@�F�/�t@�V�?C��@�qN���@��r��^�@��F7j4@� ��˾@�F����g@��3S��_@��&l��@�Z�e`U�@��q~�88@�L��A�@�֖��b_@����Э�@����_y�@�_H���@�<�)bų        ?�z~�KU@?�W���0_?�D�@ �?�l�O�?F?�|*�?��C���@�x��@�ѧ!�`@XM���@�,�.�O@#�m�D�3@*e�rU@1�؋(0@5Ɛ���@;NC�k�7@@�q%,��@D��
on@H�I+�@M�v�DQ�@Q��8�
�@T����,�@X�6-%�@[�M�Lyo@_�65j�@b5����c@d�-�ʪ�@gI�&e@j"z��I@m1yn�@p;��ǉ�@q����~�@s�I�`��@u�lG@w���I@z=�f�@|t�}��@~�2@��R�\�@�$Lmh@��>�sB�@��I�#@�����B`@�+W=:3�@��#��*@��Cm��[@�k�8RZ@�O˦�0@��2cc@��|��2@��I@��rE�2@�����c@��l�@�>�i��@�y*�$��@���n�U�@�	�Ǎ^%@�_��N9�@�� dP9I@�'ڐc(@�L쭱?q@�
��-Qf@��ƨ�o"        ?�?J���@K�>�0\@7�;�7a@H�7 ��E@V��jn�@aB�A@h�R�h�I@q�H�{g@ve����@|���|��@����/@��ދV��@��-�5��@��>B�@��_�"��@����E�@��f��b�@�]VvM�@��N�F��@�1XȮg�@�<���9@�j�MC@��&���x@�0���d�@����ވ�@��h��k@�3F����@��~�@/@�L�=�t@��%��@��0�Q��@��>%�R@�i-��#@�b���j�@�q(�P�@��Ub3�@����d��@�1���@�@�D�@�~^��G�@��h(E�P@�Ӿ��f@�{�9Sj@���:v�_@�]����@�ߣ��I�@�m,��[@ЃD�^�@�UR��5�@�-MM�C�@�"�H�@��+f@���U-ۊ@���p��O@ֻ�$\;�@׶���j�@ط�M�@پp6���@��h�5�L@�ނ@G@��ſR*@�<���@�<�z��        ?����׌,?���{4��?Ŀ
H��2?֠)�_��?�@�~�J�?�u�q��?�u�^b��@ 3FG�t�@u6��N?@��0�S@6v(g�C@#J~�@h����@1�Ag�@!�M�VG@$���;��@'Ѭ�#*@+H�Շ%@/b_���@1�Ұ�8@3�����@6D�7��@8�bL,a"@;2vy��'@>����@@�';m��@B_�?�@C�܎jt�@E��~�`@Gr�Fov@Ij[���@Kz\�NR@M�N	��*@O兮�+@Q ��|��@R[��J�@S�#8!@T��Qh�@V]�i�@Wϊm���@YO�b��@Z��h�9�@\|���T�@^)�P)�H@_�pmQ�*@`�Vݦ�:@a�Wg���@b�F&�߽@c�.%;M@d�Ƶx�@e�'��@f�8�Zi�@h�S�h�@i*�B�@jX�����@k�F.v@l���rC@nWq��@oiN��@pa�̷X�@q��
#@q��gA@r�858��        ?lf�J� ?���-�?����"\:?��tS"?�_K��=?���f�@��!4i@*�Ei@��"Y�o@"V����@)��ܔ��@1��H�T@7�V�|�@>���zG�@C�����r@H�ؤغ@N2y��OJ@RP��G5@U���S!&@Y�	;��@^u��C^�@a��8X@dd����@gT�+��@j�h�	��@m��Q�/�@p�O[:@r�����@t�Sr���@w*��?�o@y�7�߲�@|��$MD@~�WI�@���D
�%@�G��B\j@�փ(�ƛ@�x��o@�,Rߍ��@��i�Mw@��2�>*@���xa@o@���|ax@�e(v�pS@�wej��@�� �`�@��y8[a$@��*}@� ��s`@�c�G~@���3�@���]�k@�j�J�*�@��DW�Q@�N���$@���%�i�@����)"@�{'�=@�L�p���@�$Rc1�@�xʮi@��l�Z�@��=�§@������        ?qz����?�\�6P��?�DA��2?Ԥ"�%ғ?�6��`�?��K��Ȇ@ ������@
?����@���81�@R�W/��@#��ٳ�(@*��H�@1��e�@6�/��ǰ@=K�Vz��@B\��S	@F�3��3b@K��k�@P��i@S�W0���@W��r,@[��5x�@`	��@b�^�Y�k@e>ײ�5�@h;���L @k}�%�@o�qH�C@qn��d^@s�a�<�)@u�l�b��@xv	@z��V5_@}f�s�@�'=���v@����8�@�T]vӚ�@�� 2��@���`!@����*�:@�Ӣ�7��@��{�\@�.zz�(�@��^s�@��|nh�@�B�u)L�@���x!��@��O�dq�@�p�zIT�@��b�:�@�� <�S@�&��B�@��K��$@���>��j@��[���@����*��@��hv@�@����F�@��u�Npq@����o��@����p�@��Y!\@��Sx��        ?� �����@x�W+�@4��F�#g@GN|�k+�@U^S0�c�@a=���ψ@i�X9@�"@q�N�b1�@w�ZPx�@~�X���@��h���@�!(%V��@�O�����@��~����@�n��@�Nhݗh@�1�:Æ�@�8e��l@��PQZ�d@��~���@��F0��$@��i�o{@�����C�@�y>�[!�@�:��G�@���~yF@��z�H-@�/�]J`.@�i��IWL@��t�! y@�?н1p�@��L춋?@�M����@þ�e��@�?��%�@��,�l�@�x���/@�.���t@��sl0֯@�ҜU�W�@���4��@���r��@��0�E��@���Df�y@�p_�@�H�\�@�|�mf@׽a���N@�	�e��@�a��[�@��c;J	O@�7�9K@޴vdT�@��O4�@����`�@ẓ�'�@���A�/@�oE�2�@�R��=4@�<��`�@�-^����@�$)����@�!i�'�D        ?�PSq�~?���e_�?�㱹sI�?�D���M?������v?�"�;��?��q{(�@kP��Jm@r�޹�|@k��f�m@��|�@(�����@%�,|��@!UyL��@$]�f�u@'��¢�e@+G����d@/-�]��@1���F@3�����@6^���D�@8�`֊�g@;�����@>�6�2G@@�%�g(@@B��QGH�@D@{
=�@F2n(�1@Hm�� @JpⅫ@L'y����@N_�E��@PXƧ1��@Q����Ѿ@Rњ[�i(@T!�?�Ñ@U�҅�@V��=4@XeɆ�޽@Y���X@[��b��@](��90@^�c�`�@`N;|U>@a5�ݯE�@b$��1�@c����#@d�RX�1@e(H�@f'��1@g:W����@hT7"�+�@iuE��~	@j��G�W@k�᜼B�@mb� e@n@�?b�
@o���N6@ph�L!6�@q�5\�@q��+Ώ�@rn�N�@s"U�8Y         ?��7�A�7?�r��Q�?���z$�?��r���?�Y�=�@3d"j@�7�'�@^Ǆ]��@$k��D��@-Y�0��@4p�y�J@;��rLʽ@B[&��5�@G�C)buu@N_�q�$@S���m�@W�%��&@\�k��Kq@ai��e�@d�\3l@h��9P\�@m�����@p�r�!��@s�>�?�@v������@y���X]@}�&2Ό@����/@����)�@�L�Y�Q@��*E��A@��蟟Z@���Z��@�Z�0+�r@�!V���@��vo�f�@��Xm�jM@��b#�m�@��#f%}@@�A$j�)@���n��L@��r��@��Г�|L@�Q�Q&��@�Ǳ���@�N��tl7@��ިj'@��!G�'@�L��84@����ך@�����O�@�v`C��@�x���"@��1��E@��� z�@��sG�x@��L�� @��j�mO@�K����@��V���|@�ޥu�t>@�6�x��;@��K�_�C        ?���N!��?�8We?�0�(��G?��b@�y?���,b@'V\�9 @�t��J@߁~��@GZ��Q|@%:RJ;@,���@3H�wV@9*ȵ�@@ �Z��@DWG-*Z@II6�
�@OM`�@R�+?@V��I�G�@Z̨��d�@_��7 @bk�Y��@eY�ܕU@h��()m�@l#���@o�X�7@r`��F)@tT�9��@vø��x@y_��Y�0@|*^TG@#�?,I@�&��҇@�Ӧ�{��@��U��Z[@�xr}}~@�p1j�n�@���ri@��'w.@��K��Г@����)Y@��V���>@�3�,�p�@��G#��@����!@�f=|��X@��w��9+@�v)݀U@�M�G]�@����9��@�r��C�@���.Jqp@���]��e@�tG�6'Z@�j��I��@�g��z+�@�k��?!�@�v1����@��j	(_]@��MҞZ�@��ٔè	@��
�<@���hSg        ?������q@*��|i@FQL���@Yyf�w#@gn��t�r@r�L:��j@{�{��.@�W�9C^�@��]6_�@�}�γ�Q@��	k��z@�AExm�@�d_��X�@�9��[9@���]I;@�}_|�L�@�$��L@��є��@�,��	�@�ux�ݑ^@��Fo]��@��\�f�@�Q0�!Ɛ@�J1�D��@�9]7_o�@��hL@@ī����9@Ɗ�&:6�@ȃ>�#�{@ʕ��չ@���sQ�@�
���@ж����@��d�rsu@�DTL�@Ԡ1��[@�G����@ׅ�J]�@�l�>��@ڨ���@@�R}��@�ӷa�@��٣�}K@���z���@��,Eb-@�ʘ�Ä�@��CdWG@��3G��@��m[:#c@��;�@�9�~�T�@�h�8�9@�/6�\�@�ߴ�*�@�'\W���@�w`�y@���T:<`@�0���b@�J�D�@�n��C@��M��@�|ع�cS@�?��Y&�        ?x�1�F�?�^�j�s?� oC3ރ?�h>�?��ۇ���?�#��w/�?����?�~��&@6�p8�@	�x�Tv@A�9LW1@��]o�@��J�@��|��C@ �d���@#���;��@&�T�,]@*�a@-�^��I�@0��h��s@2Ħ�r%�@4�é��@7<iɫrO@9�gz�@<<X��:P@>��aR�@@��M6�h@Bc깶��@C�̺�H]@E����e�@GRNv#�4@I����@J��uE�;@L�#��d?@N��F@P�֋���@Q���'�@R�Q���Q@S�Ә �@U�ŧK/@VX6�7�@W�Ə�t�@X���@ZP�����@[�?�8�0@]*:qKX�@^�����@`١y��@`ߡ6�@a��s�\v@b�&�/�4@cY�Ƅ,b@d8S/�_�@e:�%�@f�dx��@f�$�e��@g�ZG�@h��^֕@i��_�@j�1��@k��"�Q�@m�/B�@n)����        ?``�pdq?�P�:e�?����,�?�[���)?�>�>�p?���1?�e�[�M?�0��A�i@���R�@��B,�@_@�� r@��kە@$��7%h�@+P��~@1l-Cp��@6{V��@;p�enT9@@�����k@Ds�dW�@H�J�0�@M(T.��@Q)Ӎ�@Twt�"�@W2�g/g�@Z���7@^yO���@aM01�@c��f=PO@e�!����@h��l@�@kJ���@n>jf�{�@p���k�@r[38GC�@tD|�@u��6�n@w�hy��@z 4��+�@|*J,֤3@~o�I @�g^��=�@���5˟�@��Z���@�I�ˍQ�@���қ�@�(5��@���K¸+@�A�3�ք@���!�J@��o '��@�] 
���@�����.B@���j��@����.�@���Z_�Q@��z��8�@��@��E%@��M��.�@��̜�a�@�%讓��@�a̎�@����;LZ@���5�r        ?\
��2�_?��⸴I?�����?�vN0�?��?��?�3[�c�?��5�O�N?���1��N@|\��"@}��P/c@t��k@v�����@#EX��`@){o�VQ@0��Is�@4�k��	@:=�-f@@+��5�@C�T�GG@G��J�)@L$���@P�t#�8@S`n��)�@VvڪD@Y�6D~�@]� ��@`��8�@cgԆџ@ef]X@g�l³E@j�A�+�@m���hN@po�x��o@r!xY"P@s�'t%|q@u��Xf�@w����@z���8N@|Nyr.[�@~��5�n<@����@��=~I_@�T[�C�>@�Ɂ���@�O�3	��@���w�@�����@�@�M�jcl@�� ��@��);$��@�w�����@�z��?}�@�����@����O��@���O�Q@����,�@�[�DO�@�SFe�G�@����;@��i1u�@�@!���@���e6Y@���4        ?�V�4q�@�PK�ߤ@,�+�΁@?���^@L��+
��@V�C?��@`p!R��I@f�Lj�\@m��L�@s5(�@w�����@}/Q�V��@��6�U�@��2�X�@������@���:x�}@�s�3�z�@��_Ղ#@�U��W�.@�
���%@��<o���@����;j/@��#��*@�XQ�94@�'�9�V@�%8�}F@���8�@�*�Q���@�]�1��@��z��N�@��7{ngT@��qID@��{Q�@�e�>i܂@��	��f�@�8���a@��t�l�z@�>�JJk�@��.��y9@�x�Yˊ@�)2H���@�s��>I@�Y:Q�b�@�E�*�4@�8��T@�3�#@�4lB�1@�<:zM�@�K:4L�@�a���>�@�n�@ʣ�T�Z�@��-�8@��Ŝ�l@�?)1�@ς
@��B@�fQ5�U�@���6�@Ѽ�L��@�mט+��@�#mge@��A�|\@ԙ��׬�        ?|O�
�0?�l�aP�?�^�T��?����?�X��*?��_w�~?�(��{�@���/��@���N͐@/��4�@�j$��@ƩB��%@6�5�Z�@ ��e@@"�0��eI@%y�Ȣ@(�k|�E@+�{(�f@/1'���@1l����@3\m�.'�@5gG�횚@7��!.��@9�wE�Y
@<,�=��@>�8{Z�@@��� <\@A�+f9̪@C\�#���@DёoM��@FT��C�n@G�G�Zd@I�f7[�:@K5E��@L�Z���@N�rC��@PL'���@Q@m�\]�@R;ۘdKS@S>oDz��@TH*n�0g@UYQ�,@VqAW�R@W��)/�V@X��}#��@Y�~��@[i�)�e@\\*5�E�@]��RU@^�'!4_@`$����B@`Ԅ��ѕ@a�mʗ�@b@}��@b��2zD�@c��@e�@d���m�@eJ���׌@f���@f��P��@g�RR��@h����@iv��MH        ?vH���2?�#0+�Q?���uЁ?د���?�/P�?����ʺ?��+3�7@��+Ƿ�@�h���@\#���x@��u��@$�7��&@*�<��@1(�jc�l@5�� O�@:��-���@@5��HJS@C���9�@GS����A@K�(�R�S@P#��Ke�@R����"�@U�4��~q@X�w��-�@\$��4�'@_�;iP25@a�����@d	Ol��z@fR��}�@h�y�3�-@k\ԗ裋@n}��6�@p�$����@rpb�@s�ɛ�@uk�v-@w:��|�C@y ��g��@{�o���@}3]�I[�@a��8k@���^(��@����D�@�@[ĴF@��q��v�@��޺��M@�Cw:gV�@��[�i��@�2�,@m�@���Ɏqp@�W��\H�@��%Li@�Z۠�"@�;�;W��@�#��@�\B��'@�	��ˤA@�SP/�L@��j�,@��j6G�@�*s�¦�@�Du\꣡@�e�L�+h        ?y�n���?�󬐩!]?���$ �9?�x�}�}?�ٻ؃#�?��e3�!@ �zcT�&@	�Ǣka@�E��M�@�6��~3@".�2�ID@(NVK��@/�)�&G@4j� ���@9�9 �u@@	c�ݎ�@C�����(@G�$���]@L���C�@P��I��~@S�pʆ@WF��W@Z��MKW@^��0��@a�Ɍ�@d6b�+`@f��^�Y@iPSKH�@lD�O�@om��u&@qf����4@s27��WE@u��@w��E?�@yAuc��'@{�	B��F@}�2mc��@�/�`��@�~m�%5�@��,�_e@�K��) �@��5���@�Yq2��@��a��A�@��5��Ȱ@�höLcI@�:@4��@�r��P@�{+(4@@�^ Km@�B�~F�@�,Q2��@�J�N���@�r�dׯ�@������;@��5H�ظ@�$U�,z�@�s��;@���� �@�0u�\f@��|�g/@����ׁ�@�M����        ?� �K@ ��đ�@;off��@N�2J�4@[b�+�@e�Sb£G@oTD^�@ul��Z�@|M���b@�̗V��@�  q��@���TRW@���MD�@������@��1d���@�ǀ���@�0���s�@����3�@��w-��@����8��@��;$�.@�Aq�zs@��@��w�@��i�"@�����4<@�%�e��7@��!p�u@��ou�@�o�pu:@���w���@��GxE@�*!���)@����T��@��?��p@�Vf���@���?^!@������@�z�xX�@�w��T@�{MgW(�@ŅGD�K-@ƕ�w!@ǭHr�p@���$�X�@���ғE@�L7v��@�M羵��@͇��9�R@��K�J
@���0@Я�	�M�@�Z��y,?@�	t2S�@һB�b�@�p��,�@�*N[�M@��<�r�@է�]\��@�k�\�?@�3ɤͶ�@��:���@��IH�'D@٠�u�W        ?w/���?�̰�k@�?�ڠ���?���1���?�L���C?���HLֿ?�*�[�l)?��w�B�@�1> �0@
��Q�T�@��"���@0Dg�'c@6	�@�F9n�@ ��^ �"@#bD�$YV@&>���@)Ut��d@,�'�M��@0F���@2_�;@4	��ɔ@61�e�	@8{��$Y�@:��_�@=w�w<J@@��Z�@A�ط�P�@C ��跋@D�9p��@F9\T��@G�镜�@I¿�p1�@K����j�@M��5��@O�����h@P�)��@R�ܤI�@S/��a@Tcj�-r�@U��O�g@V�ȁI@XE(:�J@Y�U=��@[����Y@\�q��@^��)��@_�>�J��@`���G�S@a����@b]%��~�@c@��D�@d+T�`8�@e0T!n/@f�=��@g��ʫ�@hOZ2`�@i!��E��@j3�Y{o�@kL�@��@ll�D?�@m�R�E��@n�����H        ?~�:�{nD?�?�a?��?���&��?�ʣ��;�?�|L?�y�DV?�H|��u�@2�ʎ��@�z��W@De���@4Q��h@$����M@*��w��@1BȆ1�@5��=�@;�e��@@�)2%�i@D9�+[��@HR%8\�@L�l"�7@Q�@T	�Z�Y@WM���@Z�۟ r@^�ǿ<B�@a�}���r@d��"Cr@f����0@ir�/���@l�$5Z�@o���}�@q��*�
�@s����@u�΁@��@w�|�{�@z�F�@|~Ƽ��X@-��'@����h�@�\Nɤ�@����82@�}
3��w@�,�N�@���~$�E@�����+@��>��@��K��@@�j��)�x@���)J�@����@���G ']@��+��@�T���n@�����@�.�1�@�l5�}<@��/�.jG@�b1�B�@��M�L�%@�DJbf��@�
��I@���c�@���r,�U        ?z�S�ݯu?��^��a~?������?�/��`G�?�g���?�����?�I���@*>�z��@���I�@j��<C�@,���m@#j�G��@)U	��F�@0;���@4y�C�5@9v>���@?A_d�r@B��/[�@F�O���@K;Rs�@O��<rQ�@R������@U�y��W@X�[��@\�,M7c�@`:�oƃ	@ba
�K�@d���zsw@g;�z��@i�y�Mh@l��zb�@p]Wg��@q��7��@sy8�3�&@ua��6��@wi[�w�@y�\,��C@{زI��@~C�&<@�h:�ٖ*@���(3k@�,L
�%@����M��@�<��6g@��퓷�@���o���@�l@&	g@�P����@�K&+��@��μsB�@��T��[@��X�l�@��}�n@�A�j:��@��x�&bR@�Ӑ����@�/1���@����D�@��a@��7�J�@�ٜԂx@�]�r^��@�3;�AJ�        ?���^�@\�Q;��@7��V&�@I�����A@V��{TT@a�[J@i�=yB*�@q�d��@v��ѽ@}K�j[�@�����@���b�o�@���QP@�G<�v}�@���s;��@�3k�C?@��
eB@�����@�E�=b=u@�Z�ձk@�.H�<�@��O+;@�*dڴ8�@�Ts~s�d@������"@��߱�@��l3���@�nb�=,@�{��D�@�﫹k��@�t46d8'@�	��V 4@����ԉN@�h���S@�3ga�L@�Wl@����t1@��7*�@����*@� �&
+Y@�@�x�@�i����F@Ɲ��k|�@��X7q�@�&t1}y@�z��3��@��.��}�@�F�$��Z@ξvܯ�@� ��B̞@���>�@ѶP�&W�@Ҋ&{�~@�d!�C��@�DLׇ�q@�*�mw�@�^�d�$@�
Zp� �@�����@�g�Z�@�	�. O@�3��@�)3l        ?�ytvm�?��u�ʖ�?ɫXM?۰��F:?�l�?P�?�i%��V?�Q ��VW@���pl@	�}�8;	@�AV�f@��׶@�U�ʏ;@���@"^<R�&9@%����@)1��2��@-?{^)�@0���B6F@2��$�@5d^�s�I@8E}��P@:�
�)I�@=�l��K�@@z)zy�@B&ln@C� �s��@E����@G�J&���@I���H@K�5f�=@NEv]��@PTD9�H@Q���>9�@R����@T>d<���@U��?���@W$'L+�z@X�����@ZF�ΉR@[ﱯ��a@]�N?�n@_p����@`��f�s@a�����@b��L�@c�����$@d����@e��$��@f���@h
T+F3�@i<�P$}@jv��I@k���)@m�pō�@n^�^��@o�Uq0@p�آEA�@qK����@r	0�fZ@r�>Pb�@s����@t]��	J@u.�{8        ?s���F��?�����$�?�8�vk��?����>?������T?���R?]M@�n�qE@M (��@���@���ه@%I�<-q@,Ԫۊ��@3�����@8�����g@?�	ͽ]@CM���d~@G��;QB�@L�� Ԓ}@Q� Y�P@T>׃�@Wr.�a��@[(n���@_7-��@a����g@d5�T�QG@f�bsT��@i�G<œ�@l�q��n�@o�Ƴ��@q��\%�0@sr��s�;@uf<��j@wx����@y��<B�@{���NZ�@~tֆˋ8@��C�Z �@��u��@�R��0%@��k�Ǚ@�h��{B@�����@�����@����DT�@�z�І@�p���7@�����@��g�W�u@�靑P7�@��Ȳ�@�Au����@�~� ��=@��<2|��@��'ߡ@�|x��@��T��?m@�b���O�@��j{��@�=~�Ra&@�?���@�㎋(h�@����.A>@��6�&!        ?yB�0��?�Ã�^�{?ħ�L��]?����Q2?�cB��?�V�B�&@g��@��@�0�ܬ@G��/�H@x���9�@%!U��VC@,����f�@2�"�9@8*��:�@>�_�Jm@B�A��O)@G:����@L+�,6@P�r���h@S�nG��@W�̅B@Z�@)f�@^�V$�ې@a�Ҵ�N@c����N@f���<>�@iAuA��@l2�R�Mu@oWJV��@qXp��A@s H��zE@u��3e@wn(��@y���\�@{Yg�TO@}��W��H@�p�*�@�]!4��*@����31�@� "��]^@����h3@�#4s��@���J�7@�g�>ч�@�"��X��@��� .O@��A@�@��,��t�@���AI�@��^n�c@����I�@�[7�:�@�2�e@@�^>ul�@��Gܭ@��	��@�� �%@�b�j�:`@���k�Y@�����@�A��8@���Vw�@����W        ?����x��@,��u��@7.���r�@I|�y�#@V�$��a�@b1H�mH�@j��m�@rr��	�@x}���R@���nO@�����.@�K���2@�b��N�{@��$�/�@������@��U[I@��s��t@��D^l@�7��+@����!�@�-Z��u�@���b��@���&uE1@���Y��,@���{}�@�dʕF-@�>3�&�@�2�B�G@�AҤzsO@�la!��@���a���@�
�s���@�J���@�z��@��+� �x@�b��y@��E��6�@�i��A��@��W�@˰�сc5@�l�t֏@�9�3��@Ќ�7f�@у�/=@҄0�s��@Ӎ��+A{@Ԡ+Ed�@ջ�m��\@���~�@��TM-�@�H:�Y��@ڊoθ�@�րW�v{@�,xsB��@ތZ��@��&r7dO@�ӧ@�sŒlh�@�7��"�@� n�Ç�@��M�ܷ�@�>�� �@�yF��2�        ?�<b��?��k�ϻ?ͣ���O�?߇���?맏�(�F?��-^�[�?�&
x��@Q�~G�a@ �^@�G6n-�@Pr��%@Ch��l�@ b�C�t�@#mh~� �@&�^H��@*i�+��@.`D?��@1T��6y@3�]�VE�@6���@8�#�Dб@;��A���@>�!�ɐJ@@�ŌFo�@B��96I@Dkx��R,@FP/y�#�@HNj�#@Jf�Y�}`@L����C@N� P��<@P���@Q�5}[�@S=��7#@T����@V7}!�@@W��S��@YQ�Q"�@Z���/Zb@\c�0;�%@^ ���@_�/h�@`���@aيN$�@b�t\�i@c�{�i@d�� ,]�@e�AA^v@g�+���@hB;�,P�@io�0Z<@j��!�CM@k㯮�;�@m)�
��6@nx�d��@o�ȏ��@p��p~�@qL�	@@r�<�7�@r���4M@s�g
oǖ@tIcwo�s@u�t�        ?���W���?���t�J?���C8�G?��1��?�;�7�(0?��^n�G�@�>����@�Ej�<�@�'hԵ�@!�'F��@(Tv�X�@0s�~���@5�[O�7�@<;%FS�L@A�0�u@F��W��:@K��ɩeI@QU9kN0@T����t�@X�ՖA��@]#��З�@a����&@c韀�5�@g�$d.@jq&ذ��@n/���O@q"G�^�@sY�3|�@u���@xV�#4��@{��y�@~y#�j�@��l��@�]��/�@�/h�5_?@��Y�٫@�),(�ފ@�Q� [�@������@��ڻ@�%@���Q_��@����|@�k'�ݔ}@��t�il@�U�� D@��h�˿@�|�w���@�'�&��@��
��N@��VD��q@�D��R�@�;*%��@�9է,_@�A0*�0@�Qh\��@�j��!�.@��)�.�@��&hu@��l7Si@�-w�f@�vG�3|�@����2�@�%��!��        ?mc�9¦j?�S��RI?�壦�a?�X��?��/O?���{9�?�����5@H0��n�@�ɣCٓ@^��2>�@"�s=hn�@)�pL�yt@14�3�o@6{/-O@<ƍERa@B<�B�9@F`���,�@KL���C@Pq�N���@S�Zq�%�@W�U�c�@[�LeY9@_Q:�W�@bv�o�@d�1�C�t@gh�M���@js�dR%@m�;l@p����t,@r�Uw���@t�����@v�q8� @yѿ(�@{v-=�g�@~�=)��@�g01D�@��O�B�@�dT��hX@��=��y@������@��S��`�@�fh�=d�@�a���˖@�u.#o`@�P�*��*@�t]���@��=�,�'@�ፘ��@�,50�s@��X~6�@���c��@�]�;�]�@���L�,@�m��/�@�
�;��@������@���
m@��"�_5�@���__`@�w�B�~�@�pk�h�@�pk�t�~@�w�4g        ?�����"�@!�܍�@;3�k?#@MK8m) 6@Yվ��@d1�ܔ�K@m09ao�@s�)��߳@zG���$�@���iAH@����;E�@���ތ�@��
�}�@�7��,�@�^fH|�G@�іk��@����bI@�Th���@��jJ[=@���`�@�y��{�@�7����@�&�L��@�$Y��o@��u�
u�@��\n\�@�s_x��k@�oDK��{@���9v@��[��x�@�v�t&@�D�ﻼ@���}vO�@��}�@@�UR�M��@��g�R&�@�a+8S�@�ꩰR@ʵo���@�{���u@�Tڥ*�,@� �T��&@� ��=�7@�*0���@�=�[c@@�[><m��@Ղ�a4H@ִ�0�@�����	�@�7���
�@ڈԄ�[@�䐱���@�J�=;��@޻�LfDr@���>I@�� M��B@᧤�^�P@�u����@�IMEā�@�"^|=Q�@� �/���@��	KvAY@�ΣL�M        ?�}�z?�;���"?԰�Fw�
?��;�rB?�@�+���?��r�7@��,Y@��ۓ.:@`�֍��@�{lKrp@���EJ}@"�O�xw�@&\��0�@*mQa��@.��w�=-@1ԗ�x�@4j�	:7F@71dz�7@:(Ac��!@=P�[م@@Tę�-�@B�ȡ٦@C��BO��@E�r뵙B@H�L]��@J0���@�@Lvm�ԣ@NՖwR�h@P�
K���@Q���'��@SE(��6A@T���RI�@V�\���@W���b�@Yce��S@Z���tt7@\E���*@]�ۘ~�	@_�]�֮�@`�'`�@a�J7��@b����@cv~��=8@dm�W��@ejaMX,@fl�!.�@gu:,�@h�k�}@i���"3o@j��Fו�@k�H�c�@l�8��@n&^��[@oZ9l&��@pJ^�|�@p����I�@q� iU@r6n�0 ~@r�K�J�@s��j���@tA_�H(�@t���H�@u�SҺ:�        ?����?����"R?�t�>q?��G#E?򰻅&�q?�Q�
���@f��Mm@ [b�@�H]E�@!�;�,�@(֐"��@/�K�r+{@4�ݿ��G@:>��w@@v����@D^�3YY�@H���׸@Nm/� �@Q���*�;@UFF�@X�;�z#p@]� �r#@`�_,Y�@cJ�Ipx@f(���@@h��<�hW@l0��t�@o���Y@q�Sੵ�@s�Q_y�@u�6��\)@x-1M
��@z�iׄ�@}@ ��I@��8(��@�|aE�?s@��8�@��+��d@�l7X���@�?��j��@�+E���@�/S��@�Ll�J|8@�A�S�a�@�i�yC*L@������@���^�@�4XB��<@�����@�8�Mj�@����r"@�]P�@�@��X&�F@�VC9,@�
#!e�'@���QG�[@��\І�@���K��@���t>nA@��s�;o@���"�@�!���@�K{b l        ?g����^�?�4P�*�?��6�_�?�,��2�?מ�G��?�|�P?$�?�X3`S@ A�sr]@	o�@c��o@�9���@#<Q��u@**n���@1]�YE��@6�4y]�@<à�f��@B	|b�x@FBK���*@K�+�vk@PQM���Y@SmC���@V�1����@Z�{�uy@_m.e�@a�hj @dhk���@g0"�~��@j3��h�@ms.-G�@py�;a�@rX���2�@tYFI6`�@v{��B��@x�6�` @{'�	���@}�����@�1����@���rg�@�=�<�@��Ba��@�H%60��@��u���@��,�.�X@�����	@�����S�@��.'yX�@��Lނ�)@�遾L�@��I,�K@�2H��W\@�f��O@��8Q�C�@���7rE�@�@(�%$8@��"\<��@�絲�@�z�3���@��2���.@�As	��7@��F��"@�����:@���,l�@����
�        ?��(�<@+^8���@D���49o@U�m-/H�@c(��Z�@m�jM�S�@u@��� L@|�t^��{@��)�A(=@����+�@�K��@��Є���@�*���@���ބ�@�������@����,@�@���9 �@�c<�O��@�	V�=�D@���Հ@��$_N�8@�~����@�'�́c;@�������@��o�0�@����!A>@��}e��@��-3��@�����6@�$Se���@�T�]㩛@�/v�@��/��.L@�+-�@Ɖ6~�)m@��E�&@�g:�{@����E`@�q'�@�%G�
@ϥ�YV�@Ч�"=@с��}T�@�a4�C��@�E��@�/�:EFc@��f7}@� ��s@�����@�s�_@���v@�ri�SW@�-:}��6@�C�b*@�`����@ރ�a^��@߬����@�m�Ps@��x.m�@�4����@�F��԰�@���Q�8@�`�y��        ?r^�%�?�&���:?��޽Mb?л�Rzt?�NY��?�+Y�E��?�Up8,?����	�@ J��0[.@��n֣�@
+N�!�@��q�@N�{�@�ׄ@��N�F@3�T�@!��\H�@$}i���S@'; �Dz�@*,��s�@-R�'PJ�@0V��^�@2G�5{;@4 ��4�@5�l1�ө@8�����@:GD�,��@<�bV:2@>�LN�=�@@���}@BD����@Cj|��;j@D�;W�@FK��\�@G�� 4=2@IdMc@Kj�/�@L�+��@Nsp��S#@P *��Ȫ@Q�4�@R �%|�@R���CRn@T�Xz��@U�8ސ@V!�u�ö@W;�dl�@X]���.t@Y�� ��@Z�Gd�@[��D�s@].e���@^u,W[�C@_�l_�X@`��?5��@a;J���@a����@b�.��;@c^h��<i@d�4���@d�}2��@e�d�j�v@fnA�ݮ        ?Qt��?�2�Z�?����g��?����,?͝��e�l?܈<���?�
��?����'��@ 'h"�$@*<�o�@m� �R@^qwUd�@ ���v-f@&�?�
�@,�(��:@2Q �
5K@7!���2@<�s@Ai��+R�@E�R���@I!"�{�b@M��:��N@QrF�U��@TN���,@Wx	r3�@Z�K��@^�j�T�W@arj����@c���i�@f"���@hÍIlĸ@k�n|��@n�&#)@p� Ae@r�K�݆@t���!��@vz�D'k�@x��^�g�@z����`@}'j�B@���w�5@�w!!2@�ux�L��@����E�L@�k� �@�����@��� �A@�m����2@�B�3f}2@�,��z�@�lw��@�!�^�%�@�8S[�'.@�Z��;�3@��!p��@���H��@�
�h@�^��A�@����3`�@�.6i�ja@��'�@�3��O�@��[��Ѐ        ?`��d��?�/�f?��)|��?�9
��0?���<6�?�8��� �?���J?���݊6@��].�E@	�+��H@
</s��@�D�b�@ ����(@%�Y)@f@+�����@1�LҿKV@5�^~�@:��
��y@@]�0�n@C�ʾ��5@GU,�+X@KwZ#6�b@P�x6@R����@U\c=��+@Xi�4�I@[�h�{�@_V�6F8/@a���P�N@c����J�@e��D��@h\<�B�@j�\� @m����"�@pD��F�n@q́Re@si��k�;@u����@v穜$6W@xȇ]7�2@z�y�@|��E���@~��{�&@����h@�ƣtӵ�@����L�n@�C}��@��#~�n�@���~���@�\�bj}l@�ԛ�+�e@�Y���,�@��o�o�G@���Z�S@�}p	�@�����m@����)�@��]PU�@��"y�0�@��G�NG�@���P��@���2��@�ڼՈ�        ?���%���@p�YUH@'y�^NՂ@:&H���@G��5�Y*@R�qI��D@[A��%ێ@b��_8�@h˚�0i@o�zC��@s�'��z@x3�0��D@}Y��:�@�G9}�@�D�o�Mu@��ᯒ��@�l-&�@��f�Fm@�����Q@�؁�J�n@�D�P�B@�۪��Ϸ@����dY@���F-��@��7�v�@�y�po��@�5�x��@���fG@��l�#Y@���a@��3�;4@�71���@�>"2䓹@�lLc54'@���Dt�@��K���P@�<(���@����Bt@� ��1�@�txƨ�@���ƺ�+@��/�@��|v��@��g|�{6@��J���R@��3�ފ@�r����@�[�!�@�I�f�.@�>)heA�@�8N�Ħ�@�8`Q)�@�>j�Ғ@�J{����@�\��-y@�t�^^�@̓�5��@͸���G@����?7@�
�h�0@Ц��:@�FT��Yh@��o{�        ?|h��q�S?�	�D�+?�`��n�?���ߓ%?���Ο�?���ُ{?�8�}��@�URݞ�@�PQQk�@�&>�`@G�{�n@��fP��@��n�@!?~�·:@$[�>���@'�9G/�Z@+���p�k@/�|��	@1��:��@4[���@6薅���@9�X�[@<��\��@?��|:E�@A�0��E�@CG�4Q�@E'�0(,�@G#o�i�m@I<���@Kr�w��@M�'z�@P�k>�@Qe�ŚG@R����@T("�	v�@U��>^�@W,_t��@X�КVH�@Zt��5ݮ@\3!�UQ�@^ۑ;�@_�/����@`�%ŭ�@a�O���@c��A@dn+O�@e<��8a6@fh��@g��}Q\�@h����ñ@j)F|?�@k}K n�@l۶1�_t@nDq���B@o���uQ�@p��?N��@q^�E�i@r(�\O�m@r��_��@s�eks6�@t���lĎ@u��n�c3@vl@C�a        ?^n#�=w�?�u�����?�aS|�y`?Ǆ}�?٬����?�1�
�?�R���ݱ@T�İ��@
�&����@���a,2@�C�N@#gD����@*�"Γ|@1-�M̥o@6&�9�^T@<]2Hֹ@Aә�#@E��)��*@J!���@O_�Y��@R��.U�r@U�|�D\-@Y�}�V@]��5���@a��a�@c�����@f/��Ea@i�mw@l1϶I�@o�d���Y@q�Q��e{@s�ƒ�}�@u�t��]@w�C�0�@z8��@|��"�.@(��~�@���{D�3@�jl���@������@��"�̱@�A��Ǟ�@�	9ct�@������@���m�i@�����@���P)WI@����#��@���R���@���p?:@�:�v	��@�����E�@�ỎD��@�H����{@��%�ؕ0@�>���=y@�·�*�@�k�]m�X@������@�h��X�@�L��d��@�8|s�R@�*��_�        ?��wBwby?�E��7�?Ӕ�ه�?�~�t>s?�^,���@-��,@Y''�@�޳��@ DPj���@&�"^���@.jQοǞ@4	��ؼP@9�-� @@j�4���@D�2t欟@IA�z3G@N��P�D�@Ry����F@U��P�{~@Y��G�@^Y���0 @a�����@dO�/�@gCwͯɈ@j}�B�@n%�`�@p���M�O@r�Y��~�@u-��<�@w�B���@z6=�@|Ψ�^@��^إ@�a}�&�@�a�B$q@��-_��Z@��r���@�r��n�9@�u�K�N@����%U�@�̽��Z@����[@��:�$@�r2�\�@�j���@�ѩ���p@�I���4�@����4�@�k�G�@��0���@�ә��+@�����@�� V��@��[�
�M@��57I�N@���Ғj@��[��@�[�<�@�3���bu@�j���^�@��J��H$@��&'��@�QT�BN�        ?�$kJ$0@���Z�Y@8z��sL@K�vT@Y�{�چl@d���S<�@n�X���@u��W��@|��L5�@���WA�@���q@�,� /@��~�-��@�3*F���@���-O@�P�G@���V�m]@��Ť��?@�H�����@�D7��@�{iT��@��O�&�@�҃N��#@���ݺ��@���&�@�+ ��Τ@��wI!�@�̔si�@��Z1�[�@�M�TY��@�̇�&*[@�_���1@����J�@�����@ɘP�P�@ˁ���7�@͂/.���@ϙ�kX��@��~*0@�V�(R�@�8�<C��@�u�`XZ@տ��/`@�hy�6@�|�+�e@��`�� g@�rF2�:�@��ѳU@ޡ�^�..@�(��V�@���9�@����%/�@��繵<�@�Э H�@��Z0���@��@�@��ߡ�3@���l��@�|�@��@�=���r@�mY�L�@����@�績���        ?����I?�cj�F�d?����x?��0	]�?���#�-?�b�Ξ�@���[e@|?�gP�@�B�B3�@��^	�@��>���@!�k�@%fo���&@)+C�
��@->	�=+�@0�H�_'@3&S�h�@5�{�@8H�2k�@;U�ň�@>P����@@��Z��@B2Y����@C�����@E�5n�4@G�a��&@I��a,@K���@M�2{���@O��s@Q����@RJ�O�-i@S�r�@T�y6�@V!�a���@W��}�@X�r��@Z\s��Ir@[۔�t�)@]e܉ @^�T*��@`Nm���@a$�@a���uO@b�4��L�@cȘ��S+@d���@e����3e@f��*�@g�d[�n�@h��Aw)�@i�V��@j���f��@k���0{@mG�G�t@n=�B[@op�R 0�@pU��S�D@p� �P��@q���E�@rD�o@��@r�k��@s����        ?hh�A�x?������g?�ou�?� \#?�$*���?���;n�?�B�J��@ &���@��utR@����A@}5��@6��M�@$X�O�Wq@*/Xk���@0�{��@4���Æ�@9R&��ϕ@>��*Dy@Bg����@E�C�M�G@I��K"@M��'%TE@QIZx�f�@S؇=�_�@V���.?�@Y���j8y@\�ߴK�@`=@���@b#[ۼ�@d,K��s|@fY�X5�@h�ɔ��@k"d-]��@m���ʃ@pC����@q�y��_@sH?;��@t��ƥ#@v��؆;V@xq��R+�@zX0x�@|V8�Jv@~lC��@�M�y��@�qȽ�2[@���*@�@��2kk@�,�'���@���c� @��!B�W&@�dF���@���&[�@�|/Q��@��䦓@��InK��@�ɺ�e�@���c:��@��B�F�@���Sƀ�@��5�X�@��io� @����P�@��$���        ?�Z����?������?�o���O?�	U =��?�6�H���@	V5��D	@�ȡ��@v�sgX@"� ��@(�8��*�@0���Փ@4f�V �2@9�VX��@?���ND@CKr��` @GJxWC��@K���` X@Py�� #c@SX4����@V�[��i�@Zt��q@]�<Y	�@a�2j;�@ckȱzQ�@e�4%�2�@h�C��O7@k�H�D,�@n��.7�@q���@r�3ۂ��@t����@v�U)�ȫ@x�IZ��.@{`xd@}v��*@�BA�}�@�GI�sϐ@����!N@@��35<@��F,Ye@��G�q�@��q��$L@�d ��g>@� ��W9@��a��G�@��N�1>�@�۷��7�@��eG/�/@��/�5�{@��U^q�@�����@�&"�?ߜ@�M<���.@�|X���@��l�@�+@��n#44@�9T�5�S@����2V@�޵D$_@��(���@�ѹ+�i
@��ˤ�u�@�C�p���        @s��(�@.q΃h�@H9��l@Z��:��@g�Dӧ�@r�_r#�@z����lM@�,���@���@��XD�u�@�k���G�@�:�d�,@�bI-���@��ޜ���@��u
V�O@�smŅ��@�5�(jB@�"�E��@�;��57@�?"�s�Z@��F}w�@���U�@��ZL�4@��k��;@��O)J�]@��*�kn@�	&�b�@�,�g�@�`��@�N��2@����2@�>���@ƞ�dg�@�Ufqp(@ɃeUyK'@�&Zjt@̖�����@�1�:�}@���_���@����k��@ѥX���@ҊB���@�uH��f�@�f4�K�@�]o�Ֆ@�Y�4�V@�\�I1�@�f�gbF@�u��a#�@ڋte;�@ۧ�y�@��	g.!d@����-@�%u��%,@�.nc��@�͊-|f�@�p���@���q�@�L7r<@�k�0�C@��y*C:@��N�p,@�����        ?��1���C?��OI��?�[�XUQf?ߡ�qe۫?���H[U?��щ�v?�~<O�@5@~�	�W�@*��L[8@��I��@*��W@�]�8g�@ ��2�@"��.q@&!f�5JV@)��Vl@-;˅��X@0�Ҩ�/�@2�I[
�@4�����@7k�C*�@9����c@<��IX>@?�D�F��@AP��ߢ@B�m�'@D��M�ޥ@FY�ݗ<�@H1�F��@J+b�@L�!� p@N5��&��@P1W_Vw-@QR����K@R�۔�@S�%g`��@T�8pٓ@VK��L@W�A��U�@Y�x��@Z��� ��@\��d�@]���m��@_)Hq�T@`h%��N@aBe��@b#y��u�@cs�Cy�@c�_�Yb@d�H�Z
�@e�;�xv�@f�I�B��@g��9��H@iE��@j(���1@kJnH"�@ls~�2�@m�K��{�@n����	�@p�=$�@p���<$@q[eYt��@r�(]�E        ?d��/���?�k���?����!ʧ?��][�8?ۍ���ǂ?��:�c��?�P�^�)]@��j�1@��PHRu@W��h�@�\[�K;@#�*F��@*����q:@1mmZ<�@6\2����@<-�D��@Az/6P @E`@���@IЧ�0M@NӤ����@R8:�H`@UW"���}@X��>�@\�nUP@`\�(�ک@b���Sy$@ed���|@g�ߐ�s�@j��כ�@m��U-Mu@puK���@r6���H�@t����T@v�c��:@x4W�,��@zs�@�={@|�EV�{@Y�`4b@� #�f�
@�e �]�@���Ӳ�@�h����S@�}<�@���D�N�@�}jk�@�V[����@�D6tj��@�#|�1�Q@�/��0�@�Fi*cE�@�h`�'�@����֜@��t"��w@��w�N@�c�xQT@�������@�*Dz��@���Y�h�@�$z���@������O@��^d��@���r�`�@�^�?�        ?���t�?��Y(� ?�Wl�?ۢ��&�M?�_e�wp?�~�Ǖ��@ՃD�c@
��P�@j��%�E@3����@"��m;�@(��T���@04A�w�@4���\��@:��\�@@*�w��@C���j�@H�o(_�@L�g|��@Q}ȯ�B@Tt>�@Wj ��@[��j3j@_&���:@aəL���@d1}&f�@f�Y:�N@i��Ġ�Z@l�Y��l@o�L?��@q���aJ@s~����@ur�9�@w��'J��@y�j܍�@|��@~v �i@@���j; @�ݎ\���@�H����@�ś���@�T�z���@�����@���p�r�@�tu��`I@�Q�:�@�B��¬@����OP�@��F��2@��g���m@��q��I�@��n%D@�S��F=�@����3y@��^��[�@�E��jB�@��/�>[�@�"�uٰ@���_�u@����]@��;���@��Z�@���ƦO�        ?�Sgy�>@!�pD��@;m�t��@M��`s�@ZJ�(���@d��6e[@m�u�@t4L��/�@zty̑�_@�ʻ��� @��_(�,�@�H_�L��@�<[��s@��)6�^�@��X��"@��i)U@��˭��@�^�����@��� ��@�����n@�Do���@���y�!�@�m�R��@�?�*�+-@��f"��@�/�z�R�@��ф�h@�����K@�c8F}�@�H���@�C�4>մ@�T��h�@�{��$�@���Ý��@�E��@�=��a�f@Ā$�J��@����v�@�*7k�O@Ȓ/����@��/@ˉ%�0M@��c��@ζ	���#@�0��@��>�E@���ց��@��p4�JF@��uڕ�B@���Gb�B@���#{�@�ֹ�Q(F@��'!P�@�k�B�M@�"��N�@�K���@�}E	�_@ݶ�p�ә@����'�@�!_���@�ʇUG�@�w����@�)%ݴ�        ?�����?�=tv	*?�~��,�?��WT�u�?�,�C�!�?�Ɩ���@N�};�@���"�@u!��@;h�8�@��U�@�?8r�@"c����@%���.`@)rL��@-p\���-@0߽�D�K@30��3I�@5�*؂��@8S��S;@;&\��@>'F:��@@�x�jo@B[G-Qg�@D#��Ǌ{@F�'�i@H -M��E@JehS�@LE=���e@N�2:�D@P{_�5s�@Q���q�@S_Rp�d@Tj�o2d�@U��)�N@WT�����@X��3w�@Z|�ĥ��@\)*���@]�����2@_�p�D��@`��J��@a�lȽ�@b�f�3�!@c��Un��@dٗv�@e��s���@gX,��@h>F��)�@ip�g;|�@j�6}�@k�:�&�@m9����@n�u��@o齑ڠ@p�E>F�@q]���3@r�0�@r�~���@s�fz��
@td�	ϥ@u1��YY�@v�O�        ?s�=��?���8.l?X�+}m?�O��d?��<L�?�;��oJ@���S z@��cD�z@|Q�a�@ ]Gu�D@'�Wz�@/p��;	@4�D&r@;E���`@Ak�P�O�@E��ls@K���:d@P�q�GK�@S�^�$�@W�H����@\)��Ã@`�Z%Z;@c.�Ef��@f"�s�p�@i^�@l�Q��@p]VKW2@ro|��w@t���ݕb@w�d �@y�s��R@|[	�[�d@C$�z�Q@�,C�� �@����,6@����e@�W��Q_�@�@Cs�8@�@�gww@�Y䔋�@���k*,@�kR]�t�@��gX+�F@��Cż��@�(d�@���f�%V@���O.@�ZgV�ҷ@��o0��z@�j@��XK@��Jԃ@��0sʱ@�5�U���@�#8�?/@��mq@��l����@�����ˌ@��8ω�a@�ײ���@���~2�@�4VeËb@�Y��5�D@����E        ?��F��[?� ���?Ϩ�W�b�?�Eh�H�?�c��q4�?��g���@A��h�i@c�T�o�@� ��}@!fj�$�@'�A��z@/FT�@4Q2��@9�kkϑ)@@L����M@D2��J@H�=0l�@M�qè@Q�=��s@U=k?e@X����Y�@])V*d�@`��Q/@cu;�J�@fE@��@iXH$(�-@l�ã�7�@p)���d%@r �L4w"@t=��p�@v�O���@x���o�@{�T2�(@~JfY�u�@���w�P@�(�5Z�'@�������@����� @�V�(�ic@�?5�!�@�?�m
@�V�E��@��sd�f�@��7펕@�q��S�@�S�ĩ�&@���ˏp@��\ߎ�@�TR��f�@����*@�>�H�2@��b�X�@�Z��T�H@��E�M@�U\GP�@�3�kO�@�K�	!�@����(@��m�`�q@��c�}J@������@��6�U�@��]��        ?�\����@(#��@B��5^"@T��-ߘy@bOv�@l�����F@t��+G@|�.�:��@�� 0���@�0�P�@�X�=�@�`��@��U%�7@�EMU;@��:���@��B�?��@�Lo��@���a(@�&���@�f��Nn@�o���@�H�^!3@�?o	I�@�TL>��@���1E}�@���R���@�M���p@���;z@�J�`��@µ��OP@�2W�>z'@��W��7�@�`Vf�y@��8��@�׾���Z@̯�`j�@Κ����@�L�ü,j@�U�Qz,@�h��<u@Ӆ����.@Ԭ��G~@�ݴk�w�@��hp@�^����@ٮ����@�	M8Ԁ@�m��8{@��4��A,@�V�kK�@�m�k�@�4�i���@�W��]@@��TٞT@���Xe@��Yk@�g|�׊�@�N�TК@�9�A��<@�+"�䶢@�!���@�S�ЯC@�[W�X�        ?�B����?�L�����?���'O?�E9�)&�?�ܦ0z?�	��P@r��<F�@�3"i@��"F�@ޛ��@�H@~-�|A�@"G����@%��,h�e@)@��$0@-4�ʍӛ@0�Ҋ�K:@36�D�@5����;@8'�o��@:�sX�:1@=��M
�@@�n��@B>�n��@Da�HF�@E���@G�]�Ш�@I�ŷ�T@L�O�@NS"9��@PWԑT;�@Q�8W�@R��q��l@T2�|�@U��`���@W��R@X��ќ�D@Z<�ة�@[�b�@]_k/ڞ@_�pZ�@`rc�2�@a_&�,�@bS�Xt��@cO��7�h@dS���i@@e_�O�@frr={��@g�����@h��y%�g@i�9�Bn�@k�Gpb<@lKѯ��=@m�b���@nݩc�]Y@p�6P��@p�wӁU�@q}��+��@r6h��@r���:��@s�D�c�@t}x3���@uI���UK        ?y����-?�m;�_?��� �T?�b���e}?#.�?�S}>�@�'1��@ <	��@)�:u� @�il�6@$���+��@+B�����@1�� =5J@6mxst@<XL�Vl@A]��[�^@E3�,u@I�&��JZ@N��@R�ۄ�R@UA$='�@X�� `��@\�nHv9%@`o+*݆@b�#H݅�@eI���@hvJJ��@j�Io �8@n0l%s]@p�6��Oz@r����n@t���1@v�?^cS@x�s ��@{7����@}�c`��R@�'�y�ߖ@���WR�8@���i&|@��9�ۘ�@����@����9�@��P�3@�l��_�@�[��'E'@�`E��P�@����^BN@��hH��]@����mB7@�*�]�m@�fi��l@��>F�'�@�M��ݓ@�b�}�WB@����}�@�I�A�ɨ@�ЕO>�@�d���a@���À�[@�Zn${f�@�8�X]�@����kI@�
9Ό�0        ?ͨ�/�2?����?��m8#V?�*�J.?�6���T�@�4-��@��U"S@��ǤP6@�nV:�@$Mof�ݑ@+Ɍ$
�@1�kue��@6��܅�S@<e�G���@A��S�o@E���ݜW@J
fA��{@O);c�"\@Rw��fݭ@U�U�(�N@YL���9@]HkTO@`��_1&�@c=Tpl�@e�?�X��@h�ԃ㷡@k�]� ę@o&*7΍%@q_H��b�@sM|��o�@u^�z��#@w�ٍ|�@y�z_��@|swܳ[�@ޒ�EI@��0LM@�zR�:�@��!� @��8p��@�����%@�` ���@�U�@��@�d��0e@����a��@��|R�%�@��H�©@�T��.#�@����D�c@��d�!)]@�aʕ''@��U j�@�`^3�$�@��Az=��@��Z��&@�Vh�Q@��I��X@�|3�o�-@�q�D���@�p�c
R@�xk� sW@���)œ�@��#��w�@��[�O        ?�c�~!0h@&A�C'�]@B���?�@T����@c*��%D�@n�m�uZ�@v�:-���@<�)��@��!�9Q�@�j�0��@�t�:'�u@�^9�N�@����@�t<�t@��,��@�F;�b@�)ٶ!2@�(�?@�n(���P@��E�w�G@�Ե���@��B�$|@��=ۜ@�# ��m@�{u�M}$@����pn@���)��@�#�dն�@�g/j/@�Z�Ck�@Ţ��Rl@�Fv\8�@���� �@��Q~�)�@̣P���@Δ3$��@�L�˛ N@�Yxy!l�@�p��~�M@ӒU��\x@Ծ�$��5@��Rfٺ�@�6�l$@؂�%@��\�8U.@�:�G�@ܦ���5@�h3�`�@ߞ��7,�@����ݵR@�am�m@�2�Mo��@�	����@��
�`�@��3:4�G@��A8�@杧�bb@�S+U@�0GL�@�8t�٧@�+��@�����@���        ?��q}�?��G(х?����z�'?�=�jT�y?򶲹�A??�O�J���@:�Pgs�@v�,�@%/ɻ�@jd:���@am-@"�x��@&>L@/$�@*V�X.W@.Ԧ� @@1�%p��@4��r\��@7b���@:wo�t�@=�a̷t@@����#�@B�9��3@D}�z.
s@F�J��@H̒-�j@K ����@M��:���@P���@Qkyj��D@R��:T�@TK����@U�(g`�@WlsB�ZT@Y`'j�@Z�"���Z@\�$r��@^v8jQ@`1�̷l@a1Ə5=�@b:�s�R�@cL��\#@dgג�|@e��.p{@f� f �@g�%͚�@i6'a��@j�BtT@k�"�Y�@m>"a�I@n�w�@pɶ�@p�F�Ub@q������@rk�ca@s?�*L,@t�2G(�@t��6�@u�U�S�@v�VA�@w��P<@x��UR{�@y��z�@z�e���R        ?z$	��L�?���k�~�?�₄^��?ڈ''��?�R��J?� ��;�@�����g@��-��@ @j+@�t⮒<@$^��v�{@+B��<�P@1�:��3�@6��AW�e@<�Nk��@A��3M�@F
����@J���1N�@O���N�8@R�o߱J@VKJА?}@Y�F{J.$@^p�l��@aJ���@c�u�\�4@fs˧l��@ia��#��@l�4U�bt@o�L�p6�@q�$-7@s�K��@u�с�+@x9�}�@z���G_@};+��@����Z�@�o�č�@���X�s@�������@�L���n@�����@������@��Z-سX@�	�=�@�t�"@�<��ُ@�j�ś9�@�����Q@����Ѓ@�D5Sͤg@��^�W@�1�S�@��䪮M@�#��\݈@����S�@�h�W7@���E��@�shTkr@�^9�x�@�P�\/��@�Juok*@�K�'R�r@�U.a�        ?���T��7?�d�~l?����x�?��๨l�?���s��?��1d�v@���Y�@�T�I@Վ��@�0z��k@%�R��X�@,�X��,�@2�	�EJ@7�x<1��@=���\�@BZ,wD�@Fn+@���@K�;G��@P4��25<@S2d�֑@V���&Z%@ZBш�Y�@^^aX�+�@ap�	Q��@c蘧}N�@f�Kc�J�@i��o�@l�����@p���g�@q�Z�
�@s�6qVG@u��|?�e@xm��{@z}A�U�@}z3��@�2�%�@�C�"FH�@�Í�S�@�X�|��H@��(�B�@��w#@����0@��W&�t�@����\@��ݏ=v�@��7�O@�X��c@�9���@�s�1���@��b��@�
yo��.@�g9�~Ll@�Ͻ�^}�@�D%D9�*@�Ĕ1�C@�Q1�Cѩ@��'Fei@��ω�/@���/�;@��`���@�f`@�R�4n�@�F'��(�        ?��п�,@*E	e�]�@Dv�Z�@V"�#���@c���Δ@n�0+��L@v3���@~RN�T @�݂�1n@�9��5�@�Bn�a@��#L{م@����t��@��w���k@�E� �?]@�q)��@���)O�@�����f�@��b��Y@��9EK�@��)R��~@��?�M�@��9^�d@��hmW��@��c1�N@���ܦH@��=��ό@�
�N��@�_� @@���v�@�9~�@��@Ž�-=@�Q�f�R�@���%��(@ʩ�A�t�@�o$(�4Z@�E\�׬�@��86Џ@�:2���@��Ϛq@�()��+(@�@���֊@�c$�W��@֏|v���@��"5��@�yd"��@�S�#s�@۫�uժ�@�ڧ�*@��vHOz@�����z@����.�@���wI�@�_C�*=@�7+���@��uY~@��t��T @����R6@�׳��+@����}@���7��@�ԃ(Ȝ�@�࠴�        ?��/t?ʅ��%?���5�w?�I��[��@ mE�(%@	G	 !�@�uL�н@*�0�@t��(�n@#���}h@(�<#b�@-����@1�A�-�@4�˱|@8>� �%*@;����@?�P�_8�@B@fW*@D]�`՗.@F˅�1��@I_D�k�@Lo>�@N�?W���@Q ��&@R�H����@TCEyn@V�`��@W�ݟ&�@Y����N@[�9��s@]�/;fŤ@_��]6�@a�����@b9��@ckf)���@d�x�t@e��ov�@g?Jo�:�@h�;�� @jOP><@ks�Ǆ]&@l�M��W@nx��G�@p��b�-@p�9��@q�+�$@r��蚯@sd�7���@tJ�L0��@u6;j�N�@v'oM�@w1�J�K@xjQ�~�@y�|Ҕ@z"�}��D@{.�l��@|?��(�@}V2�2�b@~q�e���@���l�@�[����@���$wlv@���T1?�        ?�_J�7D-?�8�M��?�nC��Ĺ?��lv��?��q���@�_����@>���~�@L����@/!�&@#;�� �:@)�h)D��@0�S(�@5V#�<�@:�x6_��@@��NNE@D}iX�|�@H�^��J@M�h'�@Q��%Q�@T��"H)�@X�_����@\x�/\@`mSu�%=@b�h{�\�@ez6���@h[2�ʪ�@k{�3�T�@n����@qB�%(@s8��x�@uQ�b�@w�{V��@y����@|~�����@07�@��G�g�@��T��C�@��:U@�Ċh}��@���m�x@�X5ĩ�@�Bxv��@�B�q[�@�YJ�ʜ;@��6r$��@��7���
@�ш��@�L.�;V@��y�O�@���ԫ�@�@��i��@���_��@�!��\��@���gh�@�6n��|�@�ԛVFz�@��!	= W@���"�@��a�;�.@�k�_7@�\�=��!@�U���@�V&�)o�        ?r0(R��?�n�?��?�Sz�R�?�*YV�j�?�.1�>^?�\Ĵe�?�A���M@�B�_�@c(;���@&jn��@�%@�f�@$ �-@*����w@1Uk��n@6#��_�@;�6M��@A8R�h��@E	��g��@If/R�}/@NUS��s1@Q��ɗ�@Uv6�:@Xr��b�@\8�ֲs@`-A��R�@bn�~��@d�h2�@g���fL@jf�?Ę@mz��W��@pc�/��@r'�ӭ�@t	X���@v
	ݺi�@x*oYt�?@zkXW��@|͓����@Q�|\@���]�\�@�bA5��@���<4�@�dLd?��@�����@��Ӎ	U�@�w�~b`V@�Q�p�@�?W��"@�!.�:@�-l;��@�D�<QD@�gD��$@��.�k��@�αU�!@��hn�@�e8su�@�S��@�,"���|@�����T@�$uTm��@��hZq#h@��~��@�{����@�V.ï�r        @p ��@7=ў0�Z@Q7A���@a���Z�@njp���@w];M�:F@��*���\@����tɨ@�H� (�q@�{L˅@�Ȭ��V@��f��ӿ@�h�t�@�Iw^��,@�joCZ@���⤐@�r�۟�@��Xse�@��d���@�=S%��@�`o��?=@��C73uB@��@��l@�[��v�@�(N��eG@µ�ΡN@�W�2�@�׆gn@�Ԉt�%[@ɱQ�ܯq@ˢe:j��@ͧ�+��j@��-�]�@���4��@��
�S�@�GxO��|@�~��-U@��?�z�Z@�x�
�T@�f���R�@���'촟@�8Q /@�@ܱ�nE\w@�6k�J?�@��+v�1@ఄ��nx@Ⴢ�E�@�\C���@�:��O@��^�ky@��᱃d@�����@����Z�@��Ӹ|�@���!��@��\G�
7@�����i@��dǄJ3@����@�#�ҩ�@�@��|�@�1X�9��@���l{        ?���"mr9?�9�K?�,]CЀ?�O�x��?���tCX�?�6eM��?�4�a��@�ߗ���@
;[���J@��r�[@�e���/@I�ߋ:�@O�+@!�q� @$�?{�]@(6���@+�Iъ��@/��ȧ8�@1�(��Vu@4n�F�	@6S�'�Z�@8ˤo-v�@;i���6@>.�j+�@@�Qe�y@B��\�@C��-�@EoHs�w�@G9� ��e@I2���@K��P@M����@OA�v@P���z�@Q�,�l�@S��ٔ@T_W��
@U���J��@WS�S��@Xl�C��l@Y�ks+�h@[_,p�X�@\�!ьz@^�;F��]@`�H_�@`�31T@a��8P;@b�\�f�@c���Px�@d��� )d@e�(x$f@f���V��@g���St@h�;���@i��SK�*@j�|��hw@lv[��@mH���C�@n~-����@o��!�d@p~j�j@q%+y���@q΂�
Y
        ?`��}�Y??�W��	�C?�ەs K?ĊQ�$�?���̪N?�E�J��?�iE�^w?���c�@�����@ �2|�@�fM��@!>�!�@'v�]��@/1>1y�@4O�wO�Z@9��уK@@U��)ƶ@D?�3)��@H�y���a@M��-0Ș@Q�'��@U3��U�@X�p�k�@\�)���@`����w@c1A�m-�@e��[��@h�G/�Μ@k�}f�@oU�4��9@q|���@sm��B@u~K����@w�u��3@z����@|vr���@�.��@��h��@�MMق�@��t����@�X� I�@���h���@����	j�@�jd|b�3@�=��ڱ@�"�DK@�쓠@��$�Y�@���~�@�3�ۘf@�S&��	v@�{�n���@��lg��@�����@�-W%�2m@�{���F�@��ը�@�5�>��m@���OA�<@�$�a/@��}I��@��ʫ��@�]�9�        ?dD�,��?���x���?��O��d�?�����ˊ?����QK?� �t]?���D�g�?�*��G6�@�� �@�,y��@˫�4�@ Z�U�_*@%�2�@,�a�b
s@2}l�|q$@7`#�Q��@=�_���@Aݗ.���@E���i+�@I�	S��s@NѦѧ��@R��h�@Ue����@Xf�:Y+@\,8_��@_�i�:��@b�F@d]� ��@f�I���@io�C>�U@l9�r��@o/�=[u"@q)r�,�@r�l�~��@t�"���@vbI]�~]@xL����@zN.�D:_@|f �r11@~�ir�@�l�w��!@��s�'�@��u0Q	7@���V��@�g,L���@���p]��@�'�gݝ$@���ụ@�4� ]|@������@�/��@��z���N@��YB���@���?���@�uwN���@�Z��K~s@�F4��@�7���K@�-���s@�*�~�M@�,D�ڙ(@�4J?���@�B7#d �        ?��}X9@����+<@4���k'�@Fd�-�c@S���S@_5�%���@f�*A��@n��)�&�@tc3$�@z '̌�f@�.)�@�@��Z:�@���f��@���@M�@�mz�.\�@��=�ٛ@��	�V�@��L;�h7@�5i9O0P@������@���+�u+@����։4@��I�u<�@�2�7ei@���2K@�*�����@��t�g��@�Y&�RZ@��h䉝=@�f@�h:�@��G�6@���|�e@��I�As@�d��5F@�U_�"@�Yt�Q�@����>��@��A��,�@�����Wq@��X��@�K{_���@Ɖ�:�e�@�Ҍ��9@�&g/�@ʄY?���@�������@�a�0�52@��d��?@�62@�#_|��@��Ԑ$`@Ҩ>"�@@ӄo�N��@�f{�-��@�Nvf��N@�<t�"Y�@�0�B 0^@�*�\CU�@�+`����@�2JQxd@�?�4��@�S��{�n@�m�ϭ�7        ?x����
?��Xv�G?��V/{!?�W/�
i?�i���?���y!�?���[P��?��F�E'@DQH �@c~Ń�@���@�J!:�@b�)��u@7?�@� @l�߷/?@ �v�!(@##M��@%�X�B1@(�#��_@+���?~@/
2{;)@1KM��@3.����@5.�7�2�@7N/�q�@9���[B@;�-����@>j!C���@@�� p@A�,��<@CX����@D�lc�@Ft����/@H����@I����JM@K��%0ic@M�!.�u�@O�����@P�QI@Qݙ���<@R��C�@T����S@UK��j3�@V������@W�L�2F�@Y�"�G@Zt�_��3@[�h Չ@]L�|�:�@^ʤ����@`*w%�@`���F�@aő���@b�B�K�@cx�1IH�@d[rx��[@eC�+e{@f2J��j@g&�^�'�@h!��)�@i!��T�?@j(K}��@k5k���        ?]�l!m�K?��n��?�~j��y?�[�r�?���69�?�C�x��?���EYb?� M6s��@l-vl@�K��l@�g�r[z@ �����@&�/Bj� @.=;nB
@3��j�!�@9���I�@?u�)�@Cq�K���@G��S�@L����1�@Q+k��@T(.e�S@W���O?@[p��?��@_�+��R@b%�Sm�@d�����`@gj�䎂@jcl�7J}@m���I@p�%��@r]�=5o@tW.��y@vq��s��@x�O�Mج@{�}�D�@}�rZ��@��(���@��v.�8@��;v��,@��l����@�+dVd��@��y�U�@��J���@��M��J@�{���l�@��l�y��@��k!bo@�����@��sc�@�A{�j@�}y\m�@���#WD@�G�[*O@�w_��@��m\��X@�Y�,sh�@����^�9@�ly{gp@��3V�c@�X[p"j@�2�P�`D@�KW�д        ?Xز7=T!?����ˎ�?����9�C?��GPT3?�hit�z(?�Ο\8�M?����(n?�o�,{�@��L9U@u�NV@t�����@y�1L*G@#G���iE@)|��`�@06�Vȃ@4����(@:5K���@@%f���2@C�a\!~�@G�#���@L	��1@P��q�`e@SW�!��@Vm�����@Y��q}�W@]�{�b@`�j��B�@b��Ր�>@eX�m��j@g�4��؂@j�T�;L@m�vB;�.@pU�0e@q������@s�x��L@u�5��@w�`�xL@y�_��+@{Λ�E�@~x����@�=.����@�}W�׿@����c�@�)�z@��f/�@��;�Z@���@e	@�3l�:;@��`�@��ε3N@�]�2�Lx@��1'��q@���M���@��\���@��QAY��@���;���@��Gh��@��h�@��{�+@�(@��#@�`��A@���1�yk@���~��        ?���J)�@�VO�s@(��C�bT@:�vB�
�@G��3,]N@Rߏ�V@[^��S&Y@b����H�@h��􇞆@ox^���@s�7D��H@w�t���@|�пt��@�aԆh"@��+���@�1���q@��5��f�@�s�;F�@�A{���*@�n�|���@�·V���@�=�w��@��?Y:{@��~OǍ�@�P�|YS@�߉�U�@��}[��@�?J&uL@�_�)�E@��S�4�3@����܎5@�ƨw<@�@�,#��@���� %�@��C>f��@�7����H@���!gO�@����*H@�C��2@��1�g��@�6�:e�@��o���@�` 0c�7@�	�v�b@�a"�R#�@�D�9R*`@�/�Zf�@�"Ȳ��@��O`�z@� ?G
�@�*�ؕhK@�=�cG�@�X���)�@�{Dy�/@ʥ�C$�@��fT&Di@���m��@�T��0��@ϞYՆ�@�w�?t`a@�$�_-&@�՜��Ig@Ҋ�A��"