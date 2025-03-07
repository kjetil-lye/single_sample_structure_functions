CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T112227        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?dor� <?���~D?�?�n^��?���	W�?�9���u�?Ҩ��@�?ۦp�#��?�UC�2>�?����?�ş)y�?�)2�F�1?�!����'?���ڼ�@� Y@XPպ��@
'��Y@ܰ�C'@Ax�z��@�aI�	�@'HO�U@��γ�@�o6�5@�־!�"@!Eه7R@"��:�@$��Wr$I@&s	iwV�@(q��^�!@*��M�a&@,� ���@/ ���@0�S��,@1�jɔ��@3;x��@4�����z@5���F��@7k��Hr�@8멱;{�@:y%��m�@<R�	#@=��y�ʺ@?r��fu�@@�
<�`@A�� f!R@Br�t^?�@Ch�Չ��@De���`@Ei8��@Fs9E��@G�����`@H�aQ�X@I�ZR8�f@J��΀�@L�����@M:����@Nr���@O�T�L#�@P{4� t@Q ��r^�@Q��$�J@Rv=&�,�@S%��0*.@S�{6��[        ?c8��{ro?�É����?���h���?� ��ށ�?�#*��?ܘ�t�w?�G)�/�?��s�Kp?��u��%@'"#r�P@���E@Eh�05�@w"c��@��7�@ ����*@$P�Bn�@(�_O���@-hբ�*@1fA;�t�@4e�땫@7�Y˾v@;S�Q`�w@?Iz�R�@A�+���4@Dd����@F�oW��O@IOA#�@L.�^�IP@O>�($L@Q@
�FIj@R��R�@T��m"�@V��ؙH@X���I��@Z�ɼ�o6@]�]@6�@_tæ��@`�:S�@b9�Cr�@c�RW���@d��n�@f`��VP@g�Qtl��@ik �R@k���5}@l�����@ng�5*A@p>p�@q��{��@q�0%�@r��!�,@s�2�i�@t���n@v�Pv"@w��
�@x@U�^P�@yh�^h�@z��YP�@{Ҹ]YO@}P����@~^�}�x�@�|x���@���)C�y        ?`	��7�?��s9���?�7�ca�?��g�͇?�d���U�?�/��>1?�B���2�?��l�yD?����B�@yP�F�@�)t�D�@Vw8Λ@:���@���"��@�=�[�@#�WG�T@'�۴���@,;�8��@0�Ԝ�,Q@3�8�K��@6��b�@:*�Ε@=�+ǢC�@A�W
&�@C6R��j@E�_`tT@H�n6k�@J�}	mTo@M�+_�@Pe��h@Ri�k@S����NQ@U����a@Wr�\�f@Yr�;�x�@[�u�-�@]���r��@`ͥ�N�@a60��{@bu�HD��@c�;x��@e1����@f��R[6�@g����d�@i{�Wjoq@k~�I��@l�n$n�@nX����@p
26�`@p�"0��@qۃO4e�@r�J����@sʉ��N$@t�P���@uײR2�@v�NH�@x�@��@y%!�<�@zN�o�d@{�����@|�R� l@}���K��@D#�a��        ?������?���Ծ?��)��d1@5�E�>;@q&q�g�@&;�ͧ@0s1I��W@7��R�D@?x�MS�@D27�K55@I�V!�4_@O�Ԃ7@ST2b�]�@W3�ڭ�@[}�_�@`
R۟�@b��:~�@e��t���@h�'^b��@k�_��@ojC�7^�@q�M'��@s���X5@u�"ʷ@�@xo�*5�@zr�_J1�@|��ˈKb@�.]�@�9�����@��e#;�{@�:ޟ0�7@��5ځ��@���C6@�Cdv�+0@���X��@���H���@��t���@�~�P�O@�����0�@������@����I�@�󼝭�>@�)�B��@�h����@���W7�@�Yq$��@�_�M�}�@�Ŕ��A@�5@,���@���1�_�@����~
@�^�mQgx@�)�#��@����@���$z_@��%�*�B@���(q%@�gD�͕�@�NKhc@�9�j�P6@�*W��`�@�oaǸ�@�H�He        ?p�+G���?�K�tb��?����?§��:?�#T�G�3?�)�N�?�LJ\R�?�#��?�)u�|��?��5W�U?��O/C�?� ���Ӽ@��Ϗ�@^I��@	��Sr�H@�`';@m���a@Z���}�@�lQ���@~Q!��@O�`��r@K�G��@ �)�G�b@"b1�mr@$ �F.�X@%�ʀ/�K@'��@�d@)�*/mB�@+��3{��@."p��9@02�=j��@1_m�z@2�Y���@3�Sy�@5(k5��H@6�����@7�M*f@9U����@:�g���`@<Vsg��p@=���Ɔ@?�W|�0@@���*�@Ao��&�-@BN�O��@C3��Z�z@DES�6�@Ebz�C@F�K1@F�h��{�@H I����@I�w��@J��Y�@K$$�fq@L;s��]@MW�� �#@Ny~T�2�@O����E@Pfۡ�g/@P���j��@Q�����`@R:VډK@Rۈ��p        ?Y���P:?�]��w�?�RA~�1?�Ɋ���?��xZB,?�j����,?�߁є�?��Ȱ�վ?����Xc�?�x��(@@C��Lm�@$t]˰@�l�4�v@�5ѫ��@K�h�� @!wR`��@%B��zB�@)����@.cu��@1�e[���@4ܐ�ǯ@8"�*Tp@;��J�,@?�����@A벮^b
@D3.k��@F�_��I@IF�(K�@L�G,�@O��,DE@Q��@@RͲ�%�@T����}@Vu�l���@Xo�_��[@Z�&p���@\�ҝ0�O@^�R�{�@`������@a���-@c>�U��@d����@f�v�(�@g~�2�o�@iɸ���@j���A?�@lCD��@m�5:��[@o�}�j�f@p�"�۠�@q��#�@r�t���@s�[:��@t���-��@u�T��z/@v�/�T+�@xA�kj�@y6�oq�@ziDI"�u@{�Q3j{�@|�͡�O�@~3�rF@�L�(Q        ?p1��R?�4鰺�?�����?İ����"?�9�O�y�?���a?�����?�W��=?�JE�z@U��Z@�F��@-�G��@�����@�f���@�y:�IJ@"���g�@&R�o��@*}�� �@/�a@�@2{��P�@4�,���3@7���q�T@;KZ��`@>߰Ѭy2@A\xX<&x@Cl+POU@E���	��@G�lm��@Js~�Tg�@M,6�N]@Oܬ�ݱ�@QeArO�@R�R�B�@T����:@V?��@��@X���Mu@Y���S@[�	��@]ԝ�F��@_c�@a
y��@b1��@c_|K�Hh@d�b��h8@e܉�8f@g,���@h��r^%}@i�AK��Q@k_$�FW�@lܟ����@ne�[���@o���X�@p͠J�l,@q�ߨk�@r�y}�}@sbOs0(@tJ�7��@u8�o�[@v-{�՚w@w(2h���@x)&_AU@y0c�t�@z=��\        ?���@��?駯�T��@&H,���@���@��.Ơ�@(bK�#i@1n#
�y@7���"a@>��S@C���q @H9�U�L@Mf��\N@Q���a��@T����@Xz�Fҳ@[�x�.��@_�Ť��[@b	����H@dT*}P@f�.N���@i]q`�K@lB�81�@oӎ��@qzJ��@r�fHQ��@tRIa�3�@vE���3@w�}�qY�@y��-w�@{� F�N@}�cF�o+@�
���$�@�)C����@�R)��HA@��T���@�����1@�
��)F_@�\�;u[�@����T�@� �Q�))@��at�=�@��@^��@��l����@�h*,��@��d6:��@���:|��@��4��B6@�k�Z��@�NRی�@�6k����@�$��<$@��sW��@����M@�]ЏK�@�� ��@�����@�$z�]`@�79���=@�O\N�9:@�l�?���@�G��ϵ@����@�r�=���        ?l"�E�?����w$�?�Un��m�?���p+�?ʂ�``$?����a�?޸6%2wc?�M���4?�Z%|?�E�7���?��C���?�A-	 ��@#��@`�,�@�C�~@�&�
��@" q�Sn@v��`$@�09�C�@���3o@���	@���۽�@ k���2@"#	��@#�5�|�@%�*�j&�@'�>���1@)��R��@,$S�a�@.n��FJ�@0i�Y�@1�<��=�@2����@4I\
���@5�;�3!@7�Ө��@8�u�0&@:#��i1�@;�WU��_@=[A�H#�@?	f����@@a�d�}�@AE&��@B.:P���@C[�2@Dd	�@EG�f4@F�K$�@G|�B�@H �y	�@I2�P��@JJu'�s@Kg�sп�@L�טw@M��Y��@N�m��@P����@P������@QH�7�n@Q딇yt�@R�qgЀ�@S:@���@S��yx        ?b�m�4mH?��x�W�3?�s6N��?�����j>?�t
tdj�?�\@�Ȕ?� ��BY�?�<���?�5��[�X?��8���@?#[�z�@
�?�,S�@[���&@	�3��_@�v�.�@ �
��`@$�pxo��@(�#O���@-4hS�@1)A�gX"@3�j>r�w@7^	���@:���	��@><uK>��@A!�\���@CM�� @E�&3G�@H%L��J@J�8c�%V@M���H�@PYWQ]�@Q���Z�2@S���${$@Uo��{o�@WQ�*qZ�@YL�G-@[_7�i_@]����7@_�@���*@a[ l��@bU�1�@c�F�U@d�E75q�@fZ��	�@g�_��+�@iM��I��@j۸7���@lx:t�@n"��_@o۽��@pѺ��>�@q���-<"@r��*��@s���a75@t��xz�@u�5�|b@v�&�t\�@w���k:X@x���ю�@z(Cu�
@{XK�\-@|�w��@}Ў:�^X        ?_�S�m��?�:��Ic?�f;�/��?�u7mS�?˿� ���?���Ŕ:�?�=^x��?�A��:?���0]�?����'�@�,1�M�@�6YH@�( �?�@�>���@k�i��@"�%�ڔ@%�F�~��@*\c2�O@/KL���@2fA��&�@5sR�Ӯ@8��h\j@<|��=A.@@?^��eC@Bk��J$�@D��c�`@GK|��@J �B��V@L�b�o�@O�~ı��@Q�m�W-�@S\�d�=Z@U2C&~�@W!��{��@Y+=7�*q@[OO��^;@]�>3�@_�a�ɥ@a/
E�&�@bw�x֎@c��Յ
�@e4pHN8@f���"Y@h*J$���@i��heZ@k\C�@m����@n��J��@pLז7M�@q<*{`�@r3��H.l@s2�V�~@t:�$oF @uJ�.P��@vc�(o\@w��j?�@x�{$ �5@yߣhPQ[@{�+T�1@|^M����@}��;�D@ ��!w�@�/��Yt        ?���+a�?仅���?�1ߤr��@$��D	@q��B@&�����@0� \��@7#��@�@>�0�>m@@C�\��ek@I�.�@N��e�@R��[e�@Vp�3�@Z��4���@^��y�@a�!�[p�@d�q@�5@gwZ�<��@j�p�D�0@m�9�7~D@p���=
�@r���3�Y@t�)��]@v���D.@y&#VC@{���Q�E@~"'S�g�@�j!�GE@����v1�@�Qm~B^[@��f�@���0�@�44��j@�� ;��@��w���P@���	 �@����%��@��T#��@���0��:@�� }*2@�9�F�fO@�h���Y@���4/Ό@��C�Y{@�0�u�@������)@��zgw�~@�PC%�I@�� [��;@� ��4�@����'I@��߫m�@�|C1�~@�Oxł��@�( uz�@���^�@��hcw�@��#M�f�@��T՟L�@��
O���@��P�fv�@��4HD��        ?[��f��??�'v�-a?�%�9��?��T��?�@�/�%�?���[��?Գ�2��?�
���?>?ぷ�.�?�X�z9=?�	'M?�܁����?�+��^?��(�\@%TP�φ@��a�*@Dq ���@
�ę�`'@���K�@It���@xQ1I_@�[J�/@N��җ�@������@�#���@ e�`�g@!�����@#�Q�#�@%kum)�@'E���|�@)6�?���@+?Ȋ)�@-`K���y@/���xE�@0����+@2(�y �@3i���1@4�r>��@6�-�>�@7u7�Ї�@8�1OT@:e�z��@;�a�B�@=��d
ai@?+"�~�8@@m��ɀ@AK��7m7@B/��振@CY$�x@D
�X2+�@E�Zb��@E�KM��.@G#��D@H
*:�5@I]�@J."Sr�@KI=2�!@Lj`9�^@M��n��Y@N��ఛ~@O�� V�@P��@-�@Q5�CZp        ?]{TȂ�?�c�!��J?�I7 Ӷ?��v��r?�a�x�?�\B�+k�?��?x�&?뗤`4?��#|?���@^�i@�� _@�u��@5�B#@\����!@S��]�.@
��T'@"�&]�.}@&t�.'�L@*�9��Z�@/*C<P�@2��Vi@4���@7�`��(�@;B/X�?@>�d�r]�@A[o���@Co�����@E�����s@H
�.�#�@J��{$�@MC�^��@P�<��@Q�F��@S'&U|;@TӔ0%$e@V���\�@Xnig'��@Z]pƯ��@\cEҚk@^�0
޺k@`Z9���#@a�(k~X@b���@c��W�9�@e9����@f�!��@g�2a�@ia��Q�@j�$�%�@ld���W@m�jq}�@o�����@p�F�@q���!��@reG�J�G@sOcx��@t?�^�,R@u6�+jۥ@v4Tq{s@w8:�2T,@xB�n�<�@yS}=�� @zj��o��        ?Q#��tc�?���{���?�H���g?��q~%�~?Ī���T-?�%��N�9?�,��Ӿ?���c�n?�ms<��?�S(����@��>�!@	f�f,$i@�`��0�@^�m�z�@퍕���@ ����y@$i�JG@(����Ey@-jZQl��@1a�*i@4[$��S�@7��4b��@;A��51�@?5��z@A����A
@D��N�@F�Z?0İ@IL�M@L1f��@OIF0��i@QJb����@S
o"�n�@T�@�i�)@V�KY��@X���H��@[��O�@]e��mv@_�!�G� @a(@+���@by?�#9@c�;��wJ@eHb�D�@f���df@hT�EAs�@i�&�d@k�Tq2B@m]{���@o+�<-�@p�o��bW@q{�gjzM@rz���.@s���r@t�����v@u�)���@v�.�@w��<8��@y'���@zb�wJ�H@{�c���@|�[�r�@~G�X+-X@����}w@��Yp���        ?�]ǋ�w?����q=�?��i���X@w�n;�0@�ޗ��M@���t@#���@(4@+p���c+@2W4my�@7�E��`R@=�٩�k2@Bz%p��J@Fl�@��@Jң�_(�@O�$<��c@R�����Z@UmC��@X���R=@\�FI�@_�,!8�"@a�D�3��@c�+oJv9@f4��/gM@h�j� �@k'G�K�@m�^��]�@pW�G]@q�	ӌC@si���&�@u����g@v�/-��y@x�n���@zz�.�E\@|q�r:W�@~|�3�@�NQ"���@�h�Y�WF@�� ��@���M��@��-6c�@�8�iz8	@���K��@�����@�Aj��E@��'��/y@�%��<@��(9��@���4>@��<o<c$@���Gg�3@��<LW��@�`�N��@�>�n�1j@�!����@�	EoIW@���+l_@��~�A@��(9�p6@��O����@��,�l�@��3�
x@��߇Q$�@���87-R        ?`i����?�4����?�s�]�?�{Iֱ�?Ús�K�?Ϸ�� S?ץMS�J?���\?�`��qYr?����y*?�q��T�x?�ܒ�k?��q�s�@ �����@��nK�j@���Y�@
�t]!P@���X�k@�\��K@��G��U@V�_@��Ɓ�F@����@� �|��@!���u@"�b0{�D@$v�#qP�@&U)��"@(K�><4~@*[v�f@,�<�g�@.�`��Y@0�Y2Z@1�.o5	@3ɴԊ4@4cK��r�@5��z �@71��w @8��}o�{@:5�G���@;̧f9�G@=qz���g@?$mQX0@@r桀�@AZ��x�@BI�L��@C?�Ǫ��@D=e6��v@EB
-���@FM���Y@G`�o�"�@H{8���@I����U@J�k(`�2@K�]��O6@M,��z��@Nj�+�@O����@P~�82�@Q(�dl�>@Q�X��i�@R��I�$H@S<g�T�        ?`�%	�x9?�-�܋N�?��+u6X?��+PՐ.?�w��t?�q����?�I�s�?�0�$*u?���h��"@�8\CT�@	Ŝ�4|i@��L�@1�'|j@4�G�n@!�?��Gu@%��pk@*@��5�}@/rw�6>&@2���d$@5��>%� @9f��K�d@=JT4��m@@�!u�@C)+k��@E�A�xI�@H/6���@K��/�@N�q��d@P�,�>@RY�5�W�@T))i�S\@VR�.]@X����@Z4P��4@\n"F��@^����@`��_�O@a�E!@c9 F�@d�qq��@f:Bؘ!@g��D��Z@i+�A��@j�Z���@l�/��%@nJ���Xw@p�lm�@q=)A��@r ���ߜ@s�xB<6@t�i$z�@u*�L�8@vK.���@wt�+o}@x�E�A�@y�b�k`3@{)}�*�@|xB�d#@}�;:ޓ@4A���@�P`��"�@��|al@��9p���        ?Y�%�?���r���?�n[TO�?�b� ��?̛]*�?�6jW���?�艌�l�?�i;"c�?�T��E��@��г<@�m@L�N@o�@^(��u1@3�N�?U@ ���>�@$������@)Xi@.WҊy@1�O/3W@5��!��@8j#�.��@<~��@@v㔁_@B6@Q;4�@D�2g3@G:o��@I�-GH@Lv��o�-@Oo쇄l@QI��&��@R�ѪҰ@T����@V~�UX�`@Xe����@Zb�;,	P@\uūK�'@^�����d@`n����?@a�Ǚ��`@b���@d҇��C@e_M��SJ@f��)�_@h�t���@i�hˤ�w@k-�n@l�g���<@n.?��@o��[q�+@p�6*�'/@q���0@r���Q�@sq���>@td�5�@u^�{>��@v_L�ߞK@wg���f@xv�?�)@y�k��@z�oS�
@{���A�@|�z�k�@~-u�}�        ?��Ó�?�3�1�͐?�"�I�
@�>���@�"��N�@"�Ia��@,OO��y@4#�3,@;Xsݓ�@A�ٺ�ՙ@F��>�@L�j�bx@Q���l��@UC��YZl@YV�<���@]�uƓ�|@ada���@d��l�@g�����@j-m�%^�@m�30���@p����@r����Į@t��Wtؕ@vԼ��8@y)/�Tݼ@{�]h�J@~7�=۫V@�yx���y@��^�@�i��Y�e@���1|�@���f'�y@�X�Rģv@�"�f�@������P@�ﲖ��@��2��'@�K��j�@� �2��@�;Hb�B@�e��b@��8���@��B��h@�& :3��@�{���f@�ܘ='@�HN0=Zn@���!�@�@��B@�f��i`@�3��@��^C�@��J���@��kX��@��D��c@��ײ�6�@�s)��_�@�g<[��9@�aZ�\@�`��"�W@�fw��7@�qXzWE        ?k	e�-)�?�,?oe�L?�Q�]~<.?�Y�)-o}?�=�[?�?]�i4�?�6�L�?��m�$?��J[?�Nk=�
?�����&P?�`oS>k@��Ҩ!`@���wk@
�'b)��@��a
@��%"�@�ǧP�@M�l�yZ@Mބ[�@�pZ�X�@ u���@"FB_�-9@$2Z��@&:rO��@(^�B���@*� ���U@,�1��2:@/y�ZwD�@1	�<v�:@2e���gi@3��|bv@5Kmc��=@6պ���@8o�8�kU@:�{��@;ӽ|�z@=��NX�u@?w�I��*@@�1V��@A��s�z@B��U��@C�Ԇ���@D��xRY@E�Շsh@G���
z@HKNg�m�@I�p=�@J���(q@L	�1!�|@MZ][P!Y@N�X�Z@P
r�0�@P��<��!@Qx�@���@R6��4ǘ@R����^l@S�8��|@@T���%�@UY_�r@2@V-?1�@W,vjS�@W���&�        ?Rށ��?��,w���?���n�u?�ɡi�\?Ý���?�B�d?�7�����?籌�Чy?��t��?�+�s�+@\��� @F��t�@uT·b`@����@��[�<L@n��6%@"�p�(��@&l�C3�@*�f��]@/��H�}y@2Gy�<@5y�ɻ��@8�G��Q@<R�9Xt�@@^f�@B6�5(��@D|�d�r�@F�vT��@I�����@LYHϡ�@OT ���@Q?\*h�@R�9o��@T�j	�]@@V��lƛ@X�IO��@Z��7x]@\�p�{�@_.:�@`�!.�/�@a�
�Q��@cK-o�0@d�E��8�@f����l@g�S�,k @i��.�@j��4q��@lQ��3@n�����@o��ʞ@p�oQ�&�@q���'��@r�:��4@s��c�/�@t�n
��@u�em(�@v��Y2�;@x|s�l�@yH�%p�@z}��la`@{�D�{��@}��A�C@~P���L�        ?e��w/?�a���?�ؼnʎS?�,Џ���?��c��?ݛ�nq��?��D�R?����#�?���D )@.Б�@����@0�̱�~@����Vf@m`2��A@ tv���@$2��
I@({)�ug@-U�OQ+�@1e1q찅@4p�Y���@7�O-c�@;�\
ߝ@?�V��@B	�����@Dt䕷�@G��� @I�(;�P0@L�状��@PT���@Q�a��e�@S�����@U��N�U�@W����.�@Yؑ;z'�@\%܇�Zi@^���@`��*7_�@a�`�I�2@cJ�u��@d�.�/f@fF����?@g�/�,2#@i��T4c�@k@!�9	@m3�l~@n�d>�@pk$}��@qkO�@�@rt�����@s�8�pϕ@t��}��@u�aL~@v�)�&�0@x/�=V!�@yq�LW%-@z�m?�)@|hC�@}r�b���@~�`���@�(�F1F@��	��w�@��$���@�tm38        ?��`��N?ㅏ�?�|��r$Z@��w��@z�rE`@&�05#@0�٘���@7
�v�/�@>���b@C�:.�x@H�ݝü�@N�J6�@Rw����?@VMH+�@Y�X���@^DbS�tK@a{u���3@d�*�h\@f��B��e@i�b�*�@l��
@p&��@�@q�1�6!@s��l��@u�d�i8p@x
q4���@zM�׫�@|�I₫�@0y�@��B�˙@�HF	<+@��3�K�=@�8��UP@��N�=r+@�j���@�q� �@��'��x�@���)��@������@��0���@��e���@��+�-��@��5��@���L�@�,Ma�8�@�Z��0�r@���m��)@�����@���V�L@�lu�U�@���g��@�*�B1"�@�K�2�e�@�\��v@�ŤΚJ@��u��4W@�Q�lQ��@��xՍ�@��OP��@��qs*i�@��.��@�����e@�d~�!I        ?rM���H�?�
.f��q?���)G=?���}��_?�,���9!?ߏ�Μ< ?�կ�`�m?�Cu�O-�?� �x?�'p[��@ =P��m@�/ ��@�s_��@�?Duk@Dڢ@�K@��f�V�@x�z*�@[n���@p��x�k@�X7��X@!kg��@"�d�@$�fZF�@&��.�@)�/_h�@+S�N�� @-����X+@0qf�@1\�W��i@2���*�@4i�lN%@5��4@7�� �@8�O�e'@:7>��@;�(H�@=�M���O@?d�CD��@@���;wx@A��F��s@B��X8�f@C�E����@D�07wr�@E��\CR@F�Oa���@Gܑ�9��@IS���@J1�הI#@Kgqw��@L��
2��@M�� ��@O6���-l@PEuj�v�@P�|���@Q�a7��@R[%�V�N@S�~�LF@S�V7���@T��f�o@UY����@V"8�%�b@V�;��O@W��)�        ?n!Ykي�?�'rU,?� *??��Ú�?ս=m�q?�iǹZ{?���k�?�OW�c�?�(c�=@��K2�>@_RcBj�@�z@��@����@%٪J`o@!LR
:b�@$���zg@)�^@�3@-¯MK�@1u��@4L��r�@7jI*g9@:ψK�J�@>~*J�@A;��JCI@C^���)(@E�$�g@@H��E@J���.�g@Mr�.��t@P.����@Q�/z��C@SV�Ӎ��@U
ud�K�@V�|��@X��k
@Z�t� v�@\�ً?��@^�~8�6�@`�N����@a�9l��@bݚ��IT@d����@ee-gǈ�@f���#@hҗ�@i��@k;D�C_@l��K��G@n�C��/@o���/V@p�C|�n�@q�Zx(ۑ@rl�fEe�@sT���_@tA��p�L@u5{��(W@v/�fB��@w/�Y��@x6j`2�X@yCC����@zVj��~�@{o����@|��D2�        ?e��1ش�?��K`�F?�p���B?۩"�m?�]
Bc�?��T�T?�׺�e�?󎿖!�&?�?@��3�@����@
�o[B#Y@s4\S�B@w�蔄�@c���-�@!�i!�8�@%��,�n�@*)��ۖ@/J�����@2��=N�@5�k��T@9Fg�!7?@=-]Dn�@@�P�#
;@C��cy4@E�m���v@HK�'�W@K:�x��@N`hM��N@P�ڥ��@R��hn�@T��?)@V����y�@X���d�/@[���'�@]j���m[@_�Y�ԭ@aK��}�@b�����V@d%f͕@e�c����@gE']%b@h���Ere@j�I��@l|�O9��@n_l�ұS@p*�����@q/ �ewf@r=9*�-s@sUK�DH�@twQGm�@u�`�k}�@vِ���@x�I��U@yd��!L @z��kn&�@|R?$@}�na�/@~�.#��@�;��~=d@� ��L/�@�ː�X�-@���u�+�@�qG�	�J        ?Ɠ~��?����51@
�W�!x�@� �ҷ�@)$��W7@3��Ԡ��@<y#����@C~d�lԺ@I���?�@PQ	�91C@TE��;��@X�+ ���@]��}V�@at(�7*}@d]�Oŵ�@g��l�##@j�]f=@n��=? �@q:xZ\�@sMm��;�@u�)b\-@w�k �@zL���K@|��y^)f@����6@�>�&_��@���'k*�@�Qx�D?@��/����@��[>6�y@�s���|a@�N�G�x@�<2&�?@�<�DŜ�@���t�q@��'�_'@����y�@����:�@�/Q���@�i�J�_@��+����@���7a�@�T�&�H�@��y��n@�$�K/@���,��@���G��@�����@����d;@�m-�6E�@�A�mp�@��cJ�s@��m��0<@��f1�v@��1�@����{�j@��-XWM@����W6/@��E}�r@��0i�@�����X@���OT�j@��2�"        ?e���pcJ?��C���?�",#��?��B M�?�� kP�?ժUI�C}?�5k_��?�_�Sޜ?�聕���?�U�ЇrT?�Y����D?����@-ӂ2�@�Y1Z�;@	����
1@��C+�@/�Cs@�^6���@S�-b�@/L✃�@<���@|�m �@!x`t���@#L�~5�@%;P�h$@'D�.�A�@)iu��E�@+��(��@.���M�@0<��J��@1��{�"N@2�Xʹ�@4=TP�@5������@7+vBk@8��Y�@:OCЛ\�@;�\�0�H@=��;C�@?j=��g@@�btH@A���C��@Bk���t@C{!���g@D}�5A��@E�����@F��XpI@G�=��@H����W@I�$}�@KIQó@LN�ѝ�O@M��G���@Nɯ��`4@P�� �@P���V$�@Q\1�}D�@Rd��	@R�W1���@SuY^�@T/���AS@T����@U�	�.�        ?W����S?��� N�)?�#p$�i?��҄��?�8ԓ{?����	��?�9��T�?�\���S?�u�y�?��?�j�"@��[@	OcN��@s�{'
@�UU���@>PIs��@ -EQ�Ɂ@#��t٪�@'�ʩ�r�@,\�.�t@0���0��@3K�Du @6U�{!
@9�C�W��@=K�D�k@@�G,i�@B�&(�W�@E	�iG��@G��N��@J!cx�@L�Fh�nU@O��,�J@Q��c�+E@S7y����@T�J
�x�@Vـ��$@X�z^<o�@ZސJ��@]-R�X@_IrthSo@`��m=�?@bpq�@cWR�tB)@d���-�@f�l뻵@g�JP�@iE\B@j��7�N�@l/~a�@m��P�
R@o��c�ƭ@p���Ѫ^@q�����@r��be�_@s�؍]��@t��DGd�@u��I β@v��V��]@w�N,��u@x�#�c'�@z��@{FP�&@|�ϒB�@}Ű�~        ?b�i�(�?�[�:Jn�?�7�;i9?�c�d���?�&pm�?�J��G:?�:Y��?��^�?�8\~x��@ �n ��@�0��5�@��2�@e�O��@���w�@����%5@"�<M���@&�K��t�@+=<�SO@0���l@2�Q#�"@5�bQ��@9L48$�@<�Q�@@����'�@B���]n@E�� �@G��A@J=>[(xl@Mç�)�@P`+d�@Q��z��@Sj?.�E7@U8�U@W_��@Y���1�@[6�{V�J@]g{���@_�~[N@a
eA ؖ@bH�Q�_5@c����Ϩ@d�O�6�@fQ=>��@g�?l�Jy@iB��#�U@j�<�vT@lhϽ8D	@n@�V@oįČ�3@p�w^d;0@q�k<i�@r�?���@s����C@t�¿�aH@u���k>b@v�z˟�@w���8��@x��T��@y�ɜ��@{�v�Q�@|?���/@}vǵ	��@~��\s:�        ?��_�&%?��N�?����z��@���zc�@٤:qMi@'�I'��(@1���0�k@8eSW�_K@@D�U�Q�@E����@Jo,���d@PJ	/5a@S�P��t@W��L�;�@[Ư�t@`3bM�'@b���H�{@et����u@hi@��@V@k��@z�3@n��s��@qQ.��ۙ@sA2n$�_@uO�D��n@w}��Kj�@y��1�0@|7�ܴo�@~��H��@�� `?4@� ̓�@��_��c�@�%���9@��}g�/�@�`�Ze_�@�W�r�j@�� f��@������@�� �,O�@��Z\W2�@��s���@��t�$*@�	sˮ�8@�,�Z�F�@�X�Rt�:@��M����@��-,Jt(@��z�o@�g]gi�@����r�@�( �S�U@��;~1+�@��&���@�I���
�@�a��T@��2sZ�@��6;y(�@��{�V��@�_._�n@�?���T�@�&Qe���@�.N*�@�af�7�@��7ir        ?i��L��&?�a��P�?���?d��?��9�(�?�hp��w?�Î2~�b?���h��?�-�d%�?��/���?� ��@?���[ߺ?�J䳦%f@�o���@�l�l@�f��M@�1����@�v���@��`^l@\�R���@	{R��k@ᦀ��@��78@@ ����8@"8���f<@#�л�K&@%�%��ɚ@'��º>�@)��<L�@+�Fs�h@.!N���@06nzp@�@1gÈ�å@2���5@3�A�u��@5Az�3R@6�h���R@8��E�@9��"50�@;FE��}@<��w���@>3�[���@?۾f, ;@@���)@A�Uo��@B����Z@C{v�:^�@DnH�/>Z@EgB�`i@Ff]g��M@Gk�B�@Hv�ժ�@I�j���@J�r��0@K���u
@L��+VEH@N%n	�@O<�ACE�@P9�8��@P�.9�xB@Qy�+2�@R�zb��@R�Pd�}�@Sq1�Ja�        ?Y�G�-q�?�j�W�T?�S���zq?��x�?�H=c���?��d	�%�?����GY�?��Ee7�q?�r��c��?��&H)�u@��Y�@
Y�3?�@&���@�GI��@t9m�G�@ �9[��@$�)�r�@(�Ɔ�C�@-��2�}�@1}K�|�@4sZ�
`@7��n��@;P]a�g@?=V[�\A@A�/杀V@D	��IH@F�o2)d�@I=���2S@Lf��$�@O-/-Q�@Q8Xq�y>@R����@@T�55h@V��=�@X�����M@Z�ģ�@]2Ky @_�H��:�@az}Q@bTP0JO@c��5M�@e�+�"@f�W��@h�B��_@i�>��Ȯ@kZ3�B``@m�_v7R@n���9@pV`kЭ@qIMz%@rD?��J@sGF���l@tRp��@ue����@v�_��4�@w�=���@x�n���L@z�'3�@{B���s@|�YF��@}�8���m@,�̐P�@�E�#���        ?S��7G�?���?#�?�W����?���/R�D?��e�a�4?�~�3OQ?�ϡ�)�S?�߁)g�?�uw��9?�E��/b@|�N*�@'0 %4@��wc�e@"�TI�Z@D�~e�@6ZL>�@#3�?@&�x�O�@+2Ć5�F@0��oG�@2�'�з�@5�
�W@8�} �϶@<X�U�@@}�9+@B�P��{@DO6$�@F�a��ކ@I,)^!�@K�Q6m�m@N��ßpm@P�֥��#@Rn$\7j@T�@H$U@U�\�c��@W�_@Y��P��@[��GT��@]�f�]�@`���1�@a+�X��:@b`(|"�@c�x�@d��	�@fIe?�@g�t�,@i$��[@j��`,0@l5u�v@m�ئ(��@o{�}tT�@p���zz@q|J�6r@reҬ�y�@sVI�
	Y@tM�?oE�@uL)�A�@vQ�a}�@w^)���o@xq�-ہ@y����u@z�p�-�@{׆<��o        ?��H���?�{�G	%�?���<D@ǀ�@1g12��@!�ǅB@*:O!�=@2%
�@886�p�|@?J���xQ@C�`}G�/@HG�(��l@Mi�-ǐ@Q���g@T�W�mڊ@X Ęw3�@[��ۡ��@_�!��8�@b#t��H@dz���@f�K���@i��` JL@lzEk��@oyP��Q�@qQ���
@r��)͆D@t��\@v��j��@x},�1$@z~����@|�Q&��@~�%q_�@��$eh!�@��h�٦@���3��O@�-�}�'@�|�Q��U@�ג�tC@�=�Y��:@��;,�@�,�)p�c@���ԫ@�J��V@�넽�<@�����o%@��,�-+@��Q3��@�ro��r@�`�H�)T@�T���q'@�N� ��q@�N�s8�t@�U92~@�aN�]�"@�s��^3�@��"���@���f��@��Q�c�@��g�)�@��h�D1@��Y:܂E@�P	�@��͋yb�        ?f�I�5/�?�{0+���?���asU�?��Ԣ��?����'y;?�?l�
�>?�+�Ե4?�����?��$��?�V,B'�?����w�?�!0� �@ ��)�b@����@�ЄB�@iP�N+@���1w�@o����@j�%
�@ v�rC�@Ŏm5�@�8މ�@�8h��@!��!�H|@#^kg�+!@%;Q�ow{@'1��y�;@)Ad�S�O@+kÝ#�@-���Ov�@0FL��@1B`��ڷ@2������@3�Ndg��@5F6p@6�{=�d@862U��K@9�p�m�@;\M�d��@=���@>�B��N@@>FU|��@A&��5@B�����@Cj�Qk0@D\��p@E�<���@F问L�@G0�t�.n@HK��2��@In8� �2@J�-H @Kɝ�Ao@M�1��B@NC	wF*e@O�i��@PmO�F�q@Q��FKp@Q�<2�[�@R{a�yE�@S2Q�>�i@S�
;�@T���ʋV        ?\)K���?�N���	?��\��?I?��=��FV?��
���?�ṷʽv?�%�@��?��q�[?�	�A�ʣ?�)�+�@._����@#�C@@D���j@B�疇�@�u�]�@!�b�B@%��4�b@*C�8���@/?pM\�@2i�[|=@5��eA�_@8쇭l�@<�n�?h�@@c�֪	@B��e]�@E	-�{W�@G���'��@JrS�3@Mrꓴ�I@PT.�Eo�@R	�W��}@Sڢ�q��@U�_Q���@W�e�=v�@Y�#b�F@\8��V.�@^�V�Ao;@`��M��@a��.��z@c7q���@d�U !�g@f �7ޚ@g�� �o�@iH�j�ٜ@j���p�@l�4�@n}gqc�@p-�Bv+@q#��=b�@r"R/��X@s)h���@t8�,�*�@uP�Zw�@vp��O�M@w���51�@x���F��@z�5�	�@{GM|��@|�f�K�@}�/�{�@B����@�S�A=�@��ǩ�        ?a�j����?�	v�W?��/��?�������?�5��� �?����?���ֹ7�?�X/N�c�?����F?��b��J�@�����@E��Y%@�-��8�@4~H69.@�z9�N@ �/D)��@$qPT�YN@(nv�5�n@,��H)K@0����:@3�U ~4@6�X9$@9�,}�'�@=|�J���@@����E @B�����@D��V���@GO�;O�@IՈ��@L�s�׆@OZ;� 7@Q-8��~@R�O�ڷ�@Tl�N�@V,w4ޭ�@Xb��@Y�q?.(@[�S0���@^�)���@`5�'K�@a>ܣ��@bl�����@c����@d�!{�j@f>�uQ�d@g�in)0@io��*�@j|�9&=@k�`4���@m��з�@o*F�g�@pi_�N%�@qD�T��@r%)�2�@sҗx
[@s��mE~@t���)@u�3��@v��{��+@w�fZ�@y�V'�@z�2�ZS@{;��        ?�?{�-o�?�
	���"?�e'�A�}@���U0@q 8��@$��K��u@.�5fP��@5Y�"P@<`����@BC���s@F�M����@L,|�K��@Q3	�
�@TH/E�}@W��w�G�@[�1�_@`
��5�@b]��<@d�P,8�
@g��;@jz_�J�@m�g�BЌ@pp�0��1@r2��b@t��I!�@v�Wh
x@xi.�@zJ5̒�n@|�Q��@~� gN�@��A2fIx@�� w߂@�s�P�v@��9�쇜@�_՚4rf@��n*��:@��A�`@�2�)��&@��u��h@���J9��@�G�]ɞ�@�;��s_@�7��='�@�;�p%W@�G��['F@�[��@�v��/�1@��T9��@��zXB��@���\J��@�4\�k�w@�wظ9z�@��aq�|�@���6��@�9V����@��>BZU@��8ԯZ@�[H=
�c@�s)���@�۽��(1@��,l���@�lÁ3v@�;�j��        ?YQ��]�?����9�?��Pb;?��d@ܷ?���Rwbj?����b?��[N��?�\
�<?�*�/?�ں�g�?�u�O0��?�x�e!]�?�����[#?�P�@�r|@ ����@��0���@��y'@	�|XJ��@v�ĂHU@��p��@�Sq׃@���]@<ZS���@���3�@U��r1�@�O�f�@!�ciˏ@"��)��B@$$D�6�@%�$=�j@'�M%��@)g�#��@+P(�C�f@-L-�%G@/\����@0��<Y@1��k@3O Ewj@42��4M�@5m}Le-�@6���P�@8;9��'@9\b��i@:�$&�V�@<0����@=���5�u@?/z���@@_�1Fb�@A,��ю@A��9�@B�ןY�@C��x3Sc@D�)�2Dn@E}��):@FjP��&@G\Fu��@HS	�+�@IO���@JP#�mV@KVH᳜p@Lax�CAH@Mq���b0@N��M`        ?V"���P?��݋�?��l��(?�\����?��=���?���i��?�?���?��)�Q��?����@ ����g,@ޜ���@�0��D@��E��@�D�57n@ *��W�@#���ʡ�@(`v��( @-Wj+��_@1uc4�A@4��$�X{@8 j��ef@;ǻh14�@?�7�h�>@B3�쮝0@D�J�e(@GA�<^K�@Jn�(�Z@M^��o@P&��#l|@Q܆�:��@S�#L���@U�����@W�3T�@@Y�y���@\��B�@^_����@`l���@a�-8e�@c�w@d|��q`@e�ڿ�u�@g~�Q.�@inZ�,�@j�)��O@ly�*��@nBzJf�M@p7eb�&@q��� d@rk�1l�@s�n#x@tᡫ�{@u.�8�t@vOHa�S@wxʧ�6@x�G KXl@y�о���@{+z^a,&@|yUi�^�@}�r�sݩ@0�o�F@�MY �4@��jHi�@��Y>�        ?]��S�b?�P:�c��?��q~͊+?���i"�?����.$?��j�+�?�H1>�g?��6�{�8?����p�0?����!7@S��<�@
��k6�@1L�L��@���	�a@�wC) T@ oh}I @#�G�N�7@'��Y;y@+��)E��@0M�G�,@2�Q�_�@5�x��{�@8�&;4�@<.����@?�PhR�@A�K�S�@C�}��	!@F#O-���@HC�A�@J����F�@M�z����@P8M<��>@Q��.��@S<p:X�@T�`�P�Q@V���\��@XS��lT@Z-�A)i�@\^�R� @^&��@`�a�@a.�j>��@bN���o@cw�C��@d���}C@e�w���@g2��&@h�4]��@i�qԮ@kL\L�@l�Jh3A@n<�2��@o�����@p��<=�@qz��?�J@rN�B�T�@s(2�O;.@t���"@t�2Y.<W@uԿ�]�@vìM��@w������@x���ҏ�        ?�j���?W?�?+�r?��D���J@��+��.@�(�E	�@�Z�wU�@%�~P��@.�bǅ@4�h+�ɧ@;��8/@A6����:@Em�O��<@J0~j��@O�˙�"v@R�5��@U���D�v@Y�+���@]jy�6u@`�]p�jQ@c�ր��@e���@�@h(��	W�@j�X���C@m�<�y2@p��z�@r>�T�@t�B�js@u琬R��@w� \�@y���`U@|%��t�o@~o��h_@�j84z��@��m� @����~�@�T���׋@���D�ޅ@�7G�2x@��t��&�@�S�Qw<�@�� ��;@���z�;�@�le���@��s��G@��3	�I�@��yЬ� @��O�,[@���g�T@���#\w@��R���@�ˁ��@��F��e�@����P@�P�]9�#@���	=%�@�����@�� ��@�5����@��	�XJ@���n�|�@�G��-b@���Fތ+@��Tʺ         ?w�����?���[�?�K`�Y{?����(��?�{�om�?��%��?絁�tܙ?�{���?�)* ޛ?���t��@ n�@`U�@�ߪxe�@��`c�@�v�"��@&�m�@��F���@ Q��@�8:��@ů�[�@ً̡�(@ �oU\�@"A�R7��@$�'6�@%�p�h@'�ڑs�@)�uv���@,�%9@.L>��5�@0M?�:��@1U�"@2�^���@4`4���@5W]� `|@6�\�V�w@8b����@9�vM�2@;��m�(@<��z�@>1e9�@?�?�U��@@�%��@A�C�x&@ByQ��	@C^�hLj@DIļKv@E9�� ��@F/aυ @G*"��u�@H*/���@I/��c�@@J:)X%8p@KJ���@L_9g��@My�K���@N�d��I@O��cZH�@Ps��m�5@QA�S�-@Q�:��7U@RA���C@R�ľV�@S�Y2@T& ��        ?c::�P�Q?��A[��?���3)^?�i�oq?ʱ�|��V?�5�0u��?⤺S�$-?�;��l�'?�jo�?�s\l�x�@9�h�?@	R�d.Β@Pb�@��SM�
@��s�h@j�b���@"��n�M�@&�_}��s@*�W��M@/�	U�P@2N
$�z�@5�^a�>@8.Yw�B@;��
nZT@?"�/�m.@A��=O�@C�O���C@E�o�yOD@HFfs��@J�=��U!@M���@P;��u7@QĲ�@Sd3ţ�@Ut-��@V�g���I@X�qC|)r@Z���@\��=�E@_h9��@`����@a�N3��@c%0�E��@ds�J+$@e����@g<E�Ha�@h�E����@j?(���@k�)�~)�@m~�M#c�@o5o���@p~S��(@qis�qIK@r\�m#��@sX�u��@t\�0ik@uiT9ʨ@v~xl���@w�ON��y@x��CX�g@y�7^3:@{+U�{�@|l����        ?f����R}?�����R?��*�u��?���vH�?�c��H�@?�e�1BU5?�i3N��i?�*0��z?��pe3P?�q�3�@� N�@	��/v	@n��k�@�cc)~�@�)~��@M�>ED@"�x��@&{ϵ���@*�׋�6�@.��u��@1�86�4y@4����s�@7����@:�5��Z�@>7�>�W�@@�iv'�@B�ޒli�@E�e�s@GP(�s��@I�3�<U�@L>�眠T@N����:@P�`V�8@R]G�?;@S�t��$@U�+TK��@WH���3�@YNc�l�@Z�Fo���@\�����@^�Z�k &@`�~3,�@a��[��@b�Y�Po/@c�"{X~�@e1�?;�G@fx0߄�@g�Q\g"@i&�l�f@j�>U�r�@l$;�@m��1���@o�y@�@pR-��6@q#�F��@q���#f�@rي�_.�@s��f1Se@t��t�@u��1���@v�z��@w����6@x����٪        ?�JJe[��?���e�@	.�f"3@�ث�Z}@&���
�@0��a�$�@8(���@@F,���_@E*��/�Y@J���.@Puec!�@S�"o���@W���3@[����D�@`s���H@bq����%@d�o	\5@g���)@j����,@m�p ��}@pf���C�@r��Nh�@sܔ�@�H@u�;K� @w��́E@y�SYY&>@{��p5V@~�v���@�&O���0@�VhI�@����8�@��P.�?@�)�/���@��U��*0@��U�Z@�a�X�n@���5�@�iɯ�G�@���!��@���po��@���S��@��"ό�@�`�Ǥ[�@�F�"�8@�2���\ @�$ ��@��l�9�@���/��@���%2@�!��s@�/��kO3@�B�J��@�\	�)_@�z�r�3@��8�.1@��J�<j@�|~>�@�"Wl[1@����u��@�T�G�s@���Ej�@��J {Z�@�E�H|X�        ?|3��m��?�n�.�o?���C�x�?�5���x?ֵ����r?᭩^B҄?�CP�a+?�p?s��?�&>'?��̆���@ue��#;@����f�@!a�Zr@��~@���J�@�n�K��@$�k]�}@�<�<�@ Do'���@"S��8T@$�����@&�����@)X�F1p@+�V�3�@.�&����@0�Vw,�]@2c!X�9@4}�#�m@5�u&��@7x��V۞@9Q�}g��@;>pɟ�V@=>a!�̥@?Q�Q�,k@@�W��M@A�y*��@C ;l�@D0��H�@EjT���@F�����t@G����4@IP}Dd9@J�W!�:}@L��,@M�I�YO�@OT���@PEŬГ�@Q]С��@Q��[ѻ@R�.�oG�@S�dx��S@T\v�ns]@U<g�u�@V!89W��@W
�u�A@W����>�@X�L��@Y�w��@Z�ȿ��@[��Y��\@\�)��@]���Qm�@_����        ?k�"��Dz?���հ�&?�f9ɾ�?�Q�\"�?Ԉ*U���?�1ː��?��B���
?�Ѫ,}Km?��|�I�@6A�uu@o�JC@��4;H@��D#@�g�#�@!��ފ�@%�֕��@*!|���@/i�?'n@2Y_��ʷ@5p[I�3@8�H8w|�@<�#�D8�@@L��>i@B}��]@D��1H@Gc**��@J�ugd]@L�}m��@P	؟�(@Q��>�Y�@Sd��AB�@U6ބ���@W!�,���@Y%�y%�I@[CH.<��@]z#rK��@_ʽ�#��@a�31ц@b]D���@c���"3�@e	n7�/�@fs����@g�nh�?g@ipŨҺ@k˚��Y@l���R��@nS<7��@p�X��@p�6�ZL�@qّjm{@r�x���@sǗ3<�@t�Vp�7%@u�K���@v�|��S@w��AO�@y�Rm��@z?�p�@{l���#@|��d�@}�)ȓ�@"24H�@�6�m ��        ?bT��]Ř?����MV?�R�J��?���
C-?�.|	�N?���Ճ;5?���ˤA�?�4�,��?���r�3@ �8��]@�ۆ��@X�ڦ�7@&|���@�:p�Ln@ �u��@$~9��l4@(�ʛ�0c@-�V�4�2@1�)��9�@4��0��@7�*�&��@;oK�&
A@?Z���@A�Y�&�@D���[�@F�=��#@I&�V��@K��`@N� *}��@QqO��g@R��ӽ�Z@Th�trފ@V=|�_M@X),>�#�@Z+�שJ.@\F8�]l@^wv;�%{@``:)�q@a���*�@b�ѐ��2@d�>@eiT���%@fɺ.)Z@h6O.%@i�'�V*q@k4Y�w�@l��;I@nd��@pm! tR@p�%!��%@q�B���P@r��D��@s��-�+�@t�|yH�P@u��N�tf@v����z�@w�tGvu@x�ja��u@y-R�@z�{�Sk<@|W��V@}1%[?$�@~c�7X8s        ?��ޣ��F?�	��;�@
�-UƬ�@�,VF@(& A���@2˕ wc�@;*�n�|@B��[�n�@H�;M1�q@OU���\�@S���@Wޑ�
p�@\� �`@aS �d@c����@g%��S�9@j�x����@no� +�8@qD:�7�@sw �m,�@u��J]�@xO�8��@z��FĦ�@}��	�Y@�[���j@�������@���|�(�@�A��� @�
��p�l@���~��=@��a���@��Ol(@������@��Z�}�Y@��� ��=@�ԓ _W@��p�0{@�@W��)@������@��Um2��@�&y븛@����#2@��|�X@�]GҡG�@��)�F�4@�-Mޡ#@��8k��@���.���@��\���@�aeZ�5�@�:]ۆ�@�i��sl@��fr�@���� �@��Z����@��SY�M@���$��/@��8��Ez@��"~��\@���r	ž@����RQ@����@6j@����        ?b�JG�8?��Po�<�?����$S?��FvIa�?�CċF�?�t俸F?� f[�9�?�$���H?�^�Y��?�,���?��X��?�YA
�X�?�;�ʁ�<@ ��mG@Ǿ8�z@*�[kX@
��v�!�@M9\�q;@/
���@\
�h�@��J�@%%�z�O@�ͬ%Ej@�� XP@ 6��V�@!���-�@#WP�2@%�iU7�@&õ�X�Z@(�t-6�x@*|%�F@,t��-WY@.�{���[@0O�}�d�@1h�D�@@2��ʣd@3�|~@4�N#�@6+�\N�2@7t^�~q@8�~����@:"����@;�,*��W@<��"�<@@>m��TP@?�W��M@@��)X�$@A�T�u�S@BT�r�M�@C'��6�@C��$4�%@D�рt@E�S9�@F�͜�ç@G�߀���@HvLx�.:@Ih��@J^(1�j@KX�_�S�@LWE���L@MZFq�#e@Na�����@Om}^R�        ?S��$>?�X�%�A�?��|�p?��Ȱ�"?�ܕ���?�8�j��?�&ُ�^S?�YO?chl?�����&?��F+=��@���]v@��g�^@Fz:�߰@ڢ�5q�@>�\�0@ A��Ĉ8@#� C�r�@'�̼��;@,���@0��vŰ4@3�6��@6�"4���@:{�{�@>PϢ�t*@A>zaA7@C�P�O�@E�8��)@H�1�c��@K_�&ܵ@N^����@P���r@Rz)gw�@TF�d�@V,$!OZ�@X,ւ�=@ZH�2�@\�>"�@^�#|�P@`�]DȺ�@a��0�@c9qD�Wg@d�{�֑@f`�ٗ@g�'f���@i��A��@j��\��@la7Պ�#@nʙ�i�@o�yNU��@p�.��@q�Iu�4�@r���n@sҭ�J�@t�3�U�@u�[ƀ�c@w���:l@x/̶A��@y[8��c@z������@{�n]��@}���@~Z-&~o@���         ?e�7��v�?�
��3?�|�ߘ�?�q<�E�?�E�����?��e2�?���?�^nM'F?��z�L`@ b��ӝ@�HI�@	�o��@�GZH>@���6~@P��6i�@!�]I��@%�d��@)�e��in@.���"@2����2@4���;�@80y /��@;�'���@@?�Qh�@Aީ��8P@D�cL�@F�Ŗ��@I!!��@K�E%�y�@N��R#H@P���gƝ@R�-P��w@Tbtf1�"@V9�:w�@X)D�u�@Z1H#�ɣ@\R��1@^��Ug�@`o8
�M�@a�Fk	�m@b�� t�@d7���w�@e�b0E��@f�	Q�X�@ht��K�@i��`�@k�t@�I@m(�&�f�@n��(��[@pGV/�(U@q+��`@r���@s'�MV@s���@t��5K�@vy�2�@w	��@x'��9co@yC��w��@zf�.2�@{��w�TX@|�B��H@}�����        ?���ݸ�?�� ���?����}@W��7�@Ԫ:�ƙ@!i��_�@)�LU��@1ܻ�@7�@��!@>��ާ
@@Cb$=��@G�;0)��@L����g@QE�/�r�@T[�Ӕ�@W��#i@[j����@_eS�x��@a�꧞Y�@d%f!=�z@f��s���@i;!��@l?ơ�[@n�UO��p@q
Qt�2�@r�,B��z@tgK4��@v5��3s@xuO�@z�)�7|@| �I��@~D�G�@�>���V�@�f����@�����@��}�`ٟ@���f��@�m�|�M�@��@�?{@�1v�.�v@��J/���@�����{@���x��@�8�#��@�j}Z�@�=-_�>�@��Q���@��]�O@�ռ4I@�������@���%�@���W�`�@���w��@��奢O8@��/��@��I�%�@��qM�K�@���� @�ǆ�,�@��a�L�k@� � :�@��ĴM�@�%�2�	�        ?q���?�1�OR��?�����?�y�Q�xo?�K?5`�?٪�%}N?��#�6?����=Q�?�#�H�!�?�?��>^?��=~�@ ��Xk�v@Z�A��j@.ܽ��@a����@yas�'~@��P�@�Xۆ�@z��!�@���[�@��|�@!"W6Ĉ�@"���]��@$��6�7
@&�&A�J@)y lb�@+`��Y@-�@��@0�~ָ�@1fH�V�@2���q�@4%(��$@5�`%rz@7٪-�;@8������@:K��>�m@;��6Y��@=���RUG@?�A��@@����O@A�ƨ܎w@B�����@C��9&7|@D�w�iq@E���٠B@F�M��I�@G��%3�@I$��Wֶ@JVU��@K���m>�@L�FU�@Nr�:��@Okq���@Pb$S��@Q�zG�@Q��*]��@R0�i�4@S;���a@S��.j��@T�^ r�5@U��O@VU.ʳb@W%�`���        ?n.;+ɒ�?�6�lS��?��p�;	�?��$��)�?�x�0�Y�?�����?쵫q�	�?���.�?�d��z�C@�2\;�@{�v8"�@d;���^@�n��^@����t�@#��A�@'����@-�� `@1X#���^@4�s��I@8��#@;�ɕ%��@@%c6���@B�әU�@E�̵M@G�}àl@J��4�iy@N탖Ŕ@P��Q%�@R���-=@T��̻��@V� �D^�@X�>�\�@[O3��-@]Ϊ����@`8�F@X@a�+�@�\@cep;�@d�ڟ�D�@f6����@g�%|�@i�j�p�&@k������@mo��d��@oreA��,@p�R��@q܉�˃@r�J�@t-���@uf����@v�����@w���K @y]	A��@z�mB�@|?�K=@}Ġ��v@V�{�K�@�z���:@�Qi�S��@�.�D���@��\EiJ@��.&�x�@���g|�O@���B	.        ?hܡw�?�M�,�;?��;��l?¥DR7_'?�:2y��?ߍ�uC�5?��N'?����M:A?��5,H��@uUxL4�@�(')�o@+�xa@|�@gՀ@�1��6�@����L@#Ad�*y}@'#�I��@+�¸��@0.�e;�@2� ��D�@5�U|�ĭ@9����@<��l�D`@@6430@BE���*<@D|����@F��@Ic��Z/^@L�!�A@N��~�o@P��8G0)@R�R���@T>> ��T@V ��c�@W����H�@Y��l��@[ʪ5m4+@]�q���@`
B Au�@a-XAB�b@b[��t�[@c����]@dى{��3@f)W2���@g�b��`|@h�*�z@j\F0�y�@k�$��q@maO%g[�@n�Ŕ�@pI��^�@qʝl@q�v^�@r��9�&@@s��Ĭ{@t�\����@u��d���@v���<��@w�B�ug�@x��\� �@y�����@z�xE�rd@{��_��t        ?�n����?�m���-�@.��V"�@�r�I�@$��x_�N@0�"��O@8Mw��-@@�"�pl@Fyה@M����j@R@��B�@V�YN��@[G��E��@`Lh�#��@c<��;@fv���A�@i��LF-�@m��:r��@p��-5c�@s9`��?+@u�Ld�@x4�Q��@z��"�@}����d@��?�5�`@�)�yc��@��m����@��
�8O�@��Bj���@�ā���@��6��\@�.�r9��@�FZ]l�Q@��+��G@��6ZU�@�'9�Al@��� �+@�5�:E@��vV�)@��}��n@� MА@�u��X�b@�96Ȇ��@��B]o�@�x�g�_@�r3'w]�@�t����@�ԥdI@�����gk@���c2@�Նy�;@���q3�@�;E#ޖ�@�{�JN��@��N�&�@���o�@�t	���B@�l�g�*@�#����@�����@���|��@�f �ᶿ@�0A��        ?d����|?��Fp�?�0��!?�*͏!/�?�z��I�?һ+�?ۗ7��?�1&}�?镖m�?��?�&x?���g�?��ʻz/W?��T�\u�@`�
�a@�[:�z�@	+Ƃ��@�J ��@��{��@�z���1@@�S h�@Ԋ[���@�?�H�@�p�"9�@ L��V@!�ŝ:@#���E�k@%~a���@'i#���@)l:Ǳ�Z@+�����(@-���+��@0*a�1�@18ɤ��i@2yC��*@3ƫ�b�@5!Y�@6����n�@7��X��@9~��u�@;�w*��@<�6���@>S����@@�R���@@�	��w @A�NK4H@B�t�.c@C����|@D��>j�@E��ү��@FǴ�@G���^�m@H�]�7ъ@J\��m@K@$���\@Lp�c�yq@M��
�^V@N����l�@Px�R,@P��¿�@Qi�_�b�@R�ݖ��@R˜�c�@S�^D�M        ?c堬}�^?��g��?�G��r�?��F�$S?��W���_?�Vdl=�<?�b��k�?��yc߅�?���!�J@����@%��x(@�e"޴{@_M7��@����C@ۇ�5�P@#y'ʳ�S@'��3�@,SXLX@0��d�ށ@3c$�@6��װ�@9됢�@=�z�Wy@@�͆��6@C�|�^�@Ek��@G�lS��@J�Ih��.@M�ǘ��@PZ��=@R ���[@S����l=@U�qMj��@W���lz@Y�O�jA@[ȕ��n�@^'{0�<@`:G����@a{,T��)@b�ĸ6@d*�0q�@e��D�	r@g�r�Yn@h��o.$@jC1�+�@k��4j�@m�A����@o�y�c�@p�e],@q��N�@r��r��@s����s�@t�Ϝ�W@u��y"�@wJ�t�@x>��A��@yx H��@z��!��@|"�1@}]4BZ@~��&,Y@�wP��,@��cQ�&        ?[�1wR��?��� ���?��OSp�X?�(�4�L]?�Ӝ�+?��ꟻ�?������?～��?�9�=�cT@ RD샶�@2�����@_���H@�z�	��@�)�`@��(F9@"f!#��@&F�}��!@*�`�=Xh@/�T�4�@2;�� �@5��sR�@8ˠ�G�*@<d\b��@@&C+06@BC&g:�u@D�㻰t�@F�|�T-@I��rK;@Lc-��U@OZ�N^�@Q@�] ��@R���*@T��?מ�@V�KC��@X~�s}�d@Z�#��\@\�D(�e�@^�ز�M@`����=@a�2wq{@c1����@d�|Gg�\@e��#��u@gg�##�f@h�#�[��@j����@l%֜��@m��;�rK@o��S�9@p�9��*@q��X&H@r��k8�@s�:��<@t�c��)�@u�Q��,�@v�"%x�@x�x�R@y?� }g@zx�gf1Y@{�\��K@}-=���@~\~��A@�g?A��        ?��6uA?�/��5?��3:��@M�cV��@���%�@$��uM�w@.�4֌@5���=ί@=-��@B��U1@H��9}w@M��]��@R ���F@U�'�}�@Y��r�@^�����@ax*��y@d-�nJ@f�?�Qnh@i�����@mI����@phz��_�@rJ�(&�0@tKȃ��m@vl����@x���X@{����,@}����R�@��tg�@���H@���!{+@�y�Zji@�~�ddo@����e�@�v���@�D9t�UQ@�$=���@��I��@����Ng@���=x�@���_ 8i@����o�c@����|@�*���o�@�g3�E@���ݝ@��r����@�Y?Zf�@��FQ@@�-���0@��^(��x@���)Y�<@�]>��c�@�*2��=@��0��A@���Z:�@���0�)�@��`V��@�{s�,�@�i���v@�\Xi��@�UA���@�S���        ?`�(���x?��q�>��?��{O���?�xڣs�r?�i��l�K?�-���?�X��{?�(zO_s?�[;�G/?�"?�4��C?��9&��?���Q!C�?���偕a@�����@����@	Q�oSP�@	A�M	�@�^��'@�����@�BE���@u�~���@�g���@�u�_�U@���bCh@!v�=�"@#x�&��@$Ӷ*�*@&����@(�۔�U@*�_�#@,���X�t@.�]�{8m@0}2�9,@1�V0{@2ܞ@��j@4&���@5h��bE�@6��_ԓ�@8"T���@9�H�yc#@;	ćf��@<�����@>���&@?���]��@@����=:@A�����@Bk���Q@CQ6}&@D<����@E-���p@F$A�>�U@G �}e�@H"k�q1�@I)˓zkw@J6�Q��@KH��o��@L`��k��@M}���)�@N�0�O@O�����@Pz~�Sq�@Q����        ?R
�S�6?�N��}g?�NaN���?���P���?Ù��(BD?��և?�@�L�X�?�p2�?�I��س?�4s>�@bq���w@N�D��$@�y�=Η@�����m@��g���@���!5@"��q<�p@&��s��@*މI���@/��3Zڸ@2�_t�@5�践��@8��v@<���em@@G�E'>@Bo+�~��@D�yӻ�@GE�~���@I��L|n�@L�����@O�wMk��@Q����3@SY�G!�@U2W��@W&.�,/@Y5���2x@[aS���<@]���5@`i�z�@aH�T�x�@b���|@c�b��0@eg�|@f���Cx@hr�b�=t@j!#�m�@k�iB��@mz�.�(@oH(��`@p���ӥ@q��Z↼@r�Hy��[@s��؊@t���6�@u�4s^�t@v�j��@x^��@y5EEë�@zo�4�s�@{��#��@|�Ӂ�4�@~Ss��@���!        ?P�3vb?hR�x??�|�7g�?�R�օ:�?�LE�!_W?�֩pT=j?�Ҳ�B�?篚 ��W?��4;}?�R;��;�@�����@�t s�s@�#X�_/@ǅ�;a�@�0�㜗@�A��@"��=@&�zv��@+6���J.@0��?=@2��^��@5٠m�
@9,�Zb=�@<��>n@@_�����@B�5W@DΚM��@GF{��@I���y�@L�#ef�@O����@QuC}�@S$j�ζ@T�z��5�@V�}sm�@X�}���@Z��8�i~@]Лt�@_H�b�T@`�{��o@bٰ�l�@c\�"��@d��	1!@f���@g��`ʝ$@i%W��@j��RC8�@l={�EkB@m�uOR�@o�˫�8�@p�NN[Eb@q��9� @r���'�@s��tk6@t�~&C~�@u���K�@v��|@wľE��@x�*����@z^H�]@{=i���W@|u_���L@}�Q��T�        ?��en*V?Ԕ�#\j?�i����@X*b�@x�1�*�@W�q�@"���S(@*d���1@1��!�Rz@7�l�A@=!!>�'�@B	~���@E�jDK*@JL�º�@O'��@R5�W��@U�1@XAґ��@[��Y.�@_W"���@a���i�h@c�˂��@f�T�@hf�7E�@j�9��m�@m�K��}@p;e�M�@q�!����@sL����@t�Ō�,@v��!�5�@x|N�I��@z_rjdP@|W�Ux@~cCB���@�B��Q3@�]�Ƨn@��{�Q-b@�����#�@��oHWϐ@�3���@����(�b@��n?�E@�ElN�#@���dT&@�3V�*>|@���9מ�@�&�o��$@����)�@���g���@������@���q���@�g`]��@�Q<+�C$@�@\��h�@�4�m�Y@�.?G-��@�,퍁m�@�0� K	@�9�ˇjo@�G}�-��@�Zf���@�rES���        ?c��?��nA�?�7[�p�?�S;+��?ǟ����?����E|?ۥ��2$�?�/|K�8�?鄋�V~�?�l�^�E�?��\�
&?�OD?���/ T{@-��� @[;�ы@�ݿL�m@�L �Y@Q����@��M��@�+<(��@Rc���@�!~|�@��.w�r@�AV�8?@!p�3K��@#`��59@$�_�ߎ@&�<n�m@(�i� �@*�� ��@,��ͣ@.Ƨ����@0�T�S�@1���[�@2�mZ^��@4'��,:@5u���W@6χ�I�E@850��]~@9���]@;$qR]�k@<�!A��@>C�!�x@?���@@���m�`@A����N@B�6he$�@Cs�eE�@Dc95��:@EY���'@FUU6��@GW��@H`��*�@IpR���@J�1�f��@K��:g,�@L�cH+�@M��@Ш�@O��'Y�@P*��M�`@P�3 �F�@Qk��[�@Re� =�        ?YQ��AJ?�ܢ]�??�����	
?�Hj玣?�4����J?Ց?�P6�?����w�?��#�?���et�?��Q����@ݕ('�5@�r�'�Z@&~����@{_c�U@��QD@XyV��@"�Db��@&�m_Ҁ,@*���@/��8�@2W�f�E�@5(+ȴa?@89ѥC��@;��_?a�@?(�(��@A�m�rD@C����@Eы�T�@H/�/���@J�oN�@M_����Q@P5��@Q����R@S(;��k�@T�|��];@V���͢�@XY�|zC�@Z?�s z@\:��IY@^Ll���@`9��S��@aX��n)@b����<@c��~�@d�͠4�@fF���@g�D2�ў@i�6���@jt8�@k��I¦�@my�^�@o̯'�r@pWmn,�e@q.&s(�@r^sTy@r�Z�[@s��D_\@t�����@u�-_`�x@v����@w�8Jy�@x� �is�@y�V�Y2(        ?Z|t�K&^?�8�%	�?�e�_��?�߻Q=�1?˿H�+��?�;��6	�?������?�W 1n .?�)����H@%����@���@]N���@j;���@ՓW�@ L�v���@$n	�g=@(lp���@-SB�@1i?��8�@4x�d�n�@7�"��z�@;���[@?���Y@B	"�\Y�@Do���@Gt���@IͿ�i�@L�!�o}@O��.3l@Q��b���@S|����@Uf�e�E�@Wl�Ҿ9�@Y�487�@[�$ �@^/�Fv��@`V�ʣj@a��E)�@c��8ު@dp���6*@e�e�aF@g|s/Yio@i�����@jɦ��o�@l� Zd'@nX�(�@p�hs@qtl�Jr@r{狿5@s�R�qH@t1���z�@uKؠZ{�@vngl�?@w�W�Ѵ�@x̧*��@zSq0 D@{LY�|7Y@|��m4�h@}�h�)CS@Jjg�`@�W����`@���.k @�ɐ�_!        ?�� E��y?��c�K�?�%���,�@T�)��f@Y�#~i�@$$!���@-����A@4{����@;9�lݽ�@A�Ɨ)��@E�L/ҒZ@J�a�6k@PK�*���@Sc�З@V�(��9\@Z|��^@^��X��c@aj����@c�)���J@f;gU�@h�޽fw�@k�
i��8@n�\l?X@@p�����@r�M,��@tX�.�:@v/�)�<�@x ��F�@z!%Y3�l@|;�P�'@~m"ޱ�@�Z��F=@��9�?@���$�<N@�Sm$w
@�]?p�T#@����@�#�M�5@��ܣw�@������@���,��@�>jV��@��j�>e@��eT��o@��l���@��n���@�uo��`�@�ew���@�[�u)k@�W��L@�Z��@}@�b�s�h�@�qK�Q��@��A�'��@���Y��@��H`��@�����r@�}b�Q�@�'1�b�@����	o}@�e�e�}�@�
?��I�@���t��        ?`7$<w�?���X�}?����Y�?���eN?ĸ�7?��?У�0�e?؟��=
�?�1���?��AɟU?����oH?���m��?�%�Q��?�����@ �3�Z�@�HK_ݐ@�>�p�@
���_�@mh֩=R@Mٶ~�@����'p@� E�@���AB@A9�nn@)�SKP�@ ��*$@"A�[`�@#������@%��~ߤ@'��%/��@)�p��/�@+�hQY��@.
XYe�@0,��6.@1aߙb0@2�C�w�@3�(*�a�@5Q��R��@6���S�S@86-��Y�@9�f����@;R��r��@<�l�(��@>�u`��j@@4~�!�k@AN~%�@B���v@C`�W�@C�Av�@E�G|&@F��y�@G&�����@HCF��@@Ig�O�C�@J�#;�M@K�~w^�@M����@NIC~hKN@O��r\�@Pu"�`*�@Q#t`5@Q�є*��@R�: �P@SF�/3
        ?Uf���?���~�#?��kͤ?�|�8��?�qxQ5�Q?Ԙ��(N0?�A�,��?�-tIV?�Z��b?��t��Y�@����@
\�>���@7]F�@�$i��@���5 ;@!�,�R@$�#��5�@)R�If@-� �wU�@1�^�E,@4�s���@7��vA��@;\t��U@?="��l�@A��|{}J@C�4����@Fmc;�}}@I	�=x�V@Kӵ$�`O@N�a]���@P�� $�J@R��N¦0@Tfg��X@VAt�-�V@X5.�@ZA�\���@\g@w5#@^�W�'p�@`�p�WQ@a��x��@b�q$�_@dS.��@e�J#s[�@g"�.{� @h�Mw�T@j)p61%@k��L)ak@mf�aj]�@os��@pn5���@qVQ��|@rE�HO@s<J���@t9� KW@u>Ƹ���@vK)�}@w^�I:�@xy��÷@y�/l�_=@z�Uw�r@{�_5���@}0.�.+:@~p��n��        ?Y \�
?���p��?����1*�?�Y�8 ��?���Q�f�?�9���?�Go�բ�?�0�<�6a?���K&""?�'eO){�@���z@
iu��q�@"?�f:k@�gޔ*�@<V���@ �5_���@$[L���@(l�1:.@,��v�@1G�_c~@3�A 1�@6�Vr塼@:L����@=�����@@��`\]3@CS��L@Eg8���y@G�?�e�U@J{$d�.@MD�L�@P�N�֟@Q���>�$@SSWD�R@UQ}�J�@V�%��+@X������@Z���%�@\��s�@_�t� :@`��Ʈ@a�&jj�@c!yg.�.@dk8��8�@e���	�@g$����@h�R��@�@j:�@k��k?;@m2C�8��@n��Bˉ@pD�$5ɞ@q$���Yd@r�;�:�@r��Z��,@s��'׊�@t�`���@u���"	@v�:�q�x@xϚ#�@y&�@��@zH��Rފ@{r)b�'�@|�m^Х        ?�������?و69��?���x��@���,τ@܁��%@��ę�@'�n_��@0����Nv@6.w,k#C@<����~@B)��C�@Ft�[��@KH����@PT�)C�@SN�D�@V��Xl�L@Z&T�#ؠ@^lB��x@aJ��_@ca��7�>@e��p
6@hjT���q@k1�		�@n'�$�,@p�oQ��@rQ.��@t�6���@u�/3<~5@w�o꺉@y��H��@|"�d�K@~h*
F�6@�dh؛�@��l�h��@��A�T��@�H!�|@���(�@�%֖��@��"�g�@�<��	�@��1ID�&@��>ew��@�M+���@����w?p@�|�X�@�rV��h;@�pMhw�1@�v�r@��ӑ�*#@����`t@��l�'@��t��2�@��e�[@�BV]���@��J�U�@�Ȣ�f�@�b�9��@�8G�/�@��\�x�@��5i��@�U�]��(@�����@���X`�M        ?a��3?��pE��?�O���?�w���I�?�S���*?�*�ژt?�n�m)?��%�A�?絹�D?�d�":�?�6J�5�?��!_��?�|���L@ �/>ܙ�@��EVL�@���@
�e����@H���+0@%Drm0@I�����@��6�9�@ =R�@@����@L�2��@ �����@!�P���%@#1�o�?@$ݗ(3@&������@(r���$@*[W���w@,YxL���@.l����@0J��3O\@1iU]~��@2��}�j@3�#_5I@50.��@6Pjy�.@7��_���@9Ts�)@:n�	��@;�<�YGS@=d�^�a#@>��:;�@@C	��I@A��6T�@A�v��@B��S�v@C�x]��;@D���&p:@Ew����@Fg�����@G^H��D�@HZ.n��@I[) B@d@Ja�ۑ(]@Km�
�".@LRc\�@M�Ǎ�n@N���#@O�qY���@P}*���        ?g�`�/�?�W�Dқ?�Q�H�c�?����?�+voʧ:?ߓ��!-?�A�N��?�O���?�W�%�e@�L6s@	��)�@��t\�R@��a�)@"��؂$@ �̞k�@$�"�R³@(�!dދh@-�D���@1�U���m@4�s	�@8#y�0�t@;�&{G2@?�phY��@B9E���@D�B5��/@GE��'�@Jǜ�^�@M!2�0�@P/�,�+�@Q�����@S�^�a��@U������@Wȉ��)@Y�Ed�@\FhI���@^�d/�(@`��r@Y�@a��c�'@c[�k�h@d��-��@fX���QJ@g��Yg?@i�h!Ir�@kP(h�@m�4�n�@n�P1��,@ppD��!@qn�\��@rv���)@s�)��ka@t�nm�@u��Ð)q@v��S�q@xuS&�@y\F��
	@z�4�Z �@{�N��U@}I��P@~�E�o��@�"bd?(@��Yi��#@��Q4	�@�H�8T        ?[�D+�>?�/@��ǂ?��Lk\�?����;/?�ˏӲ?�5���a^?�/GeN?�"�T`(?���:��?�`yee�@���O�B@mkU]�@#T���q@��.�}@���m��@�$_ o&@!o�Ź��@$�[��MK@(�A��@,���@0��HzAa@3<��u�@6!Q�J@9Q�@<Ag S�@?������@A���	@C�PXO�@E��@��@H,E���'@J����@M# �s�^@Oԋ��@QUu���@R�O.�v@TdR�l@V�
��@W�[��@�@Y�X��,@[i6�.a�@]\1��.#@_c��VT@`��V,_�@a��=��@b����q�@d(�p��@e`Ñ
�s@f�θ�tO@g�h��@iJ��$�@j��b�z @l�Y��*@m���=_�@o/�e �@pV�BF@q$�9�\�@q��Bw�@r�1��(�@s�d�Y!@t�Zt��@u��Y�\@vq��Da�@wg�cy�        ?��#?͋�?�p�x�3?�7��A�@
6�.�X@�^BŔ�@"�?�Q4@+�F~L@3Wߑy@9�K\��@@� �F/<@Dڭ�F0>@I����[�@N�&���G@Rt<�..�@U�n[�ϩ@YDB��%}@]"�'���@`��Z^�@b�sa�1�@eX'�� @g���A��@j�y�@��@m��?��x@pd�:]�@r��f�@s��B�ـ@u�0�v�Z@w��&	3@y�A�{@@{���í@}�jʊ@�"ov@�K@�X��6@���@|�m@��g���@�E��4�@����XX0@�$W�W��@��ȱO�@�6ף��@�Ӟ�7@�}t��+@�2AخF@��9q�
@���g��@���.&�u@�ɴ?n��@���
f3@�����@��d�Zc]@��n��'@��A��G�@����}�@�:���?@�eeiL.@����%+@���[� �@��OEr?@��n�L-@�OpԮr!@���h�/�@��m�嚁@�Ue���        ?et8F>VI?�{|�n~�?�(�k�)�?�w%j��?���U&�=?����7�?�^(�t�?�}�GC�?�e}�6�s?��S^��?�SIe̞�?��朼9�@ ����+@��u��@�����@p�M���@�>+�S@/�h��@��'�6�@h�ne^�@PzUk��@lsq�!3@ ^�3�O�@"# ���@$�r�@%��3�̅@(�!^@*Q���m@,���8\@/
Z�8\@0ؼ�IL4@22�T��@3�>_�0@5{�ˣ@6�R]�7�@8=���q>@9��'(�K@;��;�J7@=u�Η�@?TWS{1"@@���9�@A���g!z@B���zI�@C��5�!@D�.)#��@FɹK�@G1�5�_�@HjbߩMy@I��I�9G@J�O��R�@LM���U�@M��ٸ��@O���g@PC�<�0@Q��H�@Q��'�u@R��m��N@SY�Bt�@T+�E��F@Ur��|�@U�^j��@V�V�ٽ�@W�_x8�        ?`��!O:?�A���3?��x?���?��p��?��%�Dc?٤�K�"?��/�H�N?�����9?�-�]���@ :�{[�@��~�@�Ó�@̑�87�@��h?f4@��ı�@"<e��̀@&/\��@*|�)�v,@/he�ƃ@2r�Or�@5}'dH@8���1�8@<�3�(v@@B�����@Bo�R �@D��Z�*@GU��$�@J�4O @L��#�@P��l�@Q���O�@S}���7@U^
7X@WY�R��0@Yr"�F~@[����ɔ@]���U�@@`4J6}�9@a{+��@b�	(mv�@d6_�@e�E�+Xn@g/�\��@h�zĐ�@ji%	R45@lҎ��@m�~V�L'@o��맶�@p�'���@q�mo>�@r�iU��a@s�k�Q@t�vUZ�@v���sn@w8ǅ���@xh�~e@y���^��@z�~ݎ	@|/+�#�@}�qR��@~���J@�#���W@���}���        ?_�����?��-�:l?��M�n_?�4�G&S?�f�aвC?�C��#?�?�y_���?(jN{?�	Z���=@ (�]���@�"MHI�@���vP@�[���@��LM��@�Tu�4@"?ǼGV@&���U@*�kc��@/lA3�{�@2sM~�L4@5{h7��@8т��Dp@<x�%aʇ@@9��rc�@Bb{�E`�@D��H�8#@G;س��@I�rd��_@L��/|@O��g+)@Q�Q��'@SRW2̊�@U)� t�@W�7�7�@Y(�q�x�@[Q�.��@]�ң�W@_��3; >@a;�z��@b��%'x�@c�T���@eR�2��@f��4f�@hW��@i��\���@k������@mR)ep�@oqϛ@pyG���N@qmE�}�q@ri:;q �@sm+�&��@ty�Z��@u����@v��*�@w� 3~K@x�/��U0@z-K{�*�@{ip�R]@|����-}@}�π g@N�>Z@�U bڈF        ?���B��?�!�@�?���M3b�@
�d%���@>��4o@#h�j��@,���(�@4��$�@:ɋA���@AX�nK ~@E��2�`@K��kR@Pp2M%�w@S���4
@WF���v@[<�ƎK@_���"j@b&�K�@d���Wh@g|�S�A@jy��L@m�z�C@p��r�
�@rb��V�:@tU��Z��@vh
!��@x�;� �H@z����5@}`�3�X�@����\Q@�V(w[x@��B�n��@�A[�-��@���	��@�r���@�$�D}�@���wn@���(E8@��mq�/%@�RU��!Z@�Y1tms�@�i\���h@��遭�p@����3v@��h<Cs�@�xUlƾ@�H%	��@��yF��@��~�&��@�A>���@���,���@�b))�@�I5y��@�E�5u@��	W�i@����̓�@�n�N�@�D�0"@�vR;N@��K��Ԁ@��$C;�@���?
@���R��        ?n���ML?���!E�?�d�)f)S?�h�:���?�7�j�>?�z����?�x9SX?逡�`��?�����v(?��W9�A�?��3�6*@ s��#�<@�v(ޙ@v5ω�@{���v@ܒ����@L�.\I@�x�K@�A��f�@�U��d@�����+@ ��y���@"N����@$2o~�i�@&1���@(M	iױ@*�mʀ@,�*pS@/N��Bn�@0�|7n�z@2H���c{@3��X��C@5(µ��@6�mA��@8H/;�M�@9�:��q�@;������@=q��D�@?K�sN�6@@�wL��i@A����#�@B�n�כ9@C�$3+�@D�ΥDZ@E�~�CO�@G>#8�y@HI9Y��@I��M[;@J���R9@L��)�@Ms��G@NԒ(>@P�����@Pٔ���@Q�)��z<@R[^�)J�@S#4�lQ@S�n�of@T���׫	@U�h�֔�@Vp��yp�@WOy����@X2�8�^        ?\o���?����7A�?��G�|^?���^V?ɯ�{�f�?��u�]Ti?Ⱞ���G?��'s$?��g{M@�?��/?�N@ �S��g@
�X�D)4@N�	�@ Q�T�@|{a�N�@ �N	���@$�#z��Z@(�H[�Bq@-:�Z9;@1-|aй�@4~�Y@7"(�n��@:����t@>C����i@A%̩�e@CS
t8�@E����@H.*�}#�@J�a��.@M��y�I�@Pd��r��@RǴ�q�@S�W�D�@U�;ݭ�@Ww
P��@Y|Zh�B�@[���`��@]��g��@`���r@aSBnmT_@b���H��@c� ��l@e\�W�7@f��"�
@h[%� _@i�v��l�@k�3^��@mR��6<v@o;�^�@p{T����@qqg�CA@rp]�>�@sx[1��@t��3�@u����@v����I@w�;���@y,Q���@zm3�N�5@{� �6@}�9��@~k�T ,=@�&yo        ?\ �|��?��;o� ?���t�?�k{���?�|0�j��?֛�C�n�?�k�|M}�?�0�`��?�o!4�?�͆f�E@�QD8��@	�$��H�@�Y{	��@"��5��@N��si�@  ����@#���1 �@'R� %C@+���ȩ'@0(3J�y@2ãP���@5�X,��@8�i��I@<ߔ�$@?ȱv�)@A���3u�@C��X!\V@F>,]�A@H���o�#@K;���6@M�'�V@PmKo)R@Q���>q�@S��G���@UD�or�@W�%�[@X��K�I@Z��7�q@\�9�<@_
Eq�9@`�Q�*��@a��Z'��@c�@U@dT�=ˮ�@e���@g;�%)t@ho�@�#�@i�DX5@knG��E�@m�XxxJ@n�	hb��@p)%h��@q��5Y�@q�
Հ�@r٪�o@s�s/˃�@t�sڱ@uʷ��d�@v�N0�*�@w�BV�Q�@x���t1@zp��Y�@{D�v�c*        ?�F����'?��Wɓ�?��X��ؽ@��~g�@+E����@&�����@0��:?��@7Z���@>�����@C��CG�&@Hp =�K@M0�.@R�r�(U@Ug�D��@Y�G�u@](FL�O�@`��I ��@c$�f���@e��\�xl@hnOp� �@k[���4F@nz�;�\@p���C�@r�h�9��@t���Jn@v|��>z@x�qN�4&@z�KAdi�@}	�b�	@rx�M@���?8@�M�mQ@������@�-�0U�@��zB�@�.��?��@��.j���@�}�f�	�@�=����@��ʗ�H@�wj�D�@�pG��o@�q����a@�{��Y@��fH=��@���+�I�@��!pL`u@��4U�V�@�1"�%�@�o�d�S�@��ȧ��@������@�brR
��@��Z��!Y@���Q4
�@�S4F�p�@�I_�Ձ@����dc@���EB@�j�`��@�<��N@�͕x��@���s=        ?_��%6(I?����N�?�Sz���?�[n�_�6?�r7���?�W�R�`?�A�%d�.?�E2#�`-?�ʕ찤�?�8 ��Y1?��eO!X�?���q�S?��6�ȑ�?��
7^@�y"��@�;ȅ�@	0x�ȣP@�C��z@_IQ�@x!�Ő�@�n�@_1�I�@�b��@GW9�^$@r$ȜC@!nLj��@"��Z�j�@$3�XV��@%����$A@'�?6,�@)�p�Z��@+od6�I@-m,aF�@/}�:I@0��s�@1�T*]@3��h) @4@����@5yu2�@6�ltj@8	��p@9`�B��@:�!�%@<.��D��@=�N��j�@?&xȧ��@@Y��%�@A$G\��@A����@B�~�[��@C����*�@D�ԝ��r@EkgV���@FV=��`�@GFVUϺ�@H;��=�@I6Gm��@J6�S��@K;({w�l@LEsHB��@MT�mR@Ni���@O���W�        ?U�WD��?�"?���?����:K5?�H1@�I@?�"[�ۛ?�F˖���?����[��?�i�8Z ?��C��ˁ?�?-�>W�@zZv=�@
͋��@4E���@��5qX(@�ʛ1{(@!	$��_X@$�P֍v@)q�Ư�@-�u�<�@1�����@4�����@7�=h�l@;�0�n�@?y")�z@A�?��	@D0Fx/-G@F��q(�@IY���	@L4���Bo@O@y�Y�@Q>I.U�@R�n$
ϱ@T�߉�@V��
|�@X��Ϗ~@ZҚf8?�@]��N�@_`	��@`����@b-zl�h@c� ���B@d���@fSODfn@gѪs��@i^�x[я@j��'��p@l�Ϲx%@n_αK�M@p�^6ɚ@q ��]B_@q����@r��Z�L@s�`�S@u '\��@v���]@w/ca��@xS54 ��@y2L}^@z�hAh#�@{���?�@}4�*�U@~�����@ו���Z        ?S���q%?�Z�Y��?���J��?�2�p 7?���	��?��T��??���T�c�?�? Я̈́?�+kk���?�X+��v�@ �g�
�@?ϚaK�@��,?��@xs	:r~@$E�]q�@�r{�P@!\�2�J3@$�j�#s�@(�gM�]@-.�ⵣE@1��w��@3��_4O@6����� @9ɔ�&t@=;X1�{B@@yc@?�@Bx�h%<@D���<^�@F�rkJ['@IT;.Rq@K郠m�@N��W��@P����^@RK��,@S�n��@U�� �b@WX?d��@Y0�.��@[�ɺx@]!�`�@_9�~�@`��֞4�@a�]�6U@c���2_@d9)B<r@e{h#�cI@fȚO��@h ��ڢh@i���C�@j�?6|@lk�K㬾@m�4��@o��+�@p�C��� @q`L �7�@r8�����@sLY�X�@s�O�UpN@t��Mz@u�~ќ�@vɷ, AL@wļzI"�@xŖ��b        ?�!-#�J�?ְ)6��/?�{��,�@2$�H��@b���1{@�Z���@$�Y�a7@,Ԟ ��p@3Hӵ�s9@8��T9H�@?yM�2({@Cm�blW@G���Ī�@L'�%�@P�=�,L@Sbl�!�@Vg�b��+@Y���@]5vu���@`��}@b�_�]@d� �@f�����@im(i�v@l 1ì@n�~��:�@p�P*���@rGK�/@s�D"Y)|@u{R���K@w0�m?aE@x�%ڂ}@z�&Nm@|��#m�@~�e�@�h)<�nH@�z�iD@��O�Y�@����w@��ʘ���@�(��9@�l����A@��GK;��@�g#6n@�xJ-�#@��/w�@�^�_�x�@��{��&�@��V�r�`@��ːH:@�V�����@�-�)k�(@�
OP*�@��-��M�@��c�gs@����n#@���W�BM@�����@����f�9@����/uV@���m�+@��w���@�͊����        ?���&s�Y?�&[��~?�7x!�y�?��Z��?���f�?�~-v��?�-�V*��?��z�?��8(�cl@\oh��@���A2�@���@��j��@t���y@���@)�y[@�5?���@ ڌu��@"�d���@%*,�6@'��O���@)����3@,�I���7@/G�xb,@1ap�^-@2�@�@4�th�@5��D1��@7_?>�-9@9����@:�k���@<��i�@>��@zjr@@X�0w@A_�D�)�@Bnf�n�@C�#mg�[@D����q@E� (�@F�4���!@H._��>@Ik���@J��S��V@K�M�ڢ@MS�"@N�և�$w@P
NL���@P��u��h@Q{.��y�@R9�)l]�@R�wtM#�@S�Q��S�@T�O6�O�@U]i�N�@V0���p@W�M=�@W�7���f@X®�'7@Y�M�
i@Z�aɫ�@[z�{#@\j6o@]^	��        ?q�\����?�Y��QW{?�d�5W)R?���)?��K�?ᦣ��l�?�ҽ����?���A`�?������f@`��R@G'��WB@�+�7˴@�nS�0@�﻿@!��)�W@%�8A�,R@*䶟��@.��KMM@2E�-��@5Z^��@8��~��L@<xE��e@@C?���2@BvQ���W@D�a���@Gd^�qZ@J!N���@MVq�[@P٪1��@Q�dQ��_@Sz�S���@UR��Q:T@WC�� ��@YM�B�@[q\T�@]�Im�D@`a��v@a:w�)P@bv
�v�@c�s'N�@e0�4���@f��QT��@hS��@i�M1��@k1ӻ-J�@l��٧.@n��FT@p!4�_@q����@q�$���@r�k���Y@s��'Ƞ@t橕B��@u����@wv��@xےv�@y;�qi0@zb�%��@{��]��@|����@~���X�@K^�%�@�L����        ?�@"��@G?����z+?ȩ�S=�?�K��h0R?�|ڵe��?��x��'?��
���0@�̞z@
���T��@�y\���@s�		�=@;a�e�/@!sk
�La@%B�܃��@)��OP��@.l��2i@1�?!=�@4��L��@862�]7-@;ӤF�~@?ĭ�\�X@B���p@DV@�Pn@F�J`eN;@I�kЎ��@L^ܦU.@Omǋ�g�@QW�U�"@S4��Ô@T�Da4�@Vֱs���@X�{����@[�L���@]J8�ɔ�@_���s@a:?�@b^�H��+@c����@e#����@f��d�ON@h%%�g��@i�1f�F@kd��pIG@m��@n� {��@p]G���I@qQ&s��e@rM@�	,z@sQ�V�V�@t^v�%�j@us���sv@v��7&1:@w��m��@x�F`�@z��!\�@{_�I���@|�q�	�=@}�*b0�@W�dV��@�^x�9@����a�@��R�?�-@������s        ?�1[�D��@�X���a@v$�1@+61Q�4s@7l|���@B	,$E�f@IĻ\��@QtR�RH@V����Q@\�b�ȍ@a�J~FL@ej�&��@i}j�}@m�9���g@q\ni�b�@s�-h @v�����@y���ڐ�@|�XǓ�R@�w>ɊP@����Dm@������@��i6�@������@��3��i�@���8��@�5��PXZ@�L����@����@��`_@�)��D$�@��H�8�k@�����@�r��+�@��vy�@��q�o*�@�&���ʚ@��NH�c@�A��g�@�!�/��=@��TI @��U�g�B@����(F@��κO�@�دD���@��S!�Ac@�㻄���@���yi��@��!j��@����c(@�?Bd"֣@�d�?�z@���g���@��5^:H@�|;¥�@�{4��,@���&��@�`6k���@��6�Ѳ@����w��@�_ Kh}e@�]��@����J        ?a����c?��'h�k?�_�ɮ�2?����X,�?�q�.�O�?���]~?���q̋�?�6qP?����?�6���?�p�A��4?�;%�l_Z?��t-Mf~@I�ϻ� @�#��t@	45fj�#@&g�ׯ%@�{o���@�2�@�%�m��@2طI�L@L�|��@�ԕ��@ ���^ޑ@"f����)@$90��=@&%�IJ(@(,��}9@*Nώ�8@,��*$M�@.��V��@0���5�@1�Bl�@3L&�գ@4�����@6%��p	�@7�C{ݿP@99����@:�UUP�@<�Ӗl�@>H`q���@@��7@@�u0]X�@A��O@@B�W5p��@C��q@E W�jr6@F�2��+@G3 w�@HXs}��g@I�3� �@J���r\^@K��p��Z@M@pȱq�@N�[mS�g@O��#��@P�[Zy��@QW�}6�@R>t�n@R�5P)�@S�����(@TTNZ��c@U|�)��        ?W�7�E�?�N۪0�P?��a0�L[?�N��V%?����?ծ�Ykk?����i
 ?��g�1v<?��JQ���?�/�H��0@ ��@�h@
�t�Fh�@[�X&�3@$@�U�@�o�l��@!V��9@$�r�U�E@)0��S�@-�m��)�@1�ޝ"��@4x��;?�@7�JOpN�@;?~C� �@?��N@A��E"�@C�'/��q@F_z���@I �I�^@K�BM��@N�-�@Q�Tc5@R�q�op@T�%��@Vh+��P@XjE{��@Z��ܭ�@\��Dz@_��|1D@`�vg��@b��w@ce>���j@d��N�@fB$9�1@g�"�$T�@i^(�]��@kt[l��@l�D��@n�ُ�L#@p-��!�@q"���؋@r U�زx@s&�(>{�@t6xY��@uO,�7x�@vq#����@w�~�X�@x�^�֬@z�ƱU'@{X-��n@|�_��1@~��@l�_nK@�n�y�	        ?S��@ǋ�?�	Wh��?�;���2T?��1t�q�?ō�V?ӵHw@��?�q��{?�%��L�?���s�n�?���ȗ/@s�DC5f@�]�X��@�,�^�@_:>e@}�~��8@e��u�@#���f\@&ᣆ��'@+'YS3_�@/���n@2�R�B��@5v�$��@8� ޭ��@<	����@?���;�@A���aL�@DO�6�@FM�߾�@H�۷�@KXiw:�j@Nl"�>_@P��R��@RD!׋�@S����h{@Ub?�]��@W-d�^�@Y�<9�@[�z0@]1��(@_:��Ψ@`��-j��@a�[��@c����@d_����@e���,��@gt,�@ho�+�C@iㆨ�@kc�%�.)@l�%K���@n�0�!KH@p���@p�("Q@q��)�@@r���aJ@s�#`��[@t�����@u��a#�P@v�<p�@w�{���@x��1��6@y�jZQ:�@z����8        ?���)̶{?ڬG��??���9�+@
8`~e/@�D.`�@ ͈ �n?@(�K����@1`��?M@7@���@>��.@B�@fR�x@Gnj	���@Lm��[*�@P��ii!@T�� j�@Wn��D@[L��@_�%IR�@a�0s��@d~�l �@f};�'@i#5a4`%@k�3����@n���C%k@q�[�@r�cz��@t�p�`�@v]l�ר@xQVj��-@z]�V��Y@|�F���P@~������@��l���@�á�b�L@�����@�Z���S�@��/��S�@�&�}�J@���S޸�@�( �U˧@����H@�__\׋�@����'�@�fƋ^@�L���w=@�9�%@@�-�,Y||@�(��3W�@�+[��[�@�5�Ct�@�E�V*��@�^Q�6@�~
��&�@��4�Ȑh@����t@�	��`b@�G�-�I-@���Fi8 @�l렅��@�."Է@��F,]�@�w7�P�@�-�5�        ?Z*����?�� ��?��x�?��cָ�?�EQ_��?�h�V��\?��'�}�?ڳ`�!,B?��>D��?�W���5.?�7�A��?�Jp��??�A����?���`.�%?�����UA@�02��@�����@���ܙ@Hh�}Ud@/�G�d@2�v@K���@��E�p@$�:^`.@̨y�Q�@�� ��H@ ʼk5՜@"[� _	@$�P�V�@%���#��@'��?�B"@)q���*�@+l����@-|0�g@/��y�o�@0��=:�@2��D�@3J(s�-@4�]���@5ё!]��@7%�n��@8���,m@9�d�{^p@;d��(@<�$܈8@>p�}u��@@k�@@�{Pt@A�"bt�@B���yӳ@Cf�F��@DM5�|$@E91^0��@F*���@G!�Y�-@H߃&�@I�����@J&�]�p%@K2�"Q�@LDj��:@M[ܲ�G@Nv�zz��@O��b��        ?U��)��?�	4H�?��̹�I�?���]^??�?�7x��?�64����?�ϩV�.�?謬_2�?�2�A��1?���T[l@�G����@�d���)@�!���@��aa
�@������@ybY�@"���)@&c5�c�@*��+ @>@/{�?�-@2h�&! @5Z�#��@8����GQ@<^���@?�3��f�@BE�/"�@DM"���@F��F"��@IJA{ߕ@L1.Ϯ�@N��\���@Q�\vE�@R��6��@Tpr�q�@VGq>�c,@X7V�`E @Z@���s�@\cM��@^�|�ʦ@`{��Y�@a�s>��p@b��Y�p@dN��գ�@e�����@g Z���@h�0�n�2@j*@"�R@kĩ���j@mm����@o%	G�%�@pu��� �@q`f��@rR�Q�@sK��qX�@tL�� �@uU'�B��@vei��d�@w}[���@x����%@y�z��5v@z�1mb	@|*�˷��@}i���7%        ?T�IaNN�?�h���M?������?�.��;�?�ϵe�y?��Ɵ*�?���i ?�8yI��?�"��<��?�F��"m$@ ���5�S@*A��'@�Dڙ9�@e�����@/߉�@pV[�@!M�by�@$�MS׋[@(��''@-����@0�A�/��@3��]�;c@6�S�\�O@9ƻ���@=>##���@@~����@B�Eq�@D��#���@G{����@I}��E��@L#���@N��h���@P�&��D�@R�=T���@T65�+@U��o�6@W��[�P�@YŔ��S@[�;^�Ĩ@]�U���g@`�R�f�@aGt@Me_@b��7�4�@cɥ7؇@e�*��@f���0�@@g�D�w�A@iw��d��@k��Mu@l��mh�o@nU�*�@p	��o�L@p��V6�c@q�9(\�@r�.��g@s֎��)m@t�A{�_,@u�apK��@w�f��@x(MSK�a@yRI�j��@z��C�@{�����        ?��X�n�?Ӓ���SM?�D��K�@ �5˵M�@�W�ks@�/�x^�@"ip�rS@)�F�V�@1M�u�@6p8��@<U�)_1@A�r�o U@EIӧ�s@I��Y�A@N.�#��@Q�u=(*�@T��
@W��`�9@Z�S�g@^��bGZ@a8��O@cNW���o@e��e��@g��Rd��@ji(9� �@m���Y�@o�ٌ@0H@qkib�Y@r�D)3'@t��c��@vP�No�e@x���<@y���?�@{�7Y/@}�WV»"@�7ҶC�@���	�@@�:?�@@�d���U7@��#��H%@�ׁ��>@�ʵXؙ@�q��R�@���S_�@�3����@��3.��h@�J�k@����� @��}�V1�@�`7AOS�@�/�yt�~@����qu@��.���O@��O�(@����k@��*�m�@�k���s@�ZYN��@�M����@�D�fL
�@�@�LF4�@�@[� @�DD�q��        ?i�O'?W�?��$T"iS?���	i�K?����F˴?�+~��Sj?�f����n?�1��'�b?�|��TJ?�q�BF��?�7�3G�7?���-�d?�А��l�@ ��iC8�@���ᚭ@.n��x�@
�� ��@�ֶ��x@��29>@�
i��@9"��f�@͕dw�@��^�@n���;O@ ��X�@"Y�L�=c@$
D�3�@%ϪSM�^@'���Z7�@)���fQJ@+�?�I@-��!�U@/�Y�=w@1B�v��@2JL7�Ef@3����@4���L�@6�'@7v�vat@8��z��@:P�����@;�����`@=Xu�9��@>�}�M@@G���o@A��E�@A�ƨ���@B�KF���@C���'�W@D������@E����b@F�Y
�C@G��v���@H�Gz�V@I�q��;0@J�`���z@K�
(�6@L�s�� ~@N	�!FR@O04��C@P.<U���@P�!yc�<@Qb�2��@R��B�        ?YtA�ꠡ?��"�?�,���?�
_���?��8b��1?����m?�)с,�?����p��?�0pmk?���x@��vPv�@��˛@���́@;w�ñ�@l��}�@"�M���@&�d�:B@+��R��@0o'�aH@3a���Cm@6���1��@:D�Iq@>=7zB��@AI�b�@C�5?!:.@F4�P���@H��7\��@K�J̤�@O���2@QC�>|}@S�'*:�@U�`3-@W���@Y9��jW�@[������@]�9_�;�@`;V=�1~@a�GK��@b��0%*@dk�<r�@e�c�΋@g�!_��6@i3�Ie@j�0�~@l��%�q@n�㢼@pB�z��@qC+���@rL� �@s_?��w@t{��:�@u��c�@v�f�]��@xǰD�@yG$z�-r@z�����|@{��Ph�@}CSÊ.�@~�����@��- ��@���jd@��3BD��@�TI��        ?WF�,2��?��e��?����s&Z?�T�Ќb?č��e��?�\|~�eg?��S��?��-i?��{;���?���oa@ wp$]@DV��@z�9��k@gB<F�x@��ZJ�@����@ �C'l�@#9�>y�@&��;;�@*�"l*@.�gf�W�@1ۂT���@4q2�u��@7?�y�8@:I�=��@=�/���Y@@�Oc�I�@Bh��H�@DiDi�$@F�6� e�@H�:�qb@K/�-xQ�@M��u\�@P.��9e�@Q��V���@S��v<@T�)�$[@V0��3��@W�+�'��@Y�@fJ��@[p�8i��@]VR���@_N��T�@`��T���@a�	��p@bԽ�+v@c��2;�@e#��@fX���O�@g� �O�@h�J?vM\@j4=_aO�@k����@l��]���@nh��׫@o�~�'[2@p�hS��b@qz�\�Q@rF�*�nD@s����4@s��M�<@t�,j0@u�/�!�        ?�ǐ�޲?��R��+?��R{@
[���5@iH�.�B@"����}Z@+쑗>�@2á�=)�@8��Q�@@�v\p�@D�\G�@H�w�I�@M�T��@Q����@T�ٷx�@XD��'�@[��
&@[@_��߆Q�@b$CI\�@dt$��ͳ@f��`�@i�T��j@lY���@oOs*c.@q7�fZݜ@rݾ;D��@t�N��"�@vj�_��@xRP�~��@zO��w	�@|c��x@~� |�[@�g^��P�@���;��@�ɛu��+@�����@�X��r�@��ʦ�R�@��C��@��PN�_@����"@��$>iN@���\FQ@�� Z��@��s���@����@�\�R{�}@�?��0\@�( �g�@����~@�	����@��F��@�+�NOb@�=��*@���X�x@��HG
@�20&-�@�K��F�@�khb@����K�@�\���5@��n��:@��&&��(        ?��a@�?�R,Hdf�?»����?���|�?�)a���8?�ʲEp3u?�v��1?�����~�?�Fi���@�5�9z�@t5f!@� ���.@��Q��I@�eZ.�a@(!]݀�@�qHT��@��j�l�@!�p�O�@$/J��F�@&�̀�@,@)��hr�@+�asKJ@.~��GS�@0����UB@2>�K�Kw@3���T�@5���=�2@7DI:��@9��a4`@:�!��̟@<�P�0@>�Ho`��@@��nG�@A�>�5�@B��T���@C�]��"�@E�9v�@FE��e@G�'+#D�@H�����@J"����a@K~fխz@L�bEa@NO���w@O�f�+ @P��f�1�@Qel��@R-@�5Xg@R�]��;@Sɿ�:��@T�c_0_@UwD�*�[@VT`U��@W5����)@X2/��@YڃA�Z@Y�k�}�@Z�̕�@[�|}��q@\ԂP3��@]ҕv�0�@^ԶfY�@_��(��        ?s�S� W7?��&t�?�)R��?�f�!���?�3p���?㷎��o?���+2�?��c4/H�?��C���l@��;�.�@	��gJ��@�� ]@�%�SS.@��ѳ�#@$�����@"��-$2@&9�{��@*&�0a�@.Ub�ye@1�ݟv�@4B���n#@73�O�^@:5��)�"@=�e��*@@�-���W@B���YZ@D��V#D�@F�\�{ @I>^;�@K�	65by@N1C�=7@Pz2e�Q@Q�l��x�@Su�ɪ��@U�J��@V����@X}զ+:(@ZR2�1 @\:L)ﻴ@^6G�~�@`#$>)Η@a57�,@bQn��@cw�J$�c@d���Q_�@e�y9|0o@g(�W��@hx�3�)@i�ʋ�J
@k7�0��)@l�㧁��@n ���hb@o���/Ax@p��V`��@qg��5!�@r::��@sG��K�@s�Ԓ�s�@t����o@u��$��@v���"�@w��&���@x��3�"#        ?c�9�&&?�7:��k�?��)���	?����?�?�W�7�?ۋ��}�?�EFI�!?������?������@�x��@"��Gz@x�ƛH@�~�И@��o�Z1@�4w"Ʋ@"�2�uO�@&�+�
@+D���X@0 �&5H�@2�	9d@5��f��@9T���q�@=H6�;@@�K��£@B��a��@Ek_�#a@G��k�[�@J6�n�F�@M�  @P���Q�@Q�S�e��@Sn�-�@UAN�4�@W.��҇C@Y6�k��@[Y�zG�@]���{��@_��r\B�@a5�{�`@b�|y�v[@c��Ҹ�$@eB�4Xg9@f��J#J@hBt�UD)@i�>t@%@k��ѭp@m9���|@oby��7@pm��î@qb����@r`�	梗@sg�6D@tvL���@u�c��&�@v�{��@wٯ@Hb@y���@zI�k�+�@{���uY@|ߐ��&@~8�9p�A@���e'�@��*hZc�        ?�O��K	?��Λ&��@���l�K@#���p�@13�����@:���e�f@C��Sע@I�d� ��@P칛/�@Uy/y�a@Z��P{�@`%V+�bg@cI��1 @f��X�W@jv���<�@n��hڒ�@qlռ��@s��6�s�@v<Y��1$@x�r�#@{�#/�G�@~������@����3`
@���Мf@�8�u��@��N<��@��� ��@�ب s-�@�������@��N e��@��'�4�@�8�I>�@�d͒$\�@���+��^@��9�;��@�#��N�@@�v�+�g�@�Ӱ�ݳ�@�:8{�H�@��W����@�#����J@����@���SA@��9ZH�@��F/��@��h~��@�a��@�>GW���@��"A�@�]��@��w�@��E��}@��`
�L!@�ɿE�*@��Z,U�0@��)o�܇@��'Y�B@��O�ޖ�@�ݠu �@��#:�@��]�a'@��
m�?@��H�h�        ?p:\a+?�T⮒|2?��㓪�?��ZQ�q?Л��J�?�N)~�?��?��?�=���?�/	����?��8q��?�l�a���@ ð	�%@'����9@�(��L@����`&@6l1t��@��j`@4�Y�xX@�\�D@���0�@��g
�@ �h:��I@"~���ɋ@$]���H@&U��!�@(gb�Y8	@*���m�J@,جT�:@/8�ӅD@0ٍU�@2$3/�@3|b3�W@4�]���@6T+�ގK@7�y6�y�@9bN&G@:����9D@<����H-@>]k��
�@@�J��G@@�.F^w@A�N��֜@B��s�@C����@D���N@E��r�@G.B���@H##s:��@IF�w�)@Jq�Ź��@K��T+�@L��e��U@N"w����@OmS��@P_��u@Q����@Q�l����@Rs�bٱO@S-.�}�@S����@T�H眞�@Ur/��
@V;�K��M        ?f�K;���?�,�^�?�Ȏ'��a?���Z �?ҼtU���?�`̎�C�?�SV���?���?��7!`��@�c��}@
�'�7�@��L���@�����p@u"�D��@!��t�RT@%�HL���@)�9;��@.�LW�@2E֔���@5\�.ei@8��݉y
@<y�(��4@@CK���i@Bu	�r�o@D�L=�1@G_�W7@J�\��@Mi�p�:@P�j�G�@Q��E��H@Ss���d�@UL)�>��@W>�u���@YK\�:�@[r��Ԉ�@]���n��@`
��(�@aG^s��@b�꣹�M@c��o�&�@eU�D��@f͌��o@hT�?/c�@i��Tt�@k�\�5�@mG�r��Z@o5�X�7@pr���F�@qf�Q��@rc��'(@shM���@tvM���@u�B���H@v�Ox�g�@w֗�q@y	;س^F@zE_�z�@{�$���w@|ګxT�>@~4i��%@���L^@���S��@�>m#��C        ?g�D��T?�I�@þ?�:C�k;�?��'7j�?Ё� s?ܖ�^W�?���|��6?�>�F��?����{+�@FIQ��@M�:�@���匦@�,nR��@�r~�@�ao\^@"���(R@&��,o�@+a~H��(@0/Lm�v@2�j��n@6 T#(��@9W,d0;@<���)h@@u@�i<,@B�,F��@D�u6�@GNˌ2,a@I�׷��D@L�<�n"�@O�����@Q]�[\�G@S�D�[@T�?A�y�@V�\NH�@Xur�R~z@Zt�23@\��D�@^�C�j�@`���{��@a�dG��7@b�q�|��@d5:&X�@e�C���B@f�WX/W�@h[h�7&@iמM��h@ka"rlľ@l�{#�@n���HF�@p'��eE@q��Cx,@q��;V�@r�՝�J@s�{�C��@t���"@u��'M@v�R!��@w�0	�s@y(��@z,�%/��@{V�W�E@|�W}2�@}��V�z�        ?þ"w�w�?�yWg�^@��x�7@����~@$ك�"�@/����@6�
s�H.@?y����&@D�[��@J��d��@P��� �W@T]g�ص@X���AWi@] ����@a���I@c��2� �@f��h��@j�F��@m�v��BH@p����@r�l^�m@t����@v冽0�.@y>�4���@{�k����@~SRr�G�@��֘�3@���N�Hg@�w����@�o�<�@��22to�@�_|��5@�%v���@��Iw�@��eB�@��&�#��@��ƳI�C@�	A��@�#�e�8@�FvB�\@�si�;��@���<�?@�꨽�@�5;�,�>@������@��	�g�@�R�����@�Ƹ/o�@�"Ѩu� @����"@��+Z�P�@��/Q�f@�W���gY@�3'mT�@�0Ǆ��@���&3�
@�猿�/�@����o�@��28Qf@��Vn8��@��g ԡ�@��l���@��oKk�        ?f����G?�lB���?�=`���v?�^S�YH?��LO <2?؏��20�?���J��?�,Ʊ���?����Ns?��d@gX�?�F��	d�@ �299��@Z*ݏ�Z@I���@��H�=@��4�A @?�=�@X�}l�@�`�0�M@*_/���@���RT@!���y�@#v���x@%w��Ј�@'�Ӽ�p�@)˜NM�@,2��}@.����h�@0�0�z�a@1��+@3C/=Y�@4��R�@621��ߵ@7�X{�X�@9[��;@;� ��@<��b��@>�=T|��@@/Y�ƌ�@A"���<�@B���/B@C X�L@D*��n�@E<��O�@FVHeV!@Gw���*@H�b�z�?@I���M�(@K���S@LHi��^�@M�vȈN@N��w{�@P�2��E@Pȉ+D)�@Qz�@��@R0�Һ�S@R�Pw���@S������@Thb^Wn@U,�ភM@U��GH��@V��A\]�@W���Ĭ        ?jW�Ƽ��?��ȵz��?�Y=!�?�~d+�l?�hKє�?���0��?��4aa�4?��}�j?�j]��@H+��*@O'�@d�� L�@m����@Vg�Vp@"6�˽@&64�Hw@*�@-~�@/��w�@2��v�g�@5���.S@9@���@s@=��R��@@���r��@B��e���@El!���@H���Ue@K���@N�(�ph@P���s�*@R|�t@Td'kx�@Vf�czF@X�{Ӧ�_@Zɝ���i@]*�5H}�@_��U���@a'����@b���@c�7�g1@e��^j��@g�H�jC@h�{���@jy
6��.@lD� Mbj@n"ns�:�@p	Lܭӄ@q
�q�(�@rW�מa@s)t�J@tGI)|Y@un9�;ڈ@v��Gl@wكs�`L@y�A:��@zk�~B��@{����D@}%�W��@~���uE�@�����@�ð��
@���2�]z@�Rٗ��@�"ZH��        ?`q���֥?�(C�i�?���H͈0?�ڕ�e��?��2�ء�?�R��z �?�D�R�P?���5?���+�O@wߨ2�@�Ǟ���@j��m@N�H�/=@��k��@ ��I�9@#��[�b@'��W�6M@,a��Ͱ@0ě>��@3�c
��V@6���(R�@:*�����@=౜:7@@�2�Ơ�@C���e@Ef���W:@G�7T��Y@Jy9�V�@M>{>h@Pk@��[@Q���^�@S>���U@T��-�x@V�T�a�@X�u��Ul@Z�P�'�1@\�	���d@^�ȭ-�@`k[f5^�@a��h��@b�c��@c�7���@e6��}vw@f�ݼ
z&@g����@iBE�α@j����J@l,E�f��@m�+t��@oC*�5��@po��^,�@qC�7�?�@r4��@r�8�A@s��,�@t�$c�>�@u���
+@v����a@w���LJ�@x���@j�@y��x-��@z����3�@{����1�        ?�܁���?��z <S@K����@� #{�&@#{���@.�)��@6�G�X4�@?96�L�@D�̦TOQ@J�|ǝ&�@P��ó@T{oK3�@X��9�%�@]f�$�@aDd�0$@d �4��@g3�9�C@jP>Ø�"@m��I�@p�͢�@r�6�8�'@t�{-���@v�����@y/���p@{�X��S�@~�O�\@�Vo��&@��=���@��L�/=@��P��z�@������@���=VoL@�N��x�3@����[I�@����H�@����.�@�2�+�m@�'m��b@�#�¦\�@�'A�@'s@�29C�@�D�j�1�@�^U@&��@�z�u(@��Co>@���_mr@�/R�Rq@�M��Z/�@����Г�@���'j�@���_��@��i��\�@�y����@�.�n*�f@���s��@���$��@�a�.���@�$ZE�]�@��>�Sc@��p��k�@�吩PW@�O��;�@�"e��}�        ?_�l���?�rE/W��?�h)�>�?�U^�4��?�3dr�~�?�8��?�
�e���?����Z6?揿� w?�E��4�?�W��+�?���f�x?��Z�^U�@ ���Py@�~|�@ f /�Q@
�'a�¼@�3�Dq@e���&@�W@�@�~�5@�M�L$@}-:�@l�睎Z@ �Ӛ��X@"g
�`�+@$ !Vx�@%�1��xq@'�\�>Ё@)���u�@+���s@.	�Y��M@0$K��ů@1O�6��@2�4�5R]@3��r�֤@5��۞�@6l'�o��@7����1@9>�z�{�@:�H���i@<>Ϭ��<@=���$@?kN��5%@@�{�FP@Ab`�"@B@�4 )�@C$�M�<�@DT�S'�@D�����S@E�aÛ��@F��4fa�@G���+�X@H�����9@I�Eh�:@K��{@L&�Q*	@MCr�#�@Nf)�B��@O��<�f�@P^�P��]@P�����@Q�'���        ?X� -E?���ޓ(?�gok2�?��6b��`?�ś�:7?נ����t?��'Su��?��Y��V?���"�@ N��e�<@i2.	�@��T3@���@@�����e@6� ^x@#BJD�	b@'o�	s�@,+"!\�@0��=r��@3���/�@6�#Ѥ�5@:�-���@>��O��z@Ai:����@C�=���H@F=�>nH@H�tOU�@Kъ�8�@N�6��@Qn��0@R�̋��}@T��:���@V�K��)@X�
��@Z���@]�[��@_d�rhlF@`��7WB�@b7Ym*�D@c�ʈ��$@d�V���t@fh.v�@g�;�Ι@iz�M�
s@k�СX�@l��fZ�%@n���SEl@p(*�:&z@q��	�@r
���{@sK�@t����@u�ti~@v,%����@wH:�3=@xlO+���@y�t��p@z̻z4��@|	2��?�@}M��ɖ�@~��/9��@�XA%��@��]⅝        ?S����8?���a�?�5~�G�?���g���?Ą%/ޫF?ҿB�u?�M��X��?�q�bvI?�����?��u��>�@�'pxm@�C�'�E@�l=�5@��n�`�@���3d@o;�T/h@"�T��\@&>	T��@*l��ڪ�@/��ZkN@2�ߪ�@4��<�@8���ix@;_�l�1o@>�2� d6@Ar�s؆�@C���z�@E��rҢ#@H(��AD@J�E�N��@M^$	N�@PIV':k@Q�}��@S(}��!�@T��v�oT@V����@XT}~E&@Z6+��m�@\,>o�@^6�.��@`+ ���@aD��
�@biS�`Y�@c�(��R@dр�_0�@fi�[@gc�s4Wp@h�Jw`@j ��E��@k��ď��@m	�U�*@n�[�d�@pH#��Y@p�]O�A�@q��W��c@r�^���@scķ���@tG��H@u/�@v���H�@w��f�D@x�r�5@yKGF�j        ?���\K�?�`~�˖$?��CpT�@Ϧ]M�@�<�b)@��s$�i@&�#���@/�6���@5��&OD�@<��@AȽ�5�|@F���s@J����@P2�y40@S6��˚�@V���K@Z-�ڈ�@^#���>@a7`��G@c��IW��@f�Gs�@h�k~[×@k��(o�@n���1�-@p�z�rA�@r���Ԟ@tO���QS@v,nXuo@x ={�V8@z*��ImQ@|Lf��j@~��ԉCg@�i����$@��[����@��/}��}@�#��@@�w]��@������8@�?�7��X@��K��p@�3�v�M@���ÄBE@�RwX��N@���`dѠ@�����@������y@�����R@�m�M���@�X�'���@�H�:8@�>d�+@�9}�r
�@�:u!�@�@0���@�KӚ��@�]'ڗ�@�s��C@��;���@��M"�&@��	@��@���N/�@�g��Y�@���4
V�        ?W�1�K��?��)�=?��IE�$�?��;�C�?�S�����?���ނQ?�*���\?�/�b6��?�N����?�C`�?��f��;�?��c,ͅ\?�n���?��-���?���=	�@=���@�FwK�L@�]�x��@	�T�v�@{߽���@��Jt��@��1�(�@ĮhjX.@�}��@y*M9��@	މ)�@���$n�@ �j����@"N�yN�@#���'n#@%�G�8�@'D|1o1@)��2��@*�,���@,�����@.�:\W��@0� *���@1�����@2���(@3��w|�@50��Ź�@6r�C���@7��9��/@9 x�~e@:uK�Ê�@;߷I�f@=T?\���@>��ߧ@@-�^c@@�0j@Aś�ǏW@B�񂸲@Cq�E���@DOQs�R@E1��H}I@FT�-��@G"�aq@G��'	<@H�槆x6@I� M���@J�@�ݏ@K��.�@L�D�H        ?S�V3T?���%�J6?�{��I�?������?�XY+K��?���:�3?��!�:r?��*neo�?�'�_Z�4?��X7âz@�Q�h@
���7�@�VE+{�@�{�e"@fU[�Vj@!�~�F#@%t^�~�@)����@.�W�I\X@2(�]�aT@58Vg���@8�i\}�@<H��j@@'���o@BW+���c@D�����H@G>�Ml�`@I�,X��R@L�J�)@P ���=�@Q�(�5
�@Sku���@UHb���@W@u?�g@YT/��i�@[�+\�T@]Жe]��@`����@a`����@b�ZV��F@d;��T�@e����b@g�����@h���\�@j9����V@k�#�Xy�@m�!�I~�@o�H�6@p����@q�4N��)@r�I�j�@s�!9<+@t���3`�@u�n�1�j@w�I�@xC�<#F�@y|���q@z��y[�:@|
\�ye�@}_Cgj4�@~��B��O@��K�9r@�ˌ�J�        ?Lr��̢?|)�}P:?���ҋ��?��V��P?���;��?��6�s{?�j���q�?�(���oO?�'4C:?��� G�@�i��@Z	�x'@�Ú��@��#� @�����@�9.0@#���;w�@'���@,	*Y
�@0���@3Q�a�@6a��1�#@9�O�f:�@=eP�Ԉ@@�t��S@B��ײ�9@E�f�^j@G�:9�{@J8��� �@M��c��@P ���<�@Q��Ve�@S?��5�@U�t�@Vۤ��8J@X�Oֿo�@Z�J��@\�C~2 @_4!�ȯ@`�̃<�;@a��g�@c=�&�@d���
��@e�*`�rj@gR�����@h�*k�@jL��<X]@kݎmdH�@m{�@o'��_�@pp��_�O@qTO5�`@r>�^�@s0"��&o@t(��^
@u(y/��<@v/mt�m�@w=�as@xSF'�!@ypQG��@z��y�@{��3�@|�ں�1�        ?�1�\�u�?�{}�,��?�&�a��?�� �[m@R�C�@o��SN�@D9'�*@"��ByZ�@)[��?{@0��}�@5N,�zx�@:���3^�@@[��s��@C�޺�@G��œ�@K�^!�U@P3U��@R��LxHX@Ux��	Ǭ@XqH��@6@[�6� �@_�HnH@aa���5@cX}���|@eo�ՠ%@g��0�u@i����@@lw��g�;@o<��|h@p���|�@rY3'�1@sۗ��o�@up��>@w�~�@x��&�@z�36m�"@|y-���@~i��^/D@�6�;$?k@�A���H@�V%�V�@�t8*��@���Z�J@��@sZ�]@�S�e��@�M+�B(@����>�k@��FD��q@�V��W@�������@�8���f�@�\o���@�!h��*@��_��[S@��Y�믻@��]h��v@�gq��L@�E�
�KD@�(���#@�g�}�@����i�@���)�@��B���Q