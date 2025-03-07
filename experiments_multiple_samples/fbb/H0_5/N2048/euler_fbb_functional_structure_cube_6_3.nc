CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T103938        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?ev����?��z�O�?����X4?�}f
���?�ڝE��?��U�?���kǽ@�Z��ql@	� ���@-vƟ'�@C�V�9@�A=��o@�:ܝ�8@!�*�ώ�@$�x����@'����H@+V��$�@/	��{j@1}=���@3�^���@5�u��H@8�1
r@:������@=&�dw@?�@2�@AS�3��@Bʯ���@DP+L���@E�f����@G�n��]@I9a;��@J�k����@L��:
�`@N��K�eC@PM�G!L@QM�Y��@RV�I�@Sg�KH��@T�P]'�@U�sP��@V����@XB�=$@Y<�C[�@Z�
~�^.@[͟�)�@]"��Y�i@^�`R2@_���@`���C @ae`gd�@b$��f�@b�ue*@c���p��@d})2��@eM��Q�@f##[@f��7�\�@gڈ��6z@h���wh�@i������@j��=�@k}���C@lq�od�~        ?8C��GD?u�	
�Z�?�C&� ?�1�vY��?���ǧ�F?��$u0]?���1��?�m>*<��?� �z���?�%�9?�9�)§?�4f�B�j?�cL2�z?� d� ��?����S@ ^����@Uj���@�}E��w@
�?;��@����@�j&x��@w��6$@n��E @�7�@TFŜ��@!(9')��@#Y��,Ƥ@%�!��E@(e���ъ@+GJ���@.iS��q!@0�Aft��@2�4�'�l@4�'7+��@6χ����@9�J���@;q>���@=�i��?�@@PebM<�@A���yͤ@C.w��@D��0���@FQ;$`�,@G�Y.~@I�����@K�Ҝp�s@Mm��0�@Odo���@P��]�J�@Q�;{�@R��O��@T�����@U?����@V��Z�}�@WϮ|4�@Y,�|/3@Z����
F@\$(@��@]�Ş�0�@_5CM�@`oK��O@aLO���@b1�y�3�        ?y�	�F��?�We��;?��L�4?�0Ls_j?�}ܭZs&@��Ѻ@f-K&�@�?XG��@Wl�Չ@#M+.���@'ڪ�^�@,Ӯ'?�@1��X@4����@7���b�@:hr�u@=�"��\�@@͋���9@B�3�˝�@D���b0@F��x��T@ICG^�Y@K��
��@N3b�ق@Po>�Q��@Q�}z��@SQ�>��>@T�����@V�&"E]@X?4.��@Z�%5�@[�����o@]�����@`
|���@a%$��&X@bMv�'�@c���x@d��)�@f�M!Tk@g�v�F@h�"��@juFo��b@l���@m���$?`@o^,�D�@p� 1�@q{>PY@rm��#tG@siǙ��@tl�1"��@uy���'i@v�$p�>@w����@x��{��@zq���p@{B�� 3!@|�P����@}��?�D@.o5��"@�H�%�2@���Dc��@������h@�{�ԑ�        ?���q��@&%$"@G������@_2P��>@ox���F@z-��:.@��F����@�����u}@�chh�@���_�m@�NsR�{�@��h*��@�\�e�Z�@�3)ܦ�@�]#�p
@���as�@�VL�T�@���CX��@���h��@��e���]@��-�9hI@����7\@�6Y�@�]�#rVR@�6%���l@�"r-��2@�""�X��@�56�@�[k�@�J=^��@�pK��6�@Ҡ !��@�٬(�Wg@��~�@�jPR�
�@����Y
@�"�;y�@ڎVC�K�@���0�@݃o��6@�=�/c@�O�t���@���\r@��z�"A@������@㣕g@䃭c?@�g����@�Pq�w@�<��$A�@�-b	2@�!�d"Z@�꘱/�@�碷�@���=�@�!'3ö@� K$��@�+��@�����@�â'�@�0��V�@�����@�K(U�#        ?0�C� I�?o�b��H�?��$6�?�@s93\)?�3$K��D?ǝvW�֠?�J���?�6%���?������?�#��F�Q?�3��K9u?����zM�?������r?�����@?�I�ט��@��Ԝ�@.`f��i@�2���|@
�D�Q�@C�Њ>�@]�B�{@6�"�*@-{	l@A��ې�@to��@�!�S~@.�&O@�,���7@!(o�//K@"��8�j@#��&��@%Z/�n�@&�n!��@(a�`��_@)���Rν@+��ٹ��@-XD�$�@/ B���V@0|����@1q�|"��@2o�"�>�@3v�a�@4���F�@5�f���i@6���2.@7�=��${@9"�*��@:b6� �h@;�ŭ�@<�g]M��@>]��/@?�� `�?@@�= �!{@AY*��@�@B78��@B�p�Y��@C��<q��@D��J���@E\��[�@F9�~��@GV�X��@H.�~t�@H�_�k)_        ?"��-zO?c��l!6?��|
L�?�F�R(i?���3?�B� �K�?Ł!^��?�U+�^O?�L܈MY�?�-{�KF�?�l��m��?�3/2��?�v�ʰ�?�H9�j?�]@���?�q�M-�?��vݻ?����C�F@ -�����@��v�=�@�u��8@��v8@n���@@���@�ER��@����h@�J�Pc@T~tOr@~n/�@!'Ъ�s�@#@�kK�@%�,�9��@(��3�|@*ǫ3�"\@-�Bgh�l@0pl�*�@2 ��ag@3�(�"1>@5����[@7�<\÷@9�WN?�J@<?	����@>�!���c@@����c@Aܣe���@C:���X.@D�#1ǀ@F'%���@G��k@IR��H��@J��La�<@L�3߹+�@N���N@P1u���O@Q&b�,�@R"�}n)@S&h�k�@T1p���@UC�|k�@V]����@W~��W�<@X�M���@Yר8��B        ?��+�_?;EN��?^��v�]~?u���?��?b�%?�#
��Y?�4�np(C?�EO	�d�?�aCsu?�k詸�[?��ά�#�?�����y�?�D'W>��?�7��T?Ө��b��?ث�	˯J?޳͐!?���'Sp?�3���_?�3�,;�,?�.�u?�d��w�?�G�OH,�?����cW@ �@	� @ď����@ O3�^�@
�z%��@�W�[:�@��S�/@z"�ܬ@Ћ��@����l@ ����@ ]����j@"S߹��y@$ui��[�@&�s��\L@)CGuh5�@+�6m/S@.ٛ�7hk@0���7T�@2�����l@4nU!A��@6VE(*�@8^I��Q@:�2-��=@<�%�?�@?Fv�8)@@���@BM�fX�G@C��̔��@EH���-@F�*�
+@H�����)@Jc�>֕8@LEe�/��@N?�U21@P(˔M�(@Q>�Z��?@Ra�i�@S��jܺ�@T��F���        ?��x����?���z8�@�6"�1@+`�k��@<�U� �@H��W@Ro����@ZF�L�@a�����@f��v�:@l6TY�@@q6�s���@t�9Ԗ,�@xKf�s�@|D����Q@�D,	��b@����I�@������@������@�LkJr~�@�2�_�i�@�!ZS�3@���0B��@�n�0��@�3ۘ<�@��^2=@���&���@�짦a�@���{�ބ@��p�|��@���vk�{@���	��@��A:-�p@��N��t@��27c@�J%�1@�Hi@2@���~�d@��pЀ6v@�(ˑ���@����9@�����&@�s����@�|�|��d@�F z�w%@��k>�J@��ֱ@���8��@����֑@�����R@����\@�@�D�r�@�|�1{�@���s{@��/t�lO@��ٵ�h7@����Z@��d��!@��Ny>x@�P2\�@�����@�C0���N@�����;        ?^?���R?���šQE?���/��+?дs���?��V�X�?�)�﯌?����1?�iK˭@��3�4@	M=qϕ@�V�tG�@WoF�@7�΋�@sܒ@�3@ �l��9@"�Hjf�E@%/�
R"�@(q#a�^@+
#��@.X�Я��@0䙒� %@2��e(�@4�R}��@6�g�ĥ�@8�X�ĐU@:�b`'�@=L�%=i8@?���F�@A �տtw@Bq��'�H@C����@E=zU�@F���@H@�ԑw?@I�"Р�g@K{���@M.�]U�@N� p#=�@P_�&
w\@QN��Fp�@RD��[�@SA�h�r@TE��BM�@UP����@Vb�&:5�@W{�}���@X�*�wJ@Yä7צ�@Z�]��>�@\(c�ƶ�@]e�`�P@^�`���.@_�N4�Z�@`��NpC�@aQ�G�]�@b�ħ/N@b��^�z�@cn��U�@d)�(�H�@d�\�&4[@e�\�x�@fo�M�c@g8a�L�        ?G~��-?���V��_?�cٱ��?���>?�i4c�`?�
��Wj?��2�G�?�$��䜉?������?��Ӗ��8?�a`�f��@<Z
6SB@�74f�@FvC�:W@P��)@^h��k�@ɴ��^>@nxǅ[>@Qa*�Nm@w��c2X@� \=��@!S
�@#]�fӳ3@%�|09^;@(��(f�@*�^s��@-�$��@0N��*�@1�Ũ��@3��&r1@5�,{
F@7�|'	S@:!v>�@<��_b�@?$N00�@@�u����@Bk[9�@C�q�P��@E�M�T.@G`{x���@I8�v'8_@K)�A$l@M5g�|�I@O[Wi���@P�3N�H@Q���C@�@S9F"P��@T����5g@U��;f�o@WH�L&NV@X��_;�@ZM�2�Ԋ@[�ݱ�@]�7L�7f@_V���%e@`���N�Y@a��g5@b�>���+@c����@d��o��|@e��� @f�y�T��@h��O:s        ?f�$�� ?�r�����?��gG��?ՖH�*W�?�H{�
?��K0��?���]|fr@��=D@�r�*\�@������@�H���R@���#?@)�f
@ �$�\�@#_�/\S@%�`���@(�pﶔ�@,��P��@/{���u@1��	��@3{إP@5�dY�}@7���a@:	)*�R@<~:{'@?q!�(�@@��d,�@BaN2��@C�'�8@E�q�o�@G>�����@I
�? I@J���ݿ@L뒚8Ѩ@O��*Z3@P�Wژ�@Q�B9�	5@R�����@T4���^�@U�d5���@V���n@XR��C@Y�Jd��@[]��C��@\��j�	
@^�E�{��@`5F��k?@a����@b-K܈@c�0�@d�캴@e$�'�dD@f?�4�y�@gf	��.@h�,n�
�@iӢ��r�@k��8�@lo�B�`�@m�ۯs4@o<�(��@p[۴�"@q�hC@q�˩�        ?�`vT��@ ��)@B����R@WT�l�N�@f�!��Q@s�S�@|~K{-O@���o��@�I�t��@��!��e@�ȼ#���@�1�Wߡ�@���8�@��S�5@�c�zg�@�b��Z�@���댪n@���BW�@�ʡW�z|@���0�e@��g���G@��[�<H@�舨�@�W7��Һ@��h����@�%E�J�@�vP�à�@��ԓ/�@�@�1}�6@źS"�@�A`��K�@�����@�xe��>@�(zɃɛ@��Q�f�@ϱ��c@�œx�`�@Ѹ��Nb�@ҳ ���@ӳ�a�@Ի*e��@��߆��@���9��4@��1T戉@���M�@�>=��@�j�	���@ܝ��Ԩ�@�։Ԍ�4@�`��*�@�-I�@��e�d�@�z��R,@�%�B�=�@��V((@������@�6����Q@��p���a@夏���7@�_#5�@��%1@��vΦ;@���~        ?1y]��?mh��(?�̜��|?��{��?��z�5�#?�tk�p�?ϙ���`b?֞�p�u?ޱ��Q?�mRa+k?�W�P�Y�?�W ?�$;?�i_C{?��7!��?���w�%?�4�!��k@w�Z�@�*!�љ@`Mt�8�@
Zi g�@�J��6@r�0��`@<����@Ad��@U���(@36O��{@c���ב@��p�T@�D�p@ �F�P�@"n����@#f�s��H@$��5鮅@&6�\7@'�g����@)5�y\�z@*�er,��@,b]�u@.	DD�T�@/����@0�29Ս�@1���;3�@2�z���@3q��ܮ�@4b�[36@5X���@6Sn���@7SD2C@8XH	���@9b�����@:r�;L�@;��	=�@<��w�O�@=�>0��s@>�:z�#�@@�EN/@@�|?���@AF�����@A��VԽ@B�Mp�@C6/Y�8@C��c�7t@D�[�|&w        ?�e���&?]Q rsA�?��[�g��?�����`�?�z>���?��7�^�?��d���?�!�L�~\?�W�W��O?�S2�&�?���X)?��1�̗�?���yR?��g�Zx[?��QIJ�G?�;S.m8?��G6:fV?� ���z�?��SV+�@ �f��@b�j�@�����@�ؐ4�@ Z*<@s_r��@�ĦVk@)`ҧ>@d����@Њ�k�@o٩i��@E�����@ *��w�@!�5�i~�@#�-6@%��E�|@'�@m��!@)�p�m*@, >�\ �@.��L@0�\I=�@2 �#�o7@3���YL6@5QZ3ٺ@7��G��@8���@:�	�!U�@=:E�@?J%[�e@@�-U��@B�X�#�@Cply@G@D� ���@FZ���y'@G奄_J�@I�$oi�i@K]����@M8�n4�@O-��_@P��6@Q�e���@R�C�$@T��v��@UG�;@�P        ?�.\��?Gc�
��?i��'��?�e!�+7?��0���I?���iZ�q?��3�g�?�om�"bi?��o��kp?����?ǙJ�q?��7$��?��v�Dp�?��.VX�?�^!��b�?�ays�~�?�Lu�;�?쩔�!?�-�Cç�?�i6�amV?��@Z��?�$��;@ Y^�_�@�d��i�@��4*�o@�#���@"���i@�����@���[��@.����@�g{��:@B>��@#�G���@E�xFaj@!VG���@#.cO�@%,YΌ"�@'So�lg\@)��/�@,$���y@.�#d�@0ڰ_N�@2e�u�@4YP�@5�2w$G.@7�8 �	n@9�B֤_�@;�qH�#�@>�X.#@@:�K̋n@A~gm�(
@B�GD��@D=�"�@E�2���C@GIn����@H�P`L��@J�o��M@LxdI��@N^�g��@P.m�*^@Q8�o��S@RO:gT�@Sr;<��        ?�d����L?��֭gx�@��0()@#���@3���s@@����C@I���,�@R)���@XmQ��@_���Z��@c֊@hVFl���@mLk.�I+@q\�g$�@tN��@7*@w|���@z��[� @~��6��<@�5�Op�@�C0ngd�@�ouxڢ@���+�@�"֜��@��㯆�y@�N�:���@��%��@�x��L@���ץS@��K;nS@��u1��@��k���@�z��c��@�=c	w�z@�;
�0@��9Ie�o@��%'��P@������@��w' @��nd:l@��N�Q�@���.�@�)ԭ�;@�HKi�n@�k��N@��y9AC{@�¶��K�@���[�,@�02r��@�o�,�e<@�Z�t@�?L<k�@���;K@�Xv&8H@�	�}� �@���k��@�xF,���@�5��u�@����lg�@��@<��@��A���6@�X�1;N@�-o$V��@��rzS        ?��y��1�?��l^:��?�����??��eZ8^?��G/n@r��/)@#Oy��"@I[�Z��@����@!��zY�L@%�w���@*D�"�&@/-���E�@2<��y:@5%n�&@8�W��@;Mɀ�Ǥ@>������@A ��,��@B��,��@D��T;�@F�����x@I�$"&@KT�6]ӝ@M��G�֥@O������@Q8����@R|�W���@S�f��3%@U$q���@V���D)@W����Y@Yn���@Z��C֏@\ڮ�)d@^�:Z3@_�����@`���16@a���`@bv<����@c_Lb�p�@dNa@�VA@eC�1��H@f>��dc@g?�r�2�@hF�
�#@iS̐>P@jen�.�@k}p��P�@l�#���@m��f͂@n�2��
@p=�K�@p��|?�@qB�u>;Q@q�ļr��@r��q٥b@s+��c�@s���)��@t�g�@u0W���T@u��t'�@v���_�        ?=���K?x���b�?��vX^.?�_��z@�?�qn�J8�?�]Z�O?��X�nE_?�	p�Z#?��	��<?��Ѷ�e?���4��?�@4�?�+��-@ �.�7z�@�і�6c@20�M.�@
�6�9�@�O��'@��-F��@����@Ğ���e@�6ӄp@�lN#��@ $L����@"7��#�@$x����@&I;r���@(���5��@+PІ;ٍ@.&���@0�v]�_/@2E���Ũ@4��8.4@6 �Ȼ*@8)�U�@:V�i���@<��cO]@?W�W51@A�':��@B���nU�@D�'��)@E�N��#�@G�!��F�@Iv���@Kt� \s@M�\*W\�@OɗYv�@Q��ڶ�@RLf�;3F@S�V[��	@T�X>��@Vb��̮�@W�NWg(@Yt�`E��@[�9�)�@\ґ���p@^�G��@`@S�z�@a;�85��@bAºD��@cS4��S@do�X���@e��ŀWf        ?V,��4�?�0��=��?�(�y�'_?�����?Β<�_�?�N����7?�M&�H�?�#F�Cm?�t�=Ch?�T47��?�S��.�K@͸_�{n@�ޖK�@\�³x@|�-��@M~�Ѹ@�S�Ӳ@�L���@"�Z3h��@%��g`]@)c��6CE@-Y�t�%-@0ޛ9T@3J'��ʎ@5�hĳ��@8�*�9W�@<��6�@?r��<A-@A���];@C�V��X�@E�L<�/d@H�_ �"@JwM�[�*@M` =R�@O�)���!@Qd׹L�@R���S@T���=ex@VSZY��L@X&�z�3-@Zۏ��h@\:J@CI@^7ن�+�@`9V�0y�@ad��P�|@b���7�@c�-w���@e@�!�m@f����@h#շ�%@i�.>t��@kH�%��u@l�u��h@n�Qk�w@pB��,@q4���8@r0�{|�@s5<P�P�@tD[����@u]��o�P@v�a3k�@w��~
��@x�%ӥ�        ?����\+�@,���ɡ�@J\����@^��f�0>@l_n��7m@v���#:�@��̘�V�@��%�I�@���
��[@��.�u@�D��@&�@�)m˩�@��%�l�@�����>/@����f��@�۔5�@�R)�E@�~}{��@�l����@�t�Łt@�����r@�В��O@�$�y��@����t�d@���=��@�\���_@º{��×@�%@�A�@ŝu:���@�#R)��|@ȷ�3�@�Xᶲ�@�	 �>��@�Ǟ�Oa@ϔ�~t@и�*�ho@Ѯ@3L��@ҫ�M�@Ӱ�(в�@ԾU�&�@��.���@��*�p5@���:�@�H��<@ځ(V:�@�ޑ��@�&�^e2@�`�$֙e@߾2���@��r�5�@�J��0S�@���/�o@�ɚ���@㐖��@�\���!>@�-�kW�@��k)
�@���8��@����J�@�a��l�@�y;��\@ꉄa��@날8Bz        ?pfW]�q?��4�̍�?�R*����?��)���6?ශ�[�?�Ζo�^�?�֗��?��)!p
@lr��>�@�׭�4>@
�2��!@*�֟o@�����@0.}h[@��|a�@4\�)@ Z���u@"Kڜ)jl@$U��3�@&wb�C�.@(���}x�@+=`��@-i%�v��@/�O���%@1?b��ߡ@2�O��b@3�RaV�@5g�<<�W@6�E-|�@8h��J-@9�7���@;��^!	c@=D�񰷱@>���
�~@@_t*ծ�@AF�֕@B4s���@C'�3Ck�@D!*X��@E U�S�B@F%U&��
@G0s�g@H@��uY@IV�s��#@Jrx�%qN@K��p]�<@L�F��^@M��{��@O��6�X@P&?����@P��r��|@Qc��)�@R���D@R�E�x��@ST��W�|@S��RN=�@T�㢗�@U_VJ�@V��^�@V˲A��g@W��}��d@XExC�W�@Y�����        ?�E��W�?Ei��W�?g�30?	d?~��C1-J?���U?��M�K�?�~�өR�?����.c?�=w`^�?�k\7�s�?����q�m?��)	��?Ʃ���H?�8�l��?�yx��3?Շ�*��?�b���?���w�?�}���m?�{��<�?�!�rf?��mxeo?�ى�n��?�d>��2$?�mg���	@  ���@��ɘ�w@��;0�i@�0�d@r#;=��@Du���@��ޅ{�@���dH@�K��/�@�NP�y@R�`�@!6,�|@#|>۰@%F��)�@'�Y�H�@*S�qQ2�@-.�p���@0"��E�@1�򃛑w@3��,�Ak@5�=�V��@7��W�@9�M�S�@<< �S�@>țF}ć@@�Z;`E>@B3�CJ�@C�kcv�@E`J�d�@G�)��@H�`J]c�@J�vb{�@L�ч�@O_��69@P���E�@Q��Ik�<@S-Oŉ��@T�85��        ?R��N��/?�����?��h�)GY?���l%n3?�T�~uV?�e��}�?�O
B��?����ó?��<?p��?�0t�+	7@�b�4R@��+���@
e9cϏl@P�^��@S���@4紌�=@M�rO�i@�v�*��@+�z=-@!ztJ�d@#~FT���@%�����"@'�T)|��@*Q�B�/@,�4f.�@/���p@15�o���@2�<��@4P���@6 \�.Q@7��F0��@9����t@;��'�/@=�vROhB@@�[�<=@A0�o�*�@Bq����@Cļ:l�@E+VC���@F�$�4L@H5�Z��@I�M��X@K����@Mi�sy�;@OT�h�n@P�as8�@Q�7W=�@R��}�@S��� �@U0�iu�@Vt���@W�>�w�@Y$΢�lv@Z��i=�@\D.F�F@]�Ģ��~@_8�Q@`r����@aP��;��@b7oa���@c&�׭#@dq���@e �Nez�        ?��u�~A�@�&�,�@4O�翞�@H~�u#@WQ,V^�@b��?6pY@kn�,��Y@rۏ0�]�@x��#�b@CS�*p@�;p�w<Y@�&�0~h@�bjY:��@���9E@�bqJbRQ@�� u���@��,���%@��k(w@:@�����@�_�വ@��F@��.�:@���b�9�@�s!�vn@�g�X�Ơ@�okB���@����J�@@����o@���$�@�(��8�@�]אT��@���-y@��E�M�@�9LJ��4@���U�fY@����#�@�o��Ϙ@��6\+z@�o/��Uq@����h[@��O�F%�@����4"c@�r��1_�@�M�wr�@�.%�
@��yw2@���U"�I@��d0�@����@��+M;@���e�!@��W���@��\���@��?��@��YA�[�@�	l8]|@�*
�ɻ@Р�bz@�1���k�@�őP;~Q@�\4FuV@��|�ʘz@ӑu�W        ?p�W��%�?�����s?� �|��?܊ �S%�?�3�٨��?�*����p@ XD`4T@�-��='@��� &@�<	�B�@8IC��L@a{^lt@ �k!R��@#�~�3@&�#2$#U@*>S�>f�@-���U��@0�R5@3
}_���@5Gj���@7�4tt�@:&#�hR@<�>w�@?��;'��@A5X�щ@B���,�@DHfCѼy@E�a!��)@G�v��l�@Ih�ç�+@KE����;@M9dc���@OD��>xG@P�x1�Ϭ@Q���n@�@S �ke8@T;�!�f�@U�:e�@V�F���@XD>Ё�&@Y�I����@[?l��@\Ӊ��s@^vl�,�@`�>��@`�"]�@aچ&;�@b�&Ot@c�w���v@d�Y�L�3@e����3�@f�MAh�@g��
a�@h����q@i��V4 �@k��-d�@lA�zɅ@ml'���
@n��.��2@o���t�@p�9{Xq@q'�[�*�@q�ƺ�[        ?b�	LӁ?�ar���>?�OF���?�w��a?�:Hid��?��/th1_@99�t�@	��E�,@>����q@4�p�Y�@��c��R@ 벲K�$@$@#2�#@'�{0�	@+�t���9@/�8�P��@25(9&pO@4��5���@7$�U/@9���f��@<��ѡ1@?�-�H�@Ay6����@C)�:�4@D�H[ǳ�@F���;�@H�����@J�ouي@L�f­�-@O@��r�@P��L�
f@R�E�+@SU��}�@T�o��l�@VQ���@W�����@Y \�s�@Z�}���@\u|�v	@^@��K0@`�T�+�@a��?�@b� ̦1@c3���@dZ��@q�@e��nm@fԢ+�x�@h(y`��@i��>�|�@j�(χ�m@l�x��@n�AX�@o�,Q��@p�F,p)�@q��&6�@r���L@sxc<ppR@ttl<�ά@uy�#s@v�cu$@w�k���8@x�2t�x�@y�+'�        ?RU�W�-)?��2r�?���sa`�?�,�P�N?џ��w?�/t��g?�ԩ�P�V?�y�|�U�?�A{���?�����5�@ :y��@ݿk� >@�a��(�@v�Tǝ@��-�@��KMJ�@�ce�.�@�ߖ �@e� %ק@ ���X�5@"�/Z^�@$�V7@'T^��s@)�{ A�@,��2bT�@/��_��@1]XKp�J@3>���@4܃?��@6�(��Q�@8划�ޔ@;&,�t�@=��\�|a@@����"@A�G��ω@C;���L@D����(@Fd�p�@HCbŤ/t@JBzX�]@LcR��"�@N���K�@P�71�&�@Q�c��K@S&��U6�@T�G�@�@V(�?9�@W��e��@YT�Qb5�@[#�!G@\�
[�@^�gn\j@`rh��c@a�o�r
*@b��|@cȄ��^@d����6@fBڀ�{A@g� ���^@h�캢@j_�1ɥ@kڙ4��@mc�M�        ?��]Z�:@0Ս��@Pʷ����@e6��@I�@tlt�''�@��olE@�Ƀ$Wn@���U�@���)��@��
m��F@������T@�G'P!Vv@�>���^4@�����2@�_��@����/�@� B:A��@���II@��yZ��@����0�@���C�a@½�� K@�~�37l%@�Q˹@6@�6E�V��@�,@5�/�@�3�D�s@�N�M!�@�=�6l�v@�^��a�@Ҋ��͑�@���	�@���R�@�XmN*��@׷�tWn@�%���+_@ڢG����@�.eD��
@��a�{T@�v��:8A@���j�ӭ@�o���@�o�d��r@�f��r4@�f��8}�@�n��.�@�~���m�@疭�R@趌mDb�@��(ҩ{�@�a�Ǟ�@�Dˬ4�@�$=��v@��n�ͬy@�	�f�@𳤊yJ�@�`�e�@�hn̈́Q@��[)XhR@�|�[�b�@�7'!k��@�����i@���h��p        ?qs���?����/��?̌��ŉ�?�k ~F�?�Rƺ�,?��A���|@EF߄q�@�ݨp@h�RHf�@��.�@ ua��"@#yo�Ϲ@'(b��C@+ ʴ��v@/a%S��@1���3.@4Y��~�@6�����@9��)��3@<Vt4
�L@?B{{xI@A'�T�`@B��}�*'@Df=��o@Ff\k�@G�"۱@I���:��@K�G���@M�N�~X@O��?M�Z@P�)Z�(�@Q�o5��:@R����'�@S��#cS�@UYoV��@V�[=@W5Σ,�@XR{�k�.@Yr�j�@Z�l�� D@[��e88h@\��2�D�@^���g�@_:��W��@`5�����@`��īu$@akW}{��@bZY0a�@b��T$8=@cG1�-+@@c��"�<@d����bF@e1�dC�@e���@f�����@g,��$	�@g�r�\�@h�h9Xx�@i7qH�5@i�1���+@j��?�͇@kQĸ�l@l��~        ?yn�̇�?�$����?�P��e?�6(R��
@ :�H�x<@	���a��@F4�bc�@;%?�	@��?��@"��i��<@&zJu�0@*_�I,#@.{P���@1e��q9h@3����
<@6����@8~�W���@;�l�Q@=���I�@@I.�ǵ@A��Ss@CFP��{�@D�uA���@F�"�_�1@HG���@J��p��@L�h�@N�"���@P����@Q*��j�@RT<�B/ @S�9q�j@T�ޑݎ#@V205ƿ@W�1�]��@Y!�6@Z�c�WT�@\d����U@^'�os��@`]��B@`�OWV�o@b6�]q�@c��\X<@d8��{��@eiJ�D�@f���~C@g���A<l@iR����q@j�s���G@l9����6@m�P;JO@o^y�) �@p�)XPxE@qa Z��@rE�d*��@s2ȹ�25@t'۞�b�@u%$��X@v*���@w8�`�'�@xO��?�@yn��P�@z��@CO�        ?hAf�w�?��z ���?��*���?�ok����?����q�0?�.Z��W?�˱t��L?�����@ �!MA�@eu^t�@	.8��g�@pt�@�U��q@4K��o@���eF3@1�&�@ �?-�@""�Ya@$^�&�@&���T@)M8~���@,�ʌ�@.�E֣N}@1 ga�6�@2��q��@4hs$=@6KX��C@8W�����@:�k4�\!@=1�n��@?��r��@A�rE�u@C9��
�s@E!�q�@G7�b9�`@I~Ԉ��w@K��Vor@N��ڽT@P®����@RM�0唑@S� 6>IZ@U��r�Gb@W�$΢�*@Y���s@[���~=@]޽���k@`׉t��@aV�J�@�@b�w��f�@d0:3�}@ew�)��@f�-:wd@h�f*1w�@jM
��U@l�����@m�<p@o���$M @q���@r)O�'�@s?B�M�@tp�u��@u���gh@v��TJ $        @ ��eq@<׷{��@^0ݸ�@s#32��R@�Y��?��@���(0p@���t�yw@�V�(.@��s_}D@���H�%�@�涳E�@�;%���@�3�}p�@�Zȕ^ �@��5�T�d@�/x���\@��2|#�@�ׁ���@��Ho���@��9���h@� V�G@�J���[�@͘�v�S�@����A��@�6�-�B@�y�瞝�@����Ti�@�gG`si@�s�X_��@�ӡѫ.�@�8"�@ڠSb@�
�Y�'@�w�J@�澳q@�+�%9&@��Mӓʭ@ᝩE\�>@�W�']��@��JtqD@��揷�@�Y�=�D@�DT�s��@� �4cy�@��y�]�@�{�]�@�:���@��J�"��@�X��e@�zW;@�<M߭S�@��;j��&@��ٱ
^@��-���@�Mr<Y��@�ވ�Y�@��~.C�@�Q���M~@���<��@��1�V@����|v@��+4��@�J�!        ?Y��UQ�?�uSV��?�A�E�Ů?�<�wM�?�2%�Z0[?�vD`�u?�I���?Q?�L�W?����?��X�xL�@"�A�/�@�3���@�Ar���@�:�4i@����-@�n�g~@r��@��k��@�/ɤie@�]�1�@ ��9�4@"�2�@#��I�@%��/�C@'a6�eܔ@)Eu)�K@+:&�)�e@-@��EA@/X;=N,@0��ނg@1ݕ��ڡ@3,,i��@41Cb�3�@5g�`@6���&7n@7�ʣ��@9=F��@:�W08@;�Iv@=Z�al1@>��+8,�@@ b0�@@��
M@A�[,���@Bj��|K@C6���h/@D��h�@D�
q�8&@E��uHQ�@F�K�U>@GsP"0��@HY��F	~@IE^��^@J5~���@K*e=��@L$�<S�@M"��f��@N&3�_~�@O.�A�)@P#-��@P�.�u�@Q2��c��@Q���o��        ?��J�0?U@���W�?x�Ǹ��?�EQK�`�?��a�h �?�4g1S]�?��{]_)H?��O�́t?�s:S}�?χ�tk��?ԟ��!$$?�h��dz?�"�?j?�_?�[�IC$�?��̯8e�?����r?�E5
?�z��?�H���@_4./��@ub�M/@�F�E'@գX�@��?�;@��t@��X�@����27@ '޲�3@�ݐy8@!��r^S@#����@&Y�0���@(�0�Ĕ@+���6@.�{K_G�@1�����@2�7ا@4�����<@6�&���O@9�/CYj@;s����Z@>�'�Q@@c={$@AܘN��/@Cp(Ƙqs@EPD�1�@F�}��@H�-Ƅ�c@J��|k�&@MD���@O\�\zr�@P�;�iA@R6Z��`y@S�)�#��@U)��@V������@X?72�N@Y�?��J�@[ͱ�k@]�e�w�@_�=���@`�&�Ð        ?M5�w�?���ƾm+?�������?�b gԏ?�`���?���@��?ھ��a
B?����5�?�}�i���?��D�r?�.Wtp3�?�ec Vh@ )��~)@�w��e�@;X#G�{@^�ʹ�@��-@wo_R[�@1f���"@&>E'c�@V�w�@���KEn@!5q�*�@#'hح�@%7K���@'e$��@)����@,9N��@.��&��P@0��U��@2	�.V�+@3}��"u@5�6�]@6��D���@8EN�Go@:ڨ�-�@;ڢ1@c�@=�	�_&@?�E��@@�$�a]�@Bew��#@C?'j
 �@Dw���Nx@E�%jp5@G�oQO�@Hv�%<�@I�?5���@Kk���^@L�"�qV@N�=@��@P*�)�`@@Q�Z4�>@Q�P'�@R�S
��@S����P@T��w8�@V��'�5@W"�⎊@XH��!�@Yyh�^* @Z���r=�@[��2�@]K����        ?�	��]h�@�,��"�@%Ƽ{�@;(�:s�@I��8�N@U0�Q�@_(U���@eT�uNU@k����@qh��z��@u;9e�MH@yV���&�@}���@�3ٿ�N@��Z&�$@�L�,^��@�e�D\�@��^�5�:@��|���@�4��J@��pG��M@�t���@�>��5��@�d���@��a�!�@���f�\@��@X��@��X��Y@�1�j��
@�SŴ4@�}K��~@��@0�"@�����d�@�0;殷�@�}� �;@��rB$@�0 c�D@��^��@�*P��@�zzZ�@�|���@�@����@���S@�ԋ8C"�@���M��@�{�i�x�@�WK�jC@�8��Б@�Uo&v@�
\��@��2*cp@���VA�@��o�ɴ=@���io��@��(�5O@�6�+�~@�""���@�n_�~�@���s�D�@�A�_�Fq@���oɡ|@�p��PG�@���.^        ?G��=Q�?���(>�(?��tw�h�?��f�z��?ǹ�z=�?���ݽ�?�cM8��v?���'�?����?�D�D?��P�Vu?��Y�ӶY@hD���@��)��k@)���ٹ@�Q4ͫ�@H@�A@8�c@�U��ʁ@
g�Qn@���a@u�㨗@d^���}@!=]�PK�@"�Xs��@$�h�.	r@&V���c@(3����@*$?���@,*���R;@.F��d[�@0<���3@1`ƃ�@2�P�ƊR@3�]ېm�@5�R�c@6d���@7�5� j@9-�p@:�f���@<',����@=����@?QG�CR@@|U1��@AV$��@B6z�(@C���Y@D-�z@D�d��q�@E����D�@F�P�Z�@G�$�X�@IW[�L(@J�>��@K+NS6��@LJ_+j�^@Mpl���@N���r&�@O�j���@P�d<�ك@Q)|��O�@Qϔ
p��@Ry�C�Hf        ?"5��[�?a���U=�?�g�g8_?�o/���?�.4g���?���	��?��n�%�?�_���?���(7	?�$�z�9�?�&�>+@e?����iw?�R�U�?�!�M��?���q��?�[��m�@ө+��@mA��U�@
���ѝ�@,��o��@6��A��@*��i��@y�I�p@+:Ԉ'7@ #�_��u@"j��H�@$���d@'�ێ��x@*�C���@.���"�@0��@2؟.<uF@5 Ea��S@7V<ԿX�@9��%��@<��e7#�@?��3H@AVɾp��@C�B ]-@D׶z:�K@Fǔ2�@H�㿉��@KtD��@Me|�";@O㟥�"@QDs���@R�dxU2�@T']��q@U����@WaW
��@Y �p�a@Z�.��S�@\�9Y��@^�;:@`��zU�^@a��>�{�@b�熫j�@d[�<�@e\��\T�@f�5k�Y@h��+��@i�N7��A@k#��`�        ?.R��D?b��kw�?��߽��?��m~��?��S��c ?��܄ 7�?�k��Aq�?���BK?��#|O?�yFy�:?�1Ig���?۫�1p\�?� _�]�7?� ��`?�Փ�>�/?힤i��?���1�L?��<ײy�?�@�4?�<�{�@ 9�,�v�@����J�@m(S��D@w�l؏@�Ps�h�@��ܽR!@�6~��@w4�g@��{+�m@A���m�@5��F@l�Q��@!u�x�ϕ@#[&�v�H@%hF��@'�?���@*X�~+@,��D顯@/R�4c�@1"iw�!@2�O�؊ @4c69�QT@6-B�Z�@8����@:�7� @<@Vup_@>�˺.@@xW9�P@A�Tb�գ@C���@D�į*2�@FK���@G�G��D@I?g(:��@J�WnZ�@L�ǴT��@N�k�p�@Pb}�e�@Qq�!S�@R�o3��@S��q*l@T�㲇�
@V.���4�        ?�
"J�Fz?�-� 3�@���@3��H�*�@C��C�I}@P�$�#�1@Yt1�D��@b
��2 �@hEՈ�7-@oiC���$@s��[D@x19�<@}R�z��@�;���N�@�#���m@�D�	}�@��Kj�kf@�3�PXu@�M1�Ǝ@�����@�'�C�@�g�}(@��5�w��@�@�%�@���@��@���œ"@�5����@���9�+@�=�b@��I��t�@��W�c�@�E`��t@�����@����s@��速�@���̇@���%�U@���\��@�6$>$��@�]�i�+@��I�y�@��ap���@��C�J@�Y|��&-@����x@���-.@�s�2��@���ۏwG@��$Yq�@�l�%�˦@�0�>�\@��'D&��@�ũ�Bl@Ė�q�'@�l��l@�F>�AZw@�%V6�_�@�	����@��e!�@��= �Z@��6��@���A(@�Ҿ%�         ?_�('b�?�H�}�a6?���Ń��?�WN#w��?��?��?��ot�k?���8��1?���ȋp@��C@�mV�n�@�o4�`c@�"Ee�@[��f@`���B�@�A�k�@!����Jq@$1�U+�p@&����Z@)���=8�@,�Z:�6@/���~�@1���h3y@3�z��p�@5n���@7vRb�X@9��w�@;���6@>5�;�h@@V�.�ly@A�>.}�@B�J���@D_���D�@E�6u+]s@GV�xŀ@H��Ȟ�@J�(9z��@L4�f)/@M�kѥ=@O�m�Q�@P�Tc<@Q������@R��(�H�@S�S+�2@T����O�@Uн�ͳ�@V����\�@X^{\Y(@Y,u���@ZZN�L(@[���T�@\��ۂ@^X�*@@_c,F��@`]Zj�)@a�D?+S@a�Oh��U@b{���ob@c9�a��J@c�����J@d�3�4˥@e���C�@fa��*�@g7c`�        ?N5?!�_?�-��̉?�b��bT�?��)���?҅@��W
?���hd?�A�x�J�?�S���T�?��L����?�L�,z@��T�@���@
 �[�8@�u�@U��>�l@gQ�y�B@�w��c@~� �B�@ G�Oj��@"�fp�n@$�bV��@'����W�@*k�|}�@-�&�d�@0m��څ�@29�ph�6@4'_@t:!@68\�F�@8m�P�/@:ɡX�T�@=M'���@?�a�K��@Ai�V���@B�0]�d�@D��I�@F>6��[}@HlkӲQ@I��D��f@LKM8:�@N.�]}�@P<���j@Qr�,��e@R��V��@TA�)^@U�L%lĹ@W��~c@X�#�[_F@ZJ�L·�@\[��@]���x@_�[��q:@`�H_�6c@b	�:�j`@c)�/m�p@dW(>�j@e��dq
@f�̏���@h,���@i��ɽ_�@j��o��@ltw�grH@m�j�
��@o��7.:j        >�px�]?+1��?PM���3?g��"�T?z�t��n?�H�6�g?��}�_�?��	I�?�����m?������?��M�8��?�ac�Kڢ?��,@��?��?Ĝ�/?�)~��V?��69�?��Ss�?��˵�?������?�jB���#?����?����\�@ �[�L@�PT�V�@��G !�@�zp@jU�B@Z֨^�@��o
�@s󤽌=@$*c��@ �Z,t@"�t�x�9@%G�t�7�@'�[���@*߹���x@.���l�@0�Ҍ|#@2�ъ�^#@4��K�(@6��πį@9E+�pa@;ٌ�S�@>��p$�@@�,?@48@Bl�7��@D%�{E��@E���0j�@G���Jv�@J���f@LN�0
E�@N���(�@P����@Q�է:�@SV�I��.@T�|;i�@Vb$%1�)@XD�}`'@Y�Y��8f@[���:9�@]rh�e@_m{��&M@`��	�        ?�#w{U!.@�b��)@4DN�w@I�
Y2Af@X��!I0�@dp���p@n�;7O�2@uI{:��@|QKo�\�@�-�0�f@��ɚ�T@���/M�@���y��@����2�@���X�>�@�y�&o�@�G�����@�-��:I@�]b�s�@��tR]�@�4 ���i@��\.��m@���"<G�@�_K��d�@��]�uxk@��e�y�@�x���0@�[�FiW@�W���&@�k�, @�����q@�ܦ����@���v�@�WԮ��H@Þ�MX@��v-$�+@�R666�!@Ǿ5;�@�6c�U/�@ʺ�@�I�@�K�4�@��m+7��@Ϗ�A��@ТPbc@т���@�h(����@�T>�w@�FpZ+@�>��#@�=�]���@�C+�h��@�O`��'@�b��p~@�|����@۞7ђ�x@���T@��hR+�@�/Z"��@�7z����@���x^@ႎ�_'=@�-���v�@�ܒ_�y        ?Q�Zק��?�|4�Yi�?��C?�r݂	��?��h|�?�m:g�r?��o�XL4?����O?�bKBXl?������I?�_2���L@�~�@gS�ͅ�@	7;��{@S���!@ޝ�bx@9W�K68@��M_@`B���@+�{�@�y��~@ �/U|�@"6R��2�@#��Gu@%�-a�@'z��C��@)_���B@+V���@-^p�X+�@/w@'m��@0�h���?@1턻3�&@3�9��9@4@�aV�y@5v�rʊ@6���@7��]�L�@9Jާ�L�@:��}WUw@<�-�o@=mO�o��@>��ߗ�U@@-��{V�@@�;Ϟ@A�5B "@B��h��s@COf@1ma@D"F.�ç@D�F�`a�@E�k���@F���5Cm@G�O~nW@H+|P�+@IkX��b@J[�"�d@KQ����@LJ��8�h@MI�����@NM8����@OU�0n�q@P1�G}i�@P�����@QF�~	j�        ?0<�u=w?_�<]�>�?|m���?��?K�?����[?�	GI��?�X��ū?��+?�S{��?�l�)�x�?ͮ�K��	?�|�����?ֹ��D�?ۥ{�-�?�-W.]?����rf�?�̰���?�4�jը!?�F�6�?�}"�?���J-a�?���7^B?���)�ܳ@�~J	�@�{󕈃@�x�{g�@G�T3��@*>p!��@�$�F�@&^�B�#@�ye��{@�D��@��E_��@ Co*H�_@"4v:��a@$S�E�z@&�����X@)#��k�@+�؋��@.ʛ��`@0�����@2���y�S@4�Y��:@6}|����@8�����@:��vA�@=FQ�.@?ٻ�j�@ALj����@B­ 7�@DP���Q,@E�J���@G��� �@I���P�F@K���I�@M�N���@O�UV��"@Q�����@RI���9@S��0߼�@T�/�(�W@V\�����@W��QZ[_        ?@����?v0P�A�?�����?�.K�װ?�`o
i��?�.���Z?ղK��*K?���=�+h?��4\?�@��?�9r�r ?�K�)Lr9?��BR�\V?�	C��o@h?-�=@��&��@	C�<7�B@OT��2j@�S}�j�@l��D�@9����@UB3W��@��Od~�@ OŅ���@"p���#@$ʶ.=�@'eC^*@*D��`O*@-n�W�)�@0tς뾝@2]��I�L@4u� @6�]��a@9=E)�B�@;�{��j(@>��[�]�@A���h�@B�;Y�[�@D��a	9B@F�`���@H��a���@KRm�I��@M��n��@PP�O�z�@Q���=�P@S`"��@U���o@V�[��@X��;|�@Z��,@]��E@_i��?�z@`�݃~_`@bD%���@c���d�X@e$���+@f�1u��@hZ�X�m@j7*+�@k��RD)�@m߈/6c@o�k
�xw@q2Ee(�        ?���W�<4@ ��wZh�@!)F���@5��zH�(@E�V��Q@Q��G �@Z-H���)@b>s2�2�@h1*�YƮ@n�O�6#�@s3z��p5@wRq*i��@{�Y��l@�WK)&�{@��&�Ǎ�@��ڇ+ �@��6��6/@��"6Q�@�?�e��@�cb~x�@�>^��*@�0�@�:��t��@�\gWա�@��r�Nu@��ӗ��`@�&��k�@�e�T�&@���N�U@��t��@�e���n@��cՑ@)@�G�z��@���V5,G@�T�ſV=@����8@����R�@�q��@�����@���n���@�ó�Z%�@��z+�ww@��S���@����?
0@���&�J@���X<�l@���y��'@��:B��@�ԃ����@����?@�����@�:S4X�@�h+�E�@�M��Ò@�ꖊu-@��a6�h�@�-G���@��Xp~u,@�|�"qM�@�)#]yg�@���C#Uu@ŋ��ӯ�@�BQ�޽(        ?e��ן?�i�-��?�pЗ[�`?�{o�͏�?�7��Wb?�<��u�r?�x|X<��@�����@R����@�	���4@��s 3�@�2˟i,@�"7�;u@����@"v�š"�@%BXX��@(A�3��@+u�{@.��[?P�@1?�L��@3,�T�$W@56�&���@7^(*��~@9���Q�@<�
�Kn@>���G{@@�� ���@A���Zdz@CV���#@D�w�i�o@FV�__��@G�J�Zs@I���/i@KC6���@Ma��#	@N�Dn���@PY��]2@QPl5�� @RN�{t@SU1+�D�@Tc?'B��@Uy3����@V�!G!�@W�rΗ�@X�N3@Z!��<@[_!7�ut@\�����@]��m�@_H=�!�Z@`R�\OhL@a��vY@a���[��@bt�Φ_@c1�pe�@c���D�@d�a�N3[@e�J//@fKc��^@g��A4�@g��u�;@hĖ�"�=@i���A�        ?P=�.��?�-���?�Z\�鏁?ƻD	{�?ֈ.���?��Ǯy?��d� �?�J�X�,F?�Q��à@��]���@u倇�(@��n�!@�O����@nt_�O�@QOkތ>@�Ts�@ ě�_@#x�}Y]M@&xouQ�@)��R@-pTHT*X@0��,5q�@2��t�@5[[jP�@8Sq�@:�?��:|@>���!X@@�Jy$�@B���ӱ�@D����Œ@F��A�A@I0�w8*@K�ӗ��7@NDv�o�)@P��?��f@R����@S�O#�Tz@Ul�c���@W@4
v×@Y/%�k�@[:�GPxZ@]cI�`�@_��m7�@a�<�@bJ�2���@c�k��V�@e ��l!@ft��*��@g�E�Lc�@i������@k9N/�|�@l�4O��@n���!��@pO<�{��@qG�eBO�@rI�m>'@sU}�|�@tjΓ��@u�2�4@v�I?�/@w�ڸ�Tr@y$�����@zm�{k�S        ?'�8�U/?`���)$?�9�g�?���anC�?�K����3?��QߠPl?���$�?�'��b?��&~r�?�.τQ|�?�'�;c?�=c�?�,襺�?�o�kb?���4�?�:��tW?�?��?��p �Z�?�U���@ ��K@��*�@��"_�@��9�A@V_�a@	�M�" @|U�
@{ ��t@E)�a�e@ �4@�p@#���;�@%��88��@(cu[���@+m�8�N�@.����^@1'���u@3�=��@5)��Lx@7c���A@9�h)f;�@<Oץ�Q�@?����@@�_����@Bv�U�G	@D	e��?@E�-I���@G�a�l/@In ��$^@KfZc�@Mv��i4B@O�@[�a�@P�AOp@R��	�2@SU��g�@T�����!@U�:�2@WI�w�X�@X�.%k@Z(��O4�@[�(�@]7���'L@^���(�@`;S�o^�@a5���        ?�ko=�?@Ͱ:tݺ@8��tǵj@O(aihU@]���R@h�1Fa�@rU!nH�@y�Ǆǎ�@��Y��\0@��8njJ�@�3A�_�@�}�*�ؔ@�Ǳ�X\@�c���@�RJ�%h@������@����)@����9Vo@�H����@�)�ըۥ@�A���*@�H�BH�@��\���@��E��@��b���@�tHl�t@�:����@��.,"�@��{��k@�Ċ�/@�N[��|@�y�K�u@��L�@�f[~C��@��@���@ɉY�Ҥ8@�/99U�R@��	`��@Σ��J�@�8�w��}@�&�W��4@�,� N@����k@�M/�R�@���F�@�,���@�@�����@�Z���5@�zZ����@ڟ����%@��ʸ9�@��L4��@�15:N��@�ls�͐E@�V|���@��]��{ @��<��E@�F��]��@����G@@�߷ِR@�NŌ��@�OL�U`@嶃%�L*        ?4��f��{?m�Q=�b?�FI*?�{$"R��?�i��k�J?�`|z�?�V���?�K]!��?���bR�?�ɖ��p�?�(h��q�?�eb7�?�Z���B?��l�sb?�S�B���?�.:&Z/?�9ǧx8@^s���7@���W�\@|Z��\@	\�
g�@u*���@������@�XU�K�@�x���G@�K8��I@�e\�K1@꒞�L�@Hܞ�@ȉ���@ ���,��@"��kBV@#�>zQ[;@%<�@&�2�B�@(j%�7 �@*2�D/�j@,.#�@.��TS�@0��>c�@1%���@26��}j@3_"���@4�^>�@5ҹ��ә@7�$2@8uR�n@�@9�kO1|@;Gzb�r@<P @>I��6J�@?��~�&@@��b�@A��J��t@Bo;"_'�@CP��<o4@D8�n@E%n� �@F���}�@G�jM�@H�?��@If���%@J�k7�        ?�_6���?C�x|�?h']��L?�E�Ԩ�?�r��X�?��AX�9�?�}���G�?��1yI&E?��AVu��?��V��O�?��@a�?�C��!?�»{$0�?�",W@�?�@p�U3f?� {�5?�c8&V�T?�{Ε���?�;�8��?�D���3?��4z���?�N��/y�@!�G8%a@�]&��?@
D�&+@
��u�z�@^)��@OF���%@�=�n�>@3����.@����@�dG�@J��@!j��@#QEX���@%\B*)R@'�7�CUF@)�j\�-c@,`)����@/ל%�@0��{4�@2jk���@3����3?@5�K}��S@7qDذm9@9OR,@;G@��G@=Y�mq�G@?����m@@�Nnm@BD1]Q�@C`a�К@D�*� �@F)�e3@G��HNV@I ͍��@J�UZ�v�@LP:	���@Nm|1-@O��韏0@P��e�H@Q�lSlTK@R�~'�7        ?PWCaH2?��>&v��?����>�2?Ę@���?�>=$��?�J�^91�?��z�$��?��eȣ��@�>�N��@�AVk��@Z���U@�P��k@��r�o�@����b@"�A��@%W9���@(�-a=�I@,�,�n[@0�T:L�@2㶥#��@5`o�i��@8��lZ@:�/���@=�ŵQ8@@���%ă@BE)�n}�@DR�Ö@E��R+��@G������@J>�S�@LF'PY<N@N���*Q�@P�T���@QЩt83�@S-5�8��@T�m�!��@V"���@W�۷]��@Ys��Z�@[@��	�@])�p�@_0K
��
@`�&v�H@a�[�o��@c>��'�@dQJ��'@e������@g)z|���@h�#9c�@jaa���@l"�̖b@m��P
��@o��=QB(@p��P��{@rۨ���@s4˜�	�@tb�j�m@u�fQ�@v�bGe��@x;�&Q��@y���a֊@{輁��@|�0
��        ?��(e��?��%�@�cմF@+��n;�+@:�	"�+5@E�AkH��@O�B�%�@U�W�Q@\8'�H�@a��
ea@e�^d$T�@jF�2�@o>���i�@rX��:x@uR[&�@x�_�m�@|�D@F@�d�dX@��'�p�T@�2mO'�@��~f�)@��9�XD@��7�Cm@���Y>�@��;L��@���֯S�@�9���n@�t�<�@����Y�@��k��@���y;@�F{��@�Mב�*f@���6�@�ћ���@�+�e�+�@���G�@�U0?�@��nO
P@�A��:�@��F;@���VΕC@��hK#�>@������A@��ࢦ@��I܅�@��ֹϟ@�������@����[�@�L�:�A�@��ߏ�r@��(����@��6��@�h��E�7@������8@�. PB�f@�O�<O�@��zk��@��sV i@���e@�[*���@�)���@��gf��.        ?������F?�[���?���X��=?��9�@���Y`�@S}6��?@[O�+��@ �U���@&�)���@-����@2<�.���@6x��!�@;B����5@@O��y'g@CGKtz��@F���q�@Jس2C@Mڷ6}�q@P�{��@S�t��@U]p�&��@W�[X�@Z8�n� @\Υ�Ӝ@_~�qO@a$�3l3@b�JT?�O@d�bE�@e�����@g0/�1��@hπWH�@jy.��Y�@l,���P\@m颸��y@o���/@p�����@q�kHSH=@r� ���@s��@~�w@t��8�d @u�@��@v�L�:�@w����B@x�ƅ��@y�C��@z�w��oJ@{�4ݧ7t@|�C�/Ge@~e�A�M@3Y���@�-�9�[�@��ھ��@�[P����@��3��#@��e���'@�)�o|s�@��K�b�@�c�y�6�@�E��1@����ėZ@�A¼-�@����-@��`4�]        ?�D��Ů�?ԈU��L?�s����@d�1��u@d*��@!�)��h@)>�V�@0���6��@5��@:����@@�X}@B�
-H-@E��V�@IT�&�@L2��S��@Owe�(��@Qg+i @S�J��@T����i@V���&A�@X[{^�
@Z&�yw?@[�츭�@]ǚ�f�@_��Nm�G@`��|��@a�&���@b�+F�3�@c���6@d
o�Ec@es��V�H@fj�Е{�@gc@��@h]��7&@iZ���Ma@jY}�U.�@kZ�3�@l_D�`�@mf��i�@np>q�k^@o}� 	:�@pGlmB��@p���R�@q^�KcA�@q���=x�@r}:C��@s5 ��Z@s�?+��@tG��\�@t��89M@u�3�']�@v5�u0�@v�-����@w���5@xSxP#K@y��y@y��[�@z��̨Q7@{���h�@|^16'KC@}C|�h�Z@~0�Y�d@%�X	��        ?��_]�[?����
�?��ܣ�^?�UOܢ�@@�F� @C|7���@ ���!@&\��<0�@,�}�9��@1�aKI.�@5�=�%8@:W��}��@?mU����@B���ke@E����	=@H��gb@L�,ۀ��@P/*���@R1�,�1@TK�X��@V{�hhnN@X�$b\��@[S���c@]����B�@`i�X?@aIz���@b��Њa@c��ju�@eX�O��@f���o�@h:ku��@i���c�@k>ϩg[@l�Z�A@ne�}4��@p��Y@p�VD�{@q�:W�l�@r��U�Q;@s{2?:�M@th=/�F!@u\b.�'�@vX+}��@w\��x@xh"����@y|����@z���b+�@{�Rd4|�@|�k[��@~$�3��\@dg�ݗ|@�V�����@��{�[b@���>�@�^�C>0�@��Ɋ��@�����@��[a�'�@�V�M��@�!On��J@��c)r��@������@���h7�a        @9�@�(@SzK��@sVlG@�<qM�@������@����@�����W#@�g���>0@��Ek��F@��3S35�@��_R���@�3���� @�?�\���@ͭQ���
@�<Q�@�̓���@ֈi ��@�i����@�nTҝ@ߒ��3�@�j"�Rv@��M�C@���̣+@�?L�iK@�n6���`@�LF{�T@�4�4���@�'�ۭ��@���5h@�����@�Y���@�''��W�@�6lB#@�Hn@���@�^1�4�@�v��zC@������@��6���@�҈3�O@���L��`@�@����@�H����@�v��F��A T�?yA �m݌>eA�cKA'�5Aj\AƆ6(sAff%��gAE; `A��ЕzgAKm�GR�A�wc���A����1�A5�8t�nA�&��:�A~�F��,A	#7�/ǪA	��㋾�A
l�!��A
��W�A�U�H�AYU�c        ?��A~F�?���$�&�?��g;�?�S�v��@ 	u�W@	�<fƨ@��_�@�L���@ ���Ӷ0@%ob�Y@)��9#��@/K}1_9@2��R9=�@5�m��b�@8�GM_�@<v,�`��@@~7x�@BZӓ@D8�7� @FC�%8�@H���YF�@J�G�A�9@MJ���}@OѢ��l�@Q7��@��@R�-��t@S���i�)@UhJ�5��@V��R@Xisz���@Y����;@[��v:};@]7��F}@^�@��@`Nm���@a.2@b���UV@b�g��_�@c�{<���@d٩�o@e��\/�@f��ې_@g�d�
=@hċƜ�B@i����@j��;L�@k؏�O@l�2dC|�@m�5�z@o[A�DX@pD��[\@p�sf��@q$�W��@q��c4'R@r?��"W;@r��e}\@s^�}��@s�t���;@t����@uu�T�J@u�ʫ��F@v;�(4�@v�F��C        ?�����E?��i	8?�2�*�+�?���X�U�@=�ڡ�T@��yP0@o����
@9��)A@#��
F֦@(���qO�@-l�?b�o@1N�_<@4���9@6��b{�@9��kȎo@<�D|3L�@?��Y@A��`��@C0��JE@D�P�@F�K���c@H_Ҝm�@J0�0��@L=b2@M����a@O����Si@P��X�K�@R��F6�@S6�&�A@T+,�{@UJ�ęy@Vr�s�&�@W����+=@X�>I>v@Z�v��@[g'���@\���Z�@^|�M<,@_���i�@`x�F?�[@a6B֐�i@a�ޗw@b�#v@�L@c�YQ�X�@d`�ʼv�@e8g婮�@fM���@f�O#@g�� k�@h�:I��@i��0�?v@j��4@k�6U��@l��]�@m�/g>/p@n�r���@o���4u@p�x�06�@q��R@q�:M�0@rL��1;@r�E�d@s�M�dH[        ?n`{��kk?���z�?�N�~�/?�no��?�ϓLF �?�X�W0g?��1�W�m@d�?��@�XB�M@h���.@���@�(y�OJ@��N�9@�o)X@!��x��@$~��z�@'8��|@*�2�4�@-6��" k@0@$u�c@1�i�<�@3��D��n@5�/P/�<@7�2+�8@:'�Š�@<��,�A@?j���@@���2�K@BA�V���@C�����@EQ�}�t�@F�ūln@H���8�@J���[Us@Lx^x�@Nz�K��@PJ"��f@Qb����@R�7����@S����@T�)�//w@V<�ר�@W��yƹ@X�V�ͬ@ZakYB�@[�EtH��@]dg�P�@^�럼!(@`M�v�O
@a%G��^�@bտ� @b�F����@cյ� �@d�@+'��@e����%@f�2���@g�����@h�\�'��@i����_�@kE"�H�@lF-{V�`@mx�J-�@n�!<��        @���!A@@N�$̄"@m�sz��@�(\�)�@�pNR�Y@��AH��u@��a��@�Pۼ���@��@�@@���E'@������@��^)g@���ἄ�@å?O@����Y@Ɂ{�J��@̨���V"@���/�wA@ѱ��5�@�zp��@0@�S�!W�@�=N�°�@�6�ԟ�@�?z�
�@�WB�Zc@�}����x@���"9�@���`1@�!�Ѣ@�O�mf-U@�1&@�>Pb�@��+^6@�C���J@�ob��@��b!4b5@�3I ��@��K�@��-��l@����=@�ZC�j�<@��ڪn�@����5A@��Y2��@�:~��-T@���1�@@��Y��@�sT=ة@�3��a�^@���>~�@��4�Be�@�z{�[�h@�>��9��@������@��+v��@���)��`@�V|�$�	@�ES�~@��S�B�@��#��D�A <F�M��A �I��qA�o�|�        ?!��A?[,SL���?qf��?�� C��?�ֳ�"G?�ɬ��?�l����6?��>:�t�?�NP"w��?ԣ]~�V?�a��cu�?�u>7��?�$�5Y�?�D#_n	?���<(D?������?�Ԫ�_�?��Pt3�?�q�ݺ?�Bg=��@8K��@<8�W@�י���@����i:@�*��0�@��Rv��@�ɧs�"@��lK�@s>Ї�W@[�*��~@[EzW?}@q�m�@��cT�W@��/t�@ � �4�@!ϛ�3�<@#`zsv@$YD���&@%�:0��F@'K����@(s��� @)���B
@+d~���@,��a��@.�	i�/u@0/��4o@0�	R"&)@1�$|�.@2���O}@3�P�KƋ@4�xi�<@5z�E��@6wR�6�@7z�� \Z@8�����@9���G��@:��h�@;ȰZG�@<����G�@>˝�@?C��)@@<6���/@@�zjS�        >��i��ƥ?3o�A�˓?X�'�R�7?r��L�?��G�H�?�1WG�Hb?��̡�`?�š}�G�?�wa8%�m?��5�qS?����/?ĉW�*??ʵу=?�>�8?թW5fy?�B��?�ΐ���?��v�t?�$�7��?�`F��L�?�6���(?��#�$�?��x�t�?�v�m�@����H%@l���@����H�@��mH@��0�^\@����a@�P;�@y�1�@<�	�_@:c��@u�ѣX�@!x�b�U�@#W��N�e@%Z[Ŀύ@'�rH�@)����|�@,D�7���@.䫃|@0�c���f@2U���@3���\�&@5�����@7an,�
�@9D�?L�s@;D	����@=`1�'�J@?�/ėO�@@�zs�@B5���t�@C�K�C@DߩpR/C@FNM�p�@Gγ�0��@IaV�b�"@K����T@L�AT#�@N�yS+T�@P5�� �@Q0W��        ? ����?Xu�wt��?||�.�?�K0ǳ��?��
�}?�W��m?��ɋ�"?�^š��?��MI���?�Y���R?��aM-y?�J<>�5�?�O�n�@?�=Y�3�?�EI��u?�A"����?�Z/ͬD?��V5��?���B<��@ $O����@�QtZ��@n�?�X�@�ť(@�A
B]*@��?�k@����@00:e�)@�z8{�@M�-v��@-ȁdJ�@G~F�@!N���ٓ@#(𽐺@%�B��m@'_���@)FԝQV@+�C��+�@.$�8o�@0j*� C@1�5�@3`t|���@5�?�۹@6����@8����@:���g�@<�����Q@>�V9�N@@�� ]��@A㹲נ�@C8���@D�w���@F!)�pn@G��S��@Ia����@K%.���u@M��B��@N��:���@P�8�֤@Q�v�BΑ@R�/�	�@S�x��@U5@v�%@V�窶D�        ?��,���?���m�?����!�@�3X	��@$��l�T@2.U�a@<�'ď!&@D���08@L����v@R�<�7Q@X�ʵdE@]�j�f�@b:�A^�L@e㠦5��@i�
�o:�@niԹ��@q�Ӛ��@t^$��=@wRt�@z��i�b]@~	|52�@��\h��@���V���@��d�o@�l�	׍.@��s����@�w+�}�@�/=�Ŝ�@� ���@��*��]@���ö�@�����i@�N�ǁ�@�d*��g@����1ʸ@���4y�o@�z�V��@�35ڨy@�/c��@�1�#$�@�:��>��@�J�E�l@�`)�ť@�}G���@����_�@�͏68@�!b�Z@�<�R�]@��(��@��p�?0�@�>����@�=�~)+*@��!��Z�@��ԹE�;@�a׿�l@�!%����@��0��@��q��'@�xO�i�@�H:}M,�@�&���@��p�v�@���O��        ?��4?������?��sk��b?��q^8o�?��*�x�@�y�*�@J�z�b#@�eSE�@W�"vh@#�)f��{@(���o�>@-�Kp���@1�z=�#@4�*�P^@7�WS/J@;e�ZM�E@?�)�P@A{��DW�@C�"kb%�@E���s�@G��E�5�@J@��+�@L��^�l@O8�d��@P�nt��@RK�jc@S���w�L@U3�[�r@V�D�@X[r]jA@Z	�#��@[ʞ_l�9@]�dz{�@_�j�R|]@`��m�f@a��(��@b��n<Q`@c�C���@e#Å:�@fUl����@g����@h֖�y��@j%r�`�@k|�B�
H@l�QAܟn@nB~.sn@o���U�@p�Z�R��@qK��f�@r
"�#�@rʹI:^�@s���	��@tS ��S�@u����[@u�Tg�Q@v��j.5�@wi�,O@xP1�.��@y#3t�P@y�i��e@z��S�?{@{����T�@|�v���        ?W'4���?��\@.�?��I>p)�?�}'r�F�?��䧥�?ט斆��?���V�B?�H�H���?�tN�֟?�MZ	�J?���%���?��R:D��@@��=5@D�1�K�@�����@2���@�r�Wb�@[Zc�E@w�Y[@�l�M�@wL��@�����@Wy�� �@ A,�ˊ@!��LҮ@#G���=@%{��@&�	[>�@(݃�*�@*����{@-;j��@/�X{JM@1�G�_@2v+�@3�P���@5v��l@7�r6u(@8�.>|K@:�E\��v@<���e�@>�ج�4�@@�X� "d@A��+F�;@B��	$��@D6Lm��@E�t}�b@G�|�b@H�Xj���@J#j�@KΏ&Z�"@M�T[~@Ob�tҡ�@P�5��@Q��#�B@@R�C��@S��>�@T�^���@V�K���@WJP7s�@X�asSY�@Y�wO��@[6O����@\�D"�T�        ?r'��p"�?��L?�u?Ō}�A?ڱ|�@�?�+����?��>La�?��D%�W@��[��@���.�@*���#`@��t}��@b�@��/@ \lu�l�@#Iɟ�Z�@&~Nx�r@)��d�t�@-�e&���@1w��Y@3H���@5à6
l@8t�k��#@;^;�#w�@>�{�~�@@�m3��@B¬Eރ�@D��q .@F�ܭ��@H����@KJ��h�@M�����#@P-M���@Q�Xz�ģ@R��?9	@T��Ϗ�@Vv$�u@Wȋ��nD@Y����2@[bȢJ/�@]Q����@_Y�9�@`�[��&@aܲ��ݭ@c*b@dOv��@e��0���@g�x��8@h�ȸ0/T@j6q�r� @k��u��@m�b[b@G@o�/g�@p���D@q�7j�"s@r�c�y�@tU�?�y@u=B�ȿE@vxh��$@w��	���@yh��@zsQQ&�@{ߗ��E:@}XS���@~ݣ���        @	-ۅ���@@4�*��,@^�& �H-@rk���UB@�Bu��@�O:�xa@��'�9s�@�=�C)w@���.ن�@�2�����@�2�*��@�Q̘"E@�BQ��G@�j���g@���i�i�@�_o���@������0@KNC@Ī����@����5��@�!Y�D�@��K8e�@��F��h@�BvU1�@іA��Y�@������@�eʁR��@��W����@�p��"QC@��ٝJ�@���z��s@܇�yNkv@�c��<g�@�*Ԩ,u�@�/��c@�>q]�-C@�Xk�7@�|��pVb@��4��@��pr�@�$����@�o'���@��{� V@��$��{@���e@��EhbEA@�*�Q]�@��j8�6@�����@�Y�X�g@���A�@��e�ݪ@��A�l��@�[F��@� ��/U@��¥���@��.?�]D@�yY��<�@�E@�(��@���9H@��I4�c
@��|!L�@����ß�        ?V�2�ϗ?�� VD?��OB>��?��<��?�|�B^�f?變�8�?�
qO(;?��x��1�@EX�v&@��62�@nM�&�i@��ќ��@�k�Ī@:�.��@��8��@��ƞ@!u�H7@#�mMD$@%�%��m@(^I��@*����t�@-�P���@0-D��Tn@1��"_@3$C��F@4�u��@6Z�+�|*@8�m@9��X��@;�!��@=��<o�'@?Yӵ�&@@�����a@A��{s^�@B�@#�iF@C�����@E�&��*@F<�2x�y@GkI6Ɠd@H��k�w�@I���@�R@K"���D@Ln�<Dؤ@M��\2@O7�.@P@�E5�l@P�9q�hP@Q����(�@RmEH9F�@S.��G;�@S����@T�{�k�Y@U��'M\@Vb�����@W;����Q@X��n�@X����||@Y��zkE@Z��L�0@[�ʌ%,@\���	@]�<Gf@^νE        ?\݉;N�?��2 K�,?��wp��u?կo,�g?�$zD��?�k�y?� ?�ˠE���@Ŷ��@H��/�@f�ؖ�@nF3@����K@����>	@��G%�#@!9�#�)z@#��<�P�@&JU�	4@)�)�@,\��@/Mh7xb@1]��G4�@336��@5(�,A2@7@�%��@9}J�U@;�ѕރt@>m/�)�E@@�vt��@B2���@C��X{�@E4C�)@F�s�8s@Hρ�>�@J��@�v@L谪���@O,*Ks@P�]"�@RɄOD�@S|Δ���@T��^�=�@V�`�s�@XEn#tv@Z�l�7\@\	 F'�>@^�>m�{@`+����y@a[�9�(@b��Y�m@c�ψsh�@em=�e��@f���q�.@h��j,@jO���?�@l!OsoQo@n�M�@p� �@qÀL�e@r2f���@s[��`�@t���z@u��ʾ�@w$z��y�@x��"}4�        ?��J��?J��#Ck�?l��_�?�Ʌt?��d\6g?�2�Z��?�ԙ��v�?��a��U\?�h��	%<?�s�p�ʈ?�2BO'��?�R��>�?Ө@�\n?؈�n#�R?�JZ�t��?�Ck�Ҁ?�x�d���?��Q��?�-�J��?�8ک5�:?��P=U�?����~�R?� }���@�~�G�@�{Б�A@�P�ù@��L�|m@u�x�+@�07~�@Aܹ�ʣ@�|3V�@�,�9mx@�ĀNH�@ ,!����@"��LV@$��k/|@&Ui��q�@(��S�>�@+^�����@.2����@0��R�S�@2D9��@4f��`+@5�S�x�o@7�d�~�@:2W��@<jl`ia@>��w�@@�!�P�@B%Q��@C���`�@E4�	y,@F�ͪ�c@H�n�-D@J�x�;@L�Ȧ�ڈ@N�I��@Pgΐ�L@Q�eP��<@R����+]@T��k�@Us��ۊ�@V�����        ?�H��L�P@rι�@>��ɬH�@S��M�g�@c�l��%@pf�8�@x��ig[�@�jJ�^@�r�oH�@�|C���@��5P�G�@�"�r��@��|Dc`$@�N2��@���f"k#@����!�@�j��K�@��J���I@��.W� @�V-_q@������@��F<=�(@�#�k@��1;z�@�e�q�U�@�Eg0��@��Z"ua=@��9_��@���'<CC@��@�#k@�ǉ)LA�@���h��2@��1&��m@����4��@��{ ^@�-U��Y@�S��tӶ@�?$�}@ɰ2oэ@��Y)�@�!�9�L�@�a��"y�@Χ5�,��@��T�6��@Р��(;@�I��=?�@��9��?W@Ҥ�W�r�@�VS$,@�
g�>�@��b���0@�{uf��@�8�lR�H@���$JAS@׾���u�@؇N_���@�Te���@�%��2a
@��O� �@�ׅ;-��@ܷ�Sr(@ݝc���@ވwv44        ?�}���?�o��?���(�ϝ?��Ȟ+JK?����@�d���-@��w��@趻�8�@Q���@ ��}��4@$e��IU@(�`��@-8�,�@1��5�@3�=�0�@6�C��"@9�����@<��u���@?�P�l�@A�< �@C�s��X@EkD[��@Ga�=��@Ii4����@K�|�մ@M��K���@O�"z ��@Q����@RGDo6��@S{��F�@T��?$�4@U��(<ݹ@WDf�<�@X����@Y�M0_�@[I�cN�U@\�}���@^A�E�@_�<:~ډ@`�z�֤@aCf�#�)@b�m.�/@b���?�@c��{��@dv�g�@eO����=@f.h���P@g����@g��^l>g@h�� y @i���X0�@j��9�/@k�N;Ta�@l⭑�>�@m���Gh@o ��v@prL�V@p�J�1�	@q,�9�U@q�tX*��@rX�����@r�s��Z�@s���/�g        ?u��-ݝ�?�{j;�\?�1���V?��Cغ`?�K�h�g�?�}�ˆ��@�X��@�v>�\�@~�d̪O@�� X�X@��T@"�ó�L�@&�E&��@)����@.n>ZV@1F^:(�F@3�tnW�@63m'�.�@8���P@@;�A�O@>�H`<��@@���@�@B��*�@Df�"��F@F=��A�@H*�e��q@J-6F�S@LF
К�@NuH��NH@P]��HE@Q�2��t@RƘ����@Tv�T@U`+�D6@V��A��r@X,�����@Y��}��@[.�.@\�ۭ�;�@^i�,�x�@`��iE@`�Gr@a�҄V��@b�}��@c��K6@d�zސ##@e�?�g@f�s�lo@hDyRRj@i=ڰ�T�@jr_=@�V@k��y���@l��\db@nMFZ��'@o�X/�;@p�'��	:@qD/�Z��@r���m@r�J�ܠ�@s����z�@te�ιÏ@u<���ޭ@vK%2�        ?`:K���?�-*�u@W?�Pi��?ɟ��H=�?���n�?�e�&�J?�'o�|?�ۈ��@�?�0�!�@�Ϩ�@yv��Z@�%F�I@8e��@^��)��@�%���;@���h0�@�m�>Y@!�x�l�@$:t�@�@&��r.;@)J��pv@,��	�@.���.~:@1}�%��@2��<a
`@4]����@6+�OScB@8s��e�@:�p��@<+w1�ny@>b�\G��@@\+w�,W@A�(]��@B�J�nI~@DA����@E�-�.C@G9!��@Hԝf;�@J��^��@LP�?w>F@N4l�`O@P�����@Q%Gm��k@R@&�G��@Sj����@T�����@U�b�Z@WH����@X���@%+@Z5����@[�	�f@]qG,��@_.f��&i@`��[]�5@avN��*�@bw�s(A@c� ���@d�o��[�@e���D�@f��_w_@h>�7�c@i���Vk	@j� ��        @��G��@9��ž@X;��
�e@l��0�@z/��7�m@��G��H�@�:
L2�T@��z��~@��p�^�s@��̄�X@����d�@��l3>�@�`i�]X�@���G2�@��6O�	@�Wog�R@�/Z>�@�*�X���@�IzP7h�@�D��E�e@��Դ��@Ķ֌|C8@Ƈ�#>�@�g\���@�U�k�@�RM��:@�[��g@�9(ۄ$�@�J�~%';@�a��D��@�~�6��B@ԡ{`�^5@��v�	�w@���X��@�)B!(@�`�ǖh�@ڝ�-A�u@����We�@�'��&	@�u1D���@���� �@����A�@�B먪�@���=�;]@��{m�f@�m�cT�k@�.�M<�]@��=��@�ղ�)�@��>@�^)&O@�5ʂ��@���"�Y@���ѻ	�@�ը��,�@�Tn�@��9�*�@�����i@�ŷ��.@�$���f@�J�l��@��r�ᩖ@�Q�{AHH        ?4����?m��^R�?��r��Z�?����S�?���=��?�w3��o�?ρ`�?�f���qL?��W���?�o*̐x?�Q�*E�?����^?��3���?����	?�qȉ�?�#e =@ J�#��@%���@a�>��@���?@	>�Z��@����0@�
�Pz@����i�@I�>���@��E��@�c��@6a�-5"@��PR�@̔;v�@��[h�@�����@ Pտ�\@!W�L�@"g�އ�@#eD@m@$�4��Q@%�)���+@&�A����@(/p��@)o���p@*����"@,��Q@-a�'�ы@.��[��@0�6]J=@0��&�a�@1�;��@2U�/>�@3<|�n�@3�`U��J@4�5�Nx@5��OI��@6~����@7eF�Q�@8R��D2@9D��'�@:=�+x��@;<|
!@<A6��q�@=K��'$[@>\_1쩗@?r�M�\        ?4lK�i0?SWP�M�?y����P?�V|]?��&�/q�?���{��?���T��U?���j���?�zӅ���?�T39���?�Sj��� ?�6���9?乯T�Fk?�g}?��`4�Y<?�q=c��M?��\i	?���{ʮ]?�GÓ&�Q@��T�@n3�+@���vg@�y�+�@�p�г@�����@�I
�@�g u��@�6s��@-B�kl�@ q����"@"�
۟=�@$ʝ:�9�@'Ux�?@*'DY�x�@-H|(�w`@0_�I��@2I�ب) @4e��r��@6����c�@9@��d��@<��@?�:�B�@A+,� ��@B�1GG,�@D����@F��Z��X@I>��%��@K���F@NQ�t�<m@P�-A	@R���m,@S�J�}Qk@Uy��Վ�@WY���0@YY��v@[{���@]��+o�@`(y��I@a`�~��@b��O.�I@d2%�8U;@e�7M�x@gZ�)pf        ?3���N�!?g�>��;�?��Ŋ���?�U��'m?�k.u�B�?���d�+D?�WE�W%[?�:�#_+1?�Qn��?�L^���<?��	�?�d��J�L?�w�m�?펦�sD�?�}�J��?��C{/�?���G��?��E���k?������@\�U?n@����@����@< n���@ݔ[8 �@p9�a_@������@8K��;@�a�6�G@�hӖ)^@ĭҔ�@!�X�,�@"�|���@$�;w0��@'��.@)k5LNA@+��&�4@.�P܃H�@0��͜@2D���@3�X��m@5�a:�8@7�8���@9�\����@;�"B�@=�-��4@@.(N=X�@Av���@Bө}�6I@DF�v�q@E�n|)@Go�b~@I(��>R�@J��|e�@L�e�g�@N�)�O��@P�׷��X@Q��)��Q@R�ŁK�@T+���D@U��JH��@V�	X��
@Xh�}�\N@Y�����        ?��q�4�?�����@
��Ldb@"\u���@2��T��@@+Wm���@H��a:��@Qs4]o��@WJR�0	[@]��u��@b� l:U@f�>$Ҕ@jɜ~poh@oeֳdb�@r)�A"D@tɲ5��}@w�O��)@z�)���L@}�9(8�@�p=�[��@�&��0z�@���R�|@�ѥ��e@��8_C�@��,��x@��f�E�@���t�@�071^H@�[NK��k@����P�@��/��Ղ@���s�@�b���q@��%��eX@�S��j�@����`@���c�@�v��%�@����f�p@�F$��c�@��;r!@������@�����	@��{6���@�ty��@�Y�\�F�@�D��&�0@�4��@�+Hi���@�'�D��@�*����@�3�Z���@�C��ɱ@�Z�LA�/@�xwj��@���ˆs@�d����@��	-�"@��Lm��@�8�x���@�۪��ux@�����@�+o�D/        ?Q����0Q?�<�hFv?�oCW�WN?�gѕ�vy?�*Zj8��?�I�rL�?�q�	^R?�����?�*����?����;'�?���S>h@�-4�t7@Y��=u�@
MM��7@��.@����@��d&�@�#S��@I9�YNb@*S����@0?a6!@!,����@"�bSc��@$�F]Q�@&T{o�@(.��ND	@*[�|�@,���O@.̍��@0��L@1.�};+@2Gr�_[�@3f��8"@4�N�l�a@5�����@6�@��@8 �g79@9_d�S}�@:��_��@;��O�@=F����@>��5o @@�A���@@�m��@Aw�/~@B7��c�@B�>��< @C��K�K2@D�l;��,@Eb8��p[@F7%�o��@G8�V\�@G�{D� V@H� _:9@I�ݒ0��@J�)�5:�@K���x�@L�wӭRH@My�����@Nv���y�@Oy>-�Mn@P@d<��@P��
5�
        ?3�x��X?k��e��|?�K����?����;�?�+/�*?���0��?�~��#��?�d��sw&?Ԇ��?��J����?�)��e?�M�h��I?�,��"��?�����@O?��bə�?���`|�o?��`?:�?�szŋ1o@]���<@[nF�@��q	@�of�v@r�I{@�r����@�8��;@��wA��@��w�[@�0�@�@!꨽3�@$/Ļ�@&�����@)g�����@,c�;~ �@/���S_�@1�{����@3�(!��?@5�����@7���_��@:I�a�@<�fI�1�@?�y�Yv�@A\���b}@B�(T'@D��d�n�@F�A�X)A@H}�v�@J�[˂aN@L�ᕫi@O&G�
�e@P�A" ��@R&�m-�@S�>��P�@U
�F29@V�?U�!�@XF����@Z��:w�@[ረce�@]�j괩�@_�g��g@a�K�?@b,G��a@c`��?@d���d/        ?K ��vb?�B<�^8?��}��R?�A} ��?�?.��U?���E�?�z����?��,r�?��u�x?�����?�������?�<��fw,@0��
�e@>�N\~E@���L�@v�*�@P58�@x�}��@����@�8�~x@! ����i@#N��n@%�Pu��@(�M���@+����^@.��*S@1B.�|�@2��]� �@4�O�2�@7%�t��@9z�Sl�@;�J�Z��@>�G�q�@@�޺�}@BO!n�@C���y�@E�tN@G�����@I�&wr�l@K�⑘��@M�&;��@P%G�AeD@Qe!�j�@R�c@(�+@T���B�@U�AV��@Wo|@X��(Do@Ze��Q��@\,�f(@^��D@_��ZEy@ah��@b f�s�@c-&�u�@dU���@e���ѝ�@f��u�U@h`:B�H@iy�.MT@j�$-�@l^�%��@m璺��        ?� RY4�J@	�|=�}@*�b��@A#K@P�E�GM�@[��0�^@d���~@mJZ1��}@sv@jBq�@x�����@~�@'l}@���+���@�RЉ��@�)i��v�@�C�۫��@�P����@���V��`@�|����@��g?YB�@�Us;(~�@�$(�J�@���&u��@�9L!DP@����&�@�;�`��@�������@��굒�m@�fY	�z@�7�x��B@��f�J@�����}�@��u�S��@��!��zU@��%"S��@���t��@�x�@�?�O�@�%3�bG@�>����S@�^# �g�@����[e�@��[�F�@���1b��@�S����@�_��q�@�TLwQ$�@����N@��&��x�@�U��<�2@���Y;2@ü��<X@�u��Ǹ�@�1�{z@���u^y@Ƶ�Ҁ��@�}��j�\@�I�ݾ�e@����2�@��ͅ��@��V_�-�@ˣ@��]V@̄���@�j��Id)        ?YB`M�W�?�1Q$�u?��T���?��3?4�u?�>yB��?�M�����?���<�O�?�D�L�z?��hC
L�@O�1SDy@�˴E�@
Fl"���@gM�/G@y�#���@s��+�@�5.�@��GI�X@��ļ�U@!�-]�p@#��=��@%��}���@'�l�O@)�<���B@,C�Q	�@.���y}@0�U���1@1�_�t�@3����@4k���@5�U�+�'@7.����@8�%���@:$,��@;��
�3X@=&�͓��@>�����%@@/���5�@Al�LD@A�n��D�@B�����Y@C���:@D����U�@E�w@?ie@Fu�W �@Go�l'�C@HoJ�yU@Is�YO�@J}2�P@K�h���@L�Gl^�@M���"[@N�t��R@O�Z+�@P���j�@Q��@Q�DRkF@RMyj��"@R�T�Z�@S�� _�@T"+�ܑ�@T�_zA��@Ud|���x@Vvs#>        ?4�c���-?q��.�`�?��b'�?� �00BS?��h���?����3�?��r֍r?�Sp+!��?����QB�?���%R3-?�&)ɮ�=?�:��Q�?�:�"�?��� ��?�Y@j���@ X���G@f�)^�@�����@
���w�@`e�$;w@>� 1X@"B�Ϟ@cO��<9@
�ϻfb@ (ܠ�@"Y�id69@$��״�u@'��=&��@*�3��I�@.@�V���@14[BK�@3:���@5U�ry6�@7�q�r.@:w�˃_"@=]�i���@@@-� @A�F��@C�n(�F@E��Q*>@GҚ0�fA@J�Q���@L{� ��@O�ʹ"+@P�Lݞ@R^��It�@S�B%�Rp@U�ԍ���@W_�?�k@YB����S@[C�$���@]dx�R]@_����'3@abe�	~@bGm9�@c���R�,@e',g��@f~�h&?�@h�@i�<�*@keأ�_@m1Q�y+)@o��        ?D��A��?y���Ȧ?��A���?�*s�=�?�8U���?ɩ �?���u?ڐ/�Z@?�/�n�?�O�H�?�&9B�?�/��]��?��ux���?���~��J?�<���9�@#7���@�D}�^(@��R��@
���c��@P���}@?/�^�@�-�`�n@	�)ֽ�@�/h��0@�(�l�9@�T����@!9�Z��@#�Ŗ��@%(ɋ�y�@']�(
�l@)�CP��^@,Rf1�M�@/e�3�@1��1P@2������@4���@6o�y�Z�@8��`��3@:��#�@=7vZ{u @?�{tL�@AL��A�S@B���+@D[���S@FXSa��@G��x�@I�T�ns�@K�u��� @M�G���'@O���H�-@Q*Lm��@Rd�A�M�@S�3쓲�@U	���5@Vt��%qj@W��9�3@Y|"{��:@[Q����@\ǵ!E�z@^������@`,~:b_�@a)ݦ.@b�m��        ?�d	kM}@
b��K@+B���A@A>�����@P�'��(@[���;@�@d���S�@l��N7)�@s���@xY�eA�@~;��c�@�X�1��@��꯮{@��e�@���\�1�@����!X@�OR��Y�@���+�H�@�B��Q��@���T,@����Ͱ@�Fɦغg@��IO?C�@�N�w)8�@��Kݱ}W@�����@�8���}-@��F,��5@��o@Z@@��A2xTG@�b�Q@m�@��>V4�@�����@��cG/@���h�n@���lK�|@��a[�r@��}���E@���/�@�)ʛ�8@�[��:@���drc�@�����@��a��@�j�B���@�`�+�e�@�Hm�G6@��-3�}x@�v"��؉@�-�5^�@��x}QX`@ĥ~��@�d��!��@�&t%0��@���w9�@ǯð_��@�wh⪲�@�A�r�9@��b8f@�ڶ�u @˪���c,@�|�V�=�@�P���X�        ?x�C��?�T`�04=?���g��?��%����?�cz��?��ڠ?l�@�ȼV;a@	資�~?@@b�{|�@/0��5@�
Q7ag@ ���7�@$j�Vq�	@(*S��b@,;w�#�Q@0N���@2���a��@5(wTҐ@7ϲ<i�@:�Q�th@=�ʶ,��@@X��8@A����:@C�h�e��@Ex�#�y@GVat��a@IH$E�@KNC%���@Mh��8V[@O�Ҫb�@P���77�@Re��n@SQH�&+X@T��s�N@Uޓ�!C�@W4禬pL@X��ǽ�w@Z �e���@[uׇ�1�@\�H΍��@^~�
~V�@`	Ub�:@@`�I~-r@a�MQ��	@b�_e�qA@ccB�z�@dF�C{�@e.��q+�@fQ���@g����@h��O��@iii���@j��F�2@k�g`7j@l�u��[@m4���8@nOq�ռ�@oo��h��@pJ�*V\@p����#@qyI[� @rz��QP@r�Je�k        ?/�Dں�?gk�}6�r?�;4[��?�� �G^�?�r���ύ?�����ѿ?�W�+o�8?�ts�4�?Ԯ҅�Y?����?�D*��UJ?�>�s}?�f�����?��J^��?�W��b`?��6�0�?�l�A�2�?���G�@�d埭�@i��Sd-@S��F�@
��B�D�@���@��a@�����@[=��`�@ܪ.c�`@��ٍ�4@���}@ a�|+͛@"��e�@#��i@ @&��ʻ@(5�D�0�@*���5�o@-���*@/���
@1U�x��v@2���V@4�Tа�@6I�z<�s@8)x����@:'�U�"�@<E�q!�@>��ⶇ�@@r�u��@A����@C	0�ZY@Dp�I@E�
��@Gwȴ��y@I����.@J��Ȝ�@L�s�8{e@N�*b���@P<�z?x@QEJ���@RY�&�@Sz�(�N�@T���U�i@U�U���
@W)�/<U@X~�P�N        ?{���٧�?�b��S��?�v~t�5?�x:�=?������O@��V��|@Җ��@N#��<@ d/5���@%���Z+�@+h�,��@1`��&4@4�̻pp.@9W��2@=�r7�@@Ar����/@D>�n���@GF^�6Z�@J�����$@N�y1��@P��^��@R⽀��?@T�7��K�@W:k��+�@Y�^q
0�@\����@^��K�a�@`���RZ@bGf� @c�~ML� @e6�l�@f�mUN�)@h^}��@j�JU2@k�V��� @m��� @o�����6@pƆ@�@q���S�@r�Z �K#@s��ޚ�k@t��l�'!@v�kfd@w81e�d�@xc� �+@y��v���@z̬c=F�@|8��,0@}P<4u�@~��eC!@���-J�@����q@�R�oT�@�O?���@��rm2r@�t�Y�@�1�e~D@��d� ��@��c5��@�}��XD@�I7*a�[@�)�C�@����l        ?�'��J}�@.ݤ�^��@O4}��
@cͦE��@sU�P�&�@����A@�AHx��@�~�eA@�������@�rҤ��@�ydծ��@��e�8C�@�F`'�J@�(�-�Ӟ@��,��Iv@��S���@����d�C@�Z�F@��XGa�@��6���@�ο~m-@���c���@�~�zh@�MPה�U@̧�%m@��iC�@����#�@�"����@�����@��ή�
@�]u��q{@��{���2@�k�F�U@����D@ܪ'`|�@�[{�B'�@�a�_b~@������@��j:��@�˲�1��@����@2@�t�6�@����|@�ŝ�Z�+@����ȶ@���h*@����<A@�u��@�8�����@�_��@������@�G�,�@�z"�@�,i���@������@�\^�-��@�hX�w�@��-�
@�V.;�ˤ@��e�8�@������@�f��Aq@���ǆ�        ?F�隮^?�B��<.�?�BJ���]?���q���?�K�΃�W?�f� ��?�4>T��?�N���H?���1/?�����?��,�Q�r?���ք��@��g+@jh�ձ@
'�d�̿@3�Y�p�@Gy��"@��f�l�@�oxS@��:��@�s�U@�d��L@ ݡ�� /@"�onNj@$D�d)�k@&�7��w@(����@*���O@,0g��(�@.k%���@0`T<I�@1��A���@2�1�8:@43�]I,<@5�{>�r�@7
0�^@8���$��@:-���@;�{��2q@=v�*+��@?<�hX�l@@�rE�Gl@Az	��@B}���E�@C�'u�1@D�z�@E�C@�@FөJ��@H Ѱ�@I7��څ�@Jxzן�@K�G�=/@M6늹 @Nwb����@O���M@P�W�9ji@Qiq���@R-��e��@R�0m�s5@S��)Uhh@T�^����@Uq潙��@VO:����        ?.��/?r@�f%?�,�x�?�!�jU_?���ow?�2Q>˦+?�f��\?��]�Gj�?�K�z�?���Q!JZ?��I.u6@�5 ��@[-pH�@
6Ao�PA@�� L!@�v%�B@zk��F@aW��L�@��bG(�@!�W�{�@$h?Ҷ�^@'Qg����@*�ȯV	@-�f@�(@0�!����@2�)?X_@5-��`0@7���d8�@:-+�=�@@<�t�W@?�g�\�@A�C�	E�@CGRЋ?@E�6��@G
�켠@I؎cĎ@KJ
D�@M������@P!�*@QT����1@R���A��@T'K�k�@U���N�`@WNU����@YQ��L:@Z��t��@\�>� x@^��|�ȃ@`oMG�^@a��C��F@b�>�z�@c��5=� @eFn$]��@f������@haG�@i��v�Q@k)	�[�@l��DG�@n���k@p*�Z�@qR2`d @r���U1@s�fD_6        ?;�'ܭ�?s�G4�1+?��A �~?��8����?��,�� �?ʡGWc|�?���:M?�D Ye��?���'�&?��e90?�� -S�?���o�8?���ދH�@�:�{�@�;�B"�@�c�[%�@(��Q��@M���T@�~���_@��=@���x�@�����@!Ŵ�k|,@$���D��@'�(-;�@+��is8�@/���G�@2*n�R=+@4���ӪZ@7H�^�7�@:M�ʫ@=T<���@@Fi�B�@A���[��@CuB�x�@EB��(ѯ@G%�;l"6@I�q=@K.�hXh�@MU����@O��o��@P��  �0@R/�/���@Sv����:@T�.tS��@V.Rݮ@W��3M��@Y"���8@Z�a�A�t@\YL�.�R@^���F@_�J$[	@`�+0�W@a�Np��@b�8��!}@c�AU�@d��s\�[@fk���@g9����]@hm�C�J@i�[�hٖ@j���G@lJŘ��'        ?�(���9?�x)T�&�@!]�u>c@7��s�@H&��oK@T�¾c@_�K�[�@fq�U�[�@n&?�@sx�戩@xh�qS�l@}礞�7@����ఈ@�M�8�@��=:�@��:�62�@��.. @�ВJ_b�@�@Y ��I@�ٱG�:W@����3�@����8*@@�P�����@���5�;@��[�L�@�y�̼��@�ap׵�@�b-fC/�@�|gD_{c@����@�_@�� >���@�4�t�@�u�O40@��v��O�@�"��2�@���z�:@�A{�@��!QLc@�%���%�@�˝U4@�����&@�"��c�@�Aϐ�@����|t�@��Cgѧb@���`�I@��t�H�@�	g�.O@�6q8y��@�Z/|6�@ɆY�5�@ʻ	�.�@��Q�D6	@�>LϿ�@΍���@���&@Т�%��D@�WT�8^@���&�A@��c�x9�@Ӑ��2C@�WQ6�?�@�"D�[��        ?X@��?�#p~?��8��?�C ��?ӽt����?�\_�)�?�m�P��{?���Ǚ��?�xҍki�?�����s@�;��@vNIR�q@	����O@��m� @F`�<=@��E^-`@e`&��@-����@;��k�@.��- @!4��@"�+�-��@$�����@&�1�l�@(k��	R@*l3�T\w@,�u��0�@.����߬@0u�cs�@1��� u@2�:��5@4y�Pb@5`�DV.�@6�8M�B@8˵�<@9��끯l@:�H@q�@<���?�@>��a��@?�����O@@�Gs�?w@Az����@BVs@`�n@C6��Ee�@D6����@E���E�@E�$�qǏ@F�r3��I@Gܳ^�E�@Hֿ���H@Iԁ1��@J���N�@K���T@L���@M��fds3@O�?I�8@PC.��@P����O�@Q&(3X4@Q���
�@RII�hE@R�����@St��|�        ?�Lsѡa?Sj9���?tQ��*?����F)$?��0?
�G?�j�8�?��bT�_?�(Io[zr?�>�.dg8?�+�т$T?�R%?�CI?�2W��+*?��/}}�.?����/�?��ȕI�?۪*�}?����i�?��_��h?��<� ?�@�	��?�ZW��1?��C�%?�#Ri��?�?_��v?�xNܲ�0@:Ĥ�Q_@AHʇ�@'�q�c�@���|O@cƥ�c@��U@=���@�IH	��@���P#@��F1�(@ l=��@!��=ٮ@$��B/�@&83
�@(�_�09@+5?�P@.�d)%@0�N51��@2%	VL]"@3��n&U@5�!�Y@7ɋ��@9�?fv��@<>� �N@>�E`��@@�j��e@Bn|��[@C��=�K@EU^&�@F�>W��@H��V�@JoO93{@Lk�sF.@N�4b��v@P^�m��@Q�$U�u@R��P�@T5�tX        ?Ys$�{�?�DΜ�t?��l]��?�b&�T�?����ֻA?�&�L5�F?�)�5s{?���F��?���?��,6�@ s<��t@��<��@y�x�-�@iI�ߦ�@���4��@��2�@�EWr�@ubTO�@��*�n�@�ςK<@�_��T@!�6'UlC@#\�q�.@%=M0�}@';|��_@)Y����@+�d��@-�h[L��@0A9�'�@1�����@3��4�;@4���E�@6���B�@7����.�@9�9����@;j3�:��@=d�K��@?zi����@@�V$w�@BQ<J�y@C<#�&@D��k�9�@E�����@G]���Dm@H�*��1@J�t��R@LE�Q�G@NX�~n�@P��t
@QA��L@R$��7!@S>P$�W @Tk�6S"@U��Piܾ@V�Y�%@XA��h<@Y�oJ��@[���@\�ոƆ�@^���@_�A�Ph@`�����@a��u[�        ?��u��,,@%�v��@-|.;=�9@B�;؉@Q�+�dZ@]�x��@e�^C��F@n3�{@s��l�@x�k���7@~��ɝ�@�i|:��@��t4��@�F�-O6�@�	�;�@���c�<@��:A��@�ǃ�;�@�T���@�t��!�@��e~���@���w�X�@��F�@�LaH��@�s�����@����HL@��d��@�؝A6�@��2���f@�u�"*�@�8=� <@��*!̩@�rkz�1@�g�̴�@�c��i��@�fDz�9@�ovi��@�'�eM�@��B&Z(�@���=/�a@��d V�@��EQ���@�,6UҠ�@�av�?@���(P��@�ۣ��܆@�z���L@���ߖx@�]+?R 8@��?�@²��!�@�a��@�Xu~�@���,E'@�x��J&5@�0IW�I@��q~l�@ǦpI�fE@�eM����@�&�m�!�@���;;@ʱT
�@�z�%���        ?bO�{��?��̡/`�?�}� �v�?�0���?�uA�d�?���zF?�.��7?��bMV�?�����"@I��
��@	8��?��@�tw�@J�?y�@iBK@�Tʦm|@����]�@ A�Y�t$@"R���r�@$�N�<I�@&ʚB�@)1*�j(�@+��}u5@.Q�7���@0�[�1a�@1�|���.@3g)t0�@4�c�&@6���Qj@8!���a@9��&��@;��:�~�@=e�b]�@?H�'U�@@��X��x@A��J+��@B�[���a@C�5W+:8@D�v�O-@F��l��@G<�F�I�@Hv,K�@I�I��Z�@K�Ԃ�@LV(��.q@M�P�F�@O���@PBҵ��@P�s�dm@Q�n����@R�
g�n@SR��	��@T$B� �(@T��J���@U�#�%-@V��� �@W��d�]�@X�[�@Y~C�`�&@Zu���R�@[r:H��K@\tE��m@]{�p�6�@^��B��        ?DZ�S+?P[6K��?r�Pd8�?��P���^?�Q��>7d?�����3?���24.?�4S��FR?���(�e?���$?̗�E�?�+^��,?���n��~?�(]����?�?��Q�?������?�>�u*?�3�GU�?��n��*�?�1�뜘?����6�?�#.��@ �d�"�@|G�d6�@hSX@	�`�C�@?{w���@�b��/@ɭ�S��@-��,ݜ@�X;҃@����A�@�T����@ ��Vm�B@"SV��j@$BT�4f0@&U���V@(�x|���@*�o
=�9@-wD m.8@0pVTh@1���v|&@3pw��@4����5�@6hM���@8=�.��@:/�z=@<?\l)@>m4�6]@@]�~���@A��8}��@B�*Npř@D6�<�8�@E��+f�@G �a���@H�@�"@JW�M]%@Ln7!�H@Mྩ��@O�Z,.&�@P�O^�@Q����z@S>�LpE        ?F1[�&�?zcn�?����D=Z?������?�#[��Y?����VD?�y�3�9_?�����0�?�9e���?�6���*�?��γ2 �?�5�N!��?�߽���?���>?����6�(@]3�:�@6e��s@]/5E��@
����@�!՟��@nO� �@��T��@>#X҂�@��>9(J@�?�Z@;ꄅQ\@!c(�'}�@#O<��o�@%d���U@'���Ma@*�<6�>@,�A0�@/��j��6@1PW(
@2�Uy�i@4��3b-�@6�v����@8��CQfL@:�����@=�er	E@?p�=�@A �[��@B\ld��@C�j�z��@EQi�X@F�5B�!�@H�����4@Jfm��5@LGkq�V@NAX繯�@P*{	�@QA��Q�Y@Rf��	�@S���k�@T�y��.�@V(�ڌ�@W����:[@X�Էc�k@Zo�w�G@[�H/V @]�3|<@_@e][4@`}9P�f�        ?�����L�@
���_�/@*��n @@�$T  B@P���@Zz��tj�@c���/C-@kY��)6�@r5 ���@w~���t@|��Z���@�Vc���@��i�
�l@�/���w@�����	@�GT�?@�*ĝ���@�n��8��@�ь����@�R1�.��@���h�z@��c��0@�³+��@�=�&�M@��[�Df@�_��}��@����I@��u����@���>2�h@�Vf��1�@�;e[�e�@��Ϫ@�@�(�_�@�(�i��@�=�Oe"�@�\0���@��8�K�@��4����@����_�@�-x�G��@�w��d��@��Dէ߉@�%s�?9�@��,��OY@����4��@�����@�u@��@�9�F��6@���cx�@�үBI�y@ħ�6�A@ŀ����@�_��s�1@�C��F�@�-�@��@��$MP@��l�ߜ@�
P%̃�@���s�@��¿�@��Q?O�@�#�a�>@��u���        ?u���6z?�he�q��?̼��m?�����?��] U�@ %M�
�@��YG@jY���l@Z�%�@H��@"�4�{\�@'�o�3�@+�g�S�@0E�\	?@2񶵱�z@5�e�y@8�+��
@<$"�C�@?�1_���@A�Y�+1�@C�|���@E�L�B�#@G�;ᗐ�@I��A�i@LH ��Q�@N��^���@P�ZșJ@Q�y8)@Sg�@
@T��7L�@Vm�4�@X~�n0@Y����|	@[��fA�@]_����@_O���"@`������@a��D��6@b͡ޢG%@c���D@e� ��@fPr�)�l@g��D�M@h��yJ|�@j/z��'.@k�s�/�@l�ԋ1@nk�L�/�@o�3궇`@p���(t@q�	����@rT�s��@s*/ݘ^3@tu�I�@t�0z@u����k�@v�|/��@w��
G@x��{@y��G��@z�q��Zz@{�@��?@|�m�!��        ?C��dP��?�z,x��?�i�X�$?�{�G|{?ӑ6�8�?��K^A?��أ�?�vsτ}�?������i@ 5����J@xX���@	FCQm~�@�b��>�@N�!K@���v��@6x�:@*q-!��@ ��$�@#��p(�@%�H����@(^�j��o@+Vb}`�Q@.�S��4�@0���x[}@2�o8��@4�7G���@6�id��E@9JV��
@;�>�{7B@>iT?�`�@@�b�j�X@B"���@C�>u�M�@Ex��[@GL���%@I>Z���b@KM��96@M|���~@O���~M@Q&Y�P@Rgz~A��@S�a�8,f@U/B�K�N@V�u<+m�@X@FF|��@Y��� �@[�ԅ'��@]h4fO @_G�Xբ@`�!޷��@a�O��	@b���v�@c��(��T@d���NV�@f����@gZ|�T[@h�<���@i��%t��@k[���z@l��5w@nHJ��k@oӤ����@p���(��        ?��" �ø?�<��8d?��;/a'7@4��<�a@���%@&�w+>�@1&��6�@7�]ސ�@?_x�q.C@C��EB�@H`c�_K{@M?Mv2|?@Q8��01@S�)����@V�%�:��@Y↤���@]$[o�@`+h��*@a� ���@c�cH?@e}�;�E@gd̡��v@i]�:�~�@kh��{X@m���u�n@o��x�)@q 5AJ�@r.�v5s+@sh��l|@t�%�X�@u�M!�0@w\{�,�@x��l~��@z;�(N@{�F�Ƀ%@}Mᬥ<{@~��=1V�@�J�9DS@�'J#t�@���!�@��M8�W�@��<ejQ�@��=/��@�����΃@��%#u@��sq�@��3��@�CbR"�H@�o6F���@��z��c�@��K�Bc3@�%��J�-@�9��΅�@��lE�1�@��@8�A@�Imj���@��{���@���^byN@��[@��@�D�c�&@�	��r�@��ce�)@���3�h�        @�w~��@A�j5�@b�E5��@x�~�/�_@��m-"bO@����f@��d���@�a�|���@���C�@��=��R@�oNr��r@�T0nx@�����fP@Þ&u��@Ɲ�%��@�Ȧ;�@� �0�}@�QH�5x@�'�'=%�@�iz�Y@�1�y��@�(${%m�@�R-��}@ܑPP*�@��X�;��@��^��[@���'�d@�7J�g��@�Ҡ��;@��+�.b�@�j��w@�@����A�m@�{)��]@����а@�đ�b@�A���@�a;h�@��v;g@�����@��S�@�Y���O@����;�@��؁���@��(��@�Ӡ�wٛ@���_+48@�(�?�_@�^��S�@��%kF$�@��dJ�[�A Y�  �A �*����Aq?WI�0A$�U�xA�e�܏�A�q�$�AX�¹�A-l+t;A宖�x*A�&��ĝA�~�1��AV��OH A	.�S;�l        ?GU�H�Ŝ?���^?��D9
?�ߜ���?�̅�N�?ܧ�M�?�=�A?�wk+�� ?�V�ӌ)�?�"�ާ�@ M݃K��@߈�Dvn@��ތ@���c@C��H@@����P@J��{��@J�ז�@�W�@q�@�
v/�@ �B����@"caÌ��@$1��y7)@&4��{@(����@*'n��"�@,SAͶ��@.�~' ��@0zElCV�@1�]�2�x@2�&|Q�u@4Q�/�N]@5�zG@7!J��)�@8�RW�@:$#�֠c@;��#b�@=Z1C��+@?���H@@b,\��@AF���ǔ@B2/JA�&@C$|�q �@D��en�@E����@F$����{@G2�´z\@HG�I��[@Id^��Q�@J��[��@K�$֗
@L�۱
�@N*s��Q�@Ou/B��Q@Pe�$lM@Q����@Q��.-l�@R����
�@SM�����@T?�v�@T�����@U�x�Z@V�L���        ?;��j�r?�i�GS�?�|�__�?���g�?�v�I���?۾M@K+�?�I��<?�����?���7\}Z?�%ۙ6�@ �[��d@�@�L����@G����@
�Aݲ�@��@~�@gm�a@a]�ߦ?@��o�@�>K%)�@!͟���@#�����9@%�|��Qz@(2Դ?@*d�眯f@,�0�8-@/�\Qy�t@1;�U���@2��@4bO��,;@6d�@ɑ@7��.�@9�l凂<@;��X��@>$�]g~�@@:�c�@At9ah6�@B���&`�@D�z@E���Y/@G�:@H�<ֱ��@Jt+M�4@LD��Ͻ'@N-���@P|Yn��@Q'-۲�@RC8���@Sm0��pl@T�3�@U���b@WC�+�]@X��@|<�@Z%طZ�6@[�CO��@]T�̌_�@_
�|j�@`jǑ�3�@aZ�'O�r@bU=3�p�@cZm���@djF}�_|@e���厏        >����?2����?S}�UCG?i�H����?zL	��!?�!X�qG�?��dؿp?��T���]?�Bݷ��?�u�j��9?���H;��?�X�m�8$?��G��y?��mС�?Ϳ�'�w ?�L4&��?�7��D�@?�s�נת?���I<?�p;i���?췸PW	5?�t�Ee�`?�O��?�?��u�m?���Q�@��V\@�Y����@��;�@��K_�v@���n@S!u˾@��=sZ@=���@��9M83@ ?�t��@"c7Uz@$���׼@'P9�
V@*!�)w$o@-5Dh�X@0G���W�@2�U��@4����@688{�`k@8�:���y@;	���>�@=��3�k~@@QQ�%�@A�ao5��@C�u��/@EV��f�@GAl�W@IMW���@K|[��n@M�(!���@P%A4��@Qv���w�@R�'B�bJ@TY�6Y�@U��ļ8@W��&�T@Y^����@[>�Q�r        ?�`\��E�?��10���@">�����@9��B�@I��A 6@V)��o*�@a
��E�@h=1�N{�@pM�&���@uC�r�@zR
�
��@�����,@�5�Ԅ��@��w���u@�B�H>`@�(s�6�@�&�Y��@�Y�L�@���aK�<@�"M�n�@���7�E@�q�?�=�@�&�%I��@��"���@�7�k��@�ۇ2�R�@����e;@�[sH/߯@�8V=*W�@�)o]�Q@�.��~@�#���r�@�;֢��@�\�5�M�@��Y��C�@��ro�"�@�C�I�@�N��ֱ@���ov�V@�	س#q@�x�V!v�@����E�@�{f����@����)�@��R�@��� ��^@:��~k@�pR���@�[o����@�M��U@�H�Hp�@�L\8~q�@�ZX�#cH@�s��h
@ʙ�y��@���^O@�:��e@�V��J=0@ϯ{��@Љ����@�B��#@� E��(@��s:!        ?T����<x?�0N��w�?��A!���?�����?ٔ f�{?倊��J?�J��z
\?���C"d?���*��2@�[�4>@	�MJ@�G^!��@���d�(@�^��h@�e[��A@��8U\=@ �]^�^�@#A��A�@%��JkS@(Ao��"�@*�b)��@-�f�6v]@0k7� J�@1�0��@3�A�%H!@5[���j@7%���T@9��1�@:�6��F�@<�Pv��@?��Cw�@@��3��'@A���9�@B����r\@D-�Qen�@Erƅ�V@F�ԃ�^�@H �.�@I�R5�@J���n�@L�5�%`+@N;v+X@O��#>_�@P���r�@Q������@Ra���t@SF��߱@T2��m�@U$�
�@V�d��?@W`y�w	@X勓�@Y*����@Z;&�k+O@[Q��5�B@\n4�%�Y@]�j��[u@^�C���@_�	v�0@`�-H��@a(+�c"�@aƸ��j@bg��V        ?Y��6?�S��Ԭ�?�:V0�?�˨�B/?�Q!_O`?�G�:�?������?���#5�{@ac�4,�@
YUg@/�>��@��Bɖ@g�r��@s^�Қ@Ƌ(��@"0.��F�@$�>7`*�@'3�}Af@)�L�:�@,�+i^b@/����@1|Kt�A@3(F�;@4�LO�@6���4�@8��օ��@:�1�lD@<�Ֆyk�@?Q!98��@@��p��@B/ه� @C�/{�R�@E9��3�@F�x�""�@H=w����@I����@K�tK2@M�Ф��#@O𬧋;:@Q���t�@RCݠ��p@S����@T֑|юN@V<uRUl@W�^2���@YE��0L@Z�Bbk�}@\����J_@^uA�A�.@`/@��J@a0�w�{@b=z�\�e@cW����X@dG7s$@e�����@f�T8�\@hF��X�@i���v�m@k_��U@l�?���@n�0��@o����=@p�{g�g        ?F�Z��?}�D�c��?��u~9�Y?���^{�V?��ȕ���?Љ(~^��?��T��?�k8��;?�*.���1?����k��?�p*Ω`?�ix3�1?���|2�?�vɩ/Or@ICˉ2@�c`��@6�迆@?�����@��#@>
�":�@E�-�v@x��sB@؜f��X@k�++b�@5�:]�@ rv�5@!�6���@#�vZ��@%o��נ�@'�[�xX(@)��W�M@,%��J@.��|N@0��o�@2?j��@3�k5t��@5��Q�OF@7Z�Gʳ@9G����@;R���E@=|���@?�S��'=@AO�@B^ R��@C��H��@E֚(,�@F�Ll���@H!cn���@I�5'�i�@Kl�,�+@M--�u��@N�V]�%�@Pq�C���@Ql�*�+@RpO����@S}�9R�@T�����@U��;�%@V�(̩Ҕ@X�P��@YF���Q�@Z���p��@[�Z���        ?�	�Nl��@�k"��@:
���=@Q�N�D@`�T���@l3٩�o@u?,�LA@}Ϫ�?5@���F�w@��F@��@��A��T@�f��Yc@�3&L(K�@�O/�e��@��HȜ;r@�8���~@��)6���@�_n���@�*9Us�@����sV@�5YY"@��['�@�Y�MmQ�@�GHA��@��g��Q@��� �΁@��mq:ׁ@��?�q�@��|b��p@�c>�٤@�yї[ȱ@-e^]�@����}��@��Ĥ?@�-�����@�r'��#r@�� i���@�tt$�@�x���Ը@��.��^@�WUå�@��ڌ4��@Э�{̵�@�u����@�A�+$@���W�@��EFrq@����.�@՝�F�_1@�6��9@�d��*@�M���w�@�:�uj��@�+��3q"@� m�=�@��56�;@�iܨ��@��.�%*@�Z?@��I���@��J)Z�@�+3L@�x C�        ?S��{�N7?���qs�?������?��r"��?�_#��u�?�WhH F?�P8�A��?��&u�?��X�[	@�1|,X@3�7@ķ���@�|FN%@��S���@KN*��e@���T @-���J@!�Z3��	@$%��H��@&��>c��@)S�E�b�@,&�0�a�@/"�@[�S@1$~, �@2���f�@4�azk^�@6]x�L�@8H���H&@:Ks�t|A@<fDn}�@>�� ��j@@qj4���@A��l�@B��0т@D$dr7�@EuNM/TZ@F�M�� @H55g��@I��i2�f@Kgp@�@L���E_@N*�t&�G@O��w{@P�)�L�@Q� �wq�@R^��t�W@S=���ӄ@T!ܙRap@U1H�8�@U��>�i@V�׮���@W�5ռ_@X�� �<@Y��Lc��@Z�h��c�@\.�*�Y@]S��@^/݋|A�@_N��b8v@`9��⪶@`ΩF4֙@af{�If@b(1��j        ?C���?�a�G��?�Y%A�|
?�O;���J?�sJ�?��}i�4[?��^�m?��y��	�?�=��FmR@(�-�'�@
e~�h"@k�$SF�@B��-�1@��#0(�@LCHr@!A�O��@$+rY@',9��@*~(t.<@.�K��@0��ʫk@2�W!F��@5!����4@7k�2�}@9�+mP�@<a,�)�@?)�Yݍ@@�W^�;f@B`O���@C�4wS�4@Ewo�~8@G�V�@H�ph�w'@J�Ć-�h@L^lhPI�@NAH&X�Y@P5�@Q�����@R.D&[�@SHA�ɓ@Tm�g^v@U�oW��@V߄B�0�@X-w�1@Y��q}9@Z��C�r�@\r��.z@^v�ў�@_�y(\�(@`�y⯔G@a��|d)P@bV����@cz0\Z@d��v�l@e�\A�>@f��2tB@g�m�}�@i <���@jk��3�W@k�A�!�J@m2���x@n�c�E+�@p��=$�        ?[�ף#?P�$�Q��?r��-f�?���T5f?�J�2�i?����?�?�L��w?��v7v:?�G\���?����?�z�5���?�Pֳ�]�?�G���f?�S����?�V�N�`?���@U�?�*]W� ?�M�4���?�$7=G:?��
�w��?�2c�W@��$è@@��f�@
n�b�Ob@;]U�I�@[��Ӭ@z*bX�@�W��4@����@ ��c�$@#A��g��@&3�䗄@)3�Kb݃@,�pYn�@0G��`@2l�sN@4���0�@7jRF&�@:M*i|@=z?`�7F@@{�����@Bf ����@D��W@F��x씮@IMk۫�@L	牯9@O�+Ԓ@Q"M��V�@R��+V�@Tμ��h�@V��҇W@Y��%g�@[�K ��@^7�_o@`q�w1�i@a�i�_��@c���X��@e<N�I@g�&��@h��z�pA@k	>>L"@m6܄x�@o�����        ?Њ���dG@{�����@0���l�`@F��^�E@V:_R�>@b�'��	�@mH{�+²@uj��B�@|�చ�x@�!�`�1�@��.+(@����'Oa@��H�a�@��F����@��Q(�<�@�U�
aoa@���y�@���d��@��\I&��@���͛�@��mR�@��]� �@�DL�V$U@�:����@���Ġ�@��֡,@�6�E�T�@�p�۬,�@��u�@������@��l�Q��@�,bH	�@ĈOmu@���/�@�a��_v�@�ݯXo�@�c��>�L@���s�O@͋»n�y@�-��5@�lȩx@�@�GaA%�@�&��H@�1X���@������@����js�@��:����@�Φ:@��Ļ3�@�΋�J��@���ܯ��@���`�s�@���x��@��j�@�!��� @�?��@�0���-�@��6c�2@�Y�(�	@��/���@@��u�i@�&�n��;@�ĳ^��        ?5L�B?n���N�v?��&�?�x�\L��?��v0	��?�c��3�?�Wv�a�?��u;�S�?�*�{���?� ;)�?�VA�;�?���u��w?��^�?����R�?�rč?�����?�|T«X=?�إ��?��~�<e?��E��@ m��dT@�*t@��3eU@�
f<N@a[ƍY�@	P�Tv�@S�o�u@j�Q)�@�9Tt�@��M!f@ݷ�@@I6��@�	�w ^@�m�q�@%h[{�@����Y@��q��@`��Xj@�_JyR�@d�%�@�wAI�{@ ��"�5/@!����L@"o�![�@#Jr�Y:�@$)%S��"@%޷ͷ%@%�Q�@&���R$P@'�(��^�@(�-G?^@)�s��@*�j���@+��Ζ@,���3%R@-�R&��@.�}��`�@/��V*ڶ@0fR&�h�@0�XfL@1|A�1rZ@2
���7T@2�vV��0        >��dlq��?1�:�K.h?V�}ݬ��?qa�ǻ��?����!�?�pc)�?��Y���?��k+ ?��>L���?�0�T��z?�c���C?�|�D\y?�'����?�Y��q?�8�G/U�?��r�^.?��$~�?�+���߸?�#�����?�Q�Mi?���ys�?��%��-}@6bgG�@1��sՇ@��_tO�@�ܯ�@�L���e@j����1@⤂c@��a�\�@-O���@���0�.@!0�7	9�@#5��L�@%b/L��K@'��XA`�@*5b���@,���m�@/���1@1\?�V}@2���"(�@4����t�@6r�HUv#@8W�yU�@:W�1єD@<s�N@>����@@�����@A��� Z@C��tZ@D^�C�-�@E�Ԣ��@GDw�%=�@H�s���$@Jpk#���@L!����t@M��=���@O�[;�"�@P�+ٯ	�@Qө�@B@R�Y�Ӹ�@S�o3���@U�N)        ?!�3���p?V�?�?��?xvG&l��?�Z,��b?��O��(?�B֌��.?��7�jh�?�ʸ�w �?�UΥ�>k?�>�D�?�Vm�U?���I?�1l�=��?���~�?�O.���;?�M�V�~�?�lK$h?��?�\?�zLŜ>?��2�t�~@ �<���@d,S�$d@e��`��@	�{�z�e@��d;�@�-��%�@5#5�0@��;%�@��rس@�h�$@o��9�@!�@��h@#ԢܻS�@&5�{�@(�V�mP;@+�{���@.���$@1%毞�(@3	n�0�*@5�b�C	@7Y����y@9���x}@<uܳ�A�@?X6��@�@A;~��m;@B�)���@D�C���@F����@H���Qk@KL�P@Mkr�E�@O��5�@QZ�&��@Rΰ�N��@TY�m��@U���%_�@W�ШԌ�@Y��e6��@[~�2��*@]�M&_@_��(?�@`�"���@b,ϥL        ?��-��}$?�}��_�@_bV\�b@���2�@)}�}@4�p� @>j4���@D�A�n�@KW��׸@Q9+;��@Uʟ��@YG�p�!@]��jȿ�@aF9�S&@cϕPdd@f~���7�@iS5�(�x@lN`��$�@oq9(Q�I@q^�N5��@s��!@t�71�k@v�`m?�@x��g@z�L9U�o@})4-@@����@���rl�@���dnc`@�?FϪ,�@���o�b�@��7@��@�I$��F@����4@�:*wP�U@��i�BAb@�_�rP�@�N6Qs�@�\�WWM�@�=�7@q@�#|��H�@�4ԁ�@�[d��@����Y!@���Ac��@��Q����@�	�X���@�_8�+�@�.��e�t@�I\(m+�@�i\�,�@�����y�@���^
�4@��@J@��Nz�X�@�+�wG�@��Rꁩ�@�l\��B@�QuZ@��lo*Z>@�d��v@�!�6�@��?���