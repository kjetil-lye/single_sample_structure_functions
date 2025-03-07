CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T112243        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?`��3�k�?��&Q��?���.m?�2��&�?�&"��x�?؄o3�Zj?�D`�ߴy?�%���[?�7'�+S�?�b���]y?�b���ѱ@�:��8@��!ѕ�@	�vAI�@�G�@G��\��@aD��H@���@��1�Q@ [8q�gX@"�п� �@%
|U>y@'�? I��@*}��*@-�Eb�>@0]�cƷC@2t���@3�{�% @5ю[��@7�+_B�D@9�π�ff@<<�;��@>����q�@@�Ǌ�.J@AՇ�P�@C0c��m(@D��~���@Fȕ�z_@G��E3t@I8�w�>F@J���\;@L��be�@Nf[��H$@P�%|@QF`���@Rb��Cu@S�~S�@T .�s�@U*��2�@VA�9�G+@W_��
�@X��	��@Y��bb�@Z�5ŕ$I@\dz�h@]_��_(@^��|v�@_�^���_@`�ӈ��@aUd�B&@b]��k!@b��/\�7@cu��٥!        ?k�J?�w4��1?��l���?ʹ�Z�4?�+_�%?��qFC.c?�{ ԍ��@ƪ�m3z@�q���@���yr�@{�9���@#�H��L@+1v����@24�C.+@7��t�j@>���4�@C��XUb�@H�2n�@Nk��Zf�@R�{-j2�@Vl���5�@Z��λ]I@_�g�(�@b���%@e����;�@i�U��@l��O7�@pi�f���@r�`i�E@t�N����@wz����@z-�&�W�@}����@��]�b@�����L@�]p�N�@�(��/�@�7y�S�@���`�t@�P���@�CW7��<@���a�"@���� s�@�,��k@<@�t��0��@��X61X�@�*�.=#@����@��@�t�:Ŷ@������@�5����@��<?0�@��1�)	@��o>���@���m�'�@��]���@�y$8�=@�z���j@��;���.@��b�O��@����f�@��1�0@���3X@        ?O�Z��:�?�(B"�?�����A�?�F����a?ˏ�k��?�P�>X��?�iǿ5�?��G�E�?������@����@�!G�7C@�0f�'@ ����@&��x��1@.&{���@3�֓%=l@9LP�߿�@@ �D4��@C��D�@H��2i	�@M�5��I@Q���,@U<�%�,@X����z�@]uh�<�@`�˨�R�@cM���L�@e�ٗ�[q@h�1r�@k���[0@oT��ن@qq�|�*�@sV~���6@uYc�G�@w{^�aؑ@y�v�S.R@| � ��5@~�c��N�@�������@��xۙk@��q+�@���]*�@����=@�m�@�8o"ztY@���z;@�ol ��@�50���@�#���R@�CM�P��@�o����@���5v�@����2�@�B܏4k�@����o7@�t��G|@���ZUSR@� 1��>@������B@�4\����@�G����@��@ɢa!@��kR<�j        ?�t!@#FwGJ&�@@��ע�@TG�I�V@cQ�5�(@o�!�I��@w��jd�@�
�F�D�@�2� KI:@���hQ�@���kA&.@�����z@�HkT�4G@�m�h{��@�+�q]�@�h��yH�@�0~�+�@�F��]@�E0�M�+@���T�3)@�<�'|�@�e�T��@�E����@ė�+�@�j�5�@ɹ����N@̈N�ҵ@�R���@�O���<@��<��a@ԭ67`�@�{�%Y@�]��&Y@�Um�cH@�b!3�p@ބ�n�@�]�vK$�@�ӭ�N�@ⴙ���@���]�Q@�5J��L}@��䗝�@��O@@�A����i@�4��T@�%���@�� B��@�/yb}U@�`��q*�@�.���@@� y���d@��~z�G@�e��B@����@�p���E@�V@o���@�?�h�q@�-tMg{@�'^7��@�+��C@�G#V@�	�*���@����t�        ?��Н��?�"�ޣ�:?�y<3�?�q�G�F?��y�Qp?�,}�s�p@~��@�+-Y�i@R��q=@H��!@Dq(���@���l��@K_��?�@"+�td`�@$����c@'�$� j@*���wR@.�:�T@0�@F��@2���V@4���`��@6��q��@8�l��F@;>�
N�@=hcs�
@?߅u;��@A8Q1���@B���<�@C���W�+@E`(���@F�^���@HeM^�@I����^@K��Z�@ME�xN��@N���77�@P^Y�N�C@QC� ���@R-����@S��	B@T�8A@Uz)[��@V/���@W�]i�G@X����@Y4�LI1@Zh�g�Y@[(#�	�@@\:H�c�@]O����A@^hz#��@_�g�Eܝ@`Q�o�0(@`��e��@au��٢�@b
7���@b�t�y;3@c8}��w@c�ab4�@dn*sq?�@e���@e�����@fMA��V(        ?G�Pf��a?z�Owi?��܇D��?�s<����?�VBI�?��2���?�4X�Q�?����;�?��ۢ��?��Y���0@��͚��@=���2@�sE�LR@;F:�a@$]O=���@+h�5�@1�'�.��@6�yj�@<STݖ@A�7���@E�!u�@J�~H��@O@� ��-@R����C@U�l�êE@Yp&�� @]t��E�@`�7��p@c\&12��@f i�|}@h�N�S��@k�!�s�:@oV'!�.i@qyP���4@sih:?��@u||��t�@w����4�@z8
α@|�;�`�@=�a�z�@���}_�@���A���@���?�p@���	I�@��f�}�~@�dɲ��x@�W�B�E@�d9 �P�@��Ƒ��@����S@��ܙ%g@�Q�1��@����f@��gOP@�a@{���@���~�k@�d���v@���@���@��-�Ө�@�f��t��@��g('��@��}~�y@���d{��        ?���/Ж?��M�쀦?�߶�dO?������?������@���g�@
YK�|l@���@������@�s\t��@"	�07@&c�:��@+��PZ@0�P(	�@4��n[�1@8�&���@=���P@A�%��b@E%�z�Z@H�ԹH,W@M1@�@P�
���@Ss�{�@VJ����i@Ye��2�@\�W�U@`8��Pt�@b3++��@dT,wH؋@f��4�fr@i����X@k�]���@nm�K�R�@p�{:�@r>����@s�DV��@u��d�(�@w{�H
@ymH=~߫@{y�v�%c@}�#�7�@�O͉8@�% 2l@�e�z��=@��m"�G�@���B�@����#@�	T��@����ˆ�@�=��}��@��8_Ϯ@�����;@�E����@�9�3\v�@�64��A@�;�mT;�@�J�?���@�c�mI�@���^,=f@��9�yk@��܄��@�)��[i�@�uھO        @eQ�V@D�
įv@`���r@p�����@{��d�@��V�f�@��2��|@��M�@��ߋ+#@������@�CZԲ@�G���@�w�0Ϻ�@�՛3�O�@�b(E	��@�2/x��@��Z��@���.x@�<���R�@�X���@��\ZŲ�@�T_s(�@�s���@��4��@�-����(@ĝ���#~@��.��@@Ǥ&�Y�1@�:�k:�@����|,�@̍�`N�@�JV��X=@�	�����@��=����@���Utb@��u�0�+@���]��@��Ss�A@�⃗�@��yTX$�@�!��]�@�dS��Q@�<"�{3&@�`:�C�(@܉�Tcb�@ݷ䦈$ @��3i��@�����	@�/�1/�@�Q":
e@���5�K
@⚙oć@�CNQ�k@����lC�@�l��Ǝ@�O<D(a@�!���@�i8�U�@�z(е6@�:�ǐ�@����\jS@�ȵxY)�@��2��K        ?x���2l�?����8�K?��wʙ$?�D.���7?�1�{��?�(��;>U?��hq_�P?�N�!�x�@W;�@.���h�@�U�1@���d�@}��0@���`1@$	����@!����<@$E 
���@'56���@*_��i@-ō�h"@0�T�C?@2���/�@4�U)L��@6��|($�@9(��8'@;��m�Y�@>!�m'zK@@h���ϫ@A�BcI�@CK����@D�щ#�@Fv����/@H'ЅJF @I�_�ʕ@K�s<1S�@M�	j�,1@O�Sj{7@P�8r�]@Q��M3W@S�ɍ>�@T#��⦎@UN0A�3
@V���G�@W�j�Z[@Y�z�@ZNIu�
@[��~!;@\�\o3�V@^cɺ@_����@`��@a^	 �@b��J@b�#�:�@c�V�ω�@du��Ml\@eDKX�r@f���.�@f���Wi@g�:�#@h�F�3�@i�Ä5&@jh�B:�        ?iQ,�??��7��d?�b�.?Ɖ�!4<�?�QWJ?������z?�	=R�?��e^P?�OA�;�r@c謴��@�x���@�I���@ᥠ2)�@!�d��k@'��I9m@-��6Ӊ�@2�F����@7o����h@=4��>p@A��_� @E�4�>�M@I��v6@N�o7tu@RU��*�@U�l �x@YH\7h6@]����,@`��m~@c��Uq\@e����N-@h����@k��' ζ@o���4@q\C�2��@sN�F*b@ud;�|@w�a��g�@y��;]@|�b[ b�@2�͘r�@���l@���w�[�@��not6@����q�@��5�� @�ij�Q�X@�^g��r@�l�mH��@����'@��]�a@�'#�D�@�[����j@���3�s�@��HV��@�p|st�@���7`�@�v�Z��a@����C|@��C��[@�x�n��@�����	�@��S=i��@��]����        ?N�5���?�:�Jy�?�2��y{�?�lZe�ď?�l�+	d?Ӭ*��dN?��]�TE?�
t0�?�X8�jU?�E}����@���g��@!��0�@�ȗ:2�@vFU)�M@#��e��!@)�R�|��@0���/@5y�U_��@;�"$#@@Ԁ��`A@D�lkE@I*��/@NL���x@Re���Q@U\nRz�@Y���ϩ@]'�{�|@`�dP>�@cXl�~u@f5��1|@i�N�)H@lI�AD�z@o�D�)�3@q��3~G;@s�-u��9@u�2��!o@xD����@z���)��@}Z2�/��@��3*�K@���/��@��$]�@����/�@�y��n��@�Mx$��@�9��֑�@�>�J��L@�]�]���@�K�C5\�@�v�f��@������|@��L�@�@�N6鵴�@����@�+��g��@��Z��3@�LDG`&�@���4��@��UX-J@�B %5^k@�3�B���@�/Q	H/Y@�5,wU��        @��y?�@0�Y$5@J0��B�@]G�Q��@j�«�@t�#�K��@~G�m�|@@���C�d@����-@��#�:��@�\��|@�x�0��@�����)�@�ɮCt�b@�P�uY�_@�3�l@��@�w���@�֪���@��e���`@�[	�� @�W��mAU@�����@����l�@�h0'���@�l��=�@Ɨ84h�@����Ik�@�c�Ӯ+@��Dlf@�k��xcK@����@Ӏ����@�.����!@��J�5��@��Ẉe@���v[ʢ@���$k�@�8�� <@஁�xn@������@�#���!o@�sz��e�@����PY@�?
IlS0@��I�Z�@�EI�"<�@��~@�@�h�Y�@�=2�s�@��0�>�@�kB��>�@�\�;8�G@�U�vɒ@�V�Au��@�_�Lq@�oM��J�@���|E�@��ܥU�@��U�x�[@���q�@�:Hd~��@�|��x�@�Ǝ��\�        ?Ts�0;�X?�7�|{4?�9�Y�.�?�;/�d*�?�b���?өa2�?��i�-�?�ԿT�y?�v[��`?��Z9w?�9}l�?���Y� �?�Q��dU@��L� @�G=U�@	y	^7@fq4�/{@ג*��@,/h���@��J,@qi�Ӎ�@g�Px#@�ģ��@!GωD�@"މr�5�@$��D�5,@&���i�@);�/ R"@+����A$@.2��@0s�rW"@1�w`½@3e�c�b@4�H2��@6�n��$@8p��4>@:KJ*�@�@<<����o@>D��v.�@@1�	@AM%����@Bs��D�l@C�l��@D�ߖY�@F.4y��@G��܊q@H�r2��1@JQ䰺�@Kɐ�?2U@MM�DK@N���6@P=[y/�@Q&��@Q�-�z�@R�2|�@S�0�S�@T�+7W�@U�,���r@V�K݂�S@W����@X�NOu�@Y�j�v�@Z���݆        ?d�xJ��?���c� ?�_��/�8?���a��p?�[�EM�M?�f_W�j?��Y]��?���;XZ@0G��@����,@x!c�	�@=��c�<@OȔ��@#�%�`��@))�޳Y@/3�?��Y@34P�	$@7i��y@<I<�M�0@@�kI`4g@D"�𕿟@G��^w�@K�u"c�@P+�D�[@R�0Sd�@Uw��c�@X��?�-@[ݐ��Wf@_�����V@a�_3�c�@c�м�b@f2���@h����4@k`�+��_@n@��L؅@p�kw<4@rOM:��@tg���@u�[�}W@w���޿@y���2N@|8P�&�@~�A(�@��o*���@��X�N9�@�2���@���@��@�'#ֶ�@���\�=�@�e�`���@�!��5@��v J�m@��D��@�f�bE��@�m=��,[@�~N�Jn@���Ge�@���C��@�� O}}@�/��7E@�xO0U|5@��|���@�,ye��        ?.j@���?b���T%?�S�TZpd?�Ӡ���?�V^�X�M?�H�<�=?�Z��"�:?�]܎`c?�N�ѕft?��R�^?�H����@w%��@���:�@D���g8@ �f���P@&�t���@-���Q0l@3ij��m@8ͭ@�W�@?<�ec��@Cj^@1��@G�F'�@L��c[��@Qp���@T��3��@X��^��`@\��7V�<@`�,�/X@cm݊���@fT{c�>e@i���q�5@l�|��=�@p`v?F��@rj�Jڽ^@t����+@v���ۺ�@y��iow@|3@8v@���+@�s�<#@��?ք�@�`����z@�-uo�@��E�s@��~�@�(�f�hx@�ZGyy(@�S;H�@�����d�@��&�x�@�{�܌K@�u�rm@��6���Z@�\*k�O�@��;b��@��AUȴ@�(��1��@��;P�<�@�U���9�@�C*:���@�8��zhF@�7[cQ/!@�>�pG�        ?��G��d�@(�L\��@8ֺ�n7@Lψ���@Y�$!e�@d3۽cH�@m!�4e�@s�fg��@y���<��@��ʟ6�@���a�@��kM�^@�f1��@�\�ԡ�{@�橹�7�@��{N��@���n��@���_�
@�}j@�Rpl\�y@�9���"�@�@5݉jx@�fd�b�l@�����Ka@�a���e@��N���@�����i�@��63H@��f-ϓ@�$f��@��$@��HYA@�O��i �@�3*����@�,��L�q@�Y	�5�@�1�n�G�@�QbKt�@�{���~@Ĳo�_��@��zFVr@�A�ſ@Ț���@��l�p{�@�m#t�nQ@��M�u@�j��Jט@��>oL,@��`3փ@њi��Ͱ@�p�A�5�@�K�)K@�+j��%�@��*Z�@��3��\@��r'�@��9谏�@�˒��_@��"�#<�@���F�I@��p㋡@��jKqf�@��(�s        ?P�f>�Y�?����]?�p�S��?�+faƯp?�>t���?�v�?Ni�?�s	[m?�\+��/�?���tR1?��þ���?�4j�:�?�?�%�?��m��"�?�O:�2�@���~��@�ęy�o@	����@���gb(@��h*@Jk4-�@�P�V@�}���)@�O��@�9C��x@!"�B{@"� l��@$�9��D�@'��p@)I�!�V@+�����3@.1��6H@0o�/��@1�E�g�J@3X�!;+@4�-�[�@6�O1=�h@8N�3yp@: ��ր�@<	�#W�G@>
ǋ��K@@M3ݨ@A,A�\��@BS��@�*@C��Qu�@D�.�6@FYg�Or@G|nFͲ�@H�X}X�@Jd �V3�@K�O04`�@M�,G���@O%��&6@Pk(:�/�@QJHi�_;@R0%�!�@S�l�4@T+q@U
8u䭯@V�J�4@W��֪�@X!V�� �@Y6��)�@ZS&a�l        ?J.�'7�K?~f�/1�?���gǫ�?�ʄ�:??Ⱦ]�6�?�r��?�.�c5�f?��I��/??��B*H�@�fQ@�!�i�@X��k�*@"�W疓�@)ۭR̍�@1yݺ�Q@7 ِ[	�@>�S>@C$��w-�@H<���@M�K�f��@R��}[�@U�4lEJ�@Y����@^u���@a��W�N@d{B�Ȇ@gr܌�G�@j�U@n|��E@p�5�V�S@r��h�@tۿ���@w͌�8�@yUUHB�@{���	Ӡ@~P|{��@���n��@��y̈�@�k��۹�@����#@���j��@�k!x(j�@�D�>\{�@�8� ��@�Gb�d�@�92��m@�]u?=�\@��_aޞ@�ԡo��@�(���0�@���ʵ��@��.�H#@��Ǣo|}@�)�L�G�@�����-�@����	@�9ߖ<�G@�0L݌�F@�1��|ɔ@�>�R�P@�U���@�y��:a@��*X?��        ?5�Z���?m���;&?���G�!?����o�<?�M��m?��n��z�?�3�*�{�?����[�@:�69�@,���P�@��f��@!�� )�O@*(��8(�@2m"6(�@97!�lѾ@@��ē$�@E�#�
�@K��nM@Q�M��;@U�U&1�@Z+��@_QNԙ��@b�\*���@e�-���@i鏧@l���/�@pK���'@r_g\o@t�$ ��9@vߝ� ��@yIp!n�@{�1���@~i�4+��@����Jl@����L�w@�d&kV�@��eU�o@�e�gS��@���0µ�@����/�@�<�$�R@���0h@���3�"@�@}�x��@�/�ş�@�%69՚@�#>m��@�)i��0�@�8����@�Q�����@�to��g�@����5Q�@���C`�@�{Os�C@�p���:@���g��	@�:��cG�@�Zs���5@��տ�q@��0M��r@��lm"z�@����{r�@��`$��        ?����5�@	�i݇�@(�OW@>}� �~*@M�[e��@YW))�^A@c�`�x�m@lR�6�Y_@s��@z ��r�@��c�7p@��aA��j@���|��@�� 6J�@���T7@��vp	t<@�Z(���@��:LX�1@�T�'��v@�L�ٿ@@�����B�@�A�]��@�p�x�y@���Q�@���A�T�@��cU��@��Xm���@�Q��5��@�2�w]��@� 뀡r�@�� 5��>@�wq���?@�GX[��@�0W�׿5@�3
��B@�P1.�S�@Έ�QӅ@�n��$ �@ѨJ�Vg@��<#�`@�Jt��f?@մ�p��@�0�V�M�@ؾ�uG@�_�8��@��r,�K@��p�!@ߵ���e @����@�ҳw���@��"�@��M�"��@�9�2z�@�:^���J@�m�T�X@諫�*��@���VRe@�F��CtS@��`ƚ�@���@�~W�@*_@�}�c3��@�A�<��        ?n��1?�JNA*�?��։,�\?К�% �?޸"m}�?��xG���?�K+4��#?�e��F�d@ ۣ��;@�1��&@x��t�@����Z:@�n�� @��]J��@���?�@ ��@"���D<�@%0Gri�@'��Ԛţ@*�0C�b�@.���ƺ@0����@2w�P���@4X(�!�U@6RF8��@8f��}��@:���� @<�O�@?G��<�J@@�T��#@B8_���@C�x��n@E#�\�@F��opYx@H&(F�Ɛ@I�o�B�@K�'	��5@MS�z�S�@O3��k
�@P�����@Q��!9�j@R���
��@S�ٙ�-�@T�
}� @V�?  �@WLY��*�@X��k�H@Y���@[C����@\����;�@^(8�^��@_�(1�~�@`��e�g�@aqY��@bH��%I@c'�#��F@d�O��@d�(h}�%@e�fE�{@f�j#�O�@g�H8h�@h�P���@j���<        ?)g���?`D�����?��l=q��?���4R?��j<3?��N��e?��I�od?�{�e���?����x�?�W ~��?��0̢ d@�9Ԑ�v@��q�Ѝ@���9�@u"A�<�@%Q�D�f�@,ILG�N�@2i@{X@7�P:��L@=�ײ8�L@Bq���@F�>��l�@Ku��N�@P{9�\�@S��&/j@W��뱝@[��'�@_X����+@b ϊMk@d�I@���@g����K�@j���M?�@n?�U�@p�5�n�@r��^�@t�����@w-����@y��N��@|$��^�@~��'�X�@���(�N@�ew\y@�W�m�@��)��Ik@�~��7@�_{Y��~@�YSg�@�k7��[!@������@���T��0@���?@�Z����@�������@����($J@�f�oG�@���D0�#@�b�(�M@���%ϕ&@���PGa@�RG�=Z?@��<S��Z@�w�R���@�la�e�        ?d�m�g�?�T�Ie��?���I��?�5�PV*�?ڴK��?���Y�?�8�P�?�u�J�@�p����@L܇��r@��w/�@�B2���@!�[Q�@'�?鞃4@/��Is#@3�	��@9biz)��@?��JU*�@C�ɝ\��@He���_C@M�"M)L@Q�<cJh�@Uud��-@YvR(@]�}~|��@a��� �F@dU����|@gs`p
O@j�{Cq@n��R��@qZc5~�@s�wGHu@u�YU��@x��Z܈@{Cev��@~2SA�L�@��Є�Z@�Q�jB�@�Kn�k�@���m�@��n/R}@��3~O	@����j�@�^y�zC@�_}X�"�@���x��@��+���@�FG%̖@�������@�*� 3�@��x�q�:@�N$� @��3��-@����D�S@�~��
��@��!��ܙ@���7zl@��r#�kh@��t"x	�@�����l�@��#�!L�@�6���o@�9_*���        ?�t�$�=@%����@C��7@WR��No@e��M�2p@qmŜ3tI@y��7�@�������@�f�X�)$@��%ѭ�@��u�K�@���,��$@��zO}@�����cK@���R@�w@����(L�@�������@�)�tW@��t���@��2�my�@��^��U�@�=_�@�Z���@�Ҥ�Ƞ@�o��Ÿb@���@���@�j�@�����`@Ļp�xJ@�sf�)@�BW��[[@�*8<#��@�+b<cv@�F��3m�@�>)�$�<@�f�36��@ҝVr{�L@��M�+]�@�5�r�`�@֘��[@�
��/$*@ٍ���f@���VU@� �1�7@�vݦ9��@�N�&�[@�
#� 	�@��"*�D@��~v4��@�k`��@�f�S�@�2���K[@�Xa�I@�U��=�@�¾u�T@��%*+^@�W럀4@��?�Ɯ@��-e@�Fa�.�@���}M@��*��@��O4`�        ?������?���{S�/?Ѵ�(��?��-?��?���y�?�M��c��@y%-AI@��L��@:���R�@��R�@jZ�\��@!)�%еA@$d�ho�@'�$ O_�@+�����@/����P@2�*8D@4P���U@6�YdS/@9P��@*@<�Y��@>�Z���@@�j��<@Bz�=��@D��ք'@E��Nz@G�Y$x�}@Ir��NF7@K_���2~@M_���W@Or��a�z@P�.��@Q薼�}B@S�+��@T>�#�M@UxH3A_@V�s��@X	։Ai�@Ya����@Z�;q���@\.���M�@]����X�@_")P6�&@`U��&�@a��L@a�� �*@b����a�@c������@dmP�.[@eLt�	wU@f0)���S@g~#mF@h�Lz@h�Dw�s#@i�Щҭ@j�/����@k�f����@l�v��+�@m�]��!�@o���@pO~�p#@p�x�^l@q(^A��        ?x�D�f�c?�$�n�1�?�'���)?ܒb@�H?�.[�r�?�8�Z�|�?����0۸@���-�@�Wb���@������@��T��@"�� ?!E@(D�hl@.�MC�@3hU|�@8Hl�}!)@=�B���J@B<�5��@F�NK>�@JY��,�@O@��0�s@Ra~�ohu@Us�f&�\@Xڸ�\�@\���X�@`XAr��@b��-hEK@d�ߟrM�@g�r�P@jY .��1@mQ��[�@p=1�k��@q�>�3@s�n�Gύ@u��6���@w��x�@y�����@{Ж��@~�n��@�A�X���@���
*�@��LZ��9@�4��"P@��1ŗX�@�"T�Ip@��/�S�)@�P��B�@�,F��@���+C��@���Y���@��HD~f@����^�.@��)�^�@�����@����3n@��M���@�,�NY�m@�`�M��&@��k5em@��9sӑ�@�85r�Z�@���*��@��R�\�`        ?f���,G�?����+A�?��p?Ϥ�Q�x?ߪ�g���?�"�.��?�L�A���@&�o@	D_�EB@���I�@+��(��@!K�G�@'Z�	��~@/\Zf��@4L��7�Y@:.�����@@����@D�}�G^�@I��9��/@O�Ii�u=@Se�7+/�@WX�9s7@[�"�y��@`w�VX@cQ�sv�@f����Y@jB�b�t@m�{<z[�@q���O@sy�A��0@v
�{F״@x�:wϰ@{�)d�@��b�@�R�d�ϡ@�7wJ`x&@�?�� oD@�lњ���@��xt�w�@�<@��@�����z@��p� �@�X��3��@��>�2T@���u�a@�e�f�@�G�|w�y@�DK��5
@�\Qu�Z�@���pc�@���ą��@�(Z1�;*@�o�tK�@��>���@�+bq�.v@��ʤJ�@�(ԦH��@������@�jQ7�`D@�%�8�l�@����x?@��vx���@���zy        @ײ巷.@D��l���@bh�}S��@u b']6@�����D@�2R��G@��xU%�g@�®,g�@�d��٦�@�s�PM�@�c�P@��¥�@�m�&j�@�ӥ#�@������@��#A44@·f�4��@�ۓҊr@Ǆ���@��s���@�۰�׶@ϻExa��@�^�p��J@���B�@ԖR/��@�L�D��$@�A4q�N@���
��@����]��@�܃>ZO@��2�
@�	��-��@�%䡢� @�K��t��@�z��I�@�.�W�@����4C	@�Eȗ`@��ؿ;@��dz��@�l;�!��@���$�?@�e=��Ӝ@�x�ߒS @�C����W@��8  @��*x�NI@��e�3@���/4�!@���>��c@�pm�@Ea@�_U��@�R䫿F�@�L�ѷ�@�J�1�K]@�Naz��@�W�gO^@�fR���U@�zc//E9@��Υ�>�A YD͡/A �A�͐/A��
�        ?bSw6��?�,*��<?�M"�?�E-��i?ԟNC��?�_��`�?艤\A?�|7�u?��ļmJ�?������@@gS��@k�T�h@�m'�@"�f=C�@��'�@"��٧@����*@H�/�P�@ �F-���@"���YW@%,@�,@'����j@*a�����@-D��u@0+�{��@1�j7�@3�ÞYy[@5d.���@7U�gx�T@9`��m9@;�X�A�@=��t�0@@�_��%@AD��%��@B��D��8@C�?�Ü�@E6�U 	�@F��E6s@Hv���@I�oĸ)�@K,�_�@L��#κ�@Nvs�rY'@P����@P����Q@Q�$Ǥ�@R�%Y%��@Sʕ����@T�pp��I@UʹgkM@V�}����@W����zi@X�����@Z�nfF!@[>�b�@\j���{@]�~�:�@^�m��t@`�|��w@`��ʰ�k@a[�#��@b�e;��@b��n�7�        ?=�M�=�z?sIm8�]X?�;�Y{U�?�bZ��q�?�6��[��?��ez�.�?�s��>�?�^?B��?�7�h:��?�<ŏQ�;@2b"C��@
�����@�l��D�@�P�K;@!��/��@':O,@.7м�&�@3W��@8e��,v@>\��csX@B��Fk�@F���@KR"6�@PI��.�@SA\L�K~@V�����@ZI�!Α@^d�|�V@auv_f�@c�H��u@f��{f�-@i�]�rW@l���@p[�`p&@q�����@s�H����@v
�ܜJ�@xJЈR��@z�����|@}7ge��h@��>�)@�]��7.|@��G桬@�oq���n@��f��g@�����}@��!��5�@���T]8@�����@�������@���θ@��I�Ђ@�N�[Q@���Tx�@���:`�f@�;��D@��J�X@� �G5Ͱ@���h�e@�A�OEUU@��1<"@�PO��@�4$��h        ?^�c���?�V`$�p?�0� �?���z)ZH?�׋�ýV?�`A�H-?�)k����?����n>@ >�|�@5�R�7�@[?��ȷ@���PK@���$@$da���@*��Yt�"@1Dq��g@5�Y�+.�@;�U@f�@A*�ג��@E����@I��ē�@N�m�5�$@RSr^C�F@U�O<�;@YW�ډ�@]s:V��@`��-�ۙ@cy�ޜ��@f.���v@i`[��1@lId,)�E@o����%@q�m��*@s�;�d(@u��TRI@wٯ�-�@z'��n@|��,�O�@ �u�>@���9
f@�KO�d3�@��6Rr@�Dl�R�@��LCЁ�@�{�7U�@�.ƺ��k@��{�y�@����i�@��B)��@��J;R��@�͊�F�@���8�a�@��̈��o@�4��Y@�&,���@�R2h2�@��w�c�s@��KQː3@�MGat@�b�� �@���߀��@�(pԐ��@�NZB�6�        ?�AQ�k�@%D��u�@CK��5@V�HNv�@d�Z�ޚ�@p�q�R��@xؔ��d�@�5���@��oٍ�@�:�a��-@�AX�m�@�VJ*�N6@����C@����WC@���ޞ@��-Ǜ\Q@��16��#@�_�f^�@�)53�@�8�6¼<@�n�<�@�͚M�]E@�U�F��h@�� ks@��Zz!@����2zu@*yU�@�F�}�$�@���~s@��XpI�@���ZU�@��Dҳv�@�rH�&@�.E(�@�Y��Y�@ґ�z26@��"i�I.@�%�U��@փ��U��@�������@�g�9md�@��}�@܃�fhv@�'���	�@��4�/��@���8FZ@�$y�4@�!ը�4@��u��@䝮c0�@奊k�-R@浰�\��@��Uf'Z@�ﮪi\�@�����2@�M^�ZU@�"����@��u��K@� �I���@�=ID��@��cr��@�iX�>@�cO�,�        ?jIp�2�o?�O83_�?��+�T�?�xqƉު?��q�su?ᓲo��O?�_0/�?���S^�+?��-x8x6?�72�ء�@����IP@��ɡ�@�Ew��'@z�8��@P�t��@g8R�@�]1��@X�/�K@ ��oEd@"��q麂@$�+4y��@'˰ �s@)�/�m�@,/�j�@.�ܮ�\�@0�F�[��@23rl_�@3���!�@5K9�{��@6�%��6�@8�pu�h�@:tש�q�@<S곺3%@>G݌�%@@'JD��@A5v��W#@BNT��V�@Cr<�@D��4;D@E�H�H�@G#c�/}@Hv]���t@IՈ�C�&@K@���&@L���Γe@N<�Ls#�@O�����@P������@Q���e>�@Rb�:{NE@SB���@T(��ﻒ@U�����@VwU��n@V�c"�@W�{�);@Y ў�%@ZnZ��	@[S��̂@\3}$�o@]P�iX`@^tv��q*@_�(����        ?Azh��&?w�oT� ?�����5?��3�6?�E���n?�OԎ��?�s)9��'?�dW�)�?򦩖���?��i��ɺ@Z��h)�@����@ ����@�t��N@$��jKj@+�����@2����2@7[V� C�@=��'G�@B��x|&�@G �*�D%@L#���@QI���1@Ti�*z @X@����@\�#��@`��i8��@cf�Z�3�@f`�����@i��kOɱ@m<�n�@p�~�!@r���-ִ@t���p�@wu�k]3�@z(���@|�� 1�;@��߃*�@��~�M��@�S�z���@�%!�:@���[@��ҩ@�:�Cf�@�x툎��@�ӬGT��@�%����6@�p)l8�@��W���C@�1��`d�@��~�$]@�0�����@��֝��@�n�y�x@�&7C��@���w��@�b±���@�W�:�
@�S�UE6@�Y'�+z�@�f�����@�}v�rM@���9Գ^        ?.�Ft?a�t7^�?��9E�?��Y+_�?���=Ul�?���r~?�0�4p2l?�G�%��#?�����?����@1J/�8l@	�S.:'_@�Zw%�@�D��@@"gh@UE\@(�t1��@0K'�U4N@5	z���@:�8�1�@@�U��@D�Cp�Ji@H����-@M�{��@Q�Ǐl"�@TܜX��@XN��9�@\��n0�@`*|	e}@b\�؈�6@d��Gz��@glwO�@j>T	y��@mD2�r`@p?x����@q��{i��@s�<�A��@u��3?�@w�5�vtH@y������@|C:��C�@~�#,�,@��8���@��$�X��@�_똥��@��"�g��@�k_ 0A@�2=]/@��'o�&�@������@�qw	��O@�g�]�Ou@�����e�@��2���@����Q�@��{���@�CX(���@���{W
�@�ͳR*�*@�$��L[�@�����p@����D�@�q��e@���U?�`        ?�`(�U��@�I��`7@3�(�M�@Fo$��}+@T���_b�@`w��G�@h?�2^a�@pҳ�v>v@vY"zm�@|���-��@����#K@�і��@���.q�@@���9� 
@��s�=�!@���i@����@�_��W�8@��N>G@�_O �@�I��P�@��o�Y��@�
��@��?����@�\?����@��&��1�@� ����"@��Gq�@�`���5@�m<��@�����M�@���tYA@����`�@����&�@��Xt.�@��?��T�@�و
@�@�IB�5@�Y�}{�7@ƭ�.U	@�%�t�r@�~/� y=@��o_��@̅�:�!�@�� ��F@���T�&j@н�M}� @џj*=@҈nh�+�@�x�e���@�p,TM@�n���6p@�t��[J@ׂW�p�@ؖ�.��@ٳ�Q}Q@����T@�_���@�5i�K+�@�pu3�+@߲^�c�@�~&��&.@�&�\��        ?h�:Ջ��?���{�^?�wMŵ�=?��3��v�?�A~6K>v?�i�b'|�?�d�J��?��0 ��?������@�"q?�	@J(�J�z@k;��I@��*O��@�]���]@Գ����@^e8��@,0�@!�xXp|@#��$���@&/_"x�@(��>��@+k�[�&�@.Pr0Xt�@0�1�4[�@2WX��']@4 ��HK@5���G@7������@9�P�L�@<P��{@>S����C@@X.Ds@A�ϯQ�u@B��H@D4 l�|@E��k��@G�fJ�{@H����@J Ę��@K�58���@Ms�#�Zb@O6����@P���@��@Qw��@Rru��H@Sv�,C��@T��9\6�@U����H@V���h�y@W�3��@Y�zeo@Z]��?��@[����K@\���@^_6���x@_��W.B@`��:43@aal����@b'Ù�*�@b󵘪D�@c�M
�L�@d�����K@ey�����        ?H��!W?�2��?��9�P`�?�I&�6@?��~�q?�5Ț�~�?�|�CM1�?�!|և?�tj���?��c�gX�@�R����@F��elL@N�Q�@��ǲ!`@"���2��@(fK�6�@/��$)�@4B��!,@9�h���@?�M���@C�e	6��@HR+���@M`�b6@QeP��@T�C�2"@XX�H}Q@\z���@`����@c�[)�@e���*L@i�S)h@lc.g�&�@p�6�Z�@r$U�Ƃ@t.�Jmq@v���=��@x��y#�@{��� �@~�8��@�Áƚ�@�_J�b�G@��ߙ��@���/�##@�����@�����:@��`�"@�$[R���@�=`�J@�vk��:�@��UryLR@�=���@�z�)6v@��g�.A@�t�Kg,�@�	Py�ê@���Lb@�be�0Yw@�'f@�P@�~{I�^.@�q�����@�mE���@�q|-��@�~d����        ?a9�^@��?�K ��g.?� ��1�?�Ԍ׊�?��.C���?�Ph�z 8?��z��j?��%`�?�p��T@.�sj��@�
�X@:�9n�@��p@!1t!D��@&|���%�@- u7�ak@2s�~C@7,`+�@<�˙�!�@A�s:@Eb�
T$�@I���h�@N�Uk�r@Q�w�}@U�߬R�@Xc��s@\OA@`��7�@b8��.�@d�oU��L@g� �i@i��A�5@l�����0@o��7���@q�:���P@sDu@���@uhxn�6@w\�E@y����@{+q�Ȩ@}e8V���@�Q݌?�@�_H�@�Y"��5�@���<�@�4�cv@�|ר2��@��SY,a�@���D�H@�&J;`f�@�Ӌ���,@��2{*>@�/�J؋�@����J@�j��.�@�8��<@�%Wa��5@�:�	*�@�Xz��ʌ@���)�6M@����ݠ@����&�V@�8�+Ǚ        ?uі�@"����Sk@A��0b�@S��u��R@b��J܈�@m��aAwu@u�#L��@}����@������/@��TZ"h�@���˕�l@��XP^��@�*}�s�@�ݗA�p@�C����u@�j�zUԲ@��?�Y�D@��TgHu7@�h����@�|�}�C@��_W�x�@���U��@��� �@��*'�S�@�����NB@�S��:�@�������@���3"@��z�ZM@�]D�Y�p@��Yၐ@�v����0@� 4�ˋ\@����ĉ@ʭIS�}@̑ĩ��e@Ί�m�X�@�LU�ʟ@�]�� �@�z|׼B�@Ӣa_�D@��ӷK�@�x�i��@�]�����@س��#@����+m@ۄ�� &@��� �VI@ޅ�Q0$@��`B�@���T�_@ᳩ�v�4@␷��^@�tB	4��@�^W��@�O	"lG�@�Fj;��2@�D�D)ç@�I��[g@�U�J�q�@�h�pa�?@�rS �@줺	��'        ?LA���?��O߿?���NLx�?�T���D?���h�v�?Ʉ����?�2�QI�?���.�?�<�.7?籩$qN?��1y�??�|'Kl?�iM"�]�?��{ �?��M�9@cl�V�@>�����@ZIf�R�@����L�@`�g��@��~��@�]{��@���@�>���@0����@�/��@ ��`��a@"�/Gp�@#�y9i�@%���$��@'r��@)m�	�@+�� �Ѥ@-�-��
@0_z��@16��a}@2{�[F @3�Za^'�@55
L�;�@6�$���?@8/�e��@9��?��@;n���}S@=(g���@>��I�Gc@@hğc�{@A`���p�@Bbs���8@Cm�iǓk@D�����@E�:x�2�@Fɸ��,@G�����L@I7�	��[@J}F ��@K�$�ʔ�@M$c�#�@N��@O���H@P�����@Qq�)S>@R5AM��@R�����n        ?%/=�o~?b��C�?��dŗ�?�J���-?���N�ܥ?��^i��I?��z�hS?�2'�Ǹ�?�Os6}�?��P�@	C�6d@�Ԇx6@�s`�w�@#w���@*���pȥ@1��=�h@7����a@>C���(@C#�	��@G֒��D�@MG>�⼂@Q�_�d�*@UJ����@YD�m��@]����@aQ$��9@d�����@g xU���@j>"�q�m@m°�p�@p�Xok�@r�Z}�r�@u�5?\@waG�8D~@y��5@|��h)�@f����@�4����@��-|ˑo@�zܶ��:@�AB��6�@� 	���@��Ϳ{@�)~��@�U���l�@�NwZ�@��=`K@��$֗ �@������@�l�a���@��a��� @�W�
-�G@��#6�@���ҿ�@�3�t~R@���i}�[@�c٠S*z@�Vo6��@�RS׊�	@�W�q�uT@�f�0.�8@�����@��� �*�        ?SCh�t��?�s����3?�#�8�61?�P�-���?к̾��|?�����?�/����?��	�d�?�Yҟ���@�8�G�@j���@
)��w@�~��@@#\�dFv�@(�����I@/�4bz	*@3�QHT�@8D%^]��@=���:d@A��Q�.�@E:��B�&@I��C5@MvC�1g@Q(s|q�G@S�\��Z�@V�1;���@Z!��@]�B~;�@`��ܒ�@b���:�@e-q�@g��j@�E@j,����@l�4P�6@o�;�a��@q�!Z�7+@sE���5�@u� S1@v��Br@x��a��@{�B,\@}V�Y>)@��%�b@�N8�c�@�_���L�@���]n�@�%�Y`�@���ٟe)@�,�AK}@��!b��$@�t��}{j@�2��s�@��B�J�@�ql;T�@�i쇩�D@�k��	�@�vK$':@�����p@���\��C@��r���@��t�Аg@�3� @�u)­�A        ?���wq@�C]�M�@&�g�~-�@<#����@Ku��A��@W3��y�@a�8�{��@i���/�@p��a��@v+D�(�@|,Teƅ�@��:��@�[�6�-@��5�"{�@�t}�m�@�ގS޵�@��bWm٨@����@�gW��Q@�(��
z@���xī@��F/R� @�-!Q�+[@��@V�C@�rb@��@�]F@��@��Z濞�@�fH<r�@�*k�(��@�
�7���@��o�-@�%m.zR@�b��k@��Υ�d@���x4�?@��~��@�UL���@�ˑ��@�T�J�}
@��K�l��@ɡy�u�$@�e�_��@�>A���@�+�{�@З9L8G@ѣ��B�D@Һ�u���@��ދ��@�oϛ)@�F���@׍�X�5@���(C:+@�@;*��@۬�&�H�@�&�_e@ެ�ߨ�
@� ���7@��zLi��@��o����@�䑛�f@�ƙ�n@�sh"@�c~���        ?�;uq��?�z��w'�?����>�?�)0�ɳQ?�~�j�@�bv	]8@	�F��q@L��ca@@g��eCf@����@!-�E���@$��s�IM@(;
��˚@, �h�	�@0!y�	��@2OkR>��@4�v\�O@6��A�O�@9A^l	<@<��r@>�},�p�@@�5Br6@BA�d��@C�bU�	,@EM+���@F���q�@H���
G@J5�p���@K�!#��@M���3V@O�+j�w@P�����@Q�7E�|�@R����X@S�\s�7�@T�,���`@U�1oߤ@V�u��y@W�5^�@X��
���@Y���d.�@[ml\ȣ@\*6*��j@]Ue�=q�@^�
b]@@_�N�yR@`|"�J@a/#C�@a��N��@bg�F�e1@c��d@c��O��o@doR^�t�@e"冪�@eٲ�+?�@f��^�Ɠ@gP�z*�@hRx���@h��R��D@i���(�[@jelZ�@=@k2kS� @l�#���        ?c���(�?�H��Xy?�?b°H?��&\tn?�d���
?��KY�*?䞉z�x�?�p^ Z�3?�߳�cP�?�θ����@SK`Bei@���@�@K A�P@Ƥ����@ ��o�Z�@%�>(9��@+Y���i@1A gI@5,Y�|��@9�s�}�@?Z2���c@B�ì��@FVf�E\@@JTa<l~�@N��Ț�@Q��i�]�@T�W�2�h@W�x�}x@[	`���@^�6?�1�@aX!H�)�@c����ս@e���U��@hk�-t�5@k,Zp��@n#G��z�@p��F5P�@r`X&%GW@t6j6�K�@v-�c��i@xG�土@z���3�@|�G�ܬ�@y�x�u@�څV�@������C@��.�\@��>VU��@�m��彦@�@�7@�.�F��@�8X秛C@�^w�Ys�@���1I$@�D7�@�CIOl@�������@�� �[�@�k��(@��C7B@��G|eͣ@�6��_J�@��pG��D        ?}��֟��?�x+�;�-?�rN�f!P?�1��^�?�&Et�?�*���h?���_&T?��`��U@V�(wO�@�"�?)@����X:@�T�D��@"
��9��@'2�Q$�r@-Z
���2@2H7��`@6r�!F@;3�Ao��@@L&m��@CWi��a�@F��[��@J��|�gY@N��'��@Q��Ӛ�@T[N��@W0QV�PY@ZFй!�j@]���J��@`��!�c@b��W~�@d�c�v�@f�F�^�@iHm� 0@k�;]M�'@n\K��n@p�.�WDS@r+)4��@s�@�`A@uk+c��@w,����@yr��@z�W�L�R@} �[�@#�G�8@����]	�@��Go��B@��`ֻ�@�`�7b��@��@JQ��@��H�@���}9�@�:�Ơ@@���%��@�Y	��J@���Q@�n!ˌl@�\�ʛ�2@�T��I@�V8���D@�a��mt?@�w���@���3ⱆ@����Mќ        @4M�,��@I���ޡ@d��N*�@v�23�1@������@��+�Y�@��Xv�7�@�vW�|�i@��@paJ�@��)���S@��{?��4@��᲼�@����<�@�����@�5�����@����ʞ@��͉�g@�k�ryч@�W�����@�U�p��@�f�r�@ʈW�d�@̼K�!�@�λ��d@ЬW�� @��X��B�@�˟0|�@�a��Ǵ�@ծ����p@���|�@�`��K�&@����z��@�2�&P_�@ܨ	��Y@�%2I�@ߪ��l<@��!��@�g-5it�@�6x���@�
 ��@������t@�X��m�@�.�0�@愘q��@�n�&PPb@�]���h@�Q����P@�J��~t@�H�ý�@�L]Q�?<@�U<G���@�c{�e�y@�w#�r#@�H���@��] ��Z@�iS��ѣ@������@�]_���@�/pV�`@��9,@�"@�k��ƪ@���wg@���q'x�        ?�(�ZR�v?ǲ���0T?��z�B�{?�j"��?��ڝ=�@�޴,�g@'Lq�@ɷ�;l�@FwI�@!��*XFX@%�����@*sK2@/q[���M@2t���z@5r�4K�@8���ܮ�@<Z�M'|@@*�	�C�@BVo(t�@D���g�@G1b�)@I���9��@L�����@O��U>V@Qk7�"��@S`���*@T�����@V�i��_@X������@Z�Z�o\�@\����T@^��-�@`{�T���@a��~Q@b� ��>@d
3rT�W@eL�_)V�@f���$�@g햚{@iK4o�-g@j���$�@l ��ܦ]@m���6�@o�V~�;@pR!'�@q4�	�@q�s���@r��B�@s��W�ݨ@tx���e@u]6�_��@vF�P/�@w4��Y�@x(^ros@@y �/��@z�ww~&@{ #�ah@|'��@}2��HY�@~CH��1@X[�N��@�9�#�@���鯭        ?������?�Օ�	1�?҃��kH�?���P?���i�?�/�D�@V�y�@��'ַ�@3����@��?{@!�����@&����v�@-E�J��@2���_u�@7��Ѡ��@=���x@By�n��@F���@L��^�@Qɣ�Ļ@T}��h�@X[vc��@\�{��Z@`��۬�@cdJ+�
@fL\<jy�@iy!��|X@l���;(c@pT�D���@rY1��cH@t�u�T�	@v���]$N@yTK��j@{��bT`)@~̗_�@���G�-@�z/�g�@�%�d�@��%�+%w@�����@���>(@���kMc�@��8㧓C@��d�I�@�8Ez��@�o���82@��ɂAh�@�9F���@�d$
�}@��L�a_U@�JIJ�Y�@��$[�@�h��X@�=��c@����/�@��'@�R�@��[GD@��7w?,�@���yK��@����%�Z@��~'Wop@���x�8@������o        ?c�ƭ���?��B�[/�?�2??_?��"c�{�?ѫ�%<w0?�h�L3��?�<Ջ_�\?��L��Z@ F[�?_�@|uf�;�@�Z����@���pT@!��k��W@(1Z8�@0�2�3�@5�d�O�@:��!���@A�y�٩@E5�8Yv�@J�#͋?@O�K�j��@R��Cq��@Vj�_�p@ZT����@^��V�@a�;��@dJ�&A��@g�)�:h@j&�@�G\@mmjD���@px��P�@rYSk	څ@tY�6MW@vy��#=]@x���X�@{�M�@}�� �zH@�!fTJ_-@�����*�@���N@��@�~�(7��@��2��@�� �/� @�z
���@�G;�~��@�&�Mz�8@��J�{@�� ��x�@��/���@����9�@���e�-Q@��Ĉ���@�/+Q;�@�n}�c@���xo@���E�@�mU5���@��eӠ�0@�Qe�#�+@�՚ �@��$R��@���C�9@�Wc�Y        @$���ma�@Q%=�F?@jX$,��L@{�Q��@��cF~d@�O��v�t@�͓~���@�9��ng^@�F
�@�����@�����@�#��p@�ō��@@��մߊ�@��#y�@~��@�L�'_P�@�r��<¨@����:,�@��?���@��I��g@��)`��@�ij?��{@��	��'@�_5Vіx@�F��<4@�f.�jD@�֭����@�T���@����q�B@�uy�~�@��lު@���@�}��T�@�Bj"X@�.8\��@�u�d�V@�gvO&չ@�^/��>V@�Yl]�(@�X�a#�8@�\���@�d���a�@�p���VB@���~$�@��2ije�@�����XM@���w���@���ʵK@���	�@�=S�X,�A 6B��SLA �&�pTAl\Yj�;A
�~���A��r��AO49�A��7��gA�7�6;AHy_��A�x���A����1�AX��h�v        ?lTK���V?�F2��:?����#�?�����%�?�L�tQ�G?�*�����?��fu�O[?��ز_�?��
��K?�GL�h�M@Ed��<v@B�Jh�B@���I�@%�x=�B@�+�r�	@]�����@=���7%@K��4�@��ʭ�@ ����$@"���<��@$����/?@&�k�Y��@(ȍ7Ydb@*�i���*@-H?9�+�@/�+2�79@1�-0@2e�1��@3�K�Ɏ@5(&f9@6�A�'V@8f�%�b@9�78!2F@;L����@<��̀@>�;�g@@;0���@A$��lU�@Bsqa�@C�>��k@D
L��Ӌ@E�Ѿ؆@F�V�"�@G+4��u(@HCz����@Ib�b�%@J�cXJ:j@K�B?Nj�@L�?�[�@N$wn�@Of�����@PXb|�Na@Q �5�@�@Q��ꃋ@R\�C��@S�z#g@S��j�}@T�P�o'�@U?E��� @V �2M�@V�.���0@W�V���D        ?(ʵk��?^!��	�?��44?����?�a*687?�ʌ�t�[?�f�T���?�)	ij�?�����xv?��9	��?�><Nr��@O��v�?@eY
��@���?@�N��g�@#4�[a��@)c��2|@0~2��[@5(.�|�@:��Pf�@@��Y��@DZ��#�y@H��v���@M�>�z@Qȹ���@U	:7W�^@X���6O�@\���n�@`� �s<5@c!"��j@e���S�@h�W�\��@l@��y�@o�s�o?�@q�׆�M@s�P8���@vr$�%�@xh���@z�.�q�@}�N��@�F�7hv]@���ٍ@�n�F�V@�&;�:o@��w�3�@��ù�H@��X��F@��qJZ�@�2fJ�@����.��@�����y@�;X��Lq@��Z�s��@���wSL�@�]�㯇@��g��]@�i:J�#@�����@��ڹ��@�s�����@���4�*�@��r����@��S��\$        ?w�j�-Y?�9?Z���?ø]����?�S�X�?�]X��C?�e�-��?�x
��?t@bW��&�@�k	� �@m.oZ�@6�LQo@��$�S�@!��D��@&����M@,�ƽaf�@1�]*�*@6#4�xh,@;,f��@@�B���.@C�L|T�*@G���HQ�@Lm��4Z@P��XN�@S������@V�/h�i�@Z��=�@^��2T~S@az3�;=@c�o�_�@f��<�<@ik����r@l�8A��@o�+���M@q��%���@s�;XO(@u�[���@w���nE@zA�<�@|��e��@S���@�	}F3-�@�{�<1O@��)��@����8�@�E�ٽ�@�.`�@����Q@���5!�\@���у!2@�lN&X@���GP�U@���jws@���4�B�@��,��1@�J�2�bH@���K��@����K�@�_�.Ԋk@��ddČ�@�W��"AA@�盆}#<@�BO�E~@��.��        ?�;���m�@*NH`T��@F��h��@Yu��{a@gzDگ�@r3B!uԍ@zh7l�	�@��KO\�@��;�a�?@���,W��@�z����5@�[����+@���m#@�<:��@�#h+]@��y4�E6@��HDG @����O@�&�e��a@��<w���@����T�@��Ÿ�&@��0q���@��,���@�o{�.@���h8b@�E�h�+�@��n����@�?*��@ė�!���@�)�	�	�@��C��c�@Ɂp����@�F��δ�@�y0���@�Gڤ�>@�}p�1@с���Ʈ@Ҏ����@Ӣ�걖�@Կ�uO�H@�亢�[@���	��@�GN���@لk�z>�@�����a�@�^?[L+@�m1���@��m�ۨ@���z@���{�6�@��aP�Y@�M�t
c�@�~)q�@������@�����@�|�%��@�R�u�2y@�-�'�7�@�(I;6�@���E��@��k�^@��ik�        ?|.�c�?��b���?Ä����?տq��N?�g�w>?�*Bc��?������a?�2hH��@�0�\�x@
Y��?�@paX.�@��:@0Νʠ�@�� �c@ Ջ(��@#��	�F@&z_���T@)��:C�@-�W���@0[3��@2N�0-�@4cr�՝�@6�V6W<�@8�-��,j@;kj,b��@>Y�\j&@@dy�@AՕ�鈬@CX�M4�U@D���3	k@F����ɶ@HM�D���@J�r�$@K�;����@M�s�0�@O��aD��@Qx�u�@RZ,y�@S8L;([=@Tb�)���@U�H<��@V��q_Fs@X!N�$#	@YwnT�@Z�ך�&@\D��?�@]��48r6@_@��Ci�@`h��K�@a5�S@b	J�Ly�@b�I$�@c���E[�@d�-��@E@e�F�h�@f�b}@f|@gz�
�U=@hx˔�@i{��ٖ�@j����y@@k���;�@l���dMM@m����        ?qnɫ�?�4B�ı�?���W���?���^w:?����g��?�$��rx�?��mj>@gد���@2�2�@L���F3@Glq�+�@%��n@,�ũ���@3.�L��@9;���<K@@V�g�Rr@D�a<��{@J@2��,@PP7�Gf@T�g~�@XT���lu@]>|[�P�@agߔtA@d�}ǣ k@h��H��@k�o*3@pj��X�@rab�A�@t��z$~i@w���7�@z�ZZ�@}��+��@���u�@�b�'�m�@�S4Ś>�@�dX�{�X@�����A�@��Nǵ��@�je�.@�#��7@�kYwH��@�偃Jq@�u��v@�L��q�@���P��@��H����@���C�@���p{@���2�<@��5�a[@�BV��=@�� .��@�إ��;F@�=���'�@��H���@�=��g(�@���	O��@��Ѭ���@�M�+@�e�iG@�
}���@���i<�@��E�
�        ?fG�P�i�?�]�pW�?�<Fs�k?�%E=?ۊ^"�?�G���?�~�%ȫ?����^[�@r���@#^,C��@���!C�@�br��@"Xp��@'���y�=@.�/I٩@3e��oз@8F��L�@>	OX{	�@Bb�=4$+@FH�O*�@J������@O��I�?@R����d@V��
�@Y�v���@]�O��R�@`�S�)Yn@cW�/�"@e�>�Z&D@h��\���@k��a.|@n��C��B@q7n�\��@s't#9@u�ta��@wъ���@y?8�ή�@{��_"�@}���r@�;�@a&L@��R���@������4@�\�<8\�@���&Dt@�g� �Z�@�H���C@������@�f�<t��@�.5u�f@��Z/�@��r����@���"��@�wm@����!w@���ͼ@� rf"�@�9���Z�@�^�e1�@����b�@���>0�@������@�<����@��4�+�N        @
i���p@6և�4�q@R�ȭ�u@e[l��cU@sg����@~�����@���"?�P@�,��>�U@���_�>@�h�>B0�@���ө�@�<Ȧ�-P@�k2����@��� @���#@���6hk@�oE�3a@���.�>�@�9s�<@�!�rM��@�R�~|bN@Ű��m@�>�f�	@�� $a��@��Ɉn\�@Ћ��0��@�;�a�g@�KҴ�@��ⅫM�@��ƪEr@�!���!�@�i|+���@�Ҵ�G�x@� Qz�@����@�pɋ�\@�� S�S@�z�g��@�K�	��@�ӧA�� @랡l�vZ@�~�F��@�uC�<@��>5/�@�Ӹot��@��{*�"@�z��@�V��(5@���N��@��Ek��@�S���@���=�S @�DW���V@�Җ�P�@�o��'�A �����Aj��2AO[��
�A;f�ߣ�A.�<ز_A*!]P��A-4l�A7�f�0        ?_M��Ʈ?�)"�Y�?�c8�u�?��x�V?˟�%�r�?�0�q z�?�S'��]'?�S�04?��%ck��?�#�<n��?�� �v?�)7<��@��7�@�.5}?�@C4�~�8@�d�w@#�:��+@fa�]@ח���*@y[���K@MS %&@U��R�@ I `Z��@"�hH-<@#�GH�z�@%���J�@'�����@*D�ł�@,b)0PL@.ա��K1@0���ߝ@2�t�R@3�s;s�@5L�=<O@6��(�Tv@8Fd����@:L�ކ@;��a~/@=�Z��=.@?�,��%@@�Y^�'�@A�)�:�@CE�P�n@DI�\�t@E�W�!qV@F����E�@H^�E)>@Ipj:�0�@J�!P�3@LNŖl�\@MѦA�$�@Ob)���%@P�d�n>@QW �<(@R5'��L%@S	jIh@T�k�{�@T��Z @U�FR��@W����@X��cW@Y,>q��{@ZN%�C�        ?^���:�?��i�0pv?�C���`�?���\N.R?���"Õ?�s��<Z?�t���Z?�œ��P@�2}��@	.��F'G@����@��{�J�@�to���@$�H�&@+���W@1A��;Wt@5�rr�`:@:�.F��@@��)R@D�%��@H���@L�,m��@P㲽R�L@S�l��R@V�\j?L@Z�rq�K1@^y�{"�*@ad��?WL@c���wU2@fS'����@i�5}D@l&�~�p�@olÊ��@qz(Om@s_�1�@ui,[ڇ@w�8rF��@y�F�@|g��sq�@��7_&@��b5�6@�l��C�G@��0[�C@����m@�r����@�P��J3�@�Hl�l�@�Z�ۤp�@��|c��b@��F�۬r@��p��@�_� $M�@���'t�f@�����@���|�^g@�
�10/A@���5�
a@�F�-V8@� $���?@��a�'1�@���Бj@�Ϟ�"�A@��iT�B�        ?@S�@�X�?t�¾� ?��$N�]?��fI��?�`4z���?�R/P.?�R$�YP?����(��?����]@rO)�ߴ@xu�o��@�cJ½@Ə��$@"��5�E@)M�RÎ�@0�tC�Lf@5)W��@:�g�2�@@��y�(V@D,�$� �@HY�A�0�@Mc��u�@Q-�����@T�h���@Wd ��#�@Z�(��NO@^��<#@a�^���@c����@f��{_��@iT6���@lR �f�k@o�Y�_C@qY��:�@sY���@uSb\�@wo�rqpp@y�F����@|͚$��@~��ȇ�y@��1\I�@���&@��"�<�F@�9i���@��=��@��!��@����-��@��Ntܕ�@��с��@��E�Q&@���o��G@���\:q@�E���D�@�����@�²H�U@��I�0<v@�?H�M�-@��]��+5@��$>wG5@��6beۨ@���,�@�����#R@���[�        ?�����@G<Gb*@3F7�1]{@G���,@V��iD@b3��$U@khl�0�K@sV*@z:KB�H@��2o�A@�g!,�\�@�,b��@�i�@�P��gm@��w��@�ʻ��6�@���:(@��H���@�~�܃�@�L�c%�@�V��V֫@���h�j�@��y�4��@�zh���@����J�-@��wIܳx@������@�taf}@�{ �#�@�i���@�߾v���@�jb���@�	M���@ƽ��#
�@Ȉ�;s�@�h;L�l2@�^��d�^@�lf�;�@�Hk�ݼ@�f�6?�/@ґc֡�=@�ș�&#>@���eF�@�^�>��@׽Luӌ@�)���A@ڥ8?Ҝ@�/��|@���*\@�ph�af�@��T$o_1@�x�8B�?@�eY��*~@�Z�+��6@�Y!�2��@�`��/un@�q���J�@�w���5@�/]�Ї@��)��?v@��Z��@�^�L_�@���ާ��        ?b�0Ȋ�?��J���?��Ӫ$�?�/��Le?к��{?���:6Q�?���Ua��?�д�N?�|�x?��>��J?���h^��@%��l�@�7T��@	�k�iy@�=�S�@YZ���	@�`�CO@�1`��}@c�Ai�5@o�x��@�.�6G�@!�4J��%@#]ϼ$��@%H�t�P�@'N�vb�m@)p���b@+��Gu�@.j&ZI�@0E=Ck��@1�#�S6`@2�ԇ�{�@4d���p@5�.�Q3�@7x��b�@9$*LFK@:�o��,�@<��(�.@>mۖ�@@+@
u"�@A)f�u%@B1:2�S�@CB�Ȗ8@D^���}@E�����j@F��63�S@G�Ǥ ,�@I5N$'�$@J�wH��:@K�1+MS�@MEa�`�@N���
�@PW]��5@P�C��x@Q�*��@Rk�7L�J@S<�6ȇF@T?�:��@T�DD��@U��o?9>@V��RL�@W��M ��@X�C7��@Yx�Ά�        ?&�T��B�?b�����?��:�b^?��ãS9�?�� 1�?��q����?�A�[QU�?�#ܠ���?�~�����?��
qj!?��oA�@p(��N@{�D@�E��@\�A{A@#�wH@)G+�
@0(S�h��@4�8�|@9��-@?�k���@C�5�(nB@G�{~Ii�@L�ѱ���@P��h��\@TmBy$@W�r��?�@[r�o���@_�\�ͼ�@bJ��Z��@d�F��ˋ@g�iӄ�	@k	�0k@n�����K@q$5~�n�@s/��k�@uc�b���@w�L�l-!@zO�wA�@}
A�C�@�vlQ^@��� �]�@�.��s@��Vڰ��@�ʁ$���@���쑣p@���+�F@�(�%�*@�Lr���@�ڢ�v�@��uKa@�p�b[�@��a��N[@�E�P�߂@��^Qm�[@�[yY���@��]��B@��Q̛�]@�z�Z5?�@�):¸�@�jͥ@����p@�"�-�        ?:��7S?jE-�L�K?�~-� �n?��`�?���y���?�>�G��?Ϻ�	��G?۲5����?���7d�?򍶢t�?���
�J,@~�v;N@9�Dq{�@�+�S�@nE'�.1@$���׈@+]d��@1��p��@6n��	�@</H�Jk�@Aw'��@E_�bR��@I�Q�݊e@N�H��@RX��#�@U�/-N�@Y �oY
,@]$@`�k��y�@c�{$B�@e�����@hq3��@kv%~ T�@n�w�;dQ@q���`�@r�ãn�@t�����@wB��އ@yT-��<�@{���-@~:MY (f@�p��>h�@��6)ڢJ@�M�����@��_��g�@�s�����@�"�尮�@��)�J\\@���N�<@����m�@����ʮ@��w_c=@��%�f@�~�ŨX@�5�8�í@�i��*��@���h@@���LH�0@�KUNMS+@��+��`@����m�@��]��X�@� ���        ?�tp��k@�VW5��@-q�3��@A#�N��@Oٖ�E�	@Y�tݹ(M@c �ѡ@j�� �@q�.s+�@v�7'׽�@|.���@�/�OM�@���@&�@�T+�F@�d��/@�e�CU`f@��JC�@�X���7@�;F��@����9�@�:/�L�@@���?ؿq@��R�8}@��T�p�@����A�@���:V�@�J�@3�@�qxs��]@�X��˸@�\��tjw@�˂�Q�A@�N%J��@���II�@��IC�.@�P��$�@�&U���@�_�	�V@�ǿ�3@��Hkm�B@��0>B�n@���Hh��@��ȳ�<@�M�<2wb@Ɯa�o�@��3�B�h@�da�2��@��,����@�f��|bT@��T�V�m@Ϥ�5~%@Э[U�ǰ@я�S�}^@�y����@�kfx5D@�dn���;@�d䅯ޛ@�l�e&Z@�{܀vs&@ؒ<_ͧC@ٯ�~c�@��S�),@����v��@�2	Y�9�        ?g�@�(W?�/I�t��?��
+��?�ہ#]�?�Fݷ�c�?��V5���?�F�� q�?��?N�o?�%�ao�@�%ꝏ@y���@	{���c�@D�wJ��@�{ ��[@�:i��@~�y���@�{:I�%@y���@ �g��*�@"�����@$��Eiy�@&�(6�(@(�	���@+:�n��@-���e�@06C�0�@1X�U�2v@2��-�F@4�ezg@5�?X @7�q�v�@8�NT��N@:?�(�K@;�Ž�U@=�r��p�@?|{�l�n@@�:J8e�@A�� %W@B��W"�@C����bH@D�l��Ar@E櫨Jy@G�²�^@H@���0_@I|W{L@J��s�@L��"�@Mk�[��@N�7��r�@P~��@P�4;�`�@Q�SY�E@Re��U&@S3��@T�QhQl@T�/@	k�@U�Y@!@V�cy�@a@W�nA���@Xz��U�@Yq
�D؂@Zm��Q74@[qD[��        ?F>h���?~�?�209?�&e��z�?��Pt�K?�$x�:X?�蠘?
?ܜ�Q�II?��ł�q�?�TۑX?���ɦ��@m�s̀@�vFW��@\ӗs7<@qH�@!�N�q��@';��Ɛ@-���|�+@3T��n @7�gw�`@=bs��g�@A�Q~̟+@E�0�f� @I����:@Ne���@Q� �t�@T���;�@W����@[S%[=J�@_;L�b�@a�U�2�@c݄���@fH�[���@h��|\�@k���%>�@n�JD�*@p�1���@r��&��@t��H$@vs��H�@x�D^�3#@z�A>� @}
���@��c?�p@�!x��@�lI6��@��M���Y@�c�igj@���3D��@����U1@�l����@�DÍ��@�2WZ�W#@���"@�(h`e@�AU��`�@�f�h��@��W�E*@��NfP�w@�8��W�@�u���@����!0@�J�`.�@�����         ?O?l��}?�S�M��?��2����?��9�k?ɛ���!?١<�j?~?�āh�s-?����?�@3{�%�@>L�P�R@�pP%(�@Yq��T@%�����@-�@$��F@3����@:x�%��@@�ڬ���@E*h8�Kw@JJ��D��@P?�6�@Sw��O@WG�&���@[�/���@`*��/¬@bв�|G@e�Ґ��@h�p�S�@lw�� �1@p&�M}b@r=���@t�NC���@v��l�@y�Z T~@|o���Ɠ@L';�@�c����L@�&)��:@���� x@�	&�(��@�,!3�}'@�q]p���@�٤��f�@�2�ߞ @���2�@��G�^�@�r"|ݚ�@���E��@���
�@�X.�h�3@�^ʃ)M@��!��B@��vNwu�@�r*��n@�zژ-P�@��«|@�@����Q�@��%Y��@�����k@�06̢˭@�o�sgDg@���.RD@�
���@�fuP�        ?�0����@(k��
��@E��ҹ<@X�n;Kj@f�����@q�S[mlB@y�`�*@���r�F@�gGY�T@���+��@��DXX�@�~v�i�@�s�I	)(@��<��vr@�'sZ�@��=�6��@�5����@��6�H�@���G<�@���?�$�@�EA��@��&׺�@���ndN�@�u�����@�i5�a@�r��`$@���:��5@�ň�d��@��Bw��@���%�@����x@�<�`5N@ŏ�D���@��{ϙe�@�YP�A@��U��B�@�SɄ�Z�@���h��@΀�n}�@��/(x�@��@�]HM@�Ӥ����@Ҽ��Ӥ�@Ӭ����@ԣ�a�@ՠb3`��@֤sR��@ׯ[�$�@��::��r@��6%�@��x[ms�@�""X*�@�QE�,�@އ��TA@�����[�@����'�(@�,KJ�/�@�֤���@��e}B�@�7!;+��@����@�"�CK@�g)���        ?Un�����?�	a��>>?�x5� ?��ho���?Ȋ�JB?ӱl��Fx?���: ��?�	L���?�yn�a?�ALK�?�D��?�	,j,N?�V�ID/�@��~*@�P��0-@	X���b�@0`�u�j@��y�@��w��+@c��oD�@5<�&W@ߖV�@��̋�@ ���g,@"gYsEH#@$Q�'W��@&a)���@(�΂
��@*�P��zw@-�
�@0�0`+@1���8C+@3"g���v@4��<@6������@8e4��9B@:[�_d�@<n�E�:�@>�W�ⷕ@@u�Ԋ�2@A�;)v<�@B�1�G�@DDЙCH@E�P��9�@G�.�@H���us�@J8w���@K����@M�݂b"�@O\�62@P���-q�@Q��y�@R��o�n@S��=���@T�����@U�8d�G@V��J���@Xo|H@YBʌ]0�@Z�	L��j@[����@]y�se@^y��o�        ?(��3�#?b����)?� [��=?��D/�?�n�35� ?ř�Ye� ?�� ��`�?� `G�?��6�%u�?��nFm�@�+J�<R@���	�@�V4��@�]�V��@$�I|��@,)h�
�@2�����@7��j��@>b�I���@C&�N��@G{����$@L��X�R�@QG�m�
!@T����HF@XgA"�O@\�Jx@`�V^_|�@c6�A�|u@fA?��@i/n��@ln;K�:�@p�e�@q�	�N�@t#��*@v6��pu@x�f����@{�{Sv@}�
r��.@�;��k�z@��ȈZy@�=vb��@���+���@���vY@�UŖ8U�@�1�5�@�#XOA�B@�*����@�#�rjbK@�=��q�@�c�ƕ�F@���Ŭ��@��#���"@���[@�q����@��X	�s@�D?(fz@����Ao�@�Kh*,i�@��77�U@�D�xU�m@�S�"ܤ@� �*ű@���.�2�        ?TI�ۖ�e?�tcf#N�?�ʆAl��?�����?ɑ��Wfk?֛��@KB?��/�]��?��椽1?������@Lׇ�3�@	ID+vu�@	�v�|@(pK�@!+̈́/A�@&�3�dgD@.*`iUb�@3vBD�@8�k\�@>������@Cf�6�@G4��@K���@P�L+���@S�Z��|"@V��Nt��@Z���9��@^w�WBP@adz�?K@c�#,�Br@fAT�8�@h�i�	�X@k�lC/% @n�W�u��@q$�(na@r�r�.�@tĳ�!2�@v�c�1�@xԯ���@{2d�!@}Y��s@�0�}��@�+���|@��E@��}QjY9@�bu����@��{c�{@��i�i�@�2�MU�@��2�XY@�� �)�@���G�@������n@��P]DF�@����t�|@�&7Y�@�:.wqeM@�qzs��t@��q�/+@�|Hi@�e�y��@�ц�y��@�LiV���@��'�        ?��]c���@%}	'�@15�;��{@C��֎@RdFl�a,@]wVՄ�!@e��&���@m���/ �@s�&���@y|��\�@5
� �P@�
���<@��k��Yy@���4@��D!�It@�e�9�"�@�(�_`��@�(L �+�@�f�zޕ�@��{��ǟ@�V��g�@�_Ly��!@��s	xX @��q��	�@�s~d�f@�-��S�@�CҼ'F@��K��o�@�Q~"2��@� .:��@�Ur��@��b�B�@�K�~��@��-�e` @�Z6b�*@�Q��g�@®)1q�t@�R���$@Ŝ�� K�@�/�+���@������F@ʏ���l@�]��a8@�>�ݵ@��NG�h@� >�3@�1<~8�@�M.��2�@�t�`�Z@է�[&�^@��%KY��@�2����@يȲږ�@��'V0�@�a� ߒP@���#;�@�l�����@��YY���@�V��-�L@�1s�?��@��吉�@���k���@���wN�        ?P4ߍ���?���ϥ?�}TZq�?����U�?�Z��Wc�?�1�q�3?��3j��?�
�x=?�G�?���c?�ى�GV+?��S��nA?���v%v?��'YϨ?�MI,�3@�͂�@��"�o@����Z@
ӡ����@1�|�2@��EX�@�v�� @�����@*pe�@������@�#�+@�u%�@ ��͙@"bHʢ@$�&ܳ�@%��ݩ�@'��[�@)s��d�@+x�_6@-�6W���@/�$�d��@1؅���@2OLx�v@@3���K�@4�z �@6Z&��-@7ҳ-��@9[�Y�W@:�>�,�@<�b�o@>ZЮs*@@��N@A�8�]�@A��W�@B�a��b�@D���@EũI�@F8�)�@G`J��
@H���<�@I�d��X�@K'#�x@Lc)����@M�~�#�@O"4`!@c@PH��9y@Q�ԛ��@Qǩ�ȕH        ?aj�V���?�^���o?����MIl?�&/Qp�7?��j�ҋ'?�rFH8�?���	�P?�B���
7@0R۷;�@	�Xw3zK@��lO��@׷U�
�@�*���#@%	�(o9 @+l�פ��@1�BW�o0@6{!���~@<K�1��@A�ct��@E�M����@Jw�c�8@O��wT@S)�	ڍZ@V�]���@Z�v�i,@_qS�w�@bI<�K�@e#4L��Z@hJ�@� @k�Uk�Cw@o��N	�@q��)T��@t"���P�@v��@y@�E��@|��  @0p�|�;@�>é��@� �a�p�@��3�i5�@��?�L�@��e��@�;�NNp�@��([��@��]�%$@�]\sc��@���5�@�2#���@����@�Mv��#@��.eky@��<|��@�~�B@�_:���y@�)M1�'j@�,�t�$�@�9�����@�Py��۵@�qR�K�@��J�ǉ8@�ь��J]@�C�I@~@�[��-��        ?HxzM��?|7T"�G?����Y�y?� ��zY?� T4P�?�Xu�s��?ސU�m��?���.��n?��-Zn�?��
��@e�Ӝs@	^0Z�@ �o`��@�����;@�·a��@"���(^@'��F�/>@-�(9�-N@2pyD58�@6z.���@;�f�	k@@4�Bh@C3�ls�@F�8��%�@JS$s�nK@N~�߆�@Q��#4H�@T�N��k@V��A��@Y�҄ioL@]"\��@`V+��G@b>B�2ו@dJ�@L�_@f}u=*�+@h��HJxJ@kX�A=(�@n���F@pl�}[@2@q��a�d@s�<_n�p@u42��!@v�9�L	�@x�Q�k@z�h�9��@|�t���@�A$R@���P��@��j'zn@�&�[*51@�x`�*-�@�ل�_*@�J���2�@��<����@�^��@4h@�`���@��̽A!-@�\��=,@����\�@��PT�ը@�����H�@���ƍ@��H9mT        ?ẹ\�~@@M�΂��@1郑k�@E��AZ]P@Tn���@`�j�P\@h�ms�uz@quȑ*�@v|����@|���.p@���"D�T@���t@��}�+S@�&��8��@����+�@�)].Cd@�s17@��(�t�@�Z�n�W;@�o�,��Z@�Q�wQ~@�R�T�O!@�v{N�Kn@��<c�K�@�(6.�}@��UT��v@�76����@���	e@�'�F	�@��r��d�@�iŦ�0�@�*e��@� ߀(I=@���H=�|@��B��@�v���;@� @�9@�E�����@�x
Y�ug@Ķɰ_u@�X���2@�Z�4���@����\H@�4 ���@˵$o�?�@�D���@����QL@�F6��a@�#3;&|@��/I(@�󝩜��@��J�w��@����	n�@��$�2͛@��E��@���7n@� �J@�D�����@�p��[>�@ܥ��g^�@���yFm�@�(�HNu�@�;�T&D        ?^Q���?���9D8?���д�?��)�&YH?Љ�^xk?��N(ϙ�?���g�+0?��H�t�?�,���?��d��J?����@x>�e@O.8��@
�;��@@��@1�N�@ bN�@]M�7@^���*@��hj�@!kGѮǃ@#��k�@%����O�@(3����;@*�U��^�@-�a����@0VUĉK�@1���xi@3�Wx1�K@5����i@7�ov�@9�|�k@;��Ы�_@>UC*�2Z@@n�Qms�@A�a���|@C.�:��@D�ozѩ@F=%\�S�@G�ڣ��@I���un@Kn�䩐@MT�~'��@OR��	�@P��g41g@Q�Ώ@R𬧳�@T"�J��@Ub�B�(@V�����@Xi��F^@YxvЭ֋@Z�:p.Q�@\z�rV(�@^㎴-�@_�w,M��@`�
.�ұ@a�Z��@b�OS6-@c~y0f�8@d|/QMU@e�~"#m@f��#��M        ?T_lʒ1?�,g vb ?�.�׵?�y>��?�m�е{?���3���?�	+��?��H]t�?��y,F��@�
,���@�85��@O����@;ߴ�
@!z¹$��@&�l��A@-�O��s�@2�� t�o@7t�>��@=�z4�@A��=U��@Ex1D�5m@I���e@N�#w�c@R%��@U�P���@X�Y1k�}@\]�HM�@`LxVj4n@b����]{@e13��x�@g�xv&z@kb:j;�@n]��/�z@p����@r��~���@u=���@wA���P@y��V(�@|<8ƃ�@~���X�@��&�U�@��X}�Q@�%�`��@��p��@���S��H@����5��@����+@���Otp@���J97@�CQ@^Ʊ@���{��@��W#W�)@�/d�.�*@��<iP��@�/��@���}p�@�H�k6�G@���'��@��Pл�@�F��7i�@�8��x2@�4�D�c�@�9f�4�"        ?N�?�b�C?��E���?�K�S�GG?������?ǘg��qz?�Ì��?�Ɣ�?������?�`$���@�ܙ�  @	�����@I�� �@iU�]t@!E����@'���$l@.M�EJ@3V:X"��@8{$�W�t@>��.�w@B�[�$@F��iC�@K��Y��@P�eY,�@S�yg��@W6�9(:@Z���wo@_K�[C�@b=@딾@d�i (G�@g��Gke�@j��h2�@nA&6*NF@q�3K�4@s� �@uF )��@w�[9(@z7��-ܸ@|�L�G@墶v~@�������@�-�Dj(G@��>go@��):<��@��7��_@��>\�@���ڹ@�h��k�@���~�F.@�0m
sx5@���4BJ&@��sC`-@�[�wg�@���Q8�I@�o�0.�@����)�@�����@���D�>@�)����@���;�@��Lf^i@��/J�S@��M�2H@�)�j�        ?���ȝ�G@���E@8Uca��@L�+ lN2@Z�CU��@ef����@oq�?��@u�#"#��@|����"�@�T8��м@��,�#c@��9�МD@��4��r�@���x��@�BFӌ`�@���^Y�@��P���@��˓�#B@�0�YWR@�ϗut��@��?C?o@��hi;�@�u���@�̮L��F@���CX�@������
@�
�.�P�@�r�p"0Q@��n�1�@��2g���@�_f4�@�������@ě���
�@�_��4&^@�=ɵ��@�5�E�@�H�$��@�v��2,~@�`X����@ѓ��߈�@��3���@�%��<�y@Յ]�7��@��i�3�@�s&y��m@���
=�@۠�s$@�P[��t)@���K�9@�qH^��@�b���n�@�\�ɋe�@�`<��<"@�l��(�@����+@梹Z1��@��A	�E�@��Ē(��@�=q4�\@�sZ���@���Z� s@�5!.�Ud@��+ �        ?rҜ�m��?�;�����?� �#��?���o�?�H�p�l?�ɒC�O?��f�ߐ?��oKaÅ@ �D�VM�@�iں}�@
�2`XX@^����@�,�p�@:B��@)|�\�@r'R�!/@"Zˠ�W@$�
6���@'@�"h��@**��'��@-NA�_>�@0V�I�T@2#�2��@4G�O��@6h1�{@8IZ�8A@:�TÌB�@=
�ӡY�@?�q�O�@A.���h@B�B
B|E@D"��J��@E�(���@Gb���@�@I $ ��@J�c�>%�@L��7�@N�
���@Pp	U��@Q�1���;@R�:�]"@S�t��@T�C9��Z@V;�c�@W�'e�)@X����p@ZE?GV��@[��2	'w@]6�̈@f@^ë���@`.��$�@a��{Y�@a��j9�@b���"1@c�g'�@d�qB�@e����,�@f�u�D��@g����@h�����'@i���F!)@j�ݞv��@k�ɺܙ        ?C;���+?y�/�s��?��Dh���?�mq��!�?�O�W��?�[��k�?�r��qy?��ϼ�\�?�W�z?�IS��@}ƾO��@���b+@>�a�t�@r.4.��@#�b� R�@*sF<��@14��E�@5��c��@;����#@A'�=�r�@D��e�]@Ia�t�{�@N\.|���@Q��`��6@U�j�š@X�(Hi9�@\nA�:3�@`T�Mc�@b�ܦ惂@e-|?���@g��Ctz@j��yn�@n#��.+�@p�mQ�@r����@t��{�;�@v�棷��@y$�58@{����@~7J��i@���FɃ@���
��u@��K~��d@�6w�@��հ��@��s&Ũ@�����"�@��)�@�\�]m@��ɖ�S@�妶e�@�,�uX�@��J��D@���_U@�i���\@���̐�k@����@�SpQ��@� �L���@�9]1�(@����J@�	=�Có@�C����        ?O1@4�5-?�X���?�W`����?�	�ƕ_�?Ƥ��6�Y?ԯu�	A?���$�?�F�B��?�h�a2��@ �x*�@	���@���{@����N@ ��_s�@&���B1�@-ҘT��@2�T��@7� �z@=q�T���@A��a�@E��Ȋ@I�K�@N��f=jJ@Q�]�@@T��"@X	��(�@[��Ns�@_d4�f��@aǊ���@d
4�¦�@f|��_�@iO�kO�@k��xl�$@o��V@q#���@r��6�VL@t�v�q@v���(�@xؠ(��@{e�O��@}y%2�l�@�q3'@�UFDI�+@��]���@�;z0M�?@��E�KxU@�tn��6�@�1�S�@���:l@��)Qn��@����-@������@�����9�@��Kw�Ч@�*,u��@�E�NG��@���?h;�@��0�V��@�g]��w&@���;��@�s,[b��@�R�讐@��J��j�        ?�LU��1@%� +�7�@B�"Y�El@U���2Fl@c���@oi2�w��@v�,��@����U@�� ,��A@���n�`�@��-�:�Q@������@��˿�@�tWL�0�@������@�5޶��@�e�\�@�
z��@�I��*>@�����|@��#� o�@������E@���SW��@����@�z*T�>@� 8O�~@���*Ř�@�>���TB@»[�t�@�LH���@�����
@Ǫ�:��2@�y.)Vbw@�\�a��S@�U�_�d�@�d���@���p�@���"X7�@��F�@�@��]��@Ձ{����@��Hݏ�@�'�s##�@ٍ�����@�aݶ{@܂�R��$@�����@߯�5T_@�:b!�@��D��@@�o���I@�\h��[@�P���@�L�%`�@�P�R�v�@�\�3�a�@�o�*�i@�!�;@����@��8��uk@�
�BJ@�Cc�;@�!��oD        ?U��H�S?�h�Cш?�JoUB%?� ty߅k?Ų�D��?ѹ�
��?�\'N�A�?�a]�h�b?�|�#�'?�^}?���y�;�?�Kx���#?�Z�0�Y@|��@T@�3���@�S��@�ț�� @����3@چ��@m�c��s@��vm�D@����F@�O2�H!@��B&�@!s�Ӗ�3@#-g2c�@$�v�iD@&�Ұ�l�@(귧�C�@+��5(@-6�;j@/���kQ@@0�j#���@2.�*"D�@3x�e�R@4ύ���{@63�鱽�@7�cZi�T@9%��&@:��[a��@<S�  �@>�5`T@?��a<1T@@���*��@A�䴌�1@B���(�@C�$S�R�@D�G4o/@E�����Z@F�&�{�^@H��ѝ�@IC���!@Jx�
CkN@K�����@L��]:0X@NI�����@O��ډQ@PvZݳ@Q31��L@Q�CtE�@R����"@Sh��jJ�@T.&d�'        ?:���`*?s[h:np?��?}���?�� :���?����$�?˶�"ƍ?��UV�?��b�}?�6�� ?��-��@����~�@U�kMAP@���	�@_�]�O@$�Q�tI�@+����3�@2"U�5�x@7W�yEV�@=�����@Bvk�%v�@F����f@K������@P�U����@S�Ʊ�7C@W|<��6@[��zc$�@_�ò钿@bq�3q$@e"���]�@hp��@kB���@n�g��-@q3`*�4�@s/)1HH�@uMy���@w��&��@y��k�{@|}6�kj�@+R'ʎ�@��p$���@�|D:��(@�|��w�@��uލ)�@�h����@�5)���g@����P�@�}�@�^f��@��[��@����X@��ב�)@�����@�V��gl]@���Q��@��H���@�`_��)�@��S͹7L@�Q[Y�@@�ݭ��O@�w�[*j�@�����s�@�jU	n@�L;$"�        ?4�˰!-Z?e?����?�_t�s~�?���Ʋ��?������?���
�<?�m���u?�ko"?��og5� ?��l�Kn?���2�Z�@o�J��@ON��E@um{5@�-����@"��ќ�@(PA�6�@/?�˿�@3� �A�@8�W|��@>X.vo��@Bu_�n@b@F7���٪@Jz���Z�@OHq"�P@RS��W�@UP<r�@X����@\@߫ϷY@`����@bK����@d�t�7:8@g9��];@i���|�@l�Yr?5@p�@q��W��@s���0k�@u�����@w���T�)@y�����4@|,4�BE#@~�,>��@��z�n�l@����q�@�_E���%@��>'�>�@�g�Yx��@�\�`@%@��s�M�@�r,E�2@�A{�ks�@�![��@���e$�)@��b�)K�@��,Q~j@��H��w8@���oe
�@�޴�Q@�	0@�<X�L��@�xV�H�@��Z wG	        ?�sa��jB@&�ah�@-$�|��@AO��I@P?oa{�@Z_�@'�>@cx�L��,@j�bCF�_@q�NEB�(@v��b��@|P S]�@�?ߐ=�@��Mg9��@�b�2v�T@�r��SBd@�m#���@��(���0@�Z����@�4P�k�@��|��@�!��✫@����x�@�{)%��|@�W���H@�N��`CO@�a,�nm@@�������@��r�X�_@�;����@�ݻK�@�+����@��d���@��v��)�@�i��K?@��,���@��y.��z@�-[�_�^@��s�}J@��}�/oV@�A���$�@�7A}1_@�6dҕJa@�?Gj^`@�R����@�o��/@ƖHϢp@�����]�@��L+�4@�J����@˛�b`y@��tT&@�]$�o@�ͫ6(z6@Ф\F�M@�g-�X,�@�/T���@��ތ��@���f�;�@Ԩ]��5�@Ն{0�3@�jL�8@�S�ON�@�Cu���        ?��6?��?�J��]�?�q��?�.sU��M@iƲ��@>ȋ9�F@��^��*@#� �x@(��,q�@/e���@3W�ݕf@7WHtH�@;���tz@@-��V+@B�a�J��@EWmyDY@H'���C@K2}�@N;�5ǡj@P��ED\�@Rq��eǳ@T6�E:@VA�dy�@W��$���@Y�0�[�@[�[`�@^��2�@`!z �d@aA��Uu@bj�2�|n@c��7@d،E�@f���5@gk��M�@h���]�@j W=#�;@k�.�L@l�.����@ng!�W0@o��9Q@p�����@quv8x��@r<�Ê@s��@sԎe��@t��.���@uz�=@vRA3�	D@w.6X�%�@x/O�@x����h@y�.?=.�@z�a����@{���6cV@|�ξy�@}������@~��KԱ@�(�Њe@�Q�ۿe�@��t�(@�]W/��@�慢*�@�q�j�Q@        ?���Y�m?�_L�?�'�H�g�?���D�?�b����?���ʞu�@ ��4�.�@	�f�oP@�F㙙@����Hu@!���k@(�(ݳ�@0!eի�@5A�p���@;���
��@A��5^�@FF<��@K����h@Ql(b�@Tѽ�>�N@Y�r�<@]��s�@a�gbN�@d�
WO}�@hO�-7�g@l#����2@p,�g�)w@rz.�u��@t�l$��@w����vh@z�Adg�@}�2�l�@�{d��.@�7�$��@�
��ע@���	:�@���0Kk!@� �٢C@�#�-��c@�XS��@�N��]�@�yگcg@��]���@�避���@�.� &@�}3V6�I@���֢��@�9��I@���h\�@�"�d�O@��;N�4@�?�~�I@�qyܶ��@�J���@�+B�L@�����@�J�@L@����
@��R*�K@�����@��]zO@�4K��?\@�W�.��C        ?�b}�@u?�k�ᯊ@ F��V�@���N^@ �ip�/�@*aŌ#��@2��P,!�@9($�X�@@)�q�T�@D#QI$!�@H���ޥ�@MOF� u@QFz����@T"5O�y?@W?;ˠ�@Z���G{�@^N_O��?@a%1(�iH@cMe�%4;@e���9��@h'�"
��@jߒ$���@m���c�@p{�>
�@r-����e@t�_d�@u���*/i@x1� @zR<���@|��]��@I�:q�c@���uk@�s��~S�@��qy�N@����eM�@�N�b��@��ʣu[@� �Y��,@��Y��2�@����Ly@��<�Q%}@��oc��@�ة[-@�E�-��@��T_Z�^@��{w�@�p�|�3@��XY�@������@�2��v@���,)W @�^QO�:�@�O�h0G�@�K��e��@�RN�7�@�d"A��@��o���!@�������@�߽�u�2@�!Z����@�o��075@������@�3��w\A        @?�Jby@k�����@��cF�5@��T�_z@�ޒ7Kښ@��ʸ��@������4@�`�{��@ƀ�/��*@�5�׮9�@�=� ���@ԧ���*@�T���!�@�D��A!@�:�2J��@�r���@��єe@�<b��Z@��m��I@�x��D@�>�!9g@���;@@�?���@�t"ʁ7@����y��@�O4�ː@���fx@���q�@���k�@�S'7y${A F�M�A��BBA��l�A+���Ak;�,~A(<�g�iA<A��WdAUToJpAsh�I�A	�t�%ѻA
�lN�	�A�@L��A���sASWJ��)A���\��AgIH͙HA	��`r�A��p\^3AU�g�A�y���A����;OAZO{B�Ak�A`�A����BAt����A-9�:lA����A�5�=�Ad��~);A&���aA�e*��A��l�6�A{�q        ?X^b�N�e?�@�i�?���xFP?�H �R�?� ���F?�ɸ�a�?� �2��?�W��m�~?�v�'#�[?�d��7w?���V��@
���u@�����f@z����@�_����@��v��}@B1�銃@	�r��@�%߾@M�jmW�@��H�8;@!���y�@#��:Ժ�@%�9h.I�@(OOI�DT@*�9iX @-g��r@0�;$�@1��!�K�@3!z��y-@4�鄖�h@6���˂@8\L��p@:K�WU|@<TЛC��@>x!��/@@[�&��@A��ݯ�@B�Gv!a�@D
��/�9@Ea�� �@F�Ν�J�@H:�����@I�B��!I@KN�l%_�@L���@N��-��V@P0�v-��@QgIvs~@R
^>?T@S�6��@T?@§�@U���GH@V&#=��%@WD)�O��@Xk�s9d_@Y��?ݓn@Z�ʛ0��@\ ��A�C@]r#���@^���m�r@`�N��*@`Ր���        ?5�ȍ\?o��C�$A?���̠�?�!�.��?������?ɯ��A�?ס���[?�I�'��?�
����?�
8�B@�ċb]@�9�L�~@�V�Xaw@�ك\�@$�+�d@+�|M��@2H�H:?8@7�˪Z�M@=� ���@B�i�;U@F�D.��@K�T��#@P��8��@T'�����@Wߪ��j@\��44@`Z��0"�@b���g�@e�tV�Y@h��ж�@lZ�J@/�@p
z�~|@r�d��@t>��0�@v��7
��@yM!�)@{�hK��@~���!�@��(3@���ԫ�#@�C-�@�`�g��@���D��@��ㆠ@�B�anay@��ql_@�wG�O��@��e��u�@���J��@�nF��B@��!3�}@�g�i�ҩ@��OZ�@���$��~@�h'qG
@�:�Q�*�@�'Y�@����,�@���?�@�/SjԆ@�P�~�2n@��Q�1@��SQ"�        ?,��1 k?b9�z�?��L�h\�?�ǙnQ��?��<L?���
��?�=�'�}y?�T���5�?��w�[?�����@ ��kw�@	>�3�@�T	�H�@�����@ �ۼ��}@&Og^��@,�CN�˳@2tfcE�@7)ʚRV@<��&��x@A��)�@E%>���L@IFV���@M�����{@Q����6�@Tsd��B@W�<��t@[%׏t@@^����@a�O�Ͽ@c�3���@fK X��C@h��y� @k��+ț-@n�j�l0@qk@r�{	Q�@t����^�@v��6��m@x�Q#:J@z� ���@}:�di�N@��"��@�(��VfG@����⪈@��.5��@��Mn�@��p�X@���1pb@��@�Uc�M��@�=R���@�-���@�&x̬�@�:ů%�@�ZP�4�-@��Vة��@������@��ӛ��@�M�����@��G^��l@������@���m��        ?��ci�F\@���&�@1��A��@Dܫ; 
:@Sc�d�9@_D���6@g|Wf�@o�{2}�@u+�).
@{�U�@��g'm@�����D@��Y���@���
?@�V�-&@�'b1KƔ@�9:����@��ۅ�#@�*���}�@���1�f@���v�j@�_w�8i@�ǃ���@�YdB7�@�5d�@����σS@��c�i_@�,U��'�@�����f�@���xo�@��d�c�N@��ͧp�@���K@�ׂ���@��W�m�@��m�h@�1D:��m@Ĉ�Q��L@����g.@�d��k�e@��^��@�}�һ��@�!���|�@�բm*��@ϙ�R(��@з6"�D@ѩ뛿P�@ҥ2��F@ө;�n�@Զ9�Qcp@��_ �@����A�@���@�u@�G�ᥡ
@ڄ�p��[@��.}�@��*A@�z͐�/g@��ܱz4@��
��o@�j+QܚP@�/R�Ɂu@��e�@��        ?S���
�U?�zj<#??�7${���?��h�Z ?��cx$j�?�K����?��v�oK?�f�ʆ�?����?��ӷ5��?���Q�?��h�V�?��ZF�m?� ���?� j_b�@]�!x��@�C�K�@	
�74�@�5�;��@�ȋ��@���_�@�W�"��@aҬ���@i����@��9/q@!?l)�@"��o��@$�ǽ?@' D\k�@)g2to��@+џ��:,@.`Q���X@0�67��@1��ls��@3v�5���@5
V��=@6��ȶ@8n�-/�@:>��pm�@<%^��	F@>!��"��@@y�x@A/��S�@BPخTY0@C~ >l7�@D��zCa@E�����T@GP89�xo@H�Sw��@J��3@K���=�@M%�ʹ�@N��V��>@P%�� D:@P��p���@Q��()�@R�zO�@S��[��W@T���!��@U��?��@V��ȿ4H@W�g-�T�@X�ʑM�        ?H�p���&?� ,�r��?������?��Σ���?Ř�|Ù�?��w�,�y?޴}Y�:?�ʽ���?��GFli?����2�@�[��Ci@
[j��A@��&�@���b�^@ t(og�@%��+��@,8�%h@2{5�j@6�����@<�9e�3@A�L%���@E����k@J#����@OSg��h@R�G��#@U쐒��%@Y�����@]�=4R��@a.'�vs@c���1$�@fy��@i�X(��@l˜���;@p/&c���@r�Fl�]@t2��9�@vo�a�>@x�=�{�P@{g���i{@~$�fWÀ@���� ��@��D�ߣ@�����@�w���I@�OK��J@�@���3�@�L��@�tj��@����@-�@��G�@�J�T���@����I	@��|c&�<@�a�p@��(�p|@�jx.��@�"�X@��nvwN�@�r��lO"@�!��I�@�}�S�@�
�-���@�6�U�        ?=g,����?j�_6($?��H��2�?�������?�m�!6�?�|��}�l?ӵ��6\�?��'��:c?�+���?��D�g@ Qi���)@��@���@�N��Ȓ@pB�aL�@��Jߢ�@$���p�@+-��p>@1Om,0 @5�i�|8@:�pҽ�@@P�NA#@C��7��@GebK���@K�����*@P$J��u�@R���f��@U���k�
@X��L/k�@\3�3�$@_���E@be"��@dJ'c�@f�����@i\����@l7��mb@oM�,h@qP��>@sx��Y@u
 K~$8@w�|�@yV|�MR�@{���E�@~E�'/T@��0d&G@����z�@��Cݵ5
@�&\Pj�@��R�6v1@���d�@�����(@�ϥ�(��@��;��@���'��@�� ��]@�1rB�@����_'u@��>e3��@�}b���`@����8�@���,�H@�v�j@�GA���@��s�        ?�<���D@b.Pd�@,E�2?�@@���nTj@Oλ߹�D@Y�Lmy�%@cJOʾ�@jݙ$�`@qڱFb��@v�0�`@|�%ks}@����"$@�`�ְs@����}�@�r�[e-m@�)�N��@�۱�]Q@�����.`@�v�k@���Qف@��^#��<@��D���w@�)aTD�@��OJ�r@�B����\@��1X-�@�/�3��@�����e�@�k��#}$@�C��@�9���0@�N�<��@���K���@��B����@�$�:���@�oook	�@��9e>�@�7�5w�Q@Ŷ�͊@�FLl
�@���`o��@ʝ��o@�f���Q@�A��Ӵ@�Q)�m#@���+�@�$�P~ݮ@�9��͓�@�Xg|��\@Հ�h�^�@ֲ�?9�@����ۦ@�3�Y+,�@ځ�`�`�@��ok�@�9�I��@ޣ�~0�@�
b�-��@��jR��N@ሁ8d��@�M��瓇@�y q4@��.#iW        ?k���t�?�<�J&�?��tLMw�?˽���K�?���u��?��17�?�CKE�?�C�.C��?�)�����?�����@��a��$@����-#@y�0j�@ui��(�@
����2@�;-=@�0T���@�;�Bk@0'.�@!W��O�l@#/b�p�d@%�Ms�@')�s�ݞ@)M�	`�=@+�]<��@-�aB�r@0.�q�u�@1x���&@2�Cl�r�@49)Ϙ�1@5��ms��@77ק��t@8�W�AD�@:wp�Q��@<0|���@=���<*@?��I��L@@�Wj	_C@A�n�
R@B��n���@C���t�@E���^@FB��:��@Gt5���A@H�zE�d/@I��<Tx�@KJ�}6Ss@L����>�@NrYd��@O�L]A?@P��k�`@QO�'(H@R�P7��@R�W�TLL@Sό~��z@T��jZK@U��+�@V��J�`7@W�����@X��a���@Y����@Z�����@[�_p`�        ?7�TJ�@?p	��^?�� ���s?�$����?�)�Ī�?�5F�?��	���j?��f`sn�?�$#�.@v_Q�@
a��t�@��O�@Wh���c@#�#S�=@+�Ԍ�@2���l@7���.�"@>|oTW��@CL��[ �@H��跉@M�[�Nǂ@RX.�	@U�}�1@ZB i�S@^��l�@b+���T�@e5��>>e@h�E=c�@lU�U�[&@p;E>���@rD�Ī@t��Yx9@w��S�[@z�t��?�@}�y�<�@��e���@�a��E�@�S���J(@�f�P�@���ğ�@��w��@�g�g���@�S�GD@�`q���i@��p��@R@�T�w�7�@���Q�u�@���V��@�L�y F�@���[�@��}�sV@���rb@�z
���@���Fq@���2|�@��@K�J�@���s��#@�^%�_@�\㾯�@��wfRn�@��(�.�+@�U	P.#@��+$�c.        ?@�=��,?r:� i?�c�b�|?���a#�?�=�y
�?Ȕ��} �?��m�׮?����?����?��IFx�@ �C5���@E�>���@��<!@���:�+@4�(,�k@#���6D@(�����U@/X�E��@3de_��+@7���8��@<�)4�e�@A!,�zQ@DM��Sc@Gݗ)�9�@K�=t��M@P���� @R��
��@U6:\��q@X����@[K�=�@^�N��Չ@a:h���2@c;�&�:�@ed�E�@g�J\��J@j-�8=k!@l��ε@o�8�s�@qO��xv�@r���N�@t���x-.@vX����%@x6�I�c�@z.E��eS@|?05��@~j�-�w@�W�e`g�@���?�:�@�����@�5����@�iTN3?�@�Ѝ*�@�F��h�@����@�\�I�@��6�X�@��Ų�b@�7H���u@��ͭ��@�GC#1�@����{@���E0�@������        ?����q@���~@7�`׸@Jr���)@W���pa�@b�RƻE�@k��x$R@r���_�@xg=/�@3BB�1@�A�g��@�i�:�KX@� ��0�@��Y<�}�@�?��.@�6�!��@�i�a��@���P��@�D��i�_@�=E���v@�W�7�}^@���{`@����_�C@�}��T'�@�,/�U�@���E�u@��?D��@��)_]�@�Dm`�:@���v��@����(n@�Ֆ����@��8�?�@��s�P@�����@���\m�d@���&�@�Lt�y@ŞU� �w@��f�x�e@�iK
��@�� ��6C@�h��Y�@��S'���@Μ���^@�%;��j0@�W��ݞ@��oٌ]�@�Ԗ��2,@���%�N�@��J���@����嘡@��Ѫj�@����$� @��Xz�5@���@�8�� ]�@�e�EZo3@ݚEjk[�@�ռ�n�@�/\���@�x4"y@�Y�yU<�        ?���G��?��Г�?㺍��7Z?�{tX9�|@�2}�=@��qA@Q�b͝@�U�1�@ ��A��t@%P �w/@*0鯲C�@/����d�@2���/�@5��-���@9K�>g��@<�d���@@k;sba+@B{�?@�@D��eMH@F�l�O��@I`�=�&�@K�y�Ƕ@N��Ak�@P��ϣ��@R2t�-�@S���SB@U'���Y+@V�2��m�@Xs�G��@Z0(v�_�@[��W�C�@]�PeD�@_���"u�@`����/@aߡ����@b���V�@c��e%@e��p4c@f7���@g_w)�0@h�]m�q�@i��SPA@k u�D�B@lCtW�a@m����9@n��]��<@p�*+�y@pǳGc�@qxLs@r-1���Q@r�s�'h@s��j�@t[ԆեZ@u�~$ m@u޼�j�
@v�as��D@wl��ȕ�@x7�-�h@y�|���@y���xSk@z�&� J�@{����@|W��pp        ?���jcd�?����Q:�?�e<_Z?����`P�?�a�f��?�7n���@�Tv�Q�@�?V���@^�Td�@,�r*)@!2�>�@%f̅�L�@*E.E�@/�B���@3(���� @6�"s�6�@;��@?�bXv��@B��L,9�@E�>��IB@H֮�38�@L�O"`,o@PQ�C���@R�5T �Y@U�E�n@Wǋ�O��@Z����@]�/�j�@`��g_}�@b�B���R@d���ek@f�����B@i1��X�@k�J2�8@nai�C�F@p�u4f?�@r ไ�$@s��m��@un"!��@w9bNq@y&�U@�@{ךɵ�@}2�����@eL��ѓ@�ّ4�Fs@�^���@�QS6$�@�����X7@��m�@�q�p�ʔ@����w@�}��or�@��]��@��5��h@��6ȋQ@����C@����}�P@���#y�n@��mY8��@������@���f8f�@���,�@���_6�q        ?l��|$?��j$V�f?����7;M?�ԧ�V#�?��CW\*?�D9N�?������?����I|?�o���@���׊^@0�@#�=@�%�{%8@����P�@#����5�@)�Tp���@0�1�Dv�@56�s[�@:�b�s��@@d���~j@D��oUu@H)Ϳ��@L�m���s@Q Wi�!@T#���8�@W��B�v!@[Aoy�˃@_g��s׎@a��R��@d~ŌE�@g<�O�1@j7�`��@mt�k*�@pzR�)�@r]z]%h@te��l{@v����A�@x��]��@{l����B@~����@�z����@� bSޔ@��od
jR@�X�j�>@�-�b픾@�b�!�x@�.����@�]
�<�V@��]�k4P@�m���V@�VPĸ@�����@��ӊ�@��m����@�0�2 ��@�׌��o@��&4�$�@�c��2�+@�JD;�@��n�{~|@��%�@��KҲ�@��J#��@�A�'�        @%xԫ�<l@Q�����@ki�^V��@}�3!�!!@��1�@�R�5@"�@�I�i�ԏ@��FRX@�I�^@���3}�@�n��@�@���_��@�y�Ov��@�O�w�d@���6�F@� ��)@�G����7@Ͱ%EH��@Ч1W��@ґTz��@Ԗ�a77y@ֶ�GOT@���.E@�I�s��m@ݼcʥ�k@�%`Z\�@�z`!��@�����H@�M=�*�&@�ʛ5��@�T��=��@��S���@�_��x�@�=���@��:�J1>@Ｄ��9C@������@� �~��@�zN˼@�i��z4@��l9�@��ey���@��a$�I�@�����@���|�:d@�ή:��@��� WZ@� �3�E@��N�i�@�B�kɰn@�h���)dA I^gQ6DA ��ſwAxN��	�A:׬�dA��]�S�AJ�����A�/~eA��O���A+���PA�8�LAt*�5:oA���        ?������?�e���?ϗ��\�?�%�z:�?�N/��Y?�;��[@ ��ϸ�@?p#�	@�sU��@�適[s@��jf@F�&f�@���*P�@"ѷ2�@$����e@'�>�n�A@*���P�n@-��NFI@0��/��O@2~��bn�@4c��M�@6`.�&�@8s��\� @:��T��@<�\���{@?<��'�@@ק��ó@B��eZ�@Cp�W�\�@D�~�my(@F=�����@G�o���O@I@�M�:@J���"@L{Y��I�@N-�	�@O�g*K��@P���]@Q��T��c@RĈ%Ȏ@S���q��@T�b2�@U�	�܈�@V�&� ��@X��71�@Y7���G�@Zi���3@[�Iz�l�@\�|��@^:��@_���z՗@`|8�,�-@a3�@�	y@a�,��$�@b����n@c|�}�(@dK���fO@e _��Ox@e�g�^��@f��_+$Q@gĿIS�}@h�^ P�U@i�ޥ[        ?e�S��??������)?�/&�2l?���	*?�J�?��?���ȕR?�2׆>�@��9��@	���Q�@x��E�@�~�8@!�����@'}>��y@.�����@4u�Tň@9�o/T��@@=�!9�@D;��f�+@H�����@NHs];t�@R7;�g`@U�%���@Y��;e�@]�I�p@a[E�Ӷ�@c�VYh�i@f�;\>#�@i���H#@mX�����@p}fk��@rp/�Q�.@t�~���@v���$�@y:EH�@{�>��@~A�?�@����!`�@� E�h͸@���_k�@�0Ak�M�@������@��]���;@���c4@���)�@����e@�k�9��@������@��b��lT@�"	�j@�O��;%�@��B�A�@�\E��s@���	�>�@�&z5�AK@�Ɛ]&�0@�x�PX�@�����@���&͠@�F Y��@��-ȡ�@��3��,@�'����c@�K\�A�        ?y�n�/�c?����!?���4�!?֩r2QT?���d��?���=(C?��r+*�t@��V���@
�cHi)J@�R����@�w��v@!���-�@'�cC�F@/3�~�H@4f��
��@:Ql�.f�@@��Fz��@E�H��@Je`�R�@O�c�Ad�@SF,��&@W	�R~[�@[>:X@_䬧C�@b~��-@eE�v�@hDLv�޹@k|wj� �@n�[ٳ�@qKlq�si@s<x�@��@uI��s�@ws����@y��1CG@|F.nc2@~�Z`�h@����l6@� �Ӻ!Q@�pP%��@��n�ݷv@����6�@�$qj��@��ʺTK@��z#��@�h��?2@�q��T%@���I�@�̦�U��@��h���@��[F�5@�E��ɽm@��>���N@��h��+u@�6��0]�@��[i���@���s��@������@�C�����@�v��ZD@�S�
��@�90�[m@�&��2�!@�'�E�         @.;�|a*@Co�f�T�@`�ly;�@q�Z=֛N@.6�n�/@�/e��@�?P]�A�@�7>l��V@�����!�@����e�@��ʹf@�j��LA�@�)S�@���zpn@����g�@��L�d��@��F�rv@�2�%z�w@�^����@�:�ȵ8@�, �-+�@�3Ai ,{@�O�ΐA�@˂DN,��@��dUᆞ@�Vf� @�N��龠@Ҕ���~�@��(��@�E�y'�@ְ�����@�)�G�0@ٯ�	���@�DI��#�@��]J�@ޙ�GV��@�-�A�	�@����c@�1��O�@�UZ��@�z��&y@��ǈ; @�(���@�H;�U��@�r�R�Q[@� ��C@��f���@�4X��g�@�?n��@����V��@�0�er@����ڍ@��p�i@��!>�0@�W	K��a@�2�,1��@�ٔh,�@� �h<�m@���	�@��h$�e@��A��p�@���y�� @�8};��        ?pl[�q��?���\��5?��1UU�?۹�%	~�?�@1`��?�Krͩ�?���n:=@�9�Y0@g͘׏@�AwKb@�ܯ�y0@/���3@!�:4ز@$�d����@(����.�@,�_k�Bn@0a�Z<ML@2��TR%L@5�
iM@7���h @:a*��@<�=���@?�3n�9@AM����p@BӍ�9�@Dgqy(@Fi ���@G��3,��@It�zZ�E@K@u��;@Mv��d�@O7��K@P}���@Q�Hq!��@R�匽1@S�=5�@T�	'Z�@U��jˇ@W�����@XKk"&�@Y����@Z�{p�q�@\1J�n�D@]�kq)z"@^��ҽ�@`9�꟩3@`�1�V@a����.@b�cm,Di@cZ��I��@d/�M�@e
�ͬ>@e�~�M�@f�|h��@g��q���@h��@Ǡ�@i����@j��>��@k��C�BH@l�}��Xe@m�7���@n�����@o����W        ?{K�Px4?����/.t?�p"z�V?�Bf����?�\���<@�j�o�@3��g��@E(���@	�$�@#�WWb�r@)�R�g��@0#z#ϥ�@4$*ՠ84@8��X��@>^���#�@Bh�o`��@F)��k�E@J�ul�;@O��n���@R�XZ�)@U�[y+�@Y��AA@]��m�J�@aL)]��@c�x�IF@f���p�@j�3�"�@m�u��@p��U���@r�ǘAJ�@u�!��g@w��(���@z,i�۬I@}	�c�%}@����/@��gl��Y@�wd���@�X�7�gL@�X�tf��@�yyj��o@��O��1�@�j2sZr@�Seprw@��9�w�L@���`Y�@��[A�v�@��]��@��I�BF@�x��Z��@�FWTړ�@�)���-�@�#��@��h`+5:@�����@���uZ�@��])��@�4k�$�@�zH�t�@��5̊��@�-qu���@��7j�D�@���ߴ�@��D]v�        ?end�^?��F�|�?��"�F�?Ξ5��IB?�S�N�
?��|ĐI�?���wk5�?�	y�-�Z@�<a�@��R�y@a��"�@��I�U�@$�M�1�@+���a@2�[�@7)8�D��@=7�M��@B(�(b�@FC�ͮYj@J�.K��v@P#k��@S38�@�@VnFl��U@Z��2@^N/E��@a9���@c���;��@f�NL�`@hל'��
@k�eV�@nп�HE�@q�{Q�g@r��n+��@t��0M-@vq,�
ɫ@xl
��j@z~ˋ�~@|��t�0�@~�N
sV@���c��@�ۯ_H�
@�"��8u�@�vٿ�2�@��׸#i�@�H���@��L#�@�Ta}&�@��hW-��@���槫�@�V0�Zk�@��&6E��@�}8�En@�q�.nC@�nnN�٩@�s���@��I��@���Y+� @��K �C2@�Ԇ�T��@� ��It@�4�P%)�@�p)��L@�����Lq        @	/���@A�r��N�@`��g�4@t�
�9@��ޒ��g@�$q0X	�@�#H���@����4Y�@�%o��8�@����k��@��Iq���@�tDpn@�F�l�X8@�qM�ԡ�@���5b˽@�^�2R�@�鷂yo�@Ǖ���^�@�`Z;�@�F���F@�#Y��9%@ѯ1E9z�@�E�br�&@����-�@֑G�	�M@�D���A�@��9i�@��2�o@ݓ����@�i�=��@�E/#��@�+��a@␺*ӏ`@�*՞��@����@�ź�k@�~�i�@�6�p��@��=%�L�@���y'@�o0OC@�K'��R:@�A&��@��9o@�@�Hu@��-@�S sn��@����&�@��ü�@�j\��-�@�$��R�O@������@��� �@�j�|�n@�4J�8�%@�V ��@���U�:/@������@�|��� @�WA����@�4� ~�@�֢h�	@��ɀx��        ?V�˦�=?�$l�K�?���;>?���ݞ�?�JGל�`?���T?��r�`�?���?��䂼?�ɼϺ�?�~����?����l�@��nEI�@H�2��_@	NQư@ʃ��$@a���A@���;@ ��:n@g��*��@����x@ ��E�@"�6a�@%,�e)��@'���U-(@*࡛�l@,��p�@/kN��!@1)x�q)�@2����@4E�;?�@5�T��UV@7���tE@9{3�	�J@;^���F@=V��a��@?c�)E�@@��#pT@A�mx���@C&f#@D/�7���@Eh9 C�@F�՘7�c@G�z�X�@IN/�֦�@J� ��@L�?�Z@M�\?�:�@O< �@PL��[��@Q�Z��@Q�
�Z��@R��>�lz@S�tή(�@Tz����@UaC�1	�@VM��!a@W?����@X7�x��F@Y54r�@Z:*���@[D�p?.�@\U��U�V        ?Gܕ�`?z^�Kb��?�����?���i��]?�IEa�i?�zê�B}?�n&�Ӷm?�ֶ��B?�Q3F�z@Pn���f@	��+�m@�,z��@�%Z��{@"h�Z���@(��Xi@0k���@5S~�T�@;?Mp�\�@A&s�G{�@EM�=}@J"n�[ m@O�U�/Ex@S
%�%�@V��C�)�@Z����@_@���@b%8��K@d�H26��@g��J���@kI����o@n�R*J��@qc��W�@syY���@u���w�@x�Z�G@z���9�@}Fs
�@��8�&@��$��@�FW�[�@��J�@�n@�_
�Fl@� di�8@��?��S�@�׉�_&@��<��c�@��c��`@���BJ~�@��(���@�*&`�)@�Q�$֯�@���3��X@����m�e@�ܚ��@�Rt4�@����e?�@�ʀQ�@��e��@�;8mI@�F`G�,G@�7.J�@���ܺ��@�����1�        ?96^�.�?m�Kq�c�?��@��)?�֊+7Z?��%8��?�quh��?Ә&c�O?����xw?�񬢱Su?��`��	@ ��F��@����0@����B@�{La��@ �봱-@&_5��' @-&�5u�@2�[��q@7�3�,N@=6��@A�;9�@E��}�@Jњn�@N�:ѿ��@R0�Q��@U;���xJ@X�B@�}I@\J3��'@`)����@b[�Wa�@d��q�\�@gKiE���@jm�$<@l�ޠHW�@p6į�z@q��+�wB@s}�02!@u[�匧(@wSS�k�@ye4���@{�S���@}��M�^�@�Nn��@�Y�\��d@����?hG@����@�bK$��)@���l<-@�T؋C��@��ˢ�@�|�پ'B@�$��MB�@���xd;@�N��2ZZ@�6�ßh@�&%���@����G@��� �@���֨@�+�?@�?�6B�@�[����@���BQ        ?��T3��t@���{�5@1{��@D.V���@R��V�JW@]��G��@e�+?��@n$���7�@t~�Wm@yĝ-n�O@�0�{��@@���N)�@�A-�BG_@�cGal@�K�Z��@�`Iӫ\1@����[y@��r����@�􄙄�@�X���@��j8�{�@��p�*@��s�5;R@�Q�&��@������@�򭴾�`@�	�
�U@�@��ܢ�@����C]s@�
�m@���]��Z@��k⯠�@�|is}0@�y��,��@��:7�@ƀ�(Uw�@�1Pt�@ɶ���9�@�a�:ԙ@��F�@�ت}Zg�@�R,���@�=�dI�@�/0V�r@�&�[0�@�$����l@�)�u�ύ@�5#���=@�G����@�aI��{�@ق?���@ڪ�`H�E@�ڕ�s�@�#o��@�Q_�P�@@ߘa��@�s��Tb�@����@�Ε���@�L�+?�@�:X� �b@���8d�@��;���        ?IS�/S�_?x��"�q@?���G�d�?�W|�M�M?����V<?�<xM%?̞��?���e�?���(�?�[��W.�?��	VZ?��_��?�x�z�֢?��@?�]��1��?�^Ij2e�?�����@Jt���@���n
}@�a����@
�S׍�@L2{0��@��!�@@��e�H�@Ի�?@\�T&c�@�|��@iP�ѻj@1ǺA�F@!q3��5@"��gG�/@$V����=@& �[�8�@(�x��@@*��XQ@,-�^��2@.m`�V�@0e�Ɯc@1��	K�@2���9@4OРx��@5��r-�@7<�,6	�@8��(Խ�@:nLax��@<!qx�@=�qq���@?�r�P˥@@�I&���@A��-d�@B��BZ@C��m(cu@E;6�F@F$��A@GPw��@H���K�@I�z�(m@KQ�E>@Ld3�n�O@M�BH��1@O*���3�@PN��@QqK[�        ? G���Q?V=V��?~a%g�e�?����i?�VI#δa?ư�&r1E?�Pޑ��?姁3H��?�k��{?�#�$@-O;=K@)�>ġ@����l@!�o���@'3{S%��@.��/[GC@3�*���@9����l@@o^`�@C����~@H-"� �@M*(/@Qg[U���@T�Q2���@X�Ƨ#@\`g���@`,��z�@b�]#S�@e'@,s�@g�Y�)]�@kx�T��@niu���@q��0�@r�Hי[h@uC�M�@wH��y_@y��Jx	@|>~e��@~�	! @��q��@�z�(��@�ȏ�v�@��d+U�&@��68}y�@��rS�@�����@��:qE}�@���[�>@�2��{ϝ@�qtxv�@���ʴX@��.Uń@���<��K@�N$%@�@��Gg�z+@�?�X�@���<D�@���;�e�@�J��
S@�@�^�Q@�@��S�@�JV��U@�]Ur5{�        ?Qgv?Q�B$H(�?u͉��AV?�D2|ʚL?��j��ҩ?��L��M?��ê���?�|'���Z?�JH;T3U?�!�q}@ ��ӈ @	uh��Ec@���L��@Q�)�(@"‽w@(<��ݟ@/��p9@4lbe+@9�f����@@AN���@C��{?�o@G�(͊V@L��a��@Q �Hf��@T  I���@WT��ܣ@[�EmH|@_S�uS�@a�^2z�@d �39�@f�~"�c@i�e�[�@l��ce�@o��g�@q�$	X��@sx��G6/@up'9�h�@w�~����@y���-��@||�fʏ@~���A8@����r�{@�����2g@�`��]Nb@��O�f�1@�vV�@�1�UI@���-�@���?��?@������@�r��ϸ�@����U�U@�ʯ)��{@���̰|@�ϖ}�@�3���@�l��!~
@��մ�H�@���vX@�_�5si@��`S�E)@�@8��@����|        ?��鎭�?�]�@l��Mr�@$�6���@3�Ko�bQ@@?���@HuD�?�7@QN&$�0;@Wn7��b�@^�=v!7@c��`ag@h�K<�O@n�H�B@r;�Y%pM@uʌX�:@y�ʃ�@~#�
_OU@�|�(�o]@�$g�.w.@��v��@�:&ʒJ@��o~K"@��Cz#x@��7&2�H@��+���@�L�1��]@��_k���@��n
rA�@�p���B@�E"���@��̧��F@��5�t]@��)A]�@��u5�n�@��k�V8@�����S�@�dH-��@��!�eM@�N/)�M@�������@�4�%�@�ũ|�(�@�k+G�D@�%��u�@�����\@��;/H @��v�-�@���t��_@�
��C��@�*����@�V�zj	@ŎZ�<�@�Ѱ'��@� ���^@�|)�)�@��cAr�@�Wb'B��@�ױ5��z@�d��7;�@�^f�ww@�R�(�Ք@�-gQ��y@��'�M