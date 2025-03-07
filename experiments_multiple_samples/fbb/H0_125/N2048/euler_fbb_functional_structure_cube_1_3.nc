CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T105121        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?��z�E?�?��tX'V?���gv�@ �E�|[�@�j���R@(�(��@��%͢�@��&�D@!~�oX0Z@$���nR�@(��|
�@,��m�z@0Yj�31�@2�����@4���@7����@9�i��r�@<(B�a@>����B@@��/�d@B����@C}2�@D�":��p@Fr�'_I;@G�WAʄ@I�]X���@K&Oo�ra@LȲ0���@NsUR�<@P��7�@P�K!���@Q�pa��W@R�a`ۏ,@S�z�s�@T�_�a�f@U{I��W�@Vn�ePs@We���_F@X_����@Y]c��@Z^,� �@[b"0d��@\i3M��@]sK�g�@^�V���@_�AJ���@`Q~
8Y@`�=!9�9@ahXP_�@a��6ڄ@b����:@c�,���@c��q��@d8^7Ad$@d����@ea ����@e����@f�I�i�Q@g&��)@g�Ƨ��@hZ�qj
@h�����@i��0�E�        ?�)��l?�i%駿C?��F��$@�SN�k@�2�@
�4�p@ ,�a��@$�GV�@)� !�@/E-+��@2|����@5����)@9�f��@<��7�@@Kv�&pu@BQ���@Dq��q@F�4)�@H����@Kf��r_�@M�	fNr@P@A���@Q���,�@R�[K=�@Tg�����@U߸Iz�@Wbi��/@X�Gr@Z��{,�@@\%$�ą%@]���pB�@_��/�c@`���/@a���P+�@bh�i1@cS���s@dC����@e7OF��@f/%kйo@g+ �H@h*�㗷�@i.�^�6@j6 ���@kA?¡�>@lP-M!!@mb��S�@nx�CLJ@o�x�D��@pW�} �r@p��ө��@qy�J�N�@rb*	r}@r�}1��&@s9*--N�@s�a�؇�@tk����@uR��x@u��5@vAG!@v��թ3�@w�u����@x#�L�ܿ@x�D��        ?̫�m"?�*����?�f�zi�&@�����@o�1��@�?�r�@���
��@#���?@(y�0e@-����c�@1��u,�@4���g��@7�`X)@;d컘�0@?���@Ak^���w@Ck$e l�@E�����@G��"�@I�/�X�+@LI	�rhp@N���U2@P�A�j^E@Q�mI$X@S9�%�(�@T�L��@U�Bq�U�@Wne=�V�@X狪�$9@Zi�Ph_[@[�?rAh�@]��I�L�@_#+��\�@`c���z@a9�;0@b�f�l�@b�5	N@c�_a�7o@d��=��R@e�<݃�@f�/ �N�@g��5N�@hsO1�@ik@͡�@jf qd�@kdP��s@le�%K�>@mje���@nr,N��
@o}��Y�@pEr�eJ@p��\�؂@qW��?�@q���ꮦ@ro�/266@r������@s���D�@t�`� G@t�����@uC{{��@u׊��@vmL��C@wI#S�        ?ެ�&��=?�e��2�@
����^@����@!���!�@'��OL/@/�L���@4\�S��i@9=���&6@>��n��@B#��"��@E3��A)�@HtBhg��@K�.	��@O�M�"ۿ@Q�Wf�|%@S�l��]@U�N�-�v@W�i�u�@Z0��y�@\Rd�[@^��n�8�@`�����
@a� �^� @c/�&=f@di��l(�@eñd�ڳ@g%�N	U�@h��m8�@jm�W�K@kz�c�c6@l�TY��@n�.Dv�@p		:�?�@p��0�@q�(�r @rs��
@sHgH���@t @⼉�@t�%�V<{@u���?�@v��$�I�@w�T�f��@x��D��,@yl���DX@zXb�;T�@{F� @=@|7qD @}*���}@~ _���@j%��@�	cR i�@�������@�"(�f@���!"��@�	:�E��@����Mw�@���,�@��,���!@����ވ@���D��@�($��k@���}S�        ?��I���?�@�;?���/�?��2~o��@�:����@xS�H@��?j��@\:~�j�@ ��`v+�@$��J@'�sfOF>@+q[MK&@/h�^�| @1ȶ_;�-@3�#��@68���D@8���q�@;��ʃ�@=�Nώ-@@�Md(h@Al��|@Bν3HW�@D;UL�ʜ@E����9@G1��K@H����\�@JM;MP��@K�`O��@M��v��@O9|�t`@Pw[K��i@QV  8�@R8�p6�@S���R}@T
��H �@T����@U�yۀ�@Vች��@W�D�7��@Xؠ��d@Yٖ&��b@Z�T�@[��~�@\�]c�@^ l�x�@_���@`�OB@`�m���@a.f�"��@a��ORs�@bO��@b��U��@cu�9~!�@dx7�:B@d��8�vc@e;,*�@e�	�x��@fp^0���@ghs@g���/)@hJpqb��@h�U)��@i��߫�        ?ͪ3��?�E�5�/B?�]/ ��@�����@e�vd>l@��t]�@�{���@@#�G��@(���@-��f4*X@1˳�9��@4��q��@81;j�	@;��,Մ@?l#�g�@A�=@>�@C�F=!��@Eߢ��ƪ@H�q��@JsC5	�(@Lߋ�8��@Ob)u*!@P�P�})�@RT>��ŗ@S��@��@U!O2N�@V�q[m�@X��y3@Y���?�@@[2-���@\��Y[?�@^r���N6@`(�ý�@`�P���@aʺ�5	V@b�Qs�N�@c���g�@d���y��@eqC߁�@fd�����@g[�L��@hVέ�]�@iU[�)�@jW~[�@k]&幰@lfGRF}�@mr�&m
�@n�� ���@o��[[@pV'����@p���8ys@qqV&�5�@rCU�Ed@r�� Ż�@s%�<,>}@s�$���@tP�-�@t�w���@u�K�u@v�>G��@v�*�V�@wS.C���@w�==P        ?��C���?���Iqs?��'�@�@0_���X@.k�V�@����@-�_��|@#Y'�C�3@(��=�@-?��@1mv�+X�@4q\fV��@7���3��@;�N�L�@>���l�2@A?��,�K@C=�S& �@ESi��O�@Gw�֧@I��*�@@L`mjj�@N�H)��@P���3K�@Q����]Q@S#�Gg}@T�6�1:"@U�91Z^@W[����4@X��y�>p@ZY:�,|�@[�EWEj�@]y��}@_�ַѹ@`^Z��e@a4�Cݹ�@bs�|�@b��Zo2@c�ba�?�@d��9�#@e�P�\�f@f��f�]�@g~�TH�f@hs��sD@ij�J �w@jf�hw�@kdu@O@lf%�l�@mj׳���@nr�#�lo@o}��e�@pE�	�>�@p��<*�@qW�^F�@q�_y��@ro��g/�@r��T/�@s��N��@tz�hp@t�e��vO@uB�TAk8@u��K��@vl�	�q�@w��f�        ?��|���?�K�e��@3��J�%@���g�C@-z��r@%עW�Ff@- �Q�V@2�R�ި@6�B'4�@;�];f�@@lD�qe@C*�V�u@FdE;�p@I$vRm�h@L\�+S�@O�m_!Xm@Q�y��ś@Sq�	+s@UV��*�@WKq����@YQf�;�
@[g�jd�@]�]�	�@_¦@ȶ@a�����@b-��$l@c]�J\{s@d�kJ���@e��F,z@g4[`)@hd��q'�@i���(��@kT�is@lm�*�@mҀ�ֹ2@o=
���@pV�`0�@q���<
@qϤ�6 �@r�M|�@sS��D��@t�ljh,@t�%�Y�@u�x���@v|�]��@wL�=�ң@x�H�cY@x�OO�5�@y�K��Q@z��9޷@{�gO�@|cs��t	@}D�!Z�@~(c��"@8|�r,@�AX�1@�p:e~�_@��eTL�@�]�W��@���l4BS@�O�zi�@��Y�	�
@�D�HӖ        ?ť����?��h�|�G?�GY��?��(nSTC@�E<��@c;[�$�@�m�S@@�uG��@ �*��@$��h/@'��U7��@+WN[�!@/H�c��I@1�&xZ��@3�M�b��@6�`p.@8p��?��@:��T��@=Y� p��@?���G@AI��>�s@B��c�� @D����@E{��P��@F�a��3s@Hs��q��@I�4��_@K�ܡ�F9@M%j�$�@NŮ����@P6�x���@QZ��@Q�Kq�@R�sO��@S�ҝ��@T��3�2�@Uy�& 	�@Vf��v�@WV��O�@XI���Q@Y@�*�@Z9�"�4�@[6ۂ3�@\5L���@]7^�|�8@^<'��u@_C�ҢS�@`&Ψ���@`�Bgp@a4�A�x@a�Q#��@bG:G+�W@b�P�Ha�@c^����@c�����@dz|_	R�@e
��Գ@e��塡@f,�c�|@f���o$�@gS�l�I�@g�-��1@h~�C��        ?����m$�?�Óu$�]?��Pe��@'q��[�@�a�o@�o�
Wg@l�5��@#=�e���@'�hm=N@-�8�G@1N���f@4K^|e�@7{�
o҃@:��7n�@>p��S�z@Aگ���@Co��{d@E!��ZJ@GG+�_ȱ@I�ZsB@K���H�@N8W���@PX��2�@Q����Z;@R�w��@TJ̲=ڨ@U���>�$@Ws���@X�k���@Z:�4x�@[��ZP��@]'�4W�@^����$@`0�;�@a:�E3�@a�C&\�@b��M8@c��oj��@dz���1@ea�ֵ@fL3J�rR@g:f��@h+>26�@i��uA@j�����@kv)O@l�""W�@m���I@n���E@o�~qUV@p[�'O@p��K��@q!�Z$HE@q����NK@r5+��@r�����@sN(�@s�ip�J@tk��$�@t��PnA'@u��O�uv@v!�mJl�@v��q˹        ?��n�	?�E7Ӆ�f?��fy0��@���>�@�v~o.
@D�����@}J�ީ@#�b�1W�@(��U}2@.mDV*�@1����y@4����K�@8BHO8S!@;��_���@?s���@A�����@C��(z�@E�+��/@H�i_��@J_\��ȭ@L���9��@O@_��"4@P�rm>)@R;W�p�@S�d���$@T�|����@Vpkԩ�@W�x�-3@YoG�-g@Z�a�}�`@\�љ��@^2/��آ@_�M�+��@`ŀ1���@a��J��@b��yA��@cg�����@dPQX�ُ@e=	��^�@f-���[9@g"	���#@h18�+�@i�f;@j}$dW�@k~����@l�ྒ�@m(�/��@n6��v�@oF�@�z@p-�`��@p�x�ß�@qEb�r5�@q��"�62@rc����@r��ɮ٦@s����u@t��\��@t�=]d�h@uHMiQ@u��I�6@vyh��e@w�(Jc@w�ʀsǀ        ?��j5�?��QMi�@	09��g�@q�c���@ 9&a(�a@&��~�@.3H�bP�@3Gk�b��@7���\@<��L�
�@A ��v�@C������@G
��g��@J@Ӡ�т@M�%kj��@P��7�I@Rj�_��W@TT\�~�z@VPFޫ�@X]�o_�@Z|�-�t@\�5ذ�l@^�xK+|@`��C�!E@a�c7���@cz23��@dB��x[�@e�~?�R@f��d�@h(l���@i�o�:`�@j����X@lI�w!��@m������@o)�'��@pQK�p�@q�r�@q�Ŋ�%�@r��~���@s_Of_Ŵ@t)���@t�{Q�(@u��'@v�ߓ�@@wlIBu��@xC�j�1@yTA6�@y��3Mk�@zխj&ah@{�����@|�����@}|ZȤ�*@~b�'��@K~�R�@���(�@��t��ϒ@�ҙ���@��-/�"@��e�Oh@�t���z�@����Or�@�l H1�@���v��        ?�k%��?���C,?�d����?�aJs�=@B�G��@#%�."�@9!:�@���e�@ y���@# �QgQ@'C}�R��@*�\:Y�-@.��g"�@1}�z���@3�ɋQ�^@5ܼ��@8-�[@:�1��C�@=yK�A@?� ��z@A!H��-@B|9����@C��o��@EN:e�C@F�9^Y�s@HB��R�a@I� �Hh\@KYk�+[�@L𫫩@@N��j�z�@P%���@P�,�{p�@Q����.@R���}u@S��`1�@Tq�ѝ��@UZ}��@VE�����@W4ex0�|@X&F=p��@Y<d��B@Z:�&�@[3�
�@\��+@]�/�M�@^b�p�{@_�(�@`�}�9�@`��8@?�@a�!(�@a�,~���@b.��-J�@b��\6+�@cF�D@c�v���@db��s	@d��Uyq{@e��� �?@f�P� @f�\�$R�@g<��@g�
V�@hht��O7        ?�T'w��?��öי?��Bo���@7ؐl@��b�+*@�b���,@]V�<��@$Ui�T�@)=��ޑ@.k]齆�@2"�YIZ�@5H��x8@8�c���@<:�&��@@�Yf�@B _/˂s@D6pE�@FH�c�pv@H��G�oR@J�%����@Mi�5���@O�P�$4@QN~:Œ�@R��&�B�@T�`^
3@U����@Wmt�@X���C�@ZC��1@[�"�δ%@]VZ¹F @_����@`\V'�@a;���@bk��@c��g~�@c�kc�@dᆵah@e�R>���@f�	�z�@gș��#@h����\@i���I�@jў]1@k���mֆ@l�D׾s@m��~-Z@oS�`��@p��hKI@p�4�Tu�@q0hA" @q�0��T@rS�@�s@r�hX��1@s|����@t��h&m@t���q2�@uE��
�@u�����@v}~����@wpj@��@w��P��g@x[]=���        ?�Uj����?��V�O�?�5� ���@�z�k�@[����@YU^u@��*C	@#���W�@(|��|Z@-�ru�3�@1��o�@4�S�8@@87�mn=@;� �\�@?;S2� @A���I��@C�ZTqb@E�G�p��@G�B5�]@J5�p�3D@L�p+|�3@O�T�|@P�E�@R wI@S{��0@T����+@VN���#`@WƦ8���@YG෷�!@Z�$��@\eD:�>J@^'!	�@_�c��K�@`�?�y�@a�x���@ba��ԎK@cD\�'�%@d*�3^��@e�?��@f�y���@f�S�r�@g��;$@h�b�o�S@i޹.��@jކ��x;@k��ޭ@l�R:FB�@m�1@�?�@n�M���@p�؝��@p���:�@q��59@q���v}@r7ۿ]�@rǡ �5>@sX��e�"@s�ê{�@t���I�@u#��|�@u��bD�@vDL(�?2@v��w���@wx��W�        ?��<LGp?�$��O@@7��Zc@��A�"@(�*�p�@%�-��bU@,�:�r:N@2wa�l@6��Y���@;���v�@@[��Azk@C���T�@E�~s�@H����|i@L.���n@O����kw@Q|.�{V�@SHc�o��@U%� `@W�{�b�@YΞ�<@[�O}@]2����@_Z��?��@`�E��H{@a�� �w@c�'c�,@d@v�f~�@eu��@f�����@g�d��@i6��8<�@j��q}t@k�Cz�5�@m+-��!�@n�`����@o���f@p��-7�)@q]J�m�V@rj>�QN@r�����@s����+�@tKՇN��@u.���&@uл���&@v�r�9�@w^G���@x(/��]@x� �Ti@y��k�b@z��T���@{c�oi�!@|7`"[b@}��8l@}���*@~��KQ@��!t��@�:��?@����?G@��3ii@���� �@����J3�@�m�q�J        ?�q�,)�?����.T/?�~��Ǽ?�HL?د@|0�l@R�|��@�$��@<Ώ�8�@ ���,+�@$�k_��@'�V�CZC@+pK�ŗ@/�y1�'�@1�A�T�@4��u]@6[�S��@8����˱@;8a�"��@=�&r�i_@@6�^m]�@A����k@B�\�7۸@Dl����@E��mz�p@Gl40�j@H��I'�b@J����@L0��gA@M�9�� �@O�뒯:�@P���HQ�@Q��_��u@Rf(��@SN�K�s~@T:� �{�@U*�$@��@V����@W��@X�x��@Y��2�@Z����T@[�Y��@\�����@])P�t\@^8�e�@_Iٞ�<s@`/a�p�@`�Y�4[�@aH��r�@a��9%��@bh6�rx�@b��>Bp@c�]�jx�@d"@`�@d��5X@eO���Q@e�I�U^@f�]u'.�@g�S�p�@g�yX�| @hX~G��@h��6�U�@i�k��2�        ?����#�?�H�ߙ�?�f3pv�@y�SX�>@'Qٴ>@�'�43,@��V�r�@$]���@)L��O^@.���*�@2Ev;��D@5i2��~]@8�*hX�@<Q�}�@@
*����@B�dx�@D��u�@FC5�hi@H�;@_5�@J�gV
U�@MQ=BH�@O�I�m9�@Q:����@R�����@S�C�m;f@Ue2{>t@V�G�{)@X_W�P��@Y�7k��@[���y�@]�ԱM@^��c@`<�j��@a�e@a���b�@b���_@c�:��$@d�׬��@e��݇��@f��c�.�@g�����@h��ae��@i���]7/@j����#�@k��y��@l�짬�@mկ� S�@n�?�f�X@pGa���@p�H�*�@q#���@q���
&F@rJ#�H@r�K��`b@sx03Q͛@t˫�yG@t��)�@uJ��u@u�o���@v� j��`@w*�2��@w�x�+&@xs��(��        ?ˢc��?�E![ս~?�v�Bx�@㓝 �@���m��@F��ΪR@�x��W�@#�j<�Z@'��ŗU@,���Qc@1���@4P��{;@72���6@:��W�@[@>���.�@@�`.BD�@B�3v)2@D�]Y�q@F�Z�,��@I.�a�f@Kvս��:@M�e�+��@P!����I@Qd�W�@R��|�e�@T��!E@Ub��� 0@V����@X9�z�!@Y��@���@[3�%h��@\�]tmMi@^O@15M�@_�H��-@`Ŭ����@a����@bs�y�|@cP4�ʶ�@d0�(�@e��t@e���I��@f��@g�'mf�@hɽ��H�@i���� �@j�W�G�@k�@h�@@l��I7�D@m�ix8�@n��X���@o�ֵ� �@pl ���1@p�%M�@q}Ѧ��_@r��%�#@r����0�@s#����D@s�WS(\@tDNnLA4@t֧� 0@uj]���@u�j�
yD@v��<"��        ?�S@p��^?�!����@@�0 r@4����@!��>ƺ@(��[A��@0X���z�@4��"G�@9�;D`��@?J(I{�@B��6�@E�\(2�@H�IiU��@L|?�g�@P�!���@Q��~�W@S�3�/!b@V�w���@X<T2��@Zw�[�4@\�X���@_&�d���@`̔w�u4@bUr}X@cXy���@d�����2@f�r�g@gf���>@hЅ��Ŕ@jAm��v�@k��9I(�@m8��6�2@n��?8J�@p%�V��@p��)	@q���~q@r�Λ #�@s`}�K�@t6u���@u��Z��@u��+�@v�.�
Ѓ@w�*.@x��[̆�@yy?��-�@zca�4+z@{P/�(@|?��#@}1�k;P�@~&Kc���@t7�*�@��!��@���/}�@��<Y�@��lQ��@��0��@����h��@������@��(̠�@�qˏN@���I�K@�-W�IM]@���腞l        ?���	�{\?�/b-�4?��t�p?����?��@�����@dru}@��ε-@3����o@ ���F�@#��ؙh�@'��!�΂@+>����@/-�)!|@1�s�u� @3�(�M�D@6��JNl@8b�v��@:��T�B@=L�{�@?��h@AD�Ր�<@B�c���I@D	�� ٧@Ez1���@F��>��u@Hv�ocT�@J }�-�@K�*w�d@M2؛U@N���@PB�.2Y@Q���5@Q�����@Rݼ�R%t@SÚd�T�@T�����@U�$GE�@V�r9�J�@W~?,M!�@Xua��@Yo̠���@Zmvi��%@[nT��!�@\r]U~�C@]y�y8�7@^������@_�
��@`P�_>E�@`�S�9��@aew���@a���@b�'z�m�@c���,e@c��7��@d2�#�P�@d�n��@e[`CD�@e�>k#�@f�  F�=@g!��{�@g���<�@hV�6>�@h�D3@��        ?��5��I?�X��<�?�p{� 3�@����R�@s����&@$/��@ߑ�8�O@#�9f\�`@(�J�� @-�`��G+@1�-�\ @5�4D@8X�����@;�_�'6�@?��L��8@A�����@C����*@F��Z�@H]�-�@J�9���@M6Q�k��@O��2%F�@Q6�0@R�xa^�@@S���5d@Ur#��B@V���p@XzR�, {@Z�"8z@[��-�� @]Sg���@_ljg�@`_�祘q@aA�OJ��@b(�}�	T@c���'@d����@d�ѐ��M@e�R�3��@f�h7#@g�	�G�/@h� �r@i�J���L@k	xW���@l���@m/��b$�@nHt��w@oe���\@pB��%-�@pԼޯX�@qh�� w�@q�1�
�^@r��y�@s.����@s�|��*�@te�p{�@u���@u���b�E@vE�Jج@v��u�@w�,s���@x1�v~~Y@x�,L>��        ?�#��N?���8u�z?�FUu�@^`e�j@84�g�@���",@k�/��@#�_7�@(C]'�b@-z�kwk@1���4�@4����]I@7�����@;R�ד�@>�3gO��@Aj��_z@CpE	�ey@E��Mwho@G±-y�Y@J��ռ~@Lq���)@N�IIV�@P��6��z@Rʁ��?@Sj4;%�@TГa#�@VA2�@^@W�����@Y@�K��@Z�'.��@\ej7��@^��*I@_���G�@`�Z�iK@a�$+kk}@bq?v�~�@cW��oZ@@dB�I�@e0�}W�:@f#Q�7��@g�T=`G@hWЋ�N@i��Xt�@j�f�.�@kp��6�@l#�IJ3@m0�\ec�@nA����i@oU�P��@p6�Np[@p�!�	�@qSRh-�@q�.
�@rv���@s
�F���@s��F�@t7����@t�� ��@uku���@v����h@v�kX�*@wD2�c�@w�Ǹ2��        ?�%F��?�d�p���@~h|�@�'�:e@����6@&�`T��@-WH���@2�||\�9@7/���@<ާa�@@�C�Χ�@CiZh��<@F]�}�#�@I|�@�ŀ@Lõ�XE@PB��I@Q�lz=�@S�G�K�:@U�-��pQ@W��;��@Y�E�j��@[�$ݦ@^B�Y$`@`,n�o�E@aU�F��f@b�D��@c�w�O�@d��F��E@fD����$@g�=	�o@h�6��@jA�n'��@k�H]+V�@m-Y|�@nyB�u1�@o�e--e�@p��nu�@qs�A@r6{�.%B@r��P��@sĂ��Q�@t������@u]}���K@v-��.��@wB3� @w�Ν�@x�
��^@y��:�&@zf�te�@{F���@|(���dN@}��o,Q@}�oY�X@~�Nݙ�@�g�5��@�ZX�B4|@��%?�i@�J���(D@�Į^�l�@�?����@��a;u��@�85�^�
@�������        ?�HU���?�K%�5�?�Ue�%y?��l�2��@CF'��!@*��U�@JZ6�x�@��~�; @ �X�c�H@#�}���@'t|\�vN@+9��\�L@/3�O�"d@1�QA�O�@3�M�:�@6&
�I�_@8�ǅQ��@:��l���@=�qc��@@�N @Ai�j��0@B�D�_��@D:���N�@E�mͅ�{@G1oBh�@H�jړ-@JL4&v@K杧�h@M�t���@O4��|��@Ps�r�L�@QQ\���@R2�)� @S�7|�:@T �����@T�6
�@U�3�Ib�@VФ�<�@W�x5D+@X���{�@Y���W~@Z����`d@[Å�mC�@\�n��.@]�b:��3@^�V��]�@_�B��i�@`�A5�@a�)z=@a�!��@b&�f��@b����+�@cE��v$�@cח�ޗ�@dj�\`�@d��)$��@e��t�@f*�6��@f�c�R@g[��,�q@g���k�@h�őE�@i-��m        ?��yX	a�?�NM��?�t2�Ǆ@��]��@{�K�@� h�@ 7�,��@$�(j4@)�ϸ��@/�K���@2zJLV@5�C�+3n@9���ä@<�3\t�@@B���{G@BE���@Da�*��I@F��E�f�@H�'�̈́G@KE�!�K@M�EY���@P(��p@Q|s�D�@R�>��i@TC	��@U�"l�z�@W3\u�4�@X��uaY@ZK]���@[�����@]��@�@_6f�MY�@`v#�b��@aUy?��@b9�t��@c ���5@d�]'�@d��p瓋@e��(6�@f舏n��@g�)J��@h�c��Y�@i�X�	��@j����"@k��W�@m�w�N@n���T#@o*{_�@p �/Rq@p�h�2R�@q=�3��1@q�9�Ď@r`~���@r�O�@u@s��iA�@t ���#�@t���յ�@uR��F@u���x��@v��b��i@w(ս���@w�dn��%@xiYEm�>        ?����y$P?��4�?���r�k@�,��0@�&J�g�@�|�Q|@{����@$.讴9�@)&voʘ@.�)��U�@2-����@5Q�N�[T@8���V@<<�=.��@@ S��O�@A�W��y�@Dދj�L@F:P���F@H}�Kg@Jֲ�CX�@MF�+|�@O�,�h $@Q3�j �k@R�i@�do@S�z���P@UY���-�@V�U]���@XN�ԪzV@Y�cs��@[i9m�Do@] ���r@^��e��@`)�O{R<@a��vX@a�JZj̷@bč�B.3@c��V! �@d��G��@e�_`]4v@fs�����@gh�͝d'@ha(���@i\����@j\� _@k^��A,�@ldY�ժ@mmI�jKp@ny\b�6�@o��P�+�@pMY��W@p���,@qd�d�X@q�=�T@r�y��q@s�2�I�@s���΁�@t5���q@t��|~@u_�᫠�@u���V _@v��O&!@w(tRJS@w�0%Л        ?��R��?��M����@
�\\�oC@�y��N�@!O�a��g@(B+�'�@0��m��@4���@9y�M��@>����n@BG!V�dt@EX$�LB@H�����@L)}J�9@O��6��I@Q�p��f�@S�����@U��;h�&@W�L&;@Z8BI;4@\H�yV~�@^��Xm+�@`��b��;@a�=�8D@c ��8�=@dL�e=A@e��G�`@f����W@h[Tȇ�@i�3����@k4z���@l���߹)@n'����E@o�͸i;@p�_'fa@qcHW�@r.���$r@r���~p�@s�3�7��@t�Yl�;�@uyR��)�@vS�Rj@w/��gh�@x��q�@x�U���j@yԡQ�W@z�u�a^�@{��öM>@|���@}~��9��@~o&����@a��S�@�+u�@���\�@�#�E�L@��i0���@� %'��c@���Y;�@� �ݝGx@��`?�[�@�%��+�@������@�-=��
�        ?�FQL�Cx?���?�P?���j�Wn@+Y�o@���Y�@�co�d�@�:��@�@���p8_@"ٜ\#@&�[�#p@*\� ��$@.m��Zp@1XM{��A@3�iw��@5�ig�@8Gs����@:�ğ\ޛ@=R�e��w@?�yX��C@AV�~���@B��%��@D)ࣰ��@E���@G ��Qg@H�UM���@J:NIg�@KәbB@MuE�@O�#�_@Pg�_�K@QDy�V��@R$̍\��@S�؝�D@S���1��@T��)��@Uʗ_�>1@V���w��@W�l�t�5@X�X�X:@Y��NX@Z��l���@[�>^@\���J@]�n�<@^�_�>�@_Ќ�T�@`p�z�n$@`���Y��@a���B
�@b~T>i@b�dCw�r@c/�H�.@c�Q��@dQ����@d��s�5!@ey)	�a8@f���}Y@f�u��ձ@g=t���#@g֫_/r@hq��=f@i�,N�@i��_��Y        ?��C�2��?�Y@'��?�gC8}�n@����@^6c� @�Rؼ��@��m�A@#�z���T@(W��pc�@-������@1�e��.@4����Ւ@7ڣ��x^@;I~s�l_@>�)�A@A]�=.t�@C]�g���@Eu��T��@G��:��@I��W�@LC2��B@N�7��̶@P�Z���@Q��o���@S?�X���@T����@V5���@WJ ���@X��	m
�@Z�G�0
@\�w��@]�.}i~n@_L+����@`z��Qlc@aS��&��@b0�(��@c�]�,B@c�b2���@d���@eˋ*R�s@f���}��@g���ڞ	@h�A��@i�V�T�@j����L@k�����@l��X�X,@m���V��@n����� @o�	~~��@poC�!l@p���@q�u\N�@r\�BJz@r��1�3�@s4�԰�@s��� @tZ��� 2@t��L�Xa@u������@v�F'@v��+ ;�@wR�hz~�        ?�-m�u�6?��xwX�I?���e`b@T�^���@-Fԯ�@��!|x@Jà�br@#g�Jy��@( J�H�@-K ȶuP@1rH��@4t�\��@7�6~��@;�@>�<��J�@A=[_�@C:��;@EN(D�n�@Gx�� ��@I�Pz^�@Lq&{@Nz���2,@P},ċ�@Q��j�x@S�-s�i@Tx#V�?�@U��أE�@WN�L�O�@X����	w@ZI�1��@[�5���@]g]�I��@_�]�:@`S_o��@a)T�A6@bA��4�@b�W�{�@c�����@d�6���y@e�]�K��@f~%�F,|@gn}%��i@hbS%!@iY�B�^@jT=�B@kR3(�y2@lSk���W@mW�t1��@n_f���@oj
J���@p;� �V@p�+ �NU@qM�2� G@q�% UnA@re�Eѷr@r��H�S@s�+��@t��γ@t���i��@u8�mmw@u�=��'�@vb�
��@v���R!�        ?�����?�֭57��@�ҧ��@8��/�@ ����E@&|un0�P@-ܭ���@3~,Y� @7�I��,&@<�o��@@�h� �@Cę�b��@FƱebn�@I��=��[@MG�Y�H6@Pb��4@R3Jz�@T���@V���@@X؅��@Z,}��@\T�Ce�@^���O�@`k��(@a�	�/$@b�rB-�!@d#eC�@eF��6C@f���rH�@g�Y|�@i5'w�9�@j���W=@k�`x�@m]:���@n�h���@p LKU@p�eV��@q�;�F�@r_���@s$�I�}t@s�|��Z@t��K'l�@u����� @vS9�Z��@w%w�"�@w�_n�@x�=ԥ@y�%�v@z��4��@{bC�
��@|B<�V��@}$o�KR@~Ԯd�@~�c� k�@����r@�as;��@���N��@�Oe,���@���?���@�AsĬ�@����kHF@�7� �/@��[�        ?�$�m�f?�KVU�H?�_��T�@ 	��s��@���u�@�{��&d@��v���@�|B��`@ �M���T@$:\Yz�@'Ŕ��	�@+�Jf>R@/t@���@1�ǀh�h@3�JL^A�@6,��Y�@8	��@:��Ͱl�@=a�t,�@?��3L��@AH��|�@B�D ��@D�\p@Er�E4��@F�����`@He%��{�@I�[-��@Kx6����@M��å`@N�ܬ�a~@P'��ZD@P�	GԄ4@Q��җ�@R��o���@S����@T{|%w0�@Uc�9�	�@VO����@W>�I��X@X1�Q��@Y'��ڑ@Z ��]@[
�:�q@\�8�@]W��@^$�(~�@_-W�7��@`q�9P@`��8/��@a,H�lY@a�P�M�b@bA�����@b΂�c��@c\�n)@c�"_��@d|�f�A@eZp:<@e��P1��@f7J'�PT@f�RG}~@gd�x?q@g�1g=�B@h�4�v}        ?�����2�?�S���3?��s}���@��N4�X@��fh�@Q�Ե�@��䀞�@#��v�P@'�-.�T�@,�o��@1�@A�o@40�JaY@7,zXB�$@:���t�I@>	J&\�@@��#|	@B�4n��@D�b�,G�@F���=��@I0Ee�2�@K{*0��@M�%`9�@P'�l��0@QlY�*F@R���l(}@T�]k�|@Ut�FN�t@V߮���y@XT�K~@Yф�(��@[W�q��@@\�$�I@^~��0|@`��'��@`�L��B@a��
�@b�$G,�:@cy��B�@d^I�(O@eF�ʡ�@f2���å@g# Β�@hï�|�@i(u�fA@j	'8N�@k�Wm@l	�/��@m?(��@n'n]��@o$n�G��@p8%C�@p�{��7�@q.�|�.�@q�I�	�$@rI����)@r�}���@sj���[@s��'���@t�v��xm@u(}ؐ*�@u�mӼ�@vX��ڃ�@v�ruf        ?˻�t���?�gw�E�?��Tv�@�1�N&@��ܖ�I@k��h�[@��UR�=@#%��2p-@'�ln���@,�4k-��@19/�o�@42O�[b|@7^���m�@:��'�0p@>M��w�@AЗ�@B���I��@E&V�1@G2L��b@Im��FJ�@K��g�z�@N%& �̢@PPL���`@Q�Vjl�@R�qB�@TF��;�R@U��,2[@W��2�(@X��e8_I@Z_��@[�A�h�*@]6e;h�@^�F�ȸ�@`<^b�d�@aO����@a�e7L1�@b͏X��S@c��*x	�@d���D��@e��N�J�@fqڹ�qa@gd���g@hZ��Z@iT���@jR��ب@kS��v@lXv�y�@m`���7�@nl8��@oz��Ru@pF��qH@p�.Ǧi�@q]xGD�$@q�V�D��@rz���G@s��(8�@s�25ҥ<@t2'��Ę@tǕ
bN�@u^væ�T@u��
�W�@v��lC�3@w+��	�        ?�a�&;�^?����O�E@�`���@�v�_��@�����@&�J[K@-ZI�痮@2�S,�9@7'�n��.@;��-�]@@�}��J�@CT/����@F?�g��@IR�9�/\@L�����@O�r`��@Q�F���	@S�*�l�@Um��>�@Wb,�C�@YfZL
��@[zw*�@]��xk�@_�O`u�U@a�5m@b-�NB�@c[�Ϝ��@d��Z|@eʩN�a:@g�6�{�@hS@r��#@i��áv@j�v��W@lN���@m��x���@o�"�@p>�o�(@p�2}�#@q�-����@ro�tZ�*@s0{���@s�����@t�0��z^@u�W��@vJ)H��z@w���	@w�m��@x���/u@y�R��N�@z` ��@{7�tm�@|��A�@|�'��=9@}�{��4�@~�쥴��@�v$���@�:	
��@��]b��@�!�B��@��)�(@�e��O@���/��@��o$�4        ?�b�K{/�?᥄�x�q?�X-.-1?��9���@6Yz���@Yy�"@/���W@�X'n�n@ sh��)@#��TP @';X�_p�@*� 
.`�@.�1��@1wz����@3�ωLL@5�܆�U@8$�wb�V@:��n�@=�����@?��P�}�@Aؙ��@Bu�<}��@C�����@EF�Ϩ)u@F��x�@H;�k�.@I*旴@KQ�-j/@L�=���@N��Y�f�@P�	�@P�nQX%�@Qʻ��J�@R�Ć�[]@S�tωi�@Tr��Z�j@U\�[^�@VI����d@W:d�du@@X.e^�D�@Y%��(�y@Z K���@[��@\��C@]#7:�@^*gpWa@_4�c��|@` �C���@`���t�@a2d�c��@a�F�Ӡ�@bI��T@b�5�:ޣ@cf9
��@c���H1�@d�:���@e.5��s@e�e�� @fD۹�d@fۋ�N3�@gsp:�L7@h�q5�6@h�����        ?�J찊`J?�y�ߩi�?�������@���{��@'A��e�@��j7@ ����m@$���xn@)�?��?o@/��|@2�/|�b@5�R!��)@9'i^r
�@<�7�@@P��b��@BV����@Dv5Û��@F�g�E@H���m}�@Kg/w�T�@M漶�J�@P>�<�]�@Q��ޕ�C@R�J�p6@Tbp�
�@U�)�X'�@WZF��ϙ@X�\�S@Zz�R���@\%=�a@]���U@_u~���@`��,�%�@a{8kf_@@bbQ����@cM�W+�`@d=��;�@e2?E+�i@f*�Wn`i@g'�!��@h(�:sw�@i-�9���@j7$�"�>@kDT�i�X@lUs�YF�@mju#P�@n�JyoŴ@o���f��@p`#�(@p�rħ@q����@r�#bH+@r��L���@sK��$��@s�3���@t�2����@u!V�	��@u�"o�!�@vb��?��@w�wl�@w�KM�M�@xP���y�@x�fe�Vt        ?� �`?���.x5/?�vJ	J�@���j��@#�3��E@�I̢Ԣ@.��W�L@"��/m�@'A�@S[@,=q3cs@0��.��@3��qX\�@6с/��@:D�6�@=��"=@@��~B#@B��O
�@D��MҾz@F��r���@H�
��O�@K�-���@MY�/en�@O�
��r�@Q�ΖGE@Rb�g]�-@S��F�@U	q:�@Vi�<�ڰ@W��M���@YC�ɺV@Z� ����@\=�u�0@]Ɛ��C�@_V�Ĩ@�@`w
uv@aFUf��@b#��@b�a*Wb�@c��8�}@d��A<�@e�	���@fiZ��"�@gO���y�@h9L��@i%��/�^@j;�@	�@k�:G�'@k��$=�B@l�0z>@m�'��Ś@n�pg��@o�W��@pwh��!@p��RL�K@q}�$5�@r�8sߐ@r���~cx@sOq��@s�����@t" ��0�@t�շOJ.@u8�f���@ułi��        ?ݒ��Օ�?�s�a�V@	�&v7�~@�F�v�@ q��Y�@'!`Ji5@.�>�9�i@3�$à	@8'W2��@=2��m��@AO��à@D4�6ٲ~@GF^��@J��2@�p@M��ˤ�@P�zW+A7@R�*˘`�@T�q�O��@V~ŭ�6u@X���'��@Z����[@\�t����@_#����y@`���S\9@a��b�@c$͝��@dc�[���@e�%%	� @f�t>-�@hN�wx�f@i��3�`@k��@lw! C��@m��Ǝ�@o])vS��@pl�a=�@q.ch�}@q�B��R�@r�mL��'@s�v�A�@tPN�� @u�@Xp@u�(Ȟ��@v���d�@w��@7�i@xx��.��@yUs�׵@z4�i�@{p�n�&@{�.$��@|�>g)>@}ǘ��5@~�3�f@���'�@�G���f@����}@�9g��^�@��6q��@�0�[O�@���uu�@�+��	@��Q�*@�*%5�j        ?Ž�%*6?����{�?�$_���?����r@�?%=H@n�@1��@�:��@R���`}@ ÛYU�4@$��b�l@'��n J�@+d�ۼ{�@/Wۺ@1�]ԙ�P@3����@6!�%��@8u��s1@:�%����@=Y��zb�@?��+�~@AG���=@B���x�@D�iw�@Euɽ��m@F���&"�@Hlƶ÷8@I�8�/7@K�@�S@M���z'@N��i:�@P4m}���@Q��ȅ@Q��S���@RȆ��G@S��i<�@T���p�@U} �W�@Vj��EĻ@W[�~��@XO��Y�'@YF����:@ZA>���@[>� �'@\>���z@]B&L���@^H>�昿@_Q$�d�@`.dR���@`���!�T@a>�_@a�Ζ\g�@bR�%�[@b����P@cl��2�S@c�Bp	@d����@e��N%@e�׌��@fA*c�;H@f�X�Y*V@gj���Z@h ӳ��/@h��x�8        ?�'���I�?���Kl)?���8�?@6�H -�@7��@���
@��"�@@#E䶎��@'����f+@-f��^C@1R���x@4M�E�@7}!��:F@:�M4�6
@>p)��*@A�xV�@C�jl=}@E�@9x@GC��x7@I~
M���@K͛`� @N2���@PUk[�2@Q��y<c�@R��@TF
:T.@U�l
P<�@W�K@X��q���@Z
�uz�!@[�\�͝r@]"� �*@^�j��0@`.I*�@a�FDR@a۷Q�,�@b�i��tw@c��LV�%@d}d�FK�@ee�Bp�@fQV�[k�@g@�E�%@h3�{���@i*�x�E@j#��E%@k!zI9�@l!r���@m%cD�@n+��[�v@o5պ��@p!h5�\�@p�e�F�@q2�9�B@q��	��O@rJ�1ٗ@r��H��@sf��V@s�y9HxD@t�M���@uq;�N@u�߬��@vF��[ks@v݈:Ph^        ?�}{���3?�8��'k�?�n��F�@�&�ب�@�?��z@C^�)"@��$�X@#�3J@'��>���@,�xR�q�@1����i@4�	���@74/=�Rt@:���P��@>ܟ	��@@�w�\Ԧ@B���X�@D�]��@G y��t@I4��ٝS@K~p�&@M�Ʒ�E�@P'��~5@Qj�A�}@R��2F,�@T�]=�@Um�GW��@V�o4��@XH0H�n@YZL��@[E���w�@\��_�@^dv�t7@` ��\�@`�ӣj�)@a�yp�@b�읩��@c^_W;@d>��`@e#r��:�@fyj��l@f���9VU@g���G/@h�C��@i����K@j��1�r�@k��9�d�@l�4��D@mĜ�=*�@n����R@oҢ�z@po�1H@p�[���@q�m@r	Fp[�@r��(IY@s!�#��@s�S.���@t@�H�@t�;��ݣ@uc��\DS@u�s=ֽ@v�~<��        ?�qg��?��MOњ�@��+:�@�$��@�SN��@&A���@-�b�B,@2��6E@7VS>+ɧ@<5n��ג@@� BT�@C��~P�~@Fy �=D@I��5��@L����@P#`�F8=@Q��"l�@S�"���@U�rL��`@W�g��s@Y���_'@[�|T
!�@]��7|��@`y��@a=\cs7�@bhWa�E@c�9ZI&@d��1��@f0���@gW��`S�@h�o3]D�@i�cJ�F�@kMO��C�@l��X�b@n�PC|Q@ow��9[�@ps0Ka�@q- L���@q�t�@r��l27@sj@��@t.N��k@t�ù?�@u����@v���A/�@wV!6
�@x%���U@x���<q@yˏvݹ�@z�����@{y���K@|SǱc>�@}/І$b�@~�vl�V@~�)�%@�7?~��@�YQi�-@������@�?O�Ҡ�@�����|@�(��-��@��qmhf@���|�        ?ƿ�1Y�?����,��?󑧰��M@ �s��@��x�S@*� ��@�E�Dd@�^+�b�@!|-�3X�@$�Ъ��@(�zZ�>@,����q@0O��j�@2t���D�@4���J�@7J=<�@9k���Qo@;�u:Q7�@>{�".�@@��(r��@A�L�@CS��2�*@D�7��!)@F;���@G�����@IG�]�k@Jُ�D��@LtI�E�@N 0e�H@O���@P�;�(�v@Q�S�m/@Rx(�$�@S\�d���@TD�y}�:@U0�Em^�@V &��$@WEH@X	��ȏ�@YO�f�@Z v��^<@[ ��+(@\�Y��w@]��GL#@^��E��@_"�'��*@`�@`�h	fnk@a.��<:�@a�P��)@bIvU�h�@b� ��@cj�W�@c��`X�G@d�m���@e%�ޢ�&@e�Y�8��@fTYS��%@f���fT�@g�P�=��@h$>I�:�@h�q?�|@i_�<1        ?�q�H?�Y�]k�?�#i��-I@f����@4��V@��_q@K�}��@#d����@(A'@-;|�Á�@1e�x}�"@4a��ӫe@7���j��@:�pN��@>��0�H@A �!��@C�1c}�@E %��"�@GA+/Ry'@Iw\h@K�d�l�=@N��MR:@PH�~ݰf@Q��p6�@R�L�|)@T*�jZ+@U���JW�@V���Jr@X[�%��[@Y�5C�@[P��q!�@\ָ�K�@^d�/���@_���]@`�{[r�@a��[�B�@bsF/�C�@cL{���^@d)$��9@e	0�b̤@e����@f�5�]1@g��x��@h����@i�.E�z@j�WX嫊@k���(�y@l|��Uf�@mx����@nw�Y�?�@oy���DQ@p?&�j��@p����@qHP�eH@qΆ]ʛ�@rV\V~��@r߅�GzP@si�����@s��nU��@t��'7�@uMD�@u����S@v1Z���        ?�) ����?��gW��?�����-@lw����@CIX�1@�~8�#@���
d�@#��)��C@(U��f�,@-��[�nu@1����E@4��gϫ@7�f��i}@;e*p�K�@?��!	@AuP`d@C{"Kڝ@E��J�)�@G�*$4�@J��ЙS@L|*�ZaN@N�P�0@P���Ӈ@RGyIk@Sm�[��_@Tӟ���~@VC?�Y6@W���;x>@Y?x�͐`@Z˽�Z��@\a:�8�@]����V@_�,�˸@`��k�k@a�'�
O@bh��<�j@cMG���@d6�8��@e"���.*@f���f�@g]�1m@h r=*��@h���}�@i�=҉"$@j���ӣ�@lz8��@m���=f@n��i��@o/���;�@p"K���@p�<rB9�@q;ɿd�@q��m�)h@r[�'�@r��<{J�@s�����R@t�H���@t�~¾��@uE�p`=@u�-��2B@vz �r3@ws�m�K@w�"L1�        ?�e �fQ?�`�+�ݶ@	�|��},@����t[@ j��'<�@' �&m�@.���[�b@3|���9@8!Jw]��@=,0��^@ALEA4*@D0�$�q&@GB(����@J~"ܭ@M�O�M��@P�"�ͫ�@R�ܱ�r@T~<�hm=@V|�ޓ\�@X���Jٖ@Z��G7��@\ߏ�3��@_!�b���@`��m���@a�f��@c"���M@dbx���@e���:>�@f��$�RD@hM �:�@i����@k�^�9@luqƢ�Q@m�_z��B@o[�Uӟ�@plk�3�@q-aT��p@q�_;�Z@r��G�mM@s�%e��@tP,�8`p@u g�;@u�_1�@v���O�@w�.�/@x{J��@yX��T�G@z8�UN"@{X\lHS@| �Fc�@|�cz��@}Ңqs$$@~�Q}��@�f��Ea@�O�%@���p�%@�D�ڛ��@����@�>P(9�	@����e�@�<%Z�A"@������h@�>9��!        ?�}�5�,�?⠴���?�b�o\�@ ^��6@��v�4@��	@fv ]"�@Sh�T�*@!a��&�L@$�۾���@(�XI؁8@,j���_@0AIH��"@2fGB�V@4��SL�@6��6#�:@9`�}P�@;��ؒ�5@>t沬�@@���M@A����@CT�&|@Dő5�,@F?���2@G����@IN?V{�r@J�L�	Z�@L~�����@N"��W@O�L�>b�@P��sfWz@Q�����@R�6�k(�@Sf�~)��@TO���T�@U<N"X�v@V,���@W Cb��@Xc�1p@Y�X�u@Z���ݽ@[p�צ=@\�3��?@]�#F��@^%��f@_35�RjG@`!��z,@`�g���@a6�
d��@a�?O� @bQ$�A�@b��.t�@cqn��t@d�����@d�E�a_@e,=m��@@e���h@fZ-����@f�t�Ug@g�K|�y@h(�vi�}@h�f��ڬ@icJ1q�C        ?�R6d�?�>tlxN?����ʳ�@��טU@�S[��@iy0궝@2~�ʅ�@#����	c@(ڴ��@..�����@1�N˫��@5�R`�Q@8d���cg@;�
�H��@?� ��R@A�X+���@C��V��b@E��sG�&@H/�;�tU@J��0�D@L�dC��_@Oe;֡�@P����i�@RN��F+�@S�0Lǽ�@Uu�CS@V�o���@W��e��@Y�ƒ73J@[���@@\��s�O@^D��O�1@_�����@`��ww�:@a�#)���@b�g�@�%@cn�I0@dV�O��X@eC">K@@f3B-�@g&ݓ�"@hQ�/��@il��*	@j!���H@kf���@l -���@m)k�e�@n6�c,;@oF ���@p,�L�%�@p����0@qEƔ�'@qӯV&[@rc��&f�@r��`�-�@s��E�@t��(;@t�J�{С@uL*C�gu@u���{@v�E��d@wv7�C1@w��G�        ?�]�1�0?� @x�[?�Cpo���@�+Ih2@`���G@��i��@��)���@#�gj9@(v�ϹUG@-�hj��@1�g���@4��널�@8�Y��@;w��J1@?<ṱ@A{��	��@Ck5�|@E�I���/@G˝B���@JҖ�Z�@Lo`���#@N����@P�G�<h_@R #V2�W@SV�h\�@T��!2��@V �3+!�@W�>�Q^@Y�+ѓa@Z���G^�@\ ��vQ@]�v���@_T| DH�@`}S�Y�@aTg��ro@b/d����@c8^I�@c��H�2�@d���?@e����.@f��c�x@g��)�)�@h����xr@i���F/@j�F���@k�}�w�@l�7��*�@m��cp7@n�&Xd��@o�;���@pV��B��@p�+��@qi3@q�z���O@r�9��0@sS��@s��t�9�@t/�o�H@t��k�8�@uT�CA!@u�eB�S@v39�|3@w;Q"        ?ݠ�6��?���v�3�@	��m�v�@��d�f�@ �C�q&@'Fjkn��@.��1V� @3�Q"	�@8n>�@=��/��@A��dۖQ@Dr�H�@G�JP�C�@J��iM�@NC��� @P�,g�@R����@T����Q@VŒ�Ͱ1@X�T�t`�@[Wp-ӧ@]=67��@_�6 �-�@`����@b#Н�2�@c_��&�@d��L�x�@e�'s��p@g>��b(�@h�>#@i�N�Z��@k\C%~�@l��?^��@n;�t��@o�=���@p�s8�\@q]\-Ű@r#N��.`@r�?M\�@s�$o�8`@t��m�{@uX�lbY�@v-�sc�@w\���@w�P/>�@x��/	�@y�%���@z{��ȁ@{`K�'q�@|G#\�T�@}0p4@~(���@
D��Y�@���?�>@�v���}�@��SW8c�@�m�!�@���>�J�@�g�G�V@����A��@�g�T}@��\6��@�j�����        ?��Vw�@�?��6�??��4���?����[}:@�+� ,�@��>�Q@�鿕e�@���2�@ �ॣ��@$K�6�W�@'�Ѣ�B@+��s�� @/�Y���@@2��Eǔ@4;̞d^�@6����@8�^�@;q���V�@>u�'H@@XKN>@A��ϩ�@C!�b�Ѕ@D�tѫ��@F�B�5�@G�Ӯ��@I)�VѢ@J�Ms�@Le��x�@N�t�@O¯�}v�@P��bH�@Q��I�Q@R�9z�-@So��e��@T]	0��@UN�uq@VB䰄��@W;[�f��@X7t�:>@Y7 �"u�@Z:Q^���@[@�3��@\KWs�@]X�~�>@^ihI3[�@_}�-N�@`Jt�@`׸A��<@af��KN@a��^���@b�����@c��i@c���Ć@dF���>@d�$�+�|@ev��@f�nf�@f�X;@gH�{#�2@g�È��@h��z76�@i%�=3�@i�/�:�        ?��[����?�bL�=�?��.�N'@֬t�@�`5���@H����@��D�@#粐:,�@(��T3\�@.1�)@1�aP@5¼4@8_����@;�!	�
@?��V��F@A���K@C�':lN�@FQ��� @HA�7�@J������@MfG�C@O�F]I�@Q� ;�#@Rgd��9@SȔ>};0@U3�W���@V��n#@X'ȤW@Y�
����@[A�y*.�@\� .:�p@^��L��@`�Hb��@`����@a΋���e@b�r<�_@c��-��n@d����3@ep����@fb
�_{@gW�U���@hP��:@iM���D@jM�t#@kQ����@lXmB[|@mb���@npk��@o���v��@pJ"53@p�dK�+�@qb0�H�	@q�q�(��@r��Ҽ@s4�87@s�����@t7|m;�@t̤���3@uc�-@u�����@v����H�@w.:�nd@wɿ�a�        ?�6J*��?����=w.?�|1�z�@u���M@Lmg#R@��y��6@�o�6��@#��'�b�@(n
|*�@-����	P@1�=Oˇ(@4����@8	S9���@;�ip���@?/�M&�0@A���B@C��� ��@E��jH@G��=3��@J+�����@L����@O���@P��_PAL@RM%)޻@So����@T�����x@V?H����@W��RI@Y3����@Z����3T@\K߲��g@]���l@_������@`�g���@ao�zQ��@bLjJ}w@c,�M5�@d����;@d�~V@e�׹L�@fҽ*�-�@g����@h����@i�	&���@j�r���@k�s��@l��o�@m��G�x@n���(��@o͠��w�@pnBcm�J@p�)�H�@q�~�SC�@r?$�8@r�e3'�#@s(�3��t@s��F�ќ@tJ��y@tܓm�C2@uph����@v��g� @v��Y���@w3|��        ?�<R�?�s�X5��@� 5j>�@���&@�_�`o�@&&�mu�3@-jz��`@2��-�@7>��HZ@<�ְ�@@�q��"@Cs`os��@Fgx�D�@I��M�7}@L�fC�l�@P4���h@Q�6���o@S�#A4�|@U�k�Y��@W��!B�@Y��vU��@[�:{S�@]���gM@`D���@a=���@bi��[0@c�Yt�	v@d�Ӡ��"@f��6�?@g\�+fg�@h�hw ��@i�l4�@kU�S��K@l��"�3�@n��.�@o�-&��@pz+w �r@q4�
?�@q�}|%��@r��A��g@suU0��Q@t:���< @uK���@u�t1��k@v�ے�@wg��ퟶ@x9%:�8b@y�*��@y�b�`@z�M��8@{�Z�=C@|p�b�!@}N����@~.�f��H@����@�;�p��@�m��wq�@��&���@�VW���+@��
k���@�B�e��Y@��
�^lI@�2S�<{        ?��*��@#?��e#�?��%p�Vu?�����@���s@�q���(@��<c2@��s���@!�h�!4@$q��1ڵ@(G�-(@+��}&��@/�d��A@2�dU5|@4Sx�z@6���>�z@9�(�8@;���:q@>��3��@@[�z?�@A��|UT�@CQF�@D�����@F	>'w@G�p�'@I̢��@J�:��8|@LI"��i@M�S��Z@O��Imm�@P�k�I3�@Q�����@RiA�&4Z@SOX���@T9 D�7�@U&�Fi#`@V�>{"�@W�lB2@X��Sg�@X�>����@Y�꣐h@Z��T��@\W�o@]o2q�@^��?�]@_']Ǚ$�@`h4uV�@`��̔�@a26�[�F@a�C�~@bM���b@bݕ$*�O@cn��dz�@drN0'@d�mJP]@e*��\r@e�ij��@fYb���@f�¹p�@g�;�?L@@h)껶@h�7z`K{@id�S�"        ?�RST@nU?��S�)V?����}�@R��q�a@&`�Z��@�z�e@1VA�<@#S�úN,@(\�Ch�@-"*�Ű�@1V4(��@4OC}��@7z�y���@:�پA�@>b���ܚ@A1�, i@C�W��Z@EQ!�;@G)տd�F@I]�/��G@K��~�:\@N���n2@P8����@Qy�J"l@Rď*���@TZi��@Uu��K@@Vڱ�|�@XH���RD@Y���	�4@[>`Ȁ��@\�VW��@^T8Xĕ�@_���dq@`Ėl��@a�{���
@bn����@cH:X�H�@d%�I�@e$!��a@e��Yh�@fӸkru}@g��K�v\@h�|��x�@i�0��@@j�
���@k���� �@l��(_\�@m��Y��i@n���@o��4ힾ@pHFIu��@p��m�@qS<��	]@q��]��@rc�~|!V@r���$�@sy�T���@tu��
@t��s1@u$·�R@u��[�S1@vF�2J��        ?�ܭB�?�Y��}�H?��,d7�@�'�3$	@<c',�@5�=�@ ��-��@$��/�@)�2*�
 @/�:n�@2wY@?-@5���J�	@9	��I�@<���U#�@@0�X�T�@B+��Ax@D>����g@Fh��G�@H�fu?�@K Cf;e�@Mlϕ��@O�dW�@QB����@R��!��@S�PGV�T@U`a���@V���v�C@XN�[V>@Y����x@[b.��RH@\�4x|�@^��=i�@` ���@`���z�`@a�{�K��@b�8���@c������@d�9Qc6@eo�t��@f_�j��?@gS�p��{@hK�N�K&@iF��
�@jE�Ӫ%�@kH F�>�@lM��z�@mW�f�@nc��+!�@os��!
@pCf"��c@pΙ�i��@q[`���N@q�=ކ@ry�Q��@s
���Ĭ@s��3��@t2+�v�@t����.@u_?l��<@u���J?�@v��2��@w-����@wʊ�Y�&        ?�ZP���?��!���@2V��&�@%�W�@!�Vv @(����i�@0I8L�l�@4�;,Eb@9�w�/��@?"�{c�8@BwKjj��@E�G�`@Hֳ���S@LL:]��F@O�
����@Q�P��B@S�HM(:b@U�=,:\\@X	��Gc7@Z>��%��@\��k��@^���*�n@`���r��@a�(a���@c'�O{v@du��@e�0�9V@g(4�|�s@h��I[@i��Uγ�@klV� @l�V�jH@ng��zI�@o�|��V@p�$8��@q���ܥ�@rW��/�@s(�``��@s�*���@t�\��w�@u���(�h@v��<�@wlmz�S%@xO�-��@y5�'I5@z�3��@{
)��)@{���E�@|��K�$@}�^q?�P@~ӽ�%�F@̳Qx@�d�k@�����y@�cY�N�@��ʏ��d@�gf�Z �@��(H��,@�p
.�@��x=��@�} 2V�@�N�uH@�������        ?��S���?�o��q?�)��%�?��l�Y�@��� �@�[�u@$jU�|@���ߐ@ l�p!�)@#���*4�@'7���0@*�Qɚ�@.�'ة��@1x:�l0o@3�@!�V�@5��N�͋@8'�թ�M@:����`@=����@?��/�x�@Am���F@Bx���V^@C�3��@EJ�h��@F��{]?�@H@��j�Q@I�k�0��@KXHhQ\6@L�-��p�@N��8�(@P�I��@P�9��@Q�z��l@R�g�:�#@S��#�[@Tv���x@U_�q��2@VL�3��*@W=/~QX�@X0�7�U@Y'�Fe�@Z"�i�@[kX.�@\�:ȣ@]#e���@^)\�ʰ�@_2}�~@`7�C.�@`��Q;��@a/Qj��@a�k�\�1@bD�0�@bѮJ�)�@c_�gmH�@c�@�gU@d�w�_~@e����@e�?O���@f9����t@f�{*R1�@gfl8�;1@g��q���@h�����        ?�����?�b'�S�?���/�e_@���Հ7@��@����#@ ��Z�@$��[:�u@)��z�(�@/�{��,@2�!F���@5�S�A�@9.�|�@<��l�Ro@@W��	90@B_���@�@D��b�H@F��^Ń�@I�V��@K|�wz|�@M����z�@PMQ��[@Q�KY�L@S	��Q�7@Tx�׼3T@U�V��2F@Wv�d23@Yi	�@Z��7�@\@��3 �@]�S��E�@_���/�K@`��=X��@a���/\�@b��S@cm���c@d`1_@eV�:��@fR�K�@gQ�U��Z@hUK���@i]=�	��@jiP��b@@kyt�A�@l����@m��L~V@n������@o�e>E�@p�t-i�@q$b�U@q�yW�g@rB���K@rۦ��A@svYԢ*@t�\�$�@t��G�r�@uP�X��$@u��X6@v�����/@w9_�a��@w�r��@x���@@y0%(��        ?����7�?�P<	a?�����@��rC@�mw��@T���V@���oQ@#��ɂ��@(��=�:@.۰$�f@1�~�bY�@5j<�o�@8\�y1�@;� k,��@?���V?@A����&@C�[��X@E����ߌ@H+��Z�@J}�~jG@L�Ӻ$��@Ocz�U�@P� �C~�@RN� U�#@S��;��8@UikC@V�ۍ6�@X �1�QM@Y�#p(�@[��)�@\�%�m6@^H��~�@_𠉋�@`У���0@a�,rƷ@b����s"@cr�g	O�@d[U��#�@eH�2�@f8�Ǎ�`@g,�h4f8@h$�H��@i ��J�l@j�!f~F@k"�a�@l(����)@m2��T�r@n?�j1�@oPc��d@p1�,Gg @p�<���@qJBI|[@q�ی���@ri����@r����t�@s���Q@t"�}vOr@t�׊��:@uP�+��@u�2���@v�;S6�@w 7�RH�@w���[�         ?���?I?���a)��@
���7S�@�RTaz@!X�>i��@(N��/�@0$�5X�'@4�E,D� @9���}Ac@>�/�g�@BT��}�@Eiݰ��@H�I�q�@L#g'6�\@OĎܓԙ@QȢS�*@S��;�@U�	I���@W�ޠ{��@Z/
"Q
@\y�:_�@^�j��w�@`��i��>@a���0S�@c*9!w@d{�;��@e����r@g5���@h��B3k�@jE���@k�,�L�@meB�;
@n���C�Y@p�\$B�@p��n��1@q�p�=PG@rufsC��@sI��c��@t!'2�a�@t��Z1o�@u٨Fo@v��b-0@w��b��n@x�rG�#@yoTz�"@z\x�}@{K��T	p@|>5���@}3kk�@�@~+Z�gp@%�dH�@���Ci�@���(�%u@���_�l@��69e_@��'�o@����δ@�#�ki@��6g�h]@�3���
@��3Ǜ�'@�G�D�Y:@�Өb�k�        ?�c=#pZ<?�G�٩�?�gU�V?��I#�@M�"�\D@-<oL�Q@I�A �@��:f�@ �� ��@#� 4�W@'b����|@+ ޢ";�@/V@��@1���2��@3�)�mRt@6��n@8[�'#/*@:���}�@=IvfD�@?�*��@ADQI^�A@B��a��@D
c����@E{9L�@F��)g�@Hwe�tw�@Jg�#>@K��dD�Z@M1�mb�@N�^W@��@P@�w��~@Qp���@Q�$)��@R٥mP�@S��2\�@T��>A3�@U�p̨�@V��)�Ͼ@WxU�7�@Xo��8p�@Yj9_J@ZhSb�@[iJ)��e@\m����@]ui�E�'@^�(�֋j@_����@`O]��־@`�=���@ad�Ëk@a�W<�9R@b�B+a#@c�I3@c��?=@d2>~�ɶ@d�ˁ�u�@eZ�w��n@e���@f�%bZ�@g �7�@g�]Ag�9@hUY�;�@h�c)��        ?�/?zx�y?�ۨ�cf?��S(��@='I�
@�MJ@����@/�_�+�@#Y�$_X@(�}&@-A�d@1oK�+�@4tl2Ѩ�@7�yܖt�@;�ǵ�@>���x�@AF��ɯ@CGj		@E^���L@G����@I�V�B�@L..�2�@N��N���@P�<���@Q�[λ��@S6�Ұ^z@T��(R��@Vp)�a�@Wv�K��9@X�Q&47<@Z{/���@\
�n�,@]�Q��'8@_D�:�,�@`w�J0@aP*��JC@b-Rެ@@c�ܩ�K@c���H@d��5���@e���6�?@f����ZB@g�m�ӕ@h�Ln�:@i�+��@j�����;@k���Kp@l�|a;�@m��e�@n�_���@o�
�c�6@pt��%@p�����@q�Ӌ�ƍ@r�]��S@r�����@s=�}�W@s�2����@tf��rp@t�n�6Y@u�<k��@v-xd��@v��W	�@wd!�CS�        ?�ۼk�e?�k'��?�Ӥ�_-�@8�n=�@b���d@��2�@?�3�^�@#f�N]@($�jۚ@-W�ɟY@1}�>bɳ@4�-)��@7��k��@;5���F=@>��vm�@AW�(~�V@C[_���@Eu�KjB�@G�Y��@I��%j�@LPI�s[:@NŐ��E@P�6�>9�@Q�@wq�@SR����@T�a�Y@V&��%�@W���	F@Y �ݒ%�@Z��n��K@\A�NR��@]��
�n@_��[�@`�[�Ti�@aw�>/��@bW�@aJ@c<q4�M�@d$�v	�u@e}*�F@f���F@f��Б@g� ���I@h靵
��@i�ا�Cs@j��X@k�����@l����r�@n�Z0�@o="�?@py�_Q�@p��ɸ� @q.�@�X&@q����W@rM���ב@r�MW���@srh���;@t����0@t���v��@u4pe���@u�I��V�@vg�����@w��q�@w�ϕߢ        ?۪Ύ�?&?���5�b�@,J�B@yOr�'@�ߒ�JU@%����!�@,Ş���@2Y���y4@6��G��o@;n�����@@A��(�@B�T9~I!@E�1�jη@H��/Ge@K�׌;�E@OK��) A@Q]{��>�@S%߀�?@T�uU}�@V澥�
�@X�E�3n3@Z�\(�@\�OV��@_� G��@`�HR@a�ڻ��@b�
���@d�<И@eG@9�b@f	Md&Q@g��5Fi@i j� �@jI�Yo��@k��jZkO@l�u{�a\@nG���*x@o��b�_:@p���Fo�@q:����D@q��Qʷ@r��3�F@sh_$�@�@t'R�9:@t�/���@u��Y�a{@vq;��S(@w9#�B��@xC�W�V@xϒ�4�@y�	|�b@zn�o`��@{AL����@|
-�;@|��#"�d@}ŗ�I@~�X��%�@}	�w0�@�-��=�@��,���@�% ���@��#���@���l>M@�g�U�x�        ?�[?��;Z?�{����?�3D��ٗ@ -��F
�@0
^�5�@�
	��@��(�X@� 4�E�@ ��ј@$1�}���@'�
�ŧ�@+^�EW��@/;�;�d@1��~�Z@3���$j�@5���J�@8.��ؼ@:��1�G@<���]&f@?nu���@@����E@BQ1=�?�@C��Zv�@E/��n@F{(��g�@G���@IlZ�i�@J�~��@L|ҳ���@N�*�^@O���u�@P���q�-@Q})wJh@RV�s@S2� �'�@T�Sħ$@T�u�2@U��t+?@V�p#
�o@W�+M�`�@X�2�mM@Y�x��@Z��,�҇@[����B�@\�O>1�
@]�R~��@^��5={�@_���<��@`O�,���@`���v�@a]�>Q��@a�|];l@bp�MH�@b�V����@c�2�c�1@dTx���@d���ݝ|@e7cY��S@e�K2l��@f\mÓ�@f��~���@g�Pu}1P@hB��f        ?�牨|"�?稗�ݡ?��k[P@
��A�@�+��Y@dz�ӿ�@�����z@#����@'�.螇s@,ӳ�s�@1*0�+�@4�?+@7F����@:�{,<V@>(||�=�@@�!�Ȑ@@B�ӳBre@D��\���@G
��p��@I>rq��@K�v7�\@M��3a@P*FA���@Ql/i��J@R���Ye�@T>+R�@Ui���@V�����@X?��6@Y���R��@[6��b��@\����@^O�3e@_�)F/|>@`�z��7�@a�*��K@bn���"�@cI�C��H@d(BN7@e
i���j@e���1v@f���FQ@g�A;@"h@h�����@i�^h��@j���� @k�Ä�
H@l�f���}@m���N@n�B_��@o�`[�y@pNh�o @p��D ��@qX��)�@q�Y�O�@ri��B�@r��h:D5@s~#���@t
�sԤ@t�&q.�#@u&�Y_M�@u�� �T�@vG���I
        ?�4�?緂`zj�?��9^z�#@U��s8@1��~�@��T �@^�%sȱ@#w�t@(72c-�@-jUw�N�@1��$ɖ�@4�V��:�@7�Χ��4@;:�;W$@>ܲ�_Z@AW�(�n�@CY:U��/@Eq���@G�w���@I�Lf:@LB�����@N��nr�@P���.W@Q�6�.��@SA}��AO@T�����@V]��U@W���	!�@X��c�%@Z��;'��@\b�
0�@]�Χˈ�@_N�%eJ:@`|4�w��@aU!�-|�@b2#�L�@c(�Ť@c�ݷ�@d���YN@e͓����@f��Pc@g� nDG�@h���A�;@i��Nq�@j��R�@k��S҈�@l�X�ڲ@m�AI�ߦ@n�u��Q-@o��ͮ�^@pqBڃ�M@p�!Ϩc�@q���$ g@rp��b�@r��܋�@s6� �tM@s�����@t\��c@t��q�@u��xR�5@v}��F�@v�n���@wR�Dm��        ?�[�b��?��m�~,u@��_>��@=�C*�@�(�J4@%ox�$
@,s��� @2%����(@6u����3@;#!?C��@@��_'@B�>)��@E��\@H��L?.�@K��zvp�@N��k�z@Q2�?�V�@R�Fm�@T͸��Rq@V�D<*�P@X�@ȣ�@Z�=��Kd@\��cBg�@^ߧ����@`�*ئ;G@a�F�*�'@b� *>�@c�3TE��@e&� :#�@f^��]d@g�a�)d@h�F�w]1@j*h�o@ky�0���@l�2���@n*O��T�@o�]'�@px�g���@q.t@0��@q���U�@r�fdf�@s_Б6(�@t ���@t�����@u����@vo��A{�@w9�A�LF@x�ߥ��@x�v8��@y�H�@zxM�,>7@{M��R@|$�Ѝ�@|�D�L�K@}�Ƶ�,@~�R��q�@�����@�<4:�<{@���D�@� ��LK@��G�@����$.@�~U��z        ?Ɠ��Q?��e9�?�cw��&�@ X`���C@t�A��@�Mv\@;q9@V2)�@!1�
}�@$����Β@(3Ð<�@,�(�'�@0�҉s�@24�L��@4QOeWl @6�"�D@8�"���@;m��͌@=���g@@J|����@A�~���@CB1yh�@Dr��!�@E�#h��@Gfʢ�^@H�CD[�@J~V'�`@Lӓ[��@M���.�@O`l���{@P��P�N@Qe �YC-@RE:���@S)=���F@T����X@T�N�L�X@U�5���.@Vݝ�6[A@W�w���@X̴bэ@Y�C�h�&@Z�\�4z@[�0ԏ�@\�'y�ީ@]�G;`�@^�_�wA'@_�ctm�;@`�"��XD@a|4�r>@a�7��H@b'N���@b��ѽ@cEn��@c�g!�Ĉ@dh��~��@d��u�@e�ȍu�@f&�fk+@f��Y1@gVOI��Y@g������@h���5J�@i&�o�|�        ?͡����?�3���?�C��e�@�+�K9�@M�Y�_@��)��@�t�|ی@#���p8@(Nuw4�
@-�W�%�@1���@4��3_��@7ؖ���+@;H]%uu)@>��H��6@A^l�@C^�xl/8@Ev�#�&1@G����;W@I�^�@LDѣ��@N�oh�M@P�blX`�@Q賁ά?@S>�+��@T�[i+�@V���"@W{���G@X��
R@Z|����b@\|e}J@]��&��@_Af$�i@`t�����@aL�>?M@b(��7�@c	l��8@c�߹(�@d�����@e����@f��n�T@g��P���@h�x�o��@i��l��@@j��VYb@k��nst@l�o� �@m��^��@n�А��@o�16���@pd=�ːY@p�n�C%�@qz%@ʿT@r[ؖ�@r�&��f@s&.!߀�@s���"�@tJ�+Ĝ@t��0�c@ut�q�u@v�9�b�@v�d����@w>(h~!�        ?�#W���?�ȝ�;?�DimjK@bv��@:�;G�@�گ��@np�9�@#��ڱ�@(D�����@-{��AI�@1���&@4�b��g�@7�dg��@;Pp���@>�Y��A<@Ag��@Cl��nD@E�N�ɹ@G��k�Z�@Jm�Z��@Lhn.7�@N�kO�g$@P���^�@R��p��@SbT*�@T�x7ʝ9@V6�[i@�@W�4x@Y2��@ @Z�.V^e@\T�򤮴@]�`O�q�@_���pb�@`���e�B@a�@h�^@bc,�Td@cH2e�@d1G�.fU@e�}��@f�
��@g����@g�(-��@h�q�Ş@i����	i@k _�v3�@l����@m`j��L@n#�0��T@o6�2�	@p&���$w@p�z�?�@qB� �6@q�VW�T�@rd=(6'D@r���r�@s���O2�@t#����@t��Z��@uU� ("@u�8��@v��ځ�@w,b3G@w�C����        ?����	�?�'E*6@	H2�+�@��S.0@ F�y��@&�0�U�3@.D��KС@3P�"8@@7�'�e�@<�S���@A$��g��@D�Â�@G� |��@JAr>�z@M�`</n@P��a��@Rg�st%*@TP�@VJo}!8@XV`�!��@Zsh�ň/@\�"M]�@^���m�@`�J]#i@a���z)@b�ߧ��@d8Fפ(%@e|�;L��@f�q�"@h�m:Rs@is��
��@jӞ���O@l9��D��@m���$@o��\@pH �I@q�6��@q��YL��@r�z-��#@sT���m@t��>�+@t�<tOx@u�S���-@v��w��@w_�*��@x6g��@y1��>�@y�J���@zǦ�M��@{�:�1�@|���d��@}l�9X��@~R�x��z@:�1Q��@��6�n@�����R�@���hf=@�w�ɢ��@��B&��@�j����@����t@�a�T�i`@�ޠ�M:        ?��Í���?��61P��?�[m�r�@ �� 7��@�:H���@G�Rn9�@�,��cA@��F�@!�**��@%1^R6_l@(�;M�L�@,�j��D@0��my�@2�B6���@5��=�@7b^�_��@9�F�Z��@<d2^�c@?��,XV@@��)�J�@BC:�(6F@C�u+Ɉ@E+]�o�@F��[_�}@H9?���8@I��=�a@Kks�@M���H@N�V8���@P;k[��@Qp��ȵ@Q��6.�@R�a��#4@S��$�:@T����z�@U���3�@V��=��@W�F��R@X�c�F@�@Y���@Z�[���@[� #e6M@\�\h��G@]�@Fs�@^�\G��@_��&�S@`���T�@a`���@a��?i�@b9�I$�@b�<�R}�@cbv)基@c�I���G@d��n8�@e+��,g�@e�3mI��@fdG���@g₂E�@g�����4@hD�@�*�@h�+�X+@i�G�f�@j1���         ?ϫ��b'?��\�
��?��gF�@�Dw��Y@j���Q@r�яmY@ E��x�@$����B@)���� �@/d��5ү@2��3��@5�cZc�`@9J�Ú�@<貋�zA@@\�4&w@B]�1��n@Dw5��3�@F�}?��@H��[�?2@KN(!��@M�F���0@P%�(�@Qu b�%@R�lt�=�@T1��L@U���~A@WnC�3@X�^�kr@Zq�qm�@[�v��W�@]K>:%7b@^����@`M-����@a'-X=+�@b6D,\]@b�4>d��@c��
��@d������@e�)���@f�9��n�@g��:P��@h�M���@i}��3�#@j|�����@k~���@l����M@m�j�b�@n�o(�(�@o��G�v�@p]r���w@p� �7��@qtP��+$@r�J��@r� ����@s!�ՠ2@s������@tG  ¡�@t���^	�@urku�@v	��B%@v�`�ȶ@w<{#���@w��c��        ?�%~lĩ�?�A��m?��rrI�K@Y�r�@�f%@��2�@nf���@$#�uw�@)
�	l�=@.g�_��@2ug�Z-@5:�]7@8��[�)4@<�{��@?� 	�/@A��B��@C�<i^@F�;�G/@HLt����@J���\�h@M���S�@O��1	5�@Q
�p�=@R^'[@S�c�d�D@U"e���.@V���G�@X� ��f@Y���O.@[�eb��@\�m2�Ү@^M�g���@_�4�`�@`�^�7�@a�3��(X@b��>�6@cl���@dR�(���@e=�^�V@f*��j��@g$��f@h�b:��@i	&ya�@j�L��F@k��N�@l��ѽO@m�C�@np�z��@o�j[�;@p���zG@p�iM��@q)��l@q�*�<�l@rB'#�:k@rЂ-jj@s`5A�j&@s�:�4��@t����{y@u$���@u����ߟ@vB�a�@v�X9?��@wq�����        ?ީ�w�u�?�lzl�@
���Y5@��@&��@!��"t�@'���r�@/����@4VJ��X@90�Y�h�@>v��B@B٬$`�@Eb�Gq@HO�,J&w@K���Pg@OC;�c~@Q~j^�Zw@So�I�19@Ut�F�qF@W���0L@Y������@[�H��@^D�l@`R)��>`@a��V��k@b˒P�d�@ds�n��@ee4��@f���Z�@h�@E�H@i�4�$@j���3F�@li���H@m�`�÷h@oi�(�<�@pz*6-� @qB�sQ��@rK�d�z@r�#<#u�@s���Z_@t� �oX@u\21���@v7C�y�@wL���L@w�Dj���@x�$D��@y��=�և@z���U��@{�$~3�@|�NܤVh@}xh�P{�@~mF"�@d�N�@�/�:�@���(l�@�-�h�@��:}h@�1jn�5�@���-�J@�9�WՏ�@��lQƾ@�G\h�'�@����x5�@�Ynε�        ?�� �>�?�3k�H��?�����'?���T�_�@�2N۶@��G<@�UO���@��6�@!�/@$k�0���@(�P���@+�"]o�B@/�5�a�@2M���2@4L4�3l:@6�y;ѩ@8�YӒuC@;zw�LV@>	�>���@@W4�k*	@A�d��@CG���@D���4�q@F"��,Q@G�����T@I�5�۶@J��[��5@L:��T�@M�J����@O�����@P����3@Q|�R �@R]}�3��@SB��H@T+��w]�@U���@V7�c@V���,�@W���m�#@X�=.+@Y��W�5@Z��[�-�@[�v�X�@\�X�R.@^v���@_�]F@`	�@`�h�]Z@a(93/�@a��q@bDSԕ��@bԒ�	�o@cf@�H@c�Wф�@d��M%Q^@e#�u�z@e��F@fSj�h�@f�>O
5�@g�W�_,�@h$�x��@h�Ed�C�@ia�|�        ?ΎJ�צP?���
�?�(�1Ŵ@J`Yۇ�@�,�c�@����@��m&�@$J�����@)=N���@.���Q@2C�f��	@5kS.���@8ɱC@@<]#��BY@@$S(��@B��C@D$O��Rm@FQ����]@H��5��@J�vȶy�@Md����C@O���C�@QE@��e@R��T6��@T~�@Uo��h�@V� �_`�@Xh&S�B�@Y���%@[��3 @]"��u�t@^��K觙@`:㑃�[@a
G��V@a�S��N @bثIi��@c��vU@d�9��@e�NeV��@f�+���@g��nK@h}���h$@i{�ˌ��@j}.���@k�����@l�>�-:	@m��k-�&@n���O��@o��%՗ @pe�ޚ�@p�,h<l�@q���]+@r��s�@r��'��@s1���_q@s�Z��Ե@tZ=}^ͬ@t�z�@*p@u�i���@v �< |@v��'@�@wV�����@w�4��I        ?�B����?��s��?�!R�y�g@T�����@���5#@�E[B�@�f+<�O@$b�����@)]����@.�
H}��@2^N��G@5����d�@8�n��k�@<�W��:@@12���@B41Ou@DP���5q@F��g_7�@HӴi��F@K9a��_�@M��xK�@P%Ha�#�@Qz��b��@R�ɆtW@TEɽ��o@U�U7 �f@W;7�� �@X�=ZOk@ZY2۰( @[��F�73@]�&��BK@_N�؋9�@`�K@|�@ae����@bK�� �#@c5����W@d$Ák�@e��
T|@fMq�eC@g��߄�@h{��@iޮ���@j]�F�@k�m�]@l&a�_�7@m7p���F@nK�W� @oc�q��P@p?�݁Q�@p� aKtG@q_���Kt@q��TP@r��M�]�@s?63��@s�h	)_�@tL����@t�-��S�@u��(��@v����e@v�9�/�@w\���@w� !�zT@x�u��        ?�G�Z�?�N7��g�@	oXN�0@�?"sG�@ ]���l�@&�/[>�b@.p$~w@3k����@8�dAW3@=1�8�@A;��@��@D
F��+@G*�*ˋ@Jbg|��F@M�1�K@P����p@R|던h�@Tf�89 @Vb
�Ѣ�@Xn�Ρd�@Z�q^�O@\�g2.0%@^�CKH$�@`��H�n,@a��%=��@c}eD�@dC'�U��@e����O�@f�H�@�@h"q��� @iz&����@j�F��@l<�sW@m�P3��M@o�L߆�@pGN�\�@q����@qơ�n3�@r��I��@sQ1�MKC@t�s9I�@t����@u�E�Qn�@v���O@wZB� �@x0~�D�{@y	,��ʠ@y�?�a@z�����@{�i�Ka@|�h�SdZ@}g���S@~N
BT*@6�# @��E�~(@��
�/�H@��{RG��@�v�6��@��oΧ%�@�j�ep��@��l�CI@�b�.V�@��`#c��        ?���H^kR?����t�?�%��@ �SV�g,@�J�,F@$���@Ǚkc�@f"&r��@!f8dz�@$���;�@(|T+"&�@,Y.,4�@04�Lg�@2U�ga�=@4�?	&�g@6����4�@9D���@;���1�@>P���+*@@z��TS@AײCA�@C>3?�d�@D�F.��@F'��V��@G�e|U�,@I6uJ��@Jʼ���@Lhn~�@N��闛@O�G�ӹa@P�g��'�@Q����@R{�2�@Sc��@TN0��@U<ҳ��@V/H-��V@W%f��Х@X
�@Ybnܾ>@Z"����@[!R���2@\(����@]3�S��@^A���\@_Sc�5��@`3��;��@`�Ѹ�E�@aM7&�z@a�&�as}@bl��^*@b������@c� �=��@d'(t���@d���f�@eU��|a@e�-b?v�@f�b,��@g&zkmD?@g�B#��@hco�Nʃ@i�� ��@i��<ʋ�        ?�us�o?���o�?�&!<©�@m�P0p@?�9g�@���l@u�5Y�@#��P�.V@(Mp4�š@-����@1��}&��@4��)��h@7�׾[7@;c�4���@?�wDM�@Au��)�@C|����V@E�-��T�@G��Ꝏ @JH���@LMu*��@N�;u�@P����o�@R�6c|@Smq�`C@T�
-���@V@CW��@W��ȉ��@Y8����@Z��6�'$@\U���@]�$De/�@_�F��H�@`��3��@a{X�3@bY��HP�@c<P?���@d"�ӎof@e��U@e�	0��B@f�ҟ*B@g�H��b@h�^� �@i�/R@j�4p�]@k��X��@l���%[d@m�}~��i@n�at�]@pN���E@p���D4�@qz���S@q��
�Ï@r9�)�@r��a|0k@s\3QT@s��%�j�@t�$��O�@u�ͼ-8@u�\���@vN;��H�@v�sJ�@w�q����        ?˭��?�g��F?��S��u@%}>�=@���r�@i��o�@�.��R@#!*vg@'��}��@,ަ́@10��9�q@4&��V�@7P%s���@:���%= @>6G��f@@�m�">j@B��gmu�@D��?<��@G7#8@IP����@K�%����@M��=-Q@P9$��V@Q}� �%@R�^�U@T#��q�u@U�/E��)@V9 @Xc*�:%@Y�Fp�w�@[d/cr��@\�qu�@^�N�@`����@`劯u��@a�h�@b��K�	@cu�՚s�@dW�!�'@e=�4״�@f&�\�9�@gӘ�<�@h"!@�@h���PP�@i��7���@j�	r�Qs@k�{L���@l�i�n"@m��]t�@n�vI]
�@o�%u�3�@p���׊�@q��7��@q��<
@rJ@�@r�/���@s8m��g@s���!eC@tVܑTg�@t��V�@uzs*��@v#��^}@v��E�y        ?�M0�F?��v1s��@��3ʩz@�\��z�@�L�C�.@&2,-�sb@-w��/6�@2͓�	�y@7Grg�؟@<$	��=@@�/w�S�@Cy*y��y@Fn�J�U@I�Tǟ�d@L�_����@Pn�Ə�@Q�H	ģ�@S�%5.�@U�u��i�@W����L�@Y�b��@[��54�@^D����@` ��.�@aFrv�t�@bsJUlW�@c�3�U:@d��-~@f#�22@gk�1+k@h��5��@j�E��o@kj�I�}@l��<��@n3)��@o�+ )��@p�r�{@qE�����@r�.��@r�O�M@s����w}@tQ�-׈@u|�cV[@u���ZeV@v������@w�����@x[�ø	@y2O6�'@z �!��@z�\���/@{��%��@|����/�@}�H�oO@~j�Pڠt@Qǹ7�@�tG���@�� i�Xe@�	�ھb@���{f�@���n��@�t�]7{�@�ﱮ~\+@�k��        ?ǿ��:� ?�M>�L�?�B�CU@
'��F�@	m�)�O�@�b��@��)���@�NW�j@!�a�ZS�@%�G�[�@(���x@,���i��@0P�{
@2jP�)��@4�o��z @6ߘ�.2�@99�C�@;�@�[f�@>&�V�3h@@\�	9@A���(��@C~дg�@Do�}`@E��<@GR 4U�@H�h��T�@JT�S�@K�J�G��@Mu�[��@OQ�x@PY֫t�&@Q.�f��@R�]� ;@R◈}۱@S���Ҕ@T���y�O@U�v��@Vq���@W]3ܡX+@XK�PI�@Y=Sâ�@Z1��tv�@[(��qD�@\"���p@]�Ji@�@^�Z�Ť@_ �[�8@`��5�~@`�/K�@a���n�@a��Z�@b'�P�j@b��!HH@c8���yP@c�4O[_@dN��v�8@d��E@eh�&u��@e���T@f��U���@g,�%��@g��kJ�@h;H�w        ?�����?腤3%"�?��\��I�@��C*@��wV�}@/K� �@��ҷ�@#�J��&@(��v�L@-��J�&@1�3��5�@4���X@80"3��@;����s@?c� $��@A����@C�Ć���@E��X� "@H�`y�"@Jd`h%�@L��ն.�@OO�MU�@P�f2a@RJ��f@S�bݱ!�@U3�5��@V�_~�q�@X�[n��@Y�T��`@[,7��@\�/Ǒ#@^qU~�j�@`�ZL�@`��*�Cg@a�V��@v@b�<�=|@c����@d�,��w�@e�la��@fx/R�F@gsl���@hr�א��@ivw`�@j}Pzl�i@k�v���b@l�p�-w@m�/���'@n���Z}@o���L\@p|>i�
�@q�*�I@q�G��;�@r3i`w�@r�A�/�@s`ʅ�>�@s����k�@t��>k0@u1;`�@u�=�?_�@vn�C�қ@w�\-/\@w��� ^�@xV��bZ�        ?��vL��?渢�.2�?��O��r2@c���@��侚�@�ʖ	^�@���^ҋ@"��3�z0@'
��sk�@+��?	�P@0�N�N��@3�G��$�@6�/G}�@9Ω�jI�@=:v���@@i�/���@BL9 ;�@DD=]{zE@FQ?�!@Hr��S7�@J�J6>.@L�b`��|@OM���Ȥ@P�;����@Rύ�>�@ShSk*�@T��wӧ�@Vm�}�@Wx���@X��6^�@ZW����
@[�	�'A�@]V.�	u?@^���@`9���1@aC��ɖ@a֎ �@b�W`��@c�����@d\"�{�p@e:|6�-@f$T�@f�s&`{�@g����@h�`E'��@i�����u@j�S[�_d@k�����@l��)S]2@m����Z&@n�_�c�@o��
��+@pFN#i%@p�a�:@qK#V @q�P��@rT�r'��@r�k�=*�@sc<���@s�5�J�@tvO�'t�@u���@u��bӳ        ?�3e�j?�E�`-@R���<B@��6��@:TE Q/@%�cb�5@,�Q;�(F@2rV�a��@6�|zEi@;����L@@K_=�@B�M.:�R@Eב��c@H�K�9FC@K�G��6@OGt�r�8@QY�a���@S T1��@T�"��\�@Vݞ�p@X�U�(�Q@Z����aV@\���7q@_�B���@`�lEf�@a��U��@b�-ř�W@d-���@e<d�Ac@fs�no�Q@g��{�{@h���?k�@j<��ߵ@k���p]@lޘ麎+@n7��~v@o���Xg�@p|��e��@q0�t:�V@q�c�
@r�ah���@s[���Ԙ@tT3�X@t�5�X��@u�L�H�@v_��~�@w%���L@w�Z�a�>@x��Qڎ@y�B���@zS�+�N�@{#�(�o@{�	��)k@|� *�H�@}��=��@~wN����@P�N�ph@�����0@��&��F�@��U�x��@�cV�OPv@��'%�j<@�E�b��        ?�\u�&�^?≳� �K?�K0����@ KA:�$@kD����@�l6]�N@A�wVSR@��D��@!=,]y��@$����%@(F��V��@,���O�@0��~�@2-�+�@4a��ex�@6�jZ+�@9�#���@;�s���@>�x�@@X�[U6�@A��M�@Cf��@D�ߦd�@E��O�.b@G�Bl���@I
Ňu7�@J�;٣��@L:u(� @M�@�i�@O�q&z[�@P��d�J@Q��!�@RbRR��@SH��V�@T3H�y�)@U!|N ��@VpS\��@W	9�@X`aZ�|@X�9�|�@Y��V�Y�@[M)z�@\
c���)@]Ó���@^"]{[B�@_3"��o�@`#�I���@`��`��n@a;��)z�@a�x���N@bZmʉ��@b���u�@c~��h�L@d286@d��c��@e?�u[0�@e؁*���@frvi<�@g�͠�-@g�~|�Wp@hH�:��@h��%�@i����p#        ?�U�^O��?��W݈[?���k��@\�l�I@0�5�U@�Ux�bJ@Q�o�~@#m/c��@((��5��@-Wg�7��@1z�MYA@4�r�@7�#���@;'���\@>�b.��@ALŊ��@CLj�#`@Ed,(M��@G��kН�@I��]#�Y@L3)�l�@N��U��@P���x�@Q�H�s�@S9ԋ���@T�`l��@V��1��@W{�)��@X�1�YW�@Z��'�LJ@\�v�2@]��|�"�@_O')�U@`}-�.�$@aW�b�+@b5n?Z�@c8YR&@c�q��T`@d簝Ra@e��4Ϋ@f�
�4"�@g�h��@h��,A��@i�l�b�4@j��FTٝ@k��d8@@l�����@m�����@nߎ�(6�@o�m���@p�T�2��@q����@q���sR@r/�wd��@r�-,�u@sT_x�;�@s�����@ti	�P�@u7�mQ@u�����@vKIܩ�@v�>�.R@w�*n�L        ?�Z�#��;?���q?��5�1@���Բ�@p��+O�@�V@&[�@ Rq�G@$�ƢzC�@)���h�\@/��,��@2÷lj��@5���2�@9n�#p�y@=���@@yhڰM@B��ʝ}#@D��D�C&@F�q��@I-6̐$�@K��U"�_@NATE5e@PWR`C@Q�0n�E@SNn2�@T|��`��@U���J �@WuR#�of@Y Hw�@Z����dj@\6�K@]�1a�@_���,�/@`��S=�@a��XE�7@bo��lU@cZ��f��@dJQ���@e=�Z���@f5���u@g1�G�h~@h1|�+�@i5G�a�@j<�%�U@kHd��V�@lW�?6�@mju�m��@n������@o�����@p\L�_p@p��� %8@q�R��@r��c.@r��c�6@s?��R�@s��dp<�@tsB~�s@uZZ�@u�U�_�@vL1�P5@v��gD�@w����@x2�M�r@x�°m2        ?�U����?�>��@
q��0Z@�ٕ��@!	�.���@'�ߢ\x@/���@4B�&��@9����B@>_(�)�@B���8@E7A�^@HDv�/C3@K��E���@O;���@Q{�?�Ղ@Sn���K@UvVK�;G@W��m{�}@Y��NA��@\#�Xed@^T�
�N�@`]$��S�@a���.�@b��t"z:@d)Sy=�f@e~�DY�@f����L@h?^V��@i��U�ʋ@k�����@l�6�/D@nɭ�7�@o�����@p�X�5D@qhU��6�@r7Ó9�N@s
��(ln@s�Ê���@t�=�ej@u��y�R�@vv�Y7�=@wZ���@x@;�*Dh@y)�܈B@z̓���@{<�@{�5W���@|�<锿`@}�k�}@~޽� ]@�#�H�@�n!5T�c@��.Q��@�rEe�{6@��QM�L�@�{��A�@�G��FM@��+
@��@�O���@�����	G@�)M-}�@����-�        ?��^�\?��A6��?���e&i@ ��L:��@�a=V@9�zD@�W�7�n@�P�*6�@!u?@U{@$�'�v|@(���A��@,f���@0:U1 |�@2Y�hH�@4��+�0@6ܠTr�@9>����@;��Ux0�@>Ad���@@o�P�8@Aȡ��.�@C*�\U�@D�r3�m@F	'}� @G�} �@I	v�Q(@J��.��@L*�lL��@M�-��@OkEn�@P�vR��.@Qd��v@RB	���@S"�}0@T��:[�@T�"�\�@U��ȯ�
@V���EB@W�i�T�@X�a
]A@Y�� �@Z�0�p @[�{����@\��
�i)@]�<�\@^�!��4@_�>�@`\�d��@`����@al��MQ�@a��PǏ@b��=<I@c7��@c��p��@d*�3��@d�!�P*@eL�t�@+@e�1Bx^@fst>��@g @Y@g� �xm�@h5^y�6�@hͷ�S�        ?�`D�??�<}��?�$$���:@i؞�@9�ek|�@�Mխ�@^i���@#t^(S�@(0��^ X@-_� �Ǟ@1~�ࡏ�@4�
�H��@7���#A@;*9#*O@>ȿ�pÖ@AK�Iol�@CKe-q�@@Ebw�:�@G�m/£�@I�k�R@L,d�RmJ@N�	Vh�O@P�At�M(@Q�1��m�@S1 �,�@T����z@U�4�V��@Wl����@X�>���@Zn���G@[�	�)�O@]��0�$�@_1���)�@`lξ�=n@aDǌ�Y@b ӣ��@c �n��z@c���2z@d��od@e�q�lo
@f��jx�^@g�g�;z@h���K?@i�*�-�@j�ǒF @k�w�?�.@l�I�ZN@m�}��8�@n�ju�|@o��x]{@pbp}wȷ@p��D�O@qy9� 8@r�q1Y�@r�,���+@s&����@s�M��@tL���n{@t����E@ux4S�n�@vG���@v�+qH�@wC��KJ�        ?�])Cͮ?��?���?�0?�ޤ@�\�C:p@V}�_ �@�),qU'@��9f��@#����$d@(x�m6�@-���is]@1��l�\@4�A�wJ*@8����@;���;&v@?F�2�w�@A�_��@C��Ъ�@E�����@G�*Y;,@JJ+)2��@L�|�j�@O,�qO@P�>I��@R2M�,�=@S���DҰ@T�5ie�@Vhq���@W�=��@Yga#g~@Z���ݗ�@\���-@^)�Ɯ"�@_�{q��|@`��g���@a�����@b}��b�@ca#����@dI(�=&@e4�C��@f$��O��@gӌ�'V@h�<D�@i		�<�5@jނB&^@k�֟z@l���H^@m�-��@n���cZ@o-��6y@p��5�@p�ƹV�%@q5yt4D@q¦߁�@rQI��E@r�\��aV@sr�ΈGO@t��Vz@t�	Rh�!@u/�5���@uƧ0s��@v^���$@v���f�@w�]9���        ?�nh|̍�?��#�҃�@���h&�@��K�@ʪ�y@&G52<l@-�˞Qq�@2�z+�[@7f����@<M�K"Y@@��,�5@C���t�8@F��P`q�@I�y~��@M
�����@P?�2Ґ@R���@S�u`5^@U݇�3=�@W߶5c�o@Y��@\}�A(.@^H,���@`Ey]�@am|}�"@b�&r6��@c��M�7@e~��{@fU�X��@g�ұo�@h�?##g@jJt�;@k����I-@m!Y�6@nv\9��@o��u1*�@p��ԫ�>@qkK���A@r+���@r����@s�;��@t|u����@uG=ڗr�@v��^��@v�K�Y�@w�}T���@x�Y�,@yb�;��@z;M�p9�@{᝙D�@{��mo6@|�ɢ�8]@}�ʺ?�@~�}%���@�!�S@�5_��+@@���]��@�!+ơ�c@����p@�]VY@��g��@��x��f@�����        ?ŧ\Zz_q?����]�?�7�]x=?�Zt�~=@{�06@Ja#�@l3H@���@ ����.@#�@Z�z@'}B]�"@+<���D7@/0*
���@1�~���f@3��y�*@6�X&}�@8n���I�@:ܶҠV@=`#Կ�@?�E��Z�@AR[�	�@B�s���@D.i=�/@E�W/1}@G��+7@H�&ZE@Ji�n�@K�]��u@MU�=p+�@N�ԕ�{ @PW��7@Q3G��*@R�:�Q�@R�̹f��@S���N�u@T� J� K@U�̩4�^@V�Imc��@W�bNl �@X�Ӿ�Z@Y�$��0O@Z����s@[���A�@\��@��@]�H�4�@^���B�@_���d@`wx���@a�d�!�@a�t��T@b ,��{-@b���v�@cB��a�@c��a��@dj�H�FW@e Ҵ� z@e�HuøH@f1�I�s@f�/�+�u@gf�-��b@hPf�@h�P��k�@i@�yf�        ?�s.��I�?��J�3d?�)��y�@p��\�@@��7:@���"@uC<9J�@#�:���@(J��<^@-�]�կ�@1��{e�8@4�h�]�@7��O'�@;]�.�
@?g��@Aq����@CwҊ8o�@E����`@G�*� p@J���@Ly;G�G&@N�+~7��@P�45g@R@r��@Sk�Ȣ)@T��
:(@V?�q	N�@W��:<t@Y:�s��@Z���:@\Z���@]��<��@_�w)�@`�p�_@a�՚��@ba�,(�@cE��	�@d-�)9;@e����@f	��
�@f��oDem@g�:9u�@h��/;}@i�y���i@j� r�,@k��:��@m�N�O�@nr�0�@o�1��@p�=@p������@q1����@q����@rPB�4�@r��t�3@su&b�2�@t	��uL"@t���c@u7����@u��۩S@vks�/Y�@wq�M>�@w�վ���        ?�I�P5^�?��jMi�`?�'9��@.v9a@R��%�@�_��@�ѱ��@#�]�2�@(r��̥@-��آ�b@1�,���@4Ƙ��xz@8��]�@;���a"
@?7A
�y@A��Dl�I@C��_��@E���?@G�H�@J8��z�@L���r�0@O�G=O@P��	8�@R%*&�D@S�f�F�p@T��4@VX�7�c@W��q���@YUI+i5I@Z���QM�@\w���1�@^Qԙ��@_����L@`�ȼ���@a���C�@bs%a��@cWg���@d?�gn0@e+�ٓ��@f���b�@grl(]8@h�Z��@i	����@j É
F�@k�Γ[@l��ê@m ;��8@n�*^��@o.�-�*@p �(rʢ@p�%�^��@q9o� �@q�v��f@rWcp��@r�eT�r@s|:^��@t�2*�@t��2��@u>�(YF�@u�����i@vrd�3*�@wh�3@w��-V��        ?�܎�%�?�����b@+��[1Z@��Y@�X@$(���@%Ґ��]@,�\�JKw@2��+5Y�@6�����@;�����@@n2:�6@C.
A�!+@F(X��@I*����j@Ld�?��L@OĞ����@Q��t��@Sx�UL��@U]���@WS�h���@YY���ƣ@[o�O^�@]����@_� �j�@aޕ��@b.X�i}�@c]��-@d���K��@e���O�@gE|N��@h^�a�@i�4,�7�@k~��@l`�E�B�@m�/[���@o+a�~,@pL�-_��@q�U���@q�,uI�T@r��
+��@sD�u
@t	����@t�(��G@u�O�ת�@vh�$�q@w7RX$��@x	9�lY@x�VW���@y��/��J@z�	,�N@{hi����@|F:
$S@}&$��<@~)��@@~�{��@���|h@�]�R��G@��v>��@�I|X@����f�@�9J�`9A@���{��@�-5(�        ?Ŵ.1�?��:B�{?��k��?�iқ9f@�y�g�@Iҧ�(@dmj��@c-Q�@ ��/wE�@#׀V(��@'U�a��@+ԪR[�@.�ǝ�v�@1��*�y@3�=T���@5�P!�E@8'���@@:�|�.�O@=��nn�@?�+/�@A��O@Bt�v��@C�Y�P��@EGF6q0$@F�k�]��@H>�1�3+@Iǚ40�@KYH�~��@L�z纤L@N�2�x@P k��}@P�����@Q�P�1�@R��j	�@S�ڙ^�"@T��VE�o@Uss2/@Vc�D��0@WW�>�M�@XN�x-�@YI���q0@ZG���de@[I{IY�@\NW?t|{@]Voa�R@^a��Z��@_plv%t@`@�ʫ�@`��r��@aV�=j�t@a�D��H@br��FNY@c��'<@c��z(�@d'��+�A@d��-*�@eR �7�@e�S�w��@f�s�W@gC��=q@g��=Vf�@hT�4�qI@h�c��j�        ?��i+di ?�Zhf?�F?�j~u�I@��8��@fӕh�@��Ǻ@���5u�@#��h��@(w�iq��@-��iѹ�@1�4Tu:@4���!�I@8*D��;@;|e���@?&_Sg@A������@C�����@E��&��@G�2��ŭ@J!�J�'@L��9g�O@N������@P�4���N@Rbł�u@Sl�7��K@T�"�2[=@V?P����@W�cҽ�@Y8X4�g�@Z��:��@\Vn7�`@]��@Tվ@_�3&���@`�E��f@a~��%@b]Y���@c@��T}@d'��@�@e� �>�@f�I�:_@f�� �Y@g�.���@h�J�mQ�@i���l�@j�5�.�@k���=�@l�xEw,@m�z��M�@oB���@p�_��]@p�E�#M�@q%x���,@q�9'5��@rB�7�6<@r�G���j@se��::Y@s�@vj�@t�e�=��@u$��|9l@u�����@vV?�
�@v��?�A@w�Q1)        ?�d�u3;�?�m�H�2?�S��[��@ǰ��@���o�@,U�c<@�z�X��@"�r��eV@'���@�@,���!�@1F�k�@3�K���@7�x��@:n�
b�@=��Ws@@����@B��W�h"@D��E�yd@F��\QKI@I��U@K[�H2d@M�51�@P�װ��@QRNS�9T@R�|�r@S��0���@UL�0���@V�Q_o@X IN��s@Y� n�P2@[b��̢@\���O�@^-��u�@_��{�@`�4h6@a���5�@b\��}a>@c7�#��@d�{�#�@d���@e�i[}v@fǕyS�@g�*$H��@h��b%@i�Q��:�@j��f�+@k�e����@l�!�v9�@m���4�@n���v|'@o�u�А@pJ�PK�f@p�JO�@qWn��O�@q��}(��@ri�p"ŭ@r�e�<@s��oѤ@tp�X�@t�����@u.��d5�@u�� �!�@vSgt���        ?��j�w�4?�<Iv4��@S��e}@���%�@ZKWB�@%�~y�U@-1�b^��@2���H8�@78�h��@;����l?@@� ��@#@CX\���@FJ�(VՓ@If�:���@L����r�@P
����~@Q���{L@S���	#�@U��ˇ@W�o;�8@Y�����d@[�/�P�@]�w�qm�@`�_�}@a>f#S�m@bl�G.@c���x�f@dܨ5�"�@fM�_j@gh��Rz�@h����/@j�.�@kk��D@l�WC��@n78U��@o�y��@p�^���w@qJ���@r
�w�@r�`���@s���ɂ�@tZ�d�]�@u%����@u���D@v����@w�K�m-@xj��@yAZ����@z��w>@z�{Z@{�5ݥ�6@|����@}�����@~}��(�3@e�Cq�@�'[_��@��B'��@�A�^�@��Y1`�@��ߟNi@���|�>@�����@�wv%�)        ?�8�d��?�TE����?�d�?3@ !^L��@1Y�7J�@�J��@}U+�R@���� @!'��MD�@$�jNB��@(8e[>��@,�W�@0�F@23YҮ�@4l��� @6��~tzs@9%�'j@;�:�WA�@>8K���@@p�Z���@A�ڋ�y@C9��^�@D�$fO��@F*��&R@G���7�@IB�MP{@Jܴ�	<u@L�w��@N+�; A@O�"��@P�n[
W.@Q�����@R�K\Z@S���BI�@To�0�D@Uav*��@VV�'�5e@WP*p3��@XL�,j@YM'5��@ZP�t��@[W�߀a@\b#����@]o�bbz@^�so��@_�a"ט}@`U��e�c@`��W=4@aqi����@b��{[@b�"[A	�@c&4@C�@c��=��.@dP�V�YA@d��py�@e��?�5�@f�n��@f�w��@gSJ�	�@g�k�Y�(@h����&9@i1��\�@iӔ<I�S        ?�W#�-�?�CHō?�"��=�@l���k@?GN��)@�ɕU8@u���@#��D��C@(K�+��o@-���K@1�����R@4�J.�g@7����5@;^ (7U�@?N�Dv�@Aq%����@Cv�h%W@E�l�f@G�-Sw��@J��r B@Lv�P��@N�U��V�@P��5p�@R�\�Q@Sj�QK�5@T�D��=�@V@���@W���dHH@Y<��m��@Zɚ��.U@\_�v}�@]���Oߢ@_�>N��@`�(�!M�@a��[�@bj��R�@cO^�cӋ@d8�q i@e&Y���@fk,��}@g�i/w@h���{@iM՛�=@j��e��@k���C@l$��@m��@n'�*M��@o9Na��@p'4�f�@p�c�g��@qA/��I�@qБ�N8@ra��Gdy@r���G�@s� �d��@t�w��@t����+�@uMUA�@u���Px@v�c[ �@w8߭��@w�u5Xk�        ?ͯ�_! �?�$ȁZ�?�w�Ռm@�{�8��@'7F���@Nz��@ �A��@$��|/$�@)��"0��@/����)@2�+��@5����.@9r�ߙ�@<�Tk@@H�^�@BKXM�K�@Dg�d��@F���rdB@H�y��@KN뉣�@M�Z���@P.�8��@Q�va�!�@R�錫z~@TMw��Q@U����n@W@}���@X�i��P�@Z\7�@�m@[����$@]��Py7@_N�$ۇ@`�Pˉ�@ada��h@bIEv �@c2�8�;@d �9�W�@e��s�@f�P�w@g7�V�@h�@3�@i�>��@j	��X��@k�-�%t@l!ıU�<@m3AJz��@nHf9u/�@oa$�Ǻ�@p>��
�r@pΛ��@q`4�Oo@q�}�uA@r�ns�<�@s ,S�$@s�-���@tP��6J�@t�HY2֮@u�+��@v'��5L�@vǀ���@wh�u��N@x�ײu�@x�q+��        ?�0���_?�&�yȫ@
[��dV@t�p��@ ��"=�]@'�"'/�@/�j�m��@4<��o@9��Ǵ0@>[��C_�@B�-�@E�+¢�@HF�܂�o@K��"��@OA��8@Q�3����@Stv��D0@U},ߍ|@W�GMÝ(@Y��8��@\PNu�@^_�ŗ�@`c$=��x@a�!�E��@b㦽ρ'@d0��ͩ�@e����:{@f�%��F@hG��(�r@i�U�p�@k(�y��*@l�$��E@n&�����@o��M(�@p���X4n@ql�_��%@r;�Lh�R@sHVqY�@s��P51D@t����� @u����".@vw�݌@wY�}��@x>o��w@y&3�'�@z�㋰�@z� B3�J@{�/(H �@|��֓�W@}�>3Z��@~�&�MV�@Ȗq�Z@�b�D�%�@��q3g�@�cVq$�@��l�ݡ�@�h���?�@��"�0@�r��U�N@��W~�p�@���p@�	�OD)@��룫�        ?�,a/�w?�$��~N?��fb��?���N�2�@����O�@��7�@�>EM��@�8+�+@!���ɉ@$��"@=�@((&j�@,5����@0�I��@21�?��V@4nzÅ��@6�>V�j@9/^���@;�;K�@>K@K|�/@@|���@A��{q��@CK%��|@D��M�< @FA��A��@G�4�[`�@I`�(�j@J�MܹM�@L����@NS�v�@Pܙ)�@P��|5@Q��9W~�@R�%�y�@S����p@T�?��_�@U��	r~@V���EQ|@W�.H�[�@X����Y�@Y��E��F@Z�
Μ*�@[��O��@\�GT��w@]�\8��:@^�� �Z@_�=�3�o@`���%��@a�<��@a��5��@bBqk�<@bأ�.�@cpz�߹�@d	����@d��'E�@eA�Cb�@e�Ă��T@fv")6@g �m<�!@g�X���@hg|u�u@iB��@i�e�^�@j\}��"        ?�-�	�?�un��p/?��X �m@�3����@'���!@�lM@ a��Ǝ@$�%�P'q@)�/J�@e@/�7�J�@2}���Y@5�(>���@9�uy��@<���2Y�@@?�m$B6@BA���p�@D\L5�k@F����@H���(�@K=��ŕ6@M��ߊ��@P$O(]~@Qw�|�T�@R�1-��@T?LH��&@U��+K.�@W0�r	�R@X��k��@ZJ��*7@[�;��t@]��eI��@_:��)�@`y��爯@aZS��l@b?�H��@c)q|���@d��T�e@e
X�)��@fUo�J@f��0B�u@g�_*�
@h�ǜ	6�@j�x�@kh��$�@l#:��V@m6���\�@nN��+�O@oi�L��x@pD��|�u@p�����>@qi�Ųc@q�̨E@r�՜.��@s-H�K�s@s�m�Áw@tc=9��@u �1�ռ@u�����@v@d�e�@v◚~l@w�Q����@x+�	�W@x�C4���        ?�J�b6?�h����?��|�a9�@4,Ob�|@��y��@� � �@-[䟏@#W��Z]9@(�X��@-8Z����@1h).XY{@4i��a�@7���ɠ@;��j@>�?N���@A4�:�}�@C0���@EC���@Gl���9@I����@�@L M`��@Ni]E��@Ps�{�Y�@Q�g�\@S
��С@TkA^��8@U��C�S@W?��`�-@X�d-�t@Z8 �|@[�I�{�@]S^�M@^�:�9pr@`G����@a�8g��@a�j�;k@b��	��@c��S�<�@d����g@e�T�@fk���@gZ���U�@hM.�ޓ�@iC��7<@j<A�5>7@k8����H@l8K�\G@m;BZ�:@n@�k�$@oIh@p*��y@p��Z�w@q:zȣ��@qĂ(5�@rO�%� �@rܘE�W@sj�m覯@s�� 1�@t�s���@u<�4�@@u�<���@vCl���l@v���>��        ?� ]�5�L?��z��H@
�?�~@/8����@ ɍ�65�@'�rgf>@/G��Q�@3��5�'o@8Ð̧��@=��k�<x@Aɐ����@D�O`+��@G�C�b{�@KQ�:;�@N��J�Y7@QE73�*�@S2��XT�@U3�4���@WH$X��@YoZ��3�@[���KR@]�@`(SXO�@a_vyS@b���p5@c�.<�z@e4+�%��@f��|��%@g�/l�@iN�/�@j����C	@l/�����@m����@o,ԕ�>�@pZ�f	$s@q"UG��@q�3����@r�G\\�@s����pn@t`�)�$�@u8SSDe,@v�+�:�@v�R����@w���~<@x�I���@y��de_@z�	y�Z@{p=�5�2@|_E>�s	@}QV�ql@~E�9`W�@<ԛ�Q@�XO�\@���z��@���(v@����x�@��i'�}@����С@�#}'���@����|@�/��o@@���Ꚉ(@�@Տ�5r        ?�	;�y�9?�i�Zƌ?� ݼH�?��lB�/@��W-�@��*?f�@oc�گ@�wr�;@ lrMe�@#����@'D����@+2��@.��o�@1����S�@3�RQ8:r@6���e@8^Gw���@:�����@=WD�Wx�@?��2��@ARC�9~-@B��16�@D!"����@E�(�K]y@G���+-@H�u	��@J1Z�)Zs@K�'y|n�@Mo��d@O���Q�@Pg�5ݦ?@QF:�QD�@R(sY<H@S�F�}@S��Ա�E@T�L�Ѥ�@U���j"�@V����@W���q�9@X�@ȹ�@Y�1�Q@ZŖ��D@[�`�-h@\�{xKX�@]��$F�@^�P1+��@`��@`�=��N?@a��R�@a�@��a�@b9�~,x@b���<@c]�ز@c�kCZ�2@d���Y��@eV�roW@e�Q�Ufw@fN��8�@f�<-��|@g�"
���@h"MW�*�@h��@t��@i`_�=OH        ?�`^!�/?��X�?���C�@"�iG*@ʒ[�Ȏ@������@��J"@$3[�n��@)$:�F��@.�hhx�9@27�|��@5_���G�@8�`�D��@<V��6�@@v/�t@Bu�+J�@D)��t�@FZ.�!�@H�nA�V@K?�s 7@M|'�ZrN@PXS*h&@QW���@R��\� i@T�xϵD@U�-t��@Ww	j�o@X���*��@Z"`�@[��K�@]_'B��@_�O`�@``�r�p@a?���@b#[��&@c6y~r@c�C�g��@d�o�\˘@eۣT�1e@f��#jY�@g��1S�F@hϞIh`@i�"��u�@j�I�ȧ~@k� ����@l�8f�@n�*��U@o��� @p&L�c@p��u5�8@q6k�Y�U@q�s�,�@rZ
�t�@r�+*iCK@s�����@t����=@t��A?~@uM����g@u��=Ͻ}@v��+�_�@w$�=|�@wÒ՞`�@xdv!3��        ?�H�s�?��J=
?�7o���0@��'�̵@_J�9�J@
 �4�v@�㕹��@#���t{@(�M$�2�@-���9@1ƹ���-@4���"N@8'N����@;�BDE�,@?Z���Ƿ@A�7�@C�e��`�@E�ͦ�+@H	�G�t@J[�NF��@L�]<�l@OC  n�@P�:�@R@�yCݙ@S��$�e0@U	
�j�@V|[���j@W�r!h��@Y�>��Z@[+���R@\�r`Եg@^K�ً>@_���vx@`�m�n7�@a��yj��@b�殎M@c|��/�i@dg	%�|�@eU}-��N@fG�ZS�V@g=�&��@h7�d���@i5=f�fP@j6R���@k:�Cl{B@lC+��@mNwd�@n]A�U�@ooMNGk4@pBE}y%�@p�t����@q\+�	F@q�cT�_�@r|b4
�@s4���@s���_q|@t6���@t��Ϧ{@ud��:@u��u0g@v���-
@w3,~�~j@w����        ?ܑ��ge)?��u#Z��@���;@&k^��@ Bd�S@&o��q�@-�-�+{
@3	�<�>@7���#4@<�"�"KE@@�.E�k@C�Z���o@F��5�8@I�>�t*�@MS�g�\@Pi�lm�H@R<款�@T"���@VN�#C&@X#}M:��@Z=���@\hk���@^�P�m~|@`v����a@a���p�#@b�z�i8�@dJ�A�@eW=U�\�@f�+Dp��@g�����@iIV+CP3@j�B��vx@l�0;�@mv��}�@n���R[@p.�,�F�@p�䊡�@q�
��{@rr
�@s8�\�@tb��@tΝ�Gcz@u�{��t�@vn�Q�@wB�?=-z@xT�\ٱ@x�2��w8@y�u��r@z�D��@{�H8�j@|mQGڗ@}Q�j8/�@~8����8@!�QO��@����@�}4P��b@����9��@�m�\c�@��?85@�b}���@��YG�X@�[2Sab|@���J�        ?�b�n��?�4!)��t?��{7?��?��O/QF@�<_U,y@���W�@�ЬC�@~h�tQ@ ���;X$@$3����@'·�d�P@+��NS�@/}!~
�@1�c4�`@3����w@6>ɼ�x�@8�i�`�@;C�z�@=��RD��@@� R>@Aa|0�V�@B�_�7��@D&zH.��@E��򔹸@GY�{�@H���(;-@J5�)r@K��sy�B@ME8�-@N�=gB?1@PGV�y��@Q/ý�@Q���@R�t��ej@S�Ô��6@T�u����@U��V]�@Vv�Q�@Wf�V��@XY��^��@YO����@ZI:q@[Ey_��5@\E�OK�@]G����@^M#:�\�@_U���@`0t!~��@`���{Z@a?���@aɭ�g�8@bT�����@b�!���@cnǯo�C@c�����@d�ͤ��4@e 5�ad@e�����r@fEA`���@f� �[l@go���-�@h�%+R@h��y�        ?�}�'�-z?��^��#�?���7$�h@9)��@��ܕZ�@�`�@O�MG��@$i2�@(����aN@.J�{cH@2Rgy�&@5)
#��6@8}��`�@< �%N@?�����P@A�2v� @C�\:{�v@F�)y	D@HR
�+�@J�Rc桥@M8��(Q@O�>�/Z�@Qt?��@Rq�X���@SӬ�BV@U?�Ð80@V����@X5H���@Y��ゔ�@[QPdӴ�@\�I��3K@^�W�ʲ@` )���@`��o��z@a�6����@b� 8��@c�3(H8|@d�\�X+L@e��j�q�@fw��Fk�@go�C���@hk��$�S@ik,>?��@jn}}.7�@kuuC�NM@l��:
�@m�&��$�@n�ĶǸI@o���x�H@pf��J�,@p���TZ@q��6щ@r=�q�/@r��*��@s<R�P�"@s�2抈@ti�����@u�ڸ@u���I@v8޿�o�@v�>'ۇ@wu�>7	@xJ��        ?˛�����?�F��:®?�y���ST@�5Ч�`@�D��7@@H�e�N�@�'\"�=@#��҃�@'�*�J0]@,�{4?D@1x��]@4	.H��@7,�V��@:�Nk���@>���@@�0��x@B�@�{8�@D�j��� @F�"��f@I�5;:�@Kdh�}�@M�Iy<�:@P��z��@QT֖��^@R��i߯%@S�\L�
@UKU�@V��+�c@X��S_@Y���#�@[
��TA@\�� �@^N�+��@_�P!�@`��ͫ@at}�щ�@bH�Cc-�@c 9�:U
@c�E��!@d�<p�8D@e���y�1@f�����@g�N�x��@hp��w.(@i]� ]g�@jM暊��@k@���Ψ@l6!� �(@m.5�_�@n(�4I@o&H��@p��t@p���L�h@q�&@q�z0��@rZ�D�@r��a@��@s*:^�@s�a��w�@t;W���@t�]���@uPmM|�}@u܄���        ?ܴ��0G?�ƚ�t�4@�ȕ���@%���N�@���R�@&_|�5p@-�����@2��:?sl@7i8��<�@<F�=RSe@@������@C�����@Fy$���@I�j��)@L��'��@P&"v�@Q�$���T@S�]��@U�G�kΥ@W�]��S@Y���r�@[�d�x�@]�ͳ�9�@` m��9|@a h�j��@bG#��z@ctq`��R@d�$�uy @e���q@g" 7W��@hh"�(�@i������@k���@l\�9K�@m�f?]�4@o|Yj]@pAt�K�@p�̲��w@q��Q�5i@rl6���@s*4\��@s�ۣ҅@t��rX@ur�d�H4@v:Y�S�h@w/#�Y@w�:�+�V@x�o5G	�@yn���"@zAȉ�9@{�	�΢@{��N9^�@|�#�ǁ�@}�R�A��@~zajp��@XHV6�@@��R�_@�����IK@��Z��G@�pѲ;N@��x�@�X;��Ψ@��'a�Ț        ?��4!�c?����,Q?����T�?����-v@�؆��@p�	w�@�i���.@Q�`>�I@ �x{�H�@$��{�@'�QF�x�@+n���+@/g���K@1�4��@3����(i@6;Ay�K@8��+.�@;�k�>@=����D@@z���@Aj�ޡ(�@Bˆ�{��@D5��<�(@E�N�쑆@G%۴��b@H�H<���@J9b�j�@K����'@MnŃ��@O��:#@Pb37��@Q=j�RF�@Rb�?�@R����@S�3�gR�@T�䂴?.@U����@V�{��Q@W�Fzڱ@X�T�N�i@Y���`�s@Z���"F@[������@\�Ԣx@]��?䦅@^�$��`{@_��łu@`_n0�2@`���x@ar��d�@a���C�|@b�P�à@c��{r!@c�T�K
�@d;ax�j@dͬ��N�@ea4/J�s@e��j��@f��d�$@g#ʝO@g�j$���@hT�u@h里>��        ?�X���}W?�ȵH�b?����m�@?'m@�wa��@x)
�@K'����@$-c��@(�R#2�@.V�_j+@2�Uw�U@58�_��@8�TCɜ�@<#�*}�8@?�>\�@A�!_�:�@D��y�@F5lj��@H|*+:�H@Jڞ��@MPH�}��@OܯW?�@Q?����@R��l<��@T��i�3@UtUT��^@V�C�2�@Xuя	�%@Zv���p@[�ʊ�@]A�9�4@^��ʛ�@`Q�(�uU@a0�#� `@b=L�C{@b�"�5��@c�I�m@dؠa5!p@e��E,@fŖ��?�@g��썪@h��@i���T?@j������@kڒ�ZT*@l�����K@m����@oj���@p�vJ@p�T�@q5����@qǢ>��@r[;3�SL@r�nZDh�@s�6rD�7@t��W�x@t�m���@uT��	G�@u�%�@v��[	@w/�;.��@w��w��B@xs�cO;|        ?��2��r?���M�?��G�e��@5�}=ڷ@���@���F@4U�w�@#]�v܍T@(�qQs�@-G8��MP@1r�;��O@4x�����@7�����@; ��:�_@>�x1%z�@AHvM s@CHm>��@E_���p�@G�?U�(�@I��mH�@L*QJ|=@N��F�ը@P�ՔQ��@Q�`��rP@S.����@T���V@@U��W>�@Wg��w[@X��|�`@Ze-���@[� L��@]�>jgI@_!���s�@`c)'�*�@a9k�)<@b�Cڑ@b�!��@c�BZ�!�@d���F�t@e�����t@f�
1�|@g}�dC�@hq+p~�@ig��~�@ja|�K�J@k^qv���@l^�'g=@ma����s@ng�(l�0@op�I۾�@p>��G`�@p��#Se%@qNݮ�t�@q�#щ�@rd���j@r���S@s�*���b@t��VZ@t��D���@u3 �r�@uƬ�Y�,@v[y���c@v�[���        ?�ۗ�a��?�����@'�
��V@�ѵ ��@�%�[b@%��R���@,ټZ�d@2d�m�@6�h��J@;{W9�t@@Gl�&٩@B���Æ@E�Sߐ�@H����~@L���\@OQd�AeC@Q`^8@�@S(�L^�@UU�Sn@V钹��c@X� Ѱ�@Z�2�Ȏ@\��M���@_M�:�@`�:RK@a��e�_,@b�Jre@d|Tj�@eH	W�o@f��Pŷ@g��载@i �
r~@jH�i"�+@k��4��@l�O�@nC�-+A@o��Y�S�@p�����@q5�X,du@q�5�Z%
@r� �GF2@s`*[�W@t��<��@t�x��8�@u���p�
@vc�!#@w*x+A�@w�:t�%2@x�(5� �@y�:RZ �@zZg�!�@{+���8�@{���	r�@|�N8U��@}���q#c@~�d��,@`aQȣC@�ז�LT@��t��!�@��_ s@�ph��@���"Y7-@�V/V0�9