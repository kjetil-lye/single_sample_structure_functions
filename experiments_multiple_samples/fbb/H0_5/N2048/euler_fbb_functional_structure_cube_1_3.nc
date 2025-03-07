CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T103711        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?�׏�v�?а|]���?�}A3��?���8:?��$�B�?�����r�@�q��@��M@�S[ʏ[@O�?���@$�����@?Z���@ NCbp�S@"���
�@%
���@'�#/��!@*@��,@-�eb
�@/�	���@1s72u�,@2�>�m�@4�Q����@6>1�F��@7���@9�{�A��@;z|��$@=Qx����@?4Aq�4�@@�U�M@A�G��g�@B��(�L�@C�1'�@D��7��-@E��}�@FҼPvU�@G�üе�@I �D��@J<Ƭ�]J@Kj��P��@L��h�@M�����p@Oy���@P*�E�@P�'�0*^@Qt!P]��@R�Y���@R�At��@St[�ݙ@T#����g@TՉ���>@U��R:�$@V?۬v�=@V�b��i@W�!ڟ@Xp���@Y/36pk@Y�~��4�@Z���P@[y�S���@\A=)YІ@]M)�F@]��))i�@^�{]��        ?��\�<?���c+?�#���(?���WrN?����Z�G@���w|@-X��43@���7�@��}�5N@X��.@ K�#��S@#?PJPj@&~���@)N�i��@,���]�@0h�ۃ�@1�L���@3��� ̮@5���S�@7�UC�@: �@@�@<[�rX�@>�?��}�@@�)`@A�Z����@B��{�V�@DE��w@E��O�@F�¶
�@HPWnMzI@I�rg��@K'��?�\@L��\U_�@NHyf��@O��&�\@P�3i�#�@Q_C��:@R+�?l�@R�!�#�@S�ҷQ�U@T����]`@U|{��@VX\6O�@W76�J��@X��M�i@X���Ř#@Y�2�q�@Zυd T�@[�����@\�^�V@]���\@^�ީ�`�@_�����@`B�x:��@`�/�� /@a@�M҆@a���I�p@bC���[@b��,���@cK��M@cЧl�3:@dWW ��_@d�+���        ?����@�?ւ�r�$�?�G*\j?�J}���b?���Y)�@��*{9�@�<��)z@�4��@%bq\�@�:�@ ����;�@#���x@&�2�
@)��f�@-k�L�@0���Z�@2f�Iظ�@4^��(��@6j􁍗�@8�Ď��@:����@=}��@?[��;�@@��?�@B �%��M@Cf�t2��@D�����@F�,��@Gk�yi��@Hҏ���@JA>��@K��ۥ�@M5E�s�@N�[��l�@P#T��F�@P��u|@Q�:�r�@R��+8T@S^���^q@T6DZ�z@U��� �@U��}�k�@V���9�@W�"�v`�@X�t���@Y��	��D@Zs.U�<C@[c�F���@\V�驽�@]L�%�&@^E�H��@_A�lD�@` 1���7@`���Q�@a"�S*�@a�^���@b+��6@b�4&��5@c8��VQ@c�I���@dKCY��Y@dւ?͝H@ec�Mܹ        ?�
���1s?�P��[?�;d\� @ q|W���@��l�
@�Ok`=�@��N�M@*�(|�@"�NS{�@&Ͽ�C��@+-�l~
�@/�4�Q�H@2mQD�Y@5�/��d@7�lz��
@:�m��i@=Ԯ9E`@@�"W�<�@B*-H�OJ@C����@E��,_5b@G�g7�@Ie�$4=@KY��!�@M\!�Q{@Ol����h@Pŀ�:΃@Qۅ�	n@R�EN���@T�����@UE��'�E@Vu�N1@W��[���@X��5w�@Z-���@[vgM"&@\���**@^;^�X@_v�_
�@`k���o+@a1�ɤ@a�l�7�a@b�rv[@cJ97�j@d�
�8�@d��|�^�@e������@fTA=S�@g[i��@g�Zy,@h�I��~y@i��-k�@j[SfH�@k1��cf@l	@���X@l���L]�@m������@n�A&]e�@o� �y�@p3�/��@p�@�ǭt@q�c��t@q�༒        ?��(�e?�C�N!l�?�}�R��?��Q)�
?��`�d?���MF~@�rxk�7@
]�L���@[�{��@�ވ�Fe@�h�>@�'�#�O@�M{Bz@"�C��@$mS[dI�@&�`�w�@)i����@,����@.�&gү�@0��>�]3@2GbYpS�@3�GSo�,@5VE��dq@6�}�ߨ@8�x���f@:='z4L@;��OS7Q@=�iЈ��@?~��'�@@�	`�+�@A�j!�Z�@B�Q�/�9@C���@D}^�:�@E}S�C��@F�uV�b@G����e;@H�羫C�@I�8�O@J�zwk*@K��Mk�!@L�\�p��@N�aSz@O/L��@�@P*ͲO2<@P��f�F@QVI�@Q��@R�|�4u�@S$
*��E@S�/Ll��@T_㝾�@U wG6m@U��ɡJ�@VE&K-@V�V�l�@W��!e�@X7)͚�@X����d@Y�,�F�@Z5�l1^@Z⌎BZm@[��~rb        ?�2����?�X�u�W�?�gS�W�z?���!	�0?�Z�dV�@\���V@���[�C@H�X��@��[C$_@���]�|@ w�؜��@#O�7��@&Va8��p@)�7��t@,�!�i�
@0>��hf@2����@4�g���@6I�i��@8+a-�|@:W�y�c@<�z�]��@>��Ɯ@@�2H(�@A�H�:�?@C!֓���@Dl�G��5@E��3�@Gr��G@H}r��@I�Q �[�@KYd�m@L�l�%�@NRF.q�@Oى��ǌ@P��jE�@Q~O��@RL<�4~@S �XF�@S�`�=�@T�Ƥ>2@U�FvWRN@V���q!�@Wa\;���@XD��ݰ@Y+?u�W@Z����w@[ �n�S�@[�o�=��@\��;��@]�Pw>H�@^�?,j	�@_��*�\@``��@`�>l�(�@a`�q���@a��\�@be�xL�3@b鴦x_N@co	��ƕ@c���a5�@d}&�kr�@e芼&�        ?���r
?�ZE@m�?�Df���?��Y�^D?�Mqب6@Y
�CQ�@�j�bO<@L��@��N�F@�2\�J@ �]U��@#Z��s�@&e����@)���n�@-v����@0M�C�x@2-:\�>�@4!�Ч<�@6*�02�@8Gܯ�@:xwM6X!@<�32�x.@?��^�@@��^��@A����@CAO��p@D�'Y5@E�|6�c@GG'�$@H���@J�~�e@K��k�;@MRB�M�@N�����_@P+��5�@P�D1�3@Q�����@R�`Yu@SXI[�@T1���@U��h@U��ԫHG@Vҙ��! @W��0u@6@X���X �@Y��~�@Z�] ��@[vZ�(g�@\m|-D�`@]g�f=%!@^e	�H�z@_ef1�2�@`4c���@`���h�@a<A���@a�fσ��@bI�UĪ�@b��S��@c]o�|�@c�AUwEZ@dvs�b�@e�Ig@e��ǆ        ?Ŕ��U5�?��$��?��#��@ (\��b@�y���@D|��'�@�jd�@~��@"R�$?�@&8�s��@*j�",�v@.�O����@1��$ݿ@4W�l�w@6�&�!E�@9��P���@<��Z"�@?�;j�3�@AV�Gh�@B��h� @D�%<���@FI����@HQG�Bi@Iӝ��=�@K���.�@M��<&�@Oz���V�@P��1=��@Q�2�v�@R���y��@S�ڶͱ@T޻t��@U�D(B@WB{��@X.^�4b�@YR?���@Zz��P�@[�hXvh�@\�}�#$@^ɹ��?@_G7h���@`BY���@`�6��@a����~o@b*T�[\�@b��i�*$@cyu� �@d#(�-�j@d��� �@e|�����@f+�\2V@f��~5O@g������@hCضh�f@h��ڵݵ@i�a�:[@jj "�*�@k$o8Qf@k�Z0�p�@l����Q@m\�*��@n��&j�@n�bq!�        ?�O����?�"�B��?�����s?�C5��?��hD��&?�zx�S��@C��RA�@	����@6g�c@q�v'@��!�K@��Ip�;@���H@!�ԭ�@$�٫�'@&j
���@(�u�=j�@+�k��S0@.41��K�@0��׀@1����ȳ@3k��a+@4�ol�..@6��%���@8#l�@9��$���@;}�x�I@=9?O��@>�eO��@@g�T��@ATW��;�@BE�Qhř@C;�pe�f@D61g�Z@E5ڛ[�@F8e����@G?��<��@HK�<��@I[�e1Iw@Jo�����@K�ʠ�9�@L���a#�@MÀr6E@N���[@P$Rp�@P��FR$(@Q3�w�%@Q̶ch0@Rg_��k[@S���@S���O/v@TAdd�@T�����@U�|5�(�@V)��@�N@V���=�J@Ww>��t|@X 0��y>@Xʠ���`@Yv�q��@Z#��
@ZҾ��ܯ@[��k+�V        ?����F�?���MJS�?��Kzb�?�\�Y9<?����*E@�L���@��~ͭp@��(L@Q�G�6�@/�4�@ )=6tc}@"��a�.@%�FF��@)5/�@,l�(�գ@/�}N�$T@1�_�D�F@3���:�@5���G�@7�񼴔�@9��@<#�.)e@>m�<$xK@@d��+��@A�wp���@Bڧ&��{@D"85B�@Er��-Q@F��Z�@H)�[�>�@I�7���3@K g�[u�@Lw੄p@M�^�<�@OzN�[�h@P�L�]@QL���v�@R��5(@R�U.�/@S�x���@T��r-8@Uo�̱j@VLT�@W,���č@X&�
�@X�`�>Y@Y߬Bo'u@Z���f�@[���c�.@\����w@]�xUn@^��b!�@_�ԟ�{@`G�X���@`ǵ@�P�@aH��M�@a�3�@!�@bN鱑��@b��sqY�@cZ2Rdb�@c�� @dj�ܱ%�@d��-V6�        ?��/��?���^�2�?����Q?���up?�*J%@"`h[}@8y��>�@>���@�T��c�@g�jz�W@ U�qIMT@#(��ɭ�@&,HF�@)^=y<@,�\&�-@0$.�<�@1�U�bQ@3�D��@5�pR�J�@8	����9@:4�g���@<rM�X�@>�#UI+]@@����9@A˅�6�@C��:@DX'�Q��@E��t�b�@G���p@Hh ���j@I�hǮ�@KDA�x_�@L��E���@N>�$��@O�����@P�cs�X�@QuT�;=�@RC����@S���:@S꼌ֿ@T�:���@U����(@V}��>�@W`�cS@XES���@Y-�{�T�@Z����@[y�`y�@[����#@\�(so��@]�ZԲH@^�fn�P�@_�AxOŬ@`mq7d �@`���<�@aq([���@a�?�{@bz8�2;{@c �eQ�0@c��'�@d����@d���@e'�U��+        ?�r���?�ܻVO��?�Â޵T@ 
��@_aar��@'x!�7\@�}�CZ�@V�A �@"=�E��@&#&���1@*X&�R@.�֨�@1��)�@4X7�P�*@7 �:�@�@9��4�!�@<��ݪ?�@?� ˂6F@Am�O��@C̶���@D��
��@Fw?o�P�@H@����@J����@K�1���}@M���i@O�F`�r<@P���@Q�7�&��@S�US@T"~6i�;@U=���@V]$ �;@W�v�*��@X��<�@Y�����@[�|ҷ�@\K'<fQ�@]��<�M@^��˴�9@`
W��$I@`��Ӌ-�@aX�֖�@b����@b�`�F�@c_F�N1@d?o��@d�C�Ȫ@exK�)|�@f/P��!�@f�ME�2�@g�< �@�@h`�L�@i��U@i�~���@j��:��@kfa��B�@l,��I@l��\T�@m�����
@n�7 ��@oW�v�:@pro&MF        ?������?�b�-�+Z?�s@1�ӧ?�7��N?�@�.�a�?��v\Cl\@֝��@	[�c�@o��(�@8s��@��7���@Y�a��@@Z����@!H�k�1�@#}T���@%ʤ��-�@(/u?Q@*��!�3@-<�@/�w���e@1N����@2��j�@4'"���@5��s���@7%�P$6@8������@:H�޹3�@;�Z7��%@=����u�@?>��	�@@z�i[�+@AZ��Ȋ�@B>��Γ@C&1��R@D�8
u�@E ��d�q@E�@�bN@F�k�d��@G��Xgr@H��m�@I�m��/�@J�]��]@K��cD�7@L���\X�@N)��)@Oc�
�@PК�ʰ@P�ꂉe�@Q*y���@Q�w�Q�@RGޱ���@Rئ�2&�@Sj��[�@S�;D��@T��M+ (@U(�{���@U�1���E@VX��I�@V�=��^@W�g���@X(����@X�h�C�@Yd0�Bq�        ?�A'�C?�\ͮ=��?�i�RxR?����۷/?�_7U�b�@a��c��@�����+@O�A1��@ˍ��{�@�����G@ �4M�@#\c	C�@&g7�D@)��;!�@-ZTԗ@0M�Q���@2,�0\�@4 A����@6(2�pSx@8Cϸ��@:r����@<�Ӳn8@?�)�m@@��kڻ�@A�gUD�w@C6��!7�@D���ew@E��	�p�@G4�m��@H�4���+@Jz�n�@KyEV��S@L�p`���@Nvڤ+��@P 1��f�@P�t����@Q�'S̝P@Rc;��g@S5�Y©�@TX����@T�Jէqr@U�p����@V����]�@W�-�4We@Xg�щ�b@YP?��uF@Z;��E�%@[*_"�9�@\߆r�m@]K �|@^�75��@_�Q�6@_����j@`<痢�@a �#��9@a�#V��@b$�n�@b������@c8�N�@c�D�UȽ@d$��`@d�K4�Q@e;<-_H�        ?��EY/�d?�򒛥��?�$��#?�ϧ����?�!�A�G�@9�T|Ξ@V��Z@.��*;@��k��6@v�GM@ a��p�@#5��@&7�.D�@)h���6@,ē���@0%�Dt7�@1�+��R'@3�ⴹi@5�f��_@7�5�B��@:"s�P�\@<Y��J�@>�Y����@@~�f�@A�B��ʂ@B�/���@D5�$���@E��;{@F�lK��@H3uOfo�@I�̂	�@KO8@Lr�5X�B@M�NS�7�@Oj��U�@Px-ٝ�[@Q>X�I�]@R����=@R�-��׌@S���ܥ�@TvI 1��@UK�����@V$=�PJV@V���Mc@Wݞ��(&@X�yP	�@Y���l@Z�N�e�@[q8�Y�?@\\�:�@]J晁��@^;��`,n@_.��Ǥ@`7!�AG@`�B�C�p@a�P(�@a��.ࣰ@b	��b��@b�b����@cY?��@c�w7z!u@d��}BB@d�<y6        ?�壘e�%?�l����?�Km��N�?�AJ�3*�@��e�m@�M�5�@9�%�;�@s�F���@!���L�@%e=����@)j1�J@-��ܢ�u@1�*�@3�+�M�@6�ꄾ�@8�G���@;Zڸѣ�@>-[(�[�@@�mרRc@BEL��]@C��6�D<@E4͈���@F��e;�>@H��uMib@JA`0u�@LN�l�p@M�a�|��@O�b�|�|@PƏ�+��@Q�4 Lp@R���|�t@S�o���]@T��8�$@U���ig�@V�ӖA@W�7����@X����
�@Z
Z�1�@[&�dkF�@\GaM9��@]k���p@^��O�x�@_�W���@`wQES�u@a�v"I�@a��c�A@bH��-�1@b�@�sw@c�h�24+@d)+���E@d̀��@eq`Mǌ�@f�˴{^@f��P;��@gh�}��]@h��8�i@h���#��@im+�E@j��q @j�
���E@k}n8�X@l0�{Y@l��        ?�CB�tT?��[d�?��Y�?��>��?����%2�?�`0�r@8�3���@	ᴝG]_@�!KG�@z���r@)�?���@ȿ��@K�8h�@!� ��0@$2�y"@&�͈MWM@)1lG#�@+�+$@.�W�|L]@0�)Iv��@28A�)C�@3���AG�@5S+"j>�@6�|5�t0@8�eĆ�@:S�� P
@<^.�i@=�Ո�@?��9��@@�B��Lu@A�d<�uO@B����@C�O��@D��k<M@E��G�|@F�A0�f@G�y�"��@I�g<��@J)V\"�@KK��7��@Ls]��@M����n@N�+��Z�@P�ʣa@P���iRH@Q=v�#�@Q�x���=@R���#Z@S&�0x�@S�N7��@Twìy�F@U#D�3� @U�ʽ!L@V�N�C<�@W1ʼ��@W�8�>��@X��T��o@YQԄ�:@@Z
�6�6�@Z������@[��	��@\Ay\�Y@]�w��        ?������b?֥aQo� ?��&W7?�<m]֓N?���� '@��2}�@���>@�@��9�|@ �hO�@Ɏ�}�@ Ă���@#�m�m@&�e-�Ȅ@*���Me@-�4�OH�@0��e�@2�Q>5{�@4��b�F@6��^/@8�X�S�@; �WR�5@=Q��w�@?���
�@A@\�%�@BZ���4M@C�2J@�@D�eA/�@F](��<�@G�NX��@I3��_j�@J�R�4�@L*A�Â�@M�//or�@O?��Anp@Pj�p�#@Q9F,��@RW|�M@R�ޒ���@S��U�/�@T�Fa�@Uu��BQ3@VX4�`��@W> ��@X&���N @Y�ȸvP@Zl����@Z�d�D�@[�{�,�p@\ޭT{�@]ؓE��@^�!,��@_�KtA@`k*��@`�"˛�@ap~�k��@a�%��	@bz�]8��@c��5�@c��=�_d@d�8�@d�m���@e(��'�/@e�V��ˌ        ?�0Yӯx?��BL���?�+��.ֽ?���+�e�?���! �@<)�^S@�ڕw�@uG�g@�����@����<h@!IS��ܧ@$Ljf'�b@'��Ez��@*�� ΀@.���v@1)�T��g@3&���Ϟ@59�Ny�U@7b��N�@9��H)�,@;��|���@>\��A��@@lu�[�@A���b&�@Ci�h?@D^���O�@E��>��@G-�qv�@H�m9Х_@J�<b��@K���t@M2�L!p@N�J� ��@P2܇�_�@Qi4V�)@Q۶�O��@R���͵@S�Dc��@Tt^#�d@UX�J�@V@�r�u@W,#6+q@X��2��@Yj��.M@ZO��v@Z�Nc�3@[�^�5?5@\�w��P
@]�=�T@^��N�@_���rP@`�;��Le@a
�d1)�@a�fKەs@b�*P�m@b�09�@c2'�W�Z@c�{���y@dN(����@d�-V�u@eo��k��@f-d���@f�#�p�y        ?�V��y��?⌑�O�?�x|j{�@ ��X��@	J���@Ο���W@Ć|�6�@}Y*mŴ@"��=""@'	��CU@+o�����@0J6{qH@2��@!<�@5=��G�@8�&
O@:�����K@>���!@@�|g�@BDNϪ�@C��w(_�@E���_��@G��\e�@I~��R�@Kqu&���@Mr@���{@O��)�@P�=�Ф@Q⮷=��@R���$@T��_��@UF3�o@Vsz��Z�@W��7��@X�3CDк@ZP�f@[d&K��@\�����@]���#UY@_T+@^��@`W�5��@a�h�S@a�x<��T@bo���K@c'��u"@c�A¤�@d�8�@e^���W_@f �Mj@f��뾁�@g�y�g�x@ht�j:~�@i?����m@j��2F	@j݉�h @k�����I@l�1XY��@mZҾ)2@n3�z�k@o�J��I@o���ܴ@peNшZJ@p�ޝ݀@qGp,thC        ?���Ѿ�?��*�n�?�>S-�=4?�]T X?� �:��?�hḸ�@���_�@	 .��"�@0�iZ�@��q&r@v4��Y�@E|S��t@Q;���-@!K���@#�Yx�B@%�+˻�@(X�n�6@*�pؑ�X@-�i���\@0$����q@1�\���E@3pI�@4����V�@6�r�Q@7�|#�@9J�8�K@:�����@<�N@�Z@>jw(�@@�����@AŸXG�@A����>�@B��M��@C�� k{@D�.�=�@E��
N�E@F��9[�@G�1��@H��Ҏ:{@I�a��=@K"�s�7@L+���@MH�,�`h@NiX͊d�@O���'��@P[ ?F�@P�0� �=@Q�
Z@R"�G��@R�d�C�x@S[��0;�@S��d��@T����?@U>�^.@U�Ee��@V����j@W/��٤�@W���o��@X�T�n@Y/�X,(o@Y���b��@Z�>��,@[>I##�M        ?��q��`?�UJP�?�P���?�2ʍ�?���=J @��s��@//0��w@��jd�@����p@`�����@ Qav@#$"J�D)@&&�Z� @)We��@,���Q�@0��,��@1��!S7@3���'��@5��&�ݕ@7���3�@: �hO��@<Y�
B�O@>��W<��@@�΅f�@A���X�@B�aѢ>\@D:��x2@E�}�A�@F�\�[@H<tT�چ@I�2���@K���@L���\@M�x�:�@Oy�!I��@P�7��#w@QF��eS@Ri�=8�@R�!mx�@S����@T��u"@UU4���0@V-����@W	 '��@W�Usx:�@X�T���t@Y����@Z�����@@[{��,<@\g�'wء@]V���@^G>�j�@_:��Ų�@`��b��@`�v�*�@aӻ �'@a�̒��*@b�u@b�t]� �@cʑNF@c��eo�@d��lT�@d�4Њ        ?�!4C9י?�d^h��?�5\ {�?��8�H?�8����y@KQ�ʂc@p�1��@A^�5(n@�mk�8@��,�=@ xH����@#Q��a�v@&[n���S@)����!@,�lT���@0Eb��@2#I�1or@4ϰ��@6fUβG@86�\S�@:c�(︎@<�w>;�@>�Y�Ch@@�w�
Q@A��`�F�@C)Ȉ^@�@Dt���@E�Z��@G#(&�q@H���
�A@I�H�%�q@Kb���r@L���5�@N[s0��@O�,BCb�@P�f��@Q�N#��2@RO�J%�@S �1�
t@S�����@T˧ü��@U�ɦ�	@V��s=��@Wc�u@XFl��i@Y,�0��@Z��y�@[ O�EG@[��@\߼���+@]ӏ���2@^��,@_�@�3`�@`_��05-@`޴�\q�@a_*Y=�@a��]![	@bc��L9h@b�
yV~@cms�F%l@c��"�:@d{�Q�`Y@e��8<�        ?�Ԇ<v�b?�V��]��?�8Zt�IG?�)�]�ʹ@�IRK�@�:�=@C@��}@��f�:�@!�u�3�@%�\k*@)��,��@.�[��k@1]?���@3�(l��@6m��G@9&#gSME@;��

�@>���O@A��]9@B�F����@D<�l4�@E�_�U�@G��$>@Ixj����@KP#��%/@M3�_o�@O#���!@P�d���Y@Q���O?�@R�����@S���%�.@T��9��*@U֢Ey_-@V��@,�@XC���	@Y@���u@Zn 4s��@[�r��]j@\ט�{@^�1-�@_T����@`L����@`񘷈S�@a��c�՘@bB)>��"@b���K��@c�}��@dK[��@d�RS}.�@e�Yf��@@fgi��s�@g|��YA@gي˙��@h����/@iS��7�g@j^��8@j�#�hU�@k��r���@l^Q��@m%����@m���w�@n���-�u@o����,"        ?��~QPP�?�_��9?�rÛi��?�����?�A�Շ�S?���o�1@���%</@	e&��)-@�_�nb�@��hLl@���?��@�ϲ%�@�d���@!r$�t�@#�H�s��@&��<'�@(�]��@+����3@-ɝ����@0FY���2@1���	+@3,P�?�@4�1�k)@6>���@7����@9||m�jH@;*�KO��@<�+�7�@>��Y�E@@8Шq�@A#�}HA�@BC�O;�@C~��\�@D K�WE�@D���;�H@E�T3%?`@GnC���@H�_���@I~�e/�@J1S����@KHH�?@LcN�t�@M�Z,�W@N�\U;'�@O�K+�f�@P{��L�d@Q�o��f@Q�"����@RGD�ɺ�@R�E�#�@S�!:B�q@T#��*(@T�Y���@Uj�X���@V���@V��}Ί�@Wbc.&k@X�>��@X���S�y@Yi�K@@Z�˺�"@Z��LEw@[��t:3�        ?��k�Gu�?���~l=?�"57��?����`�?��@9"
@!u��)\@4����@�#ʓ�@�G�r.@^�g��@ N���@#�ћ7�@&��9�@)M� ���@,�l[B�@0����@1��}�61@3��g��R@5�6�q��@7瀏�N@:'A�z@<@�}���@>����s�@@o��ρr@A��o+�@B��(���@D#Բ��(@Eobh��@F�[t�@H�'��@I}ݞM�@J���D�@LU ���@M��T��@OG	l�@Pd�<�o(@Q)@�ʥx@Q��"D�@R�D��8@S��~v%�@TYX���@U,R��oV@VS�3�]@V��?U�@W��pd��@X����`G@Yu];�@ZX�s�j�@[>��rP@\&ԅ�Z2@]�����@]����o)@^�;+�p�@_�	_>�@`j���@`�3���@aart��@a��=�k@b](��@bܖ���@c]G^Y@cއ%��@da ��$Y        ?��f>�?֎m�&g?���v��X?�hh�u?��#��@�sK�d@;���@�mS�A@_�tb��@j��{��@ �G��6@#���ލ@'(s<@*R����@-�&�u$e@0����@2�����@4�a�]��@6�&���E@8�w�F�@;4�6ӭo@=��_��@?��/�;@A4�*a@B{O��@C�?5w��@E"4B�X@F��DAWu@G��_(�@I]F~o��@J�ۙ��@LX~�F@M�$�@Osm�]�.@P�?`:�"@QV��;[�@R*���>@SbPp�@S��j�D@T���)@U�2�88@V�&b�L�@Wn�{��@X[<+ǒ�@YK?���@Z>{�b�@[4�p�@\.a:��@]*�F�@^*pNFFS@_,��@`a@`�,R���@a"�/�U�@a�v!Up�@b1�h��
@b�%��>@cE����b@c�J���@d_��g@d�0�+�6@e~1h�b@fDv�&        ?Ł�N��?��"brj�?��O/h@  ��&�L@���C�@E��2@��yT�@���2�J@"hc(�GQ@&[�A�*@*�P�{5n@/5/8��@2
��z@4��zR~@7T3ɶ�L@:,?�P<�@=$�
�x�@@v�@A������@Cd�D��@E���V@F㤕(0_@H�P�,�,@J�|{N<_@L�ݕ��@N�.��5I@PG���@QRT�E�@Rc0t^Z@Sz	���@T�ٞ��d@U�t��W@V����@X�(qz@YCT>&�@Z|]�qk@[����@\��e"�@^G���Fn@_��<���@`t����C@a ��U=�@aς:�@b��*?��@c4V��?@c�cy��@d��[u� @e]�yn^�@f�<�)�@f�6���@g���U�a@h_�� p�@i&:��-�@i��G�@j�q\q��@k�X��@lUh���m@m&��Z�z@m��]R�W@n�a��@o��h��@p@;�#�l@p�
N��>        ?��ͼ� ?�>�#�&?�
G�bl?r�{?�3�.n�@ ?DU�'@�����@�d����@�B���@�8cNj@x�n�=@�Y����@ x�}�e@"��	~S�@%3%�#�r@'��2�6@*cm�~P�@-%���G�@0�h��8@1}����@3�a�e@4�\���@6>wW�p=@7�ڏx@9��
6@;l��k�@=>��B�@?{gb'{@@��!�D�@Az��P�@Bx��@C|({�w�@D���Et@E��-^D�@F��<��|@G����U�@H�h�|�
@I��C!�@K"6Y�π@LM!2~\9@M|�#�$U@N��8��@O��.�_@P��H��@Q3}X0@Q�+!9�@Rz��u�@S!��cʽ@Sʕ����@TujQ�rG@U"5r�zy@U��5.C/@V���P��@W4D��@W�v�p.W@X�����@YV��!X@Z]�M!�@Z��ݲR@[� 鲒<@\G�'���@]a��H@]ʉГ	�        ?�F���?�u�ʉ@F?�� �D?��uŔ�?��bq��t@���9�@��$�,Q@n^}�@�}�T@�q�K�C@ ����3�@#�18�@&�`=��@)����@-W�A�G1@0|�{�k@2dB;\�@4a4\�9@6sC�?k@8��eO�@:�ɄA��@=#P���@?�?6S@@�ر|x�@B@]w~Ã@C��<�r@D�K2�-@F@[:�.�@G��횽@I��[؉@J���v@L9WG%@M�[wћ@O"I���$@P\qv�G%@Q+��8=m@Q�M�|�Q@R�����@S�Ξ�@T�h�]
>@Um�k�(�@VR��@W: ��WP@X%R�(�>@Y�����@Z����@Z�-Ҽr)@[�s�@\�\ I��@]�;�>i@^�A����@_�e��>@`~Εu8�@aqc���@a��J9��@b<���@b�[w���@c)��X�@c�����@dEs�)�@d�YQ�\�@ef�9�+�@e�] [��        ?�3���F?�/�ǝ��?�e��L
?�M��Z?�w!D\]@v�+z5�@������@f�6���@����@��e��@ ���4Z�@#}��,x�@&�IHWJa@)Ҥ��GM@-Cgڶ�@0p��u��@2U�048@4O�n��!@6^��f{�@8�b(X�1@:��kd�j@=5r�@?b3b�e@@�6���m@B*a�*d@Ctgѻ.R@D���L[@F"H��5@G��B�	@H�n��l3@JeT���@K��QH�@Mc�MŁ@N����@P@h�,@@Q0�"{�@Qݓ�dW�@R���0�2@S��[��@Tc�J�	[@UA�a��@V#n��+@W3�ĚM@W�/LB�$@X�V�S�@YɞM��@Z��o�a�@[�a[��G@\��D:x�@]���@^�Jՙ�i@_�Z�- T@`P�?m��@`�pdwi1@aW�g��/@a�/
��@bd~ƽ@b�I�=�@cu�Bv�@d ��1&�@d��7�3�@e9�d@e����        ?�rX"��?��9�ˠ�?�_�Q��@ fO/e@aZ�aPJ@,�E�\@�IWf��@r!��K@"T�rP�h@&G�/�R5@*�j�o�h@/%
γ�@2h�,�b@4��b��l@7V�	���@:4� "I3@=4<���@@*i�B_G@AʵI�μ@Cz���'�@E9��6k�@G�v�):@H�|$��2@J�j���@L�R���*@N���e@Pql3��@Q���k�T@R��b�@S�����@T�?��c@V��0E�@W1���B=@Xf�:I@@Y��h��j@Z�cZp��@\(�3��@]t2(�X�@^�Hq��@`ڳ�P�@`��0���@al��H�@b.GNq@bԃ>�G@c�g@x�@dF��0�@eX|�Q@e�O�@f����@gG~�	s@h�v^b@h�~+��|@i�k��P@jjo��1�@k8�X؀@l���cT@lڼe��@m�٣���@n��y��@o\���q@pz�dV�@p�l,��\@p�M�J+        ?�nh��m?�����?����IJ?�E��w?��t(l ?�i���@2�B���@	�d:�q�@�.Ϋ�@R�_��@�py�M@����J@�gw�{@!��Q�@#�}v�
;@&3�p�4@(�U�ԓ�@+<&���O@-�d�@0S��x��@1�vq�Q�@38�秔�@4�Y�+��@6K@�Ŷ@7�WG�:@9��N�\@;7���@<�����@>�=��X@@@�uW�@A,4���@B���@C�[���@D�y��@E
K���v@F|�գz@G8=D��@H!nOb~�@I2�@��@JG�v�@K`@�Z�c@L}�~͚�@M�O�
A�@N���@O��p�wb@P�C�"�@Q'w�{@Q�����;@R^�D�1@R�?�>��@S��(�>�@T@�-�d@T�;�|��@U�4s�rX@V1�#�c�@Vۂ|gL@W����H@X3ۍ�i�@X����@Y��0��@ZED��J@Z�gߤp@[��2"�        ?�;�RSV?�Ezuև�?�L��u�?��Qm�E�?�8����@G糕0C@jv�f@<��� �@�O;xB�@��F�i@ v�l��@#Pmjw�,@&[�E���@)��j@,�fA�  @0I����v@2)���8@4Ħ\�@6([!D��@8E����m@:v����@<��'aO�@?���89@@���B�@A��bJw_@C?��^�@D��('�@E���p��@GA
����@H�����@Jj�x3 @K�^�<�@M���UR@N��1A@P	�ve��@P�%�z8J@Q�Tc8�@Rm)��@S?g�xQ�@Tηa�@T�E>dJ�@UȾ����@V�0�HN�@W��o�_@Xl�m��@YS��ߠI@Z=�M'�@[*@EO|@\���V@]v�{�@^ ?��@^�:Lqe�@_���f��@`v��e�1@`���.�b@av�;
R�@a�^w:@b{Y�N��@b��[��/@c��C���@dK�]��@d���z� @e��"W        ?�����.�?ա�l���?��2*h~?�B:��?��D��=�@�V���@߰ҵ�5@�ҳG�@A)���@	�ꂦ�@ sW�qM@"�i}cß@%��g�@(�;��^D@,G�Al�U@/�Uf�aS@1����@3�Z�|�O@5�	��@7�KN���@9�v\
N@;�E� @>�Z �@@3J���@AbI���O@B�Df�@C�e f!�@E3eS@Fi�4� Q@G��6�#@Il�Gh�@Jy��`�@K�e1�˦@MOg���@NÍ���@P׉��Y@P���U�@Q���G�@RgAPG1@S/���|@S��g$�%@T�:�� @U��U�@Vjv�3@W?KF�+%@Xs%
ɽ@X��P���@Y˃��z�@Z�U6���@[�I�W3c@\kX%��@]Ow��j@^5�7�<S@_����h@`�L�J@`zs�#@`�����@ah���]E@a��/<@b[�4d��@b�L�=@cQ�Ss%�@c�M��`Z        ?ĸ�s��?�/�E�T|?��-1�?��=���@h����@y0��`B@���my@+���Z�@!����e@%A��r\@)LsI�0@-�f��@1>����@3�M����@6�	s��@8�=���Z@;��r �@>{f�h�#@@���@BQ���^k@C�Rb�@E���'�@GT��W&�@I*R��7@J�Vq�@L�3i}e@N�D����@PU��#�@QU��@R[�f�"�@Sg�����@Ty�%��@U���qt~@V����=@W��N4�@X�f̓zQ@Z�
��@[OI9�@\���'PL@]����@^���έ@` ��0��@`��ɴ�L@ak*��@b�M���@b��c�w@ck���H"@d��V�@d����I:@e$9*ǥ@f4n[���@f��v{@g�����U@h`%P��@i>=:$�@i�<+@��@j����1@k_�����@l$\�ֿ�@l�-�|�@m��]6�@n|�E�s/@oH��~	8        ?�E�;� �?����rz+?����FGA?�Kg��G?��+iU:?�_�2a�@4�j�L	@	�J|��@�ώ��@ln��@���l)@�x�换@ ��y�@!��7���@$���@&t�;#x�@(�6n�&@+� ����@.G���@0�e*BYS@1����@3zG�U�@5%=X�@6������@85�Θd�@9ޙ��q@;���eH@=O�y�h@?O�X��@@te�6s�@Aa���H�@BTOɾT{@CKU��'�@DF��ڳ�@EG*��@(@FK�tN�@GT�Yӷq@HbB�
��@Is�%���@J����W�@K��4/x@L��k
�@M�%v�@O	�ۓq�@P�'w5@P��NNg�@QIG�ق@Q��q�Z@R�@����@St�{�d@S�o�EO�@T`+Xpx:@U����@U����@VO��x�(@V�/P���@W�_���>@XN5:M�@X��S?��@Y��j2�@Z[pN�pd@[�X�@[��(u�        ?�%)(X?�6�U��?�>����?��&k��?�%�mIx@:^�u�@X'� @1	j&z�@��_�ڏ@��i%5@ k��3CW@#E:��v@&O?���@)�
��U@,��s�@0C3���@2#��,�@4my?��@6$Np(@8C�N�%�@:wAvzκ@<�����@?L-��@@�@G�F�@B7ԑ��@CL=vp�e@D� �	�3@E��ܺ�@G[�a���@H�KvQ�@J:�B��@K�Y�F�@M9^�dS@N�L"yo3@P+\��-@P�?��a@Q��X�U�@R��g�f�@St]�5/�@TO\d4�@U-����|@Vq�u@V�k�g�@Wܠ���f@X��F��@Y��6a�T@Z�%̐�0@[��>Ikx@\�zn�O@]�d�19@^��Ջ}�@_���@`H5�s��@`�B�pR@aO����@a�}��b�@b\�"`-@b�̯�@cn����R@c�c�b:@d�j���T@e���1@e�p���        ?��C!���?դ�ވO�?���X�7�?�ߥf�?����D�O@��{��{@峑Ա@���<��@I:R0T@�@�J@ $%#cPh@"�xF�a@%�T�@)b!D�@,b�>R��@/���yY�@1�@���@3�����@5�[�v&@7��+�N@9�#�/Ғ@<�D��@>Lp�@@P��LZ@A�d�#�@B�2r�zv@D ��-�@EK[Y�@F�W8��@G���F�!@IW8\���@J��r+�:@L-;�2��@M�i����@O- �@PP1M��S@Qt�{"]@Q��8�/L@R�8�so�@Ss�Q���@TC�v�ٵ@U.�F(^@U�@ݫG@V��}�@W��Qfm(@X�
W��@Y`��_�U@ZD��Q�@[*�ox\�@\N�U }@\�e��!@]�纅��@^���u�@_���v�,@`a=m�J@`ܚ#��x@aY|v�@a֗��t�@bU-�ߞ@b��"���@cUe�k#J@c��z'��@dY�#�        ?�k��L��?��3�ڃI?���b?��fq���@>g�6o@��"!&@��^>{�@2�d�8@"'1�b��@&�Q� q@*8���N�@.��}��D@1�;@���@4@��j�@6���;~@9��
�=@<��a��@?���K�F@AW~�t�w@B�����@D�u��_L@FW���@Hx�:M@I�Z�t@K�D���@M����@O�}��@P��\q4s@Q�g�h��@R�C�K\@S�H
b#�@Uj�(`D@V.䯮��@WP�X��N@Xw����@Y�v��@Z�e����@\
9xMň@]D݂�1,@^�<FE��@_�@p��@`�j��V@a.�x��@aׯ�/9J@b���.D�@c/��Y@c��{f��@d��t�@eCK�9@e��O�c@f��_$�t@gi/,�O�@h$g�@h���n�@i���ð@ja�@q�+@k$Jn�Z@k��6P@l�e���@@mw��Hv@nA����^@o��Z�m@o�XƎ�         ?�u(H��%?�=O�7?���{�K?�R��
�?�w{4o�?���z@�g�!�@
U>�-�1@Xx@����<@�?�#7w@���Ь0@��LѬF@"%�'@$�]~Pq�@&�o�g�S@)�-7䟆@,?����@/	����v@0�Zmv�@2t`��<�@3��3��@5�����@762-V�@8�(���@:�7U+1@<^&��U@>+�\E�^@@��?�@@�p�I�@A�A����@B�l��@C�{���@D�Y�8A�@E���h@G7a �?@H\X��@I+dV���@JG,<�j�@KgUd}��@L�ў��Y@M���"N(@N�����@P	W����@P���'�F@Q@��f�@Q�J&��i@R�^i�@S"�e��@S��ny�@Tm�n3i@U�Pf�@U�W,�@Vl��D]�@W�*X��@Wʟ8��@X|q���@Y0b��@Y卩6fQ@Z��E|�@[U�BC[�@\�9^�~@\�J��V        ?�kv���,?֐0{@�7?硒a-W?�,je��?��~D��_@�]�&�m@�9\�N�@p�f=��@�7-�hI@�NY��@ �^�A=�@#s��!^@&~��,�@)�\o��@-]�5�=@0WȐV@25R/��@4'+ �g�@6,���@8Eo��o�@:p�V�
�@<�&u"��@>�-��q@@���Sy�@A�%�KT@C'��q�@Dpl��EY@E��&��s@G�bf=@Hx��7@Iߔ[Z[@KM�F@�@L��t(�@N>��_*�@O��ջ�'@P���"n@Qm��))J@R8�69�G@Sg�P@S�H�C�P@T����vY@U��|(�@V]����@W:�TN�@X `@s�@X�sd6��@Y�w�r#@Z�"���@[�hQ��@\�?��@]���~@^�x
N��@_u�c��a@`6=|�\.@`���qN@a0�=~��@a�e�+�@@b/nAm��@b��/+��@c2�ݾA@c�S�0L�@d:�	{�`@d�ywa3!        ?�6\�A��?�`3W��?��V˅?�K�*��0?�W�Ÿ!@�P��,�@�meM��@��2M@�&hx�@�p�,�X@���m�@"��zz@%��,��@(�����|@,�f'} @/z�6�q@1�v'�G$@3m��ed@5cf����@7l7��3�@9����"�@;�g��@=�I���@@"b'*��@AS�}c�@B��g��@C�5mf@E'����@Fg "��D@G����n@I��@J� �J��@K����h�@Mk��)��@N�2�y�@P6AqL?�@P����D�@QĆ&�u~@R���S!�@S`G���@T3Ёѿ@U	1��@U�}���@V��I4��@W���Y��@X�K��@Ygo��@ZO���GQ@[;���2@\*U�@]�c��@^o��y@_���v�@` �7��@`f&�NB@`�<`a<*@a�pM%9@b���>�@b��O(�T@c�B��@c��(Z�@dS���@d�]j��        ?Ň6�J	)?� ���m�?���6	q�@ /����:@�T�ө�@R��
�@���E@���x�@"n���@&`�1�5@*��� 1>@/3ũY�_@2��+��@4���Ū�@7JO����@:���6@=S�zz�@@ď���@A���1��@CPiU�1D@E+J�E2@Fǿ�=m@H�����&@Ju��@L_5�=�Z@NU�s�w@P,���$!@Q4<��So@RAމ��n@SUZ�2{�@Tn� ^ \@U�og�\�@V�ӫ�L@Wۨ���@Y
ּ�>u@Z?Fꁟ�@[x�*$�/@\���w�@]�R�N�@_C���-@`H���z�@`��;��@a�m��@bKH��N	@b�p�6͚@c���f��@db�%k;�@ekl���@e�|s��@f���;T@gK�΅D@h
�^1@@h�3��U@i���?Er@jU�����@k�t�@k�aj#��@l�IO]]@m�5��"'@nQ#u�:l@o#���@o��Ʒ'@pfg��%        ?��f;Kmh?Й�QL�?�c%���Y?��6�sc?�m�c�D?�u��؉T@�,��3�@
�
�2��@�z�Ak�@Ua��@ҿR��G@�mP��L@ �J���@"M��j�@$�����r@'%��ZGE@)�%��@,kLq^�@/5b��7`@1T�z߿@2�<~��_@4RL��@5��x^�;@7J�ԑM@8��	��8@:�a`��@<n��p$@>:�e��@@lkV��@@�n�W�'@A�Q[���@B���\�4@C�ak�&@D�fV�^@E���\@F�
�\V�@H����Y@I!_���O@J:�E�@KW�UT+�@LyNm�h�@M���ی�@N�Zh�:[@O��{,@P��>� �@Q.̈Z�@Q�yI��@Rh�46=@S���כ@S��ڕ{@TNr��@T�E��@U�68���@VB�U�H@V�*��U@W����@XFn��E>@X�z�H@Y�ӳ%@ZX2����@[��E@[��*�D`@\wvlަ�        ?����L�?�%���?�/Ui�i?�˖��TR?�"���@+kK�FP@Bq2��@"�Ѐ�@�Q]��@p�U��@ [W�	x@#/�J�@@&4���y@)h箾5�@,�Z0 �!@0+��厌@2G懧|@3���\��@5�*��l�@8�{5�@:E�Ĩ~�@<��$7�@>���h�@@�(N��>@A�2o5�2@C�$�B�@DiC���@E�xn �@G	�VT�@H~�����@I��Xy�@K_�,��@LگH2B�@N]�~�τ@O�IsQR@P����
�@Q�`�@RY?D�@S,��d:�@T3׀  @T�,�b,0@U�h���)@V��Vß@W~|��HQ@Xe?��}@YO�x@Z<�l��@[+�
~�l@\���SQ@]��ef1@^�TYF@_	S��@`�CO1�@`���@a����@a�:��5�@bm2��@b�=Q��@c�x,S@c���-�@d/��z�@d���c!@eGn�>�M        ?�Mg�߼>?�=��?�r��C`G?��?1?��CQ���@�ʫ+�@�Jx<ZD@v���T@��쫐�@��0���@ �5 ��@#�7`��@&���KDe@)ﬣ�-�@-e��<1@0���s�`@2l}6Ll@4j»F�@6|�!��@8��۩L�@:޹�t@=-N�u�q@?��An��@A�����@BD�{c�c@C��v�@D���4��@FCV���@G�!���@I �1�@J�+���@L��H\@M���0@O<�h�@PY���}@Q'͝�\�@Q���j?�@R�,�Ɩ�@S�6�)S�@T���f��@Ud�V���@VH	��@W.�^ZV=@X�՚q�@Yϳ�3�@Y�+�~�
@Z�u��@[�?B �:@\�ݯ��/@]�z��@^����@_؇q0 �@`n� ��@`�@�vb@ax�R�
@@a�\���@b��S�ߵ@cL�H@c����B@d(���<@d���K��@eDT��w�@e�Z��        ?Ų�oۣ�?��(�7�?��(. �@ 4�v<��@��t�@U{x�@ 6��K�@���
Ҫ@"o��Rz�@&`����@*�~h�> @/17}�@2ʧ"q(@4�MY��K@7E�N��@:i�@=
�/�]@@k�{>@A����U�@CJ���@D�g���@F��{x<@H�$oR{�@JkQQ>@LTE̪��@NI�?�.@P%�_�'B@Q,m���@R9�,QW@SKX����@TcC-�L�@U������@V�qzM�k@W˂+��(@X���%f�@Z+#K�@[b�m!�@\��U�N@]���?@_%�Q�J@`8:��q5@`����V@a��&�)�@b5�A��c@b��=2�@c�M�b@dFàU�R@d�I�ϩ�@e��|\j�@fjahR��@g$����J@g�O�a�*@h����Bp@i_��D�M@j!ޱ�ce@j��wv@k�S>K҂@lr�z���@m;�,��@n�k[�@n��ь_�@o����?@p8a��P�        ?�G�75�?ό����?���G��?�&�'_U?�R~���?��7q�@�n�uD@	v2���@��қ�@"�q��a@�EL��&@�Y��UI@�.��F�@!}�b��A@#�ֆ*.9@&!4��6�@(��iJ�@+.M���@-ڑ���d@0O�ii�@1�����S@378�II�@4�G�ly@6K�%��%@7�ZJ�*@9�T��]@;:���&@<�כH�@@>���<�:@@A�Pc�9@A-i�c�@B��D?@Chfp@D
b��8�@E�֣ɓ@F	�)%2�@G� ���@H,��>@I(Ǥ
D@J;��W,�@KRdyǕQ@LmO����@M�@�헶@N�,�di.@O�
��՗@P�gؠ��@Q�Եˤ@Q���$�@RL z �@R�
F�@S�� Â$@T(���	@T�K=u�'@Uo�H�R@V�-�)�@V��k��@Wg�,7@X��,0�@X�1}H@YpJRJu@Z!G� @Z�`���@[�{T�v        ?�D|>��?�#Qͺ?�)��G�s?���j��?�W�,�3z@{�V@yЮ���@����`@���@�f�Za@!_f*�@$��
�a@'87��h@*�7�r�p@. �$��@0�մ�~�@2�*u���@4쨏`�V@7�E���@9A�oǼ@;��GQwD@=���)�@@-��)�\@Ap.(t@B������@D=E�3@Eo>1� �@F�KGs�@HF"F��@I�Gؼk�@K>����@Lǽ�<�@NX����@O�v-Lԡ@P�5Ɵ�@Q�%� ��@Ru���8@SP����I@T/�L�@U�y��R@U����@V⡳��@W��RS)@X�IEt�L@Y��#A@Z���9`@[�B^�J@\��h�',@]�����Y@^�9��Ά@_��jz�@`Z�"Z>@`��n<U@ahy2�Ss@a�e'���@b{��B@cq��Ƌ@c��@%��@d#s��v@d��E�\@eC�/�N�@e�z���@fjH�Ij�        ?��*�N5�?Ք'ê� ?�1�>?�s�"U�?����|k@Ԩ(}c @�g�w,�@����@5�,�[r@�+��P�@ ʍ<ʴ@"ۢx�c�@%�Z�gZ�@(�TVTl@,Cz��@/�. �@1�.#���@3�,����@5�z�T��@7��n��@9��p�@;�ڱy@>#�?�`�@@:mF�ӟ@Ak����@B�ҰO$!@C�`$��W@E,���7@F|`ao�@GӃ�x�@I1��u�@J�V0���@L��#@Mv�Ie��@N�@%T7@P8�!�@P���6x@Q�}nh-2@R��7� @SXǹ�C@T(k�0@T���$@U�t���@V���h@W��SK"6@Xa����;@YB[� ��@Z%� m=�@[��}�@[�*����@\�F�4�@]��Wſ@^���I��@_�l$���@`R ��?@`ͳ� �]@aJi����@a�=7h��@bG(�[,�@b�'��˄@cH7v@��@c�T%@dMzodu        ?�I�VS?���H?�W#��?��G���`@�w�;@�� �qu@����9@I�'@"	ٰ[��@%�y��ȥ@*�lö@.��x��n@1�An�Q@4"���$@6���c��@9�S��Q@<h�\�Cl@?g�c�
b@AB:I5&�@Bޤ_x�H@D�۬W�R@F@��p<@He���\@I�#�AT@K������@M�=Tn�@O����@P������@Q�4�@R�2 ,�@S����@U����+@V)��x�@WLu9�?l@Xt�-���@Y����J�@Z�T���W@\�W{�@]H"L�ɧ@^�f���:@_�};�%
@`�+"�@a4�2�/@a�
�)e�@b�q��@c:�Rj�@c��0��@d�<�u@eS�rӧ�@fB�&@f�a�~�@g�U�l@h?4~Z_�@h�}"y"�@i����@j�fDt�@kL�@.1 @l����@l�a��%@m�%� ;@n{��@oL�g-�a@pũ�ݐ        ?��@+| ?��Bi���?�1����?�� u6K?����,B�?�d�[��@� �Cgk@	2?��@�T�@�z�FH@OcVڡ@��m f@8�D@!��%�@#P&\�ݟ@%�.�� �@'�T�6k@*w�̭@@-��>(k@/���H�@13f	 @2�X���@4Σ�K@5�%zN�@7sw�gQ@8��8�~@:)����D@;� ��v�@=l���LP@?\����@@g�sQ�@AF����+@B)�A�^@C#3T�j@C���S�@D�@ �n�@E�!��|�@F�}�َ�@G�D{���@H�iʱ@I����՛@J����W�@KÃ���@L˜j1@M���6�8@N�"�}m@O�|���!@P�m(g_I@Q�@8 @Q�?Zf@R,�*{Ȅ@R�����@SN_���@S�Dr@�@Tu����@UA����@U�R��d@V:�Ē�2@Vԅ҃��@Wo�N�+@X�Z�@X�ˆ'y9@YHԃ�j�        ?��+��N�?��9 �j?��>P^�_?�`]e2?������@����c@�>�\
@��*�*@NBQ��@7�p�9@ (@<��@"�^�Q�@%ek�@)��G>�@,m&�D#�@/��M�v@1�K����@3��ȶ^@5��"C<j@7�I���&@9��A�{`@<�l�yv@>egC���@@_F����@A�Z5W��@Bѹn(�@D0q+wo@Ed��A�@F��1��s@H4�̅@Iz ݝv�@J�4�pw@LWD����@M�'�8@OO��CTj@Pj�gb@Q18"�U@Q�tD��w@R���0�/@S�I� �@Th��V@U=�J%�,@V,�U2@V�n,@W����7@X�)�]��@Y�;a~z@Zw�]L�@[`+�k�Z@\J��k.@]8;׳�@^'���2t@_!x%G�@`V�N��@`�����@`�h���@a}-aԴ�@a�5�_@b|�g^a@b�@�d@c|�PA@d��R�@d�8g=d        ?���%�5�?�ۢs�?����S�?󿀍LD�?��r�`�@-E��-�@J���@)A�l��@�R᥉@�mjm@ dy3�}�@#;2�#'�@&B2y�%n@)w�
W̩@,ڢ�� %@04��A�4@2�:��@4;�Զ�@6n��V@8 +��g�@:K�R��@<�M��y@>����1h@@���;�f@A�I�{��@C��)�J@De%�o�@E���cs�@G����@Hu%�q1s@I�m�DQ"@KQK᪩�@Lʞ�o]@NKFs��@O�$m̚!@P�r��v@Q|
��z@RJz�EX@SN3��@S�z�[)0@T����P@U�����]@V����@Wf����"@XK��@Y4F:,Do@Z��v��@[��$�@[�F����@\�~V W�@]ꏃ`��@^�i����@_��#�r�@`p�"7*@`�ڬ��@as9��H@a���j܈@b{Z��j�@c=�'h�@c�Pr���@d��X��@d�ퟖ��@e$m�.I        ?ħ�%�?�2�dPd�?���1?��"�L�P@oF鞍@{s�M@��l۹�@"�䌯@!x�)�G@%-�2W�@)*c��#@-lp^D+3@0��F�u@3X�Vp�/@5���@8qs�S�@;'Leݩ%@=�K��t�@@p=��˱@A���Y@C}}31�a@Eb���d@F�V(��C@Hf�M�N@J"�mk�@K�bGg?�@M�|Y��~@O�.��h&@P���N�@Q��6�p�@R�@JBe�@S�(}��@T�T��R@U��Kg�@V�%��@W��_��@X��$��@Y�o$M@Z���e�@\��#U@]5%ɘJ@^Yf����@_�:O�@`VF�
��@`���^;�@a����"@b!uz(�@b��9�d@c[�@���@c�l �9@d���~ �@e?c��Q@e�*V�@f��^�"�@g1�4�@g�<~dj@h���u��@i0���^@i�*���@j�)��s@k=r�)9�@k�CG��]@l�{���        ?�����?��ݫ8��?��y�s?�W�F�ED?�u�fL��?���l�d@��{@	�J���@�.T^�b@.�h0J@Ş�k��@�Ax�u�@���YO@!{��6�i@#�.,��@&��P@(��T�@+@�|�@-�#�#��@0CP_@1�͌c�g@3&%�F;@4����$@66>&up@7ΰ�sz@9qƶx�@;M]��L@<���k@>���p�@@2OBu��@Ac'�@B�q�f@C �%�-@C��ݖ 3@D����_�@E���ϐ@F�.��Ÿ@H	�z_f�@I�k?�$@J,2��@KC�Q�F@L_l��J"@M=�g.�@N�'���@O��" 	_@P{h��S�@QB�e�@Q��j�9@RH�f�X@R�@�{�?@S����\@T&����@T��萗@Un�y�ڿ@VFo�̝@V��󦰫@Wg�)^(e@XJg�"@X����@Yo����4@Z V��|�@Zҝ���@[��"��        ?���T�f%?��c=K�?�����?���Y{�?�����eK@���6��@�ku�d@��k�@Zq��K�@-�Y@+5@ 4#$�G�@#\�s�@&�m>u�@)0�P���@,���?�@0	��#�@1�M8^�@3�Cf��@5�>$�@�@7����_�@:	ţD@<L�HT@>�T��3@@}����?@A���c@B�����@DB�DP:�@E�d#Pl�@F��:��@HR���@I�C��P�@K/ux�R�@L�3���{@N*^�v�@O����e@P�>�i@Ql�S`J:@R;mT1�@S��,%@S�;��ټ@T��Q"@U�$����@Vw\z0�@WY�[*.�@X?l�9@Y'|�2��@Z�y,�@[-k�c@[�aSӢ�@\�oY�C@]�K/]�@^��_�v@_�<��8;@`i�(>�@`��ܦu@al$��@a�z�
��@bt(q��@b���>�@c�;�@d	��dp@d�'�l�@e���        ?�0� Ҝ?�>n���?�W0f�`�?��Q>���?�jP?a��@o �)�;@�%�A@a��_�4@�Z�S��@֝n!��@ ��_�~�@#yk��@&�� ��0@)˄�m*@-:��>/�@0k<'�V,@2N�DvZ%@4G��*$o@6U�O
{@8w�(� @:��#�n�@<�ė���@?R���Jv@@��c��C@B![�^�@Cj�HL�@D�ɿ1(�@F_e�ԓ@GzOSAѭ@H�qY�g@JX�R���@Kӱ���@MVԳH�@N���ǭw@P9W���@Q��.�)@Q���>�@R����@S��Հ3@T[!,w*@U8���@V�xB|�@V� �A�@W�B���@XϏ�p�@Y���В@Z�
�G�@[�Cǣ�@\��|*@]��
�t@^�>�@_�;Y�f@`D^lZ�@`���O�@aH��S�@a�z��h@bRuXY�@b�2�y@c`�c��@c���� �@dtV���@d�h#�@e��:��~        ?�q�f���?�֮
A�?�q2ޮ@ k�'2@R�y��Y@M�[]@���K@Fv.��e@"3bTT$�@&lnr@*J&��W@.�
�A�@1�=�8p@4N��q�3@6��1�`�@9�vxþ@<��>�8�@?��o��;@Ah
*���@C#�1O@D�EMjRz@Fr�.@H;`%&@J�W��@K���N�@M��/@O�lJ8;@P����@Q�?/4-@Sa�m&@T%Len��@U@�pm@Vb"��4�@W��\i"@@X�U��@Y��X �@[9"/h�@\Y1Z�@]��U@^�T��@`v"\��@`�UV���@ag��B^@b0Uޔ@b�0q��@ctFBuOv@d'�(�S�@d�TK��n@e�%̢�D@fO \��@g;�+��@g�q@E�@h��U�)@iL�CA�@jn[��@j�˾d�@k� �ܖ�@lieJ�@m5��
�@n�U�@nӍC2}0@o�R.t�@p<u�P
(        ?�\�$ԋ?ΆϐF�?�����Nv?�GXo�.�?��F5�M�?��t�q�@M�ү"@��P�@����)�@�0��D�@��ٱH@��ϲ{�@�Ma�Z@ �����@#���1�@%hDl�0@'�J��@*F�����@,�HxɕO@/���s�@1"���@2�����@4�~=}H@5����a�@7Q�D�t@8�ٮ95@:Fb��5�@;���[�@=�д+�.@?_e|���@@���A;E@AzG*u�@Bfl���@CW
���@DL����@EEw�� �@FC'm� R@GE-�(@HK-�Tp@IUd�̈́�@Jc�4+��@Ku��O >@L�%�ء�@M�D���#@N�>�[/@O��l�1@P��f}��@Qo���@Q��AvԷ@RI<��P�@R�[��;�@SD�eW�@T�_��@T�d���g@U]�g�c@V {g��@V�p9�@WKd��L�@W�[���H@X��%�	�@YH2܍��@Y�
	�O@Z�x�d��        ?�>�i~�?�Z@��?�f��dE�?���p�N�?�\����@`���+l@�U�GA;@Q�b\ll@�x2�@��!%5�@ ������@#d���^@&r�!���@)�7���@-�`��l@0Z!F|@2;��n@42�A���@6>~��#@8^#eQ@n@:�U���@<ן����@?0�z���@@��`�/�@BhM��@CS�[%@D�����N@E��ћ7@G\9'�5�@H�̌��@J5T����@K���C��@M-��*c3@N�=2���@P"*�D2@P�=nMP�@Q������@R�3��v@Sc�A���@T=7���@U�h�(@U�N���@V�Z�-@W(K@X����@Y��q���@Z�"8APl@[z��B�@\pV�j�@]h�҄D]@^dO疃�@_b����}@`1�t�@`������@a7B�D�<@a�0F��@bB#�/�@bɖX���@cRY�"b�@c�g��O�@dg�]E��@d�S�'~@e�'(�F        ?���8�?յ`�E�?��H��)?�)�#��?�ѳ�{-@�[N9!@,Q6-�@��Y�1@t��@M�ص��@ G�F�@#��«@&�Ҵ�{@)O�mȦ�@,�)1���@0G�n$@1�c� ��@3�]����@5췂N��@8��>t2@:0����@<ou`$�Z@>��ƾ��@@�FQ�u@A��ٕ�@C����@D\�����@E�iN�0@G]^t�@Hs�6��L@I� Ɍ@KU��r�@L���Zz@NW�*(ʂ@O㾷�+@P����Ae@Q�4=��@RZM���>@S.�*�]�@Td#}@T���@:@U�|�� @V����3
@W�"=0��@Xq�V%7�@Y]��Su@ZL~R��@[>u�Po3@\3qLڡ@]+gH?Ӻ@^&O�VjV@_$"����@`l��?�@`�6���Z@alK�>^@a�1��@b"p}\	@b�|��?@c2K��)@c�|��0�@dH�%�7@d��1���@ecA�pԞ        ?�\'���~?���̋�?����?��D�>@@���<@�>��@��T}۬@2���@"'���@&	JI�a@*:r�}KO@.�x�/�@1���>�+@4DD�b�@6�hΪp@9�5ɊI�@<�D�^�y@?��@T4i@Aaq�ry�@Ck\�.O@D�x�́�@FkG�b�@H4����@J
�"U�@K�X�uz�@M�Z�b�@O��Oϧ@P�r��O@Q��'�(@S�n>�@T!�{�@U=t�o9�@V^��_�@W�6�͈@X�F~��f@Y��:��@[i#/@\UWb'k�@]�k��V@^ܓ�Du�@`��+��@`��+��n@afj4�(�@bP���@bz��O@ct:���E@d(07��@d�r]�?@e��4��@fQ�#�.�@g����@g��g�#�@h�C�J;@iR��h��@j]xxI�@j���@k�ޘX��@lu�7m�@mC��R�@n�!��r@n�j~��@o�G3���@pG���T}        ?�Q���?΁�e��?����U�y?�G�=�)7?���m�?�;��;@QA��8@���kZS@��O�a�@���}*@�Ü�L@�)4� �@���N@ ����@#8b�sd@%UػW�@'�����(@*"�.@,�ʢ�@/F
:�@0�HFC��@2]]���@3����S@5=�~���@6��P�� @8B�#��@9��GttH@;h��p�@="W��k@>���P��@@.-��1@A	� C#@A�`+�@Bɠ�C�/@C�&�4Ȏ@D�i[�@E�h`���@Ft
�~F@Gf��~�@H].M�@IVo�d��@JR�e�>@KR}�L��@LUuT�3@MZ��XM@NcQ��m@@On�4��@P>��@P�B���@QQM'�@Qܼ��@Ri�oh�[@R����KS@S�@�$@T��g@T�Oϑt�@U=�-@�@UғɣR@Vh�Y�'@V��)�/@W������@X2OW�>�@X�Y�wR�        ?��$W�?� ��	�?��w��?�����?��dz�@�p���@(E1U�5@���.@}���$@S�6UyC@ H��٫:@#u=�x@&�	�\�@)D�PHi�@,��	��#@0�^�F�@1�֘;N@3��d�<�@5ѽ�N�,@7�ĭ7�P@:��x��@<?�Z��@>��-�
X@@q�<��;@A�c��7.@B�[PV@D,�sJ�@Ez���b@F���QH�@H/��<�@I��JA�@K�%�G@Lv�!XH@M�L�A�@Os}�d�j@P~9A:�@QFi__�@R��,�@R�@ڜ�1@S����^�@T��3	q]@U\:S�/@V6u���X@W�ʝ�2@W�u|�@X��TZ@Y�F�^E@Z����@[�.@��@\{f��$�@]k'p�7�@^]d�A��@_R����@`$����,@`�F5��@a �n��@a�z��{@b7%���@b�j�?�@c!���<�@c���$:@d)uA�|@d�� ��        ?�}��~�?Ւ��j�?濿8�8?�z����?���d�@�񯤾x@∄�t@��
ڑ@I��@�ܣ��@ %ٓ�H@"����@%�`���_@)�k]_R@,g��@/��«�@1��$��@3�U@5��x�?S@7���@9������@<w_���@>\!��y@@Z�Om@A�f���@B��b��%@Dx�$��@E[���|/@F��C
�@H
�x8�@Im7q�z�@Jִ"$V@LG �`u@M�;�#;�@O;�#�m@P`��@Q%T��@Q�����@R���(�@S�xo�	@TX�3�+�@U-�ٵ�@V/(�@@V� �>�@W�فbu@X�NF��@Y|u\8��@ZaE�Z@[H�3a�E@\2���\�@]Nx��@^h4�_@^��W�K�@_����@`u9��<�@`�<\��@ao+'�\@a�ܪ�Z�@bm�Lr��@b�]��@cp�	�@�@c����&�@dw�El�        ?ē�b���?�('/o`�?�����?���W�@a���"@q���U�@ꁚܡ@?�\.�@!m�u8E�@% ��7@)��)@-Zn�G��@0풻ϵ�@3L�ʟA@5�ؔ�=�@8c�X3@;|�\ty@=�	�`�@@f�5j= @A��.	h'@Cr��t%@E
�d<�@F�d:~�@HYv���@J�U��@Kҡ�zI@M�!	k@Os2��,@P��A	h�@Q����ߘ@R����J[@S�6Խ�5@T���G�@U���@V���N�@W��s�w�@X���ݦ�@Y�<i"ѥ@Z�E5N,@\���%~@]&�{��'@^JN���k@_qZy�y@`M�G�O�@`��3�	�@a}�tjË@bߒ2��@b�����@cQ_����@c��)��@d�F�F͔@e3����@e�|��k�@f|��MͿ@g#� f�@g�n�`I@hvs���L@i!��PB�@i�遼&@j}]�2�B@k-<�~�H@kއ�H˭@l�:�y��        ?�sx�E��?�#��q�?��Ϥ?�*!V��?��W��P�?�q
ܣ�@7w�V�@	��`m��@���W�@We�hzb@�&���@ίR�v�@�!M���@!�Ҙ�J�@#���=�@&@�mcfY@(�Ė��@+N��Y�(@-�T"�|V@0`-�2@1·�]^�@3HnH�@4͖Uw��@6]����@7��E
)�@9����@;Mx��1,@=8�Q�@>ʍ0c�E@@Kٗ��@A7-�ͪc@B'-l���@CŞ)�@D�ܟ~@E}�QM�@F|��L@G΃��J@H%a��@{@I4#�Ӟ@JF�c-w�@K]��7�\@Lx��g��@M�C*�t�@N��5��#@O߷��A@P��ere@Qa�J��@Q�ԫ*S�@RN����@R�L�@S��;�K@T'-�W��@T�M���@Uk�%@V��>��@V��S3T	@W]ḁm"@X��^@X��0�@Y^�C1@Z�޽)�@Z�e�P��@[lO+.��        ?�ĵ�(2?��$X�<=?��J?��?�YU9��?���R?�@�?f���@�d���@�`���Z@NN�g�@l߷�O@ 'A��Dq@"��:���@%�����@)�:e�@,f7;��,@/�Y�9@1œ��m@3��p��@5���8�@7����"�@9�}��.@<��'�@>Km�ؓ�@@O�Ω��@A�Q����@B��~��s@C�5\.�@EIG��/@F���1%@G�ëUx}@ISЊr��@J�����@L(�ቀy@M���+ @Os'@PL��m'@Q{��[@Q�UI�h�@R�-�Sz@Sm�����@T=���ħ@U�q�@U�c1\�k@V�cRd(�@W��2�Q@Xua.&��@YUD>��@Z7�<���@[�]�o�@\�w�+�@\��`m@]ـ�ϫ�@^��)q��@_�>�j��@`UwLH�@`����r@aKd�3��@a����@bE�����@b�2��o�@cC��\@cē'�E@dFI-��        ?���4��:?Ք�%��@?���.A�?�{�TU6J?����Oς@�Cs0Z�@��P���@�U�ҿ@T��A�#@(���|�@ 2��Y�@#!D��R@&;OD�6@)4x$��@,�}��{<@0���;�@1�A
W�@3���
��@5�ҫ�Ⱥ@7�du�@:%+6��@<equ��@>���Ҟ�@@�,,���@A�o]�@C�{CB@D]��"V@E��[��_@G�0��)@Hw-�ڴi@I�u�I�@K[�NR"L@L�~Ǆ��@N^�#;�@O��m�@P�ޕ�r@Q��R�@R_���Y@S3�ͥ58@T	����@T��$��@UƧ�'h�@V���<:@W������@Xwf��q�@Ycnq�=@ZR���
�@[D�jhF@\:?N<�@]2�aK�\@^-��s�@_,9���^@`�J^-@`��zC�m@a�l�9@a���T��@b'��%q@b��X�Q�@c7�k��@c��y�o@dMhP��O@d�M��g@eh�h�f        ?�a`���?���U��z?�� d�e�?�q�r�YG@#r�D�@K#��@��(�kH@�;t2��@!\IU�v@%�C��@)η�`�@-m��hI@1�$���@3pr9��@5�0�5^@8��C�C@;{�sz@>fB�'�L@@�<�ig�@BIu�jW7@C�m}�ȫ@E��d�1@GQ,ma4k@IL�ȭ@J��t�@Lˎ��H@N�(K,�i@PW6;�,@QX����8@R_��s�@Sl�V�f@T}���J@U�D�u|�@V���w�Y@W�}���@X�C����@Z&����@[V�%��5@\�"YF�A@]�K��E�@_��@@`$0C���@`��i��@an}���@bA��Xh@b�����S@cl�E@dM�-�@d������@e~B/��@f2�O�ǵ@f�:5���@g��f��@h\
�4�#@iT�kAo@iցz��Y@j���:-�@kXi�&A@l��;@l��9��@m��q�eL@nq��䎒@o<|:�I�        ?�������?�Eg��'?�K���?�/;�2�?�	����?��=���=@��D �@
Sh(�@�@U.��B�@��Z�'@��/@{��_2�@��m/@"�%��@$l����W@&�[��@)o>��j@,�E;@.�b��=�@0ۜ)A��@2U���x1@3ۙ	�u�@5m"K��@7	�Ŭ�@8��Cf�@:d���U�@<!�Ԯ��@=����O@?��V�b@@��� �@A�Ɩ�K}@B�z-z��@C��xd@D��Đ��@E��3�f@FÓ)I@G���)@H���ޥ�@I��p�4*@K�t�@L6s��T�@MY�z�5
@N��vTU@O�y{�I@PnWm��@QP:5!@Q��B@,`@RAk��@R�����n@S�_Ehr@T%���oO@T�ǛT�@Uq��aI�@Vv��@V��I�*�@WqD!���@XG��np@X� g�P�@Y�f��L�@Z3u	%7@Z�$��c@[�o9E��@\VML�Y�        ?���C�E?֬��.��?�kO�_�?�Dٲ��?�ɖ,�}�@��ޔ$=@��_�Y@�}-��@@O��z@{S#�@ ����@#���M@&��� �y@)�\D�E@-qi!�@0���\�@2n�_[�@4i�|o�o@6y�t���@8�k{��@:��L�9�@=����i@?|�*�6�@@�W} @B7?h˟@C��cQ�@D�n���1@F.e���@G���jd�@H�S�@Jp���.�@K�*��@Mp�GB�@N�/�4@PF���q@Q��3|@Q��K^@R��<��@S��[ۜ�@Tl0"�l@UK�?��@V-F��(4@W왑}�@W��� P@X�D�[�N@Y����F@Z��V��@[���Z}�@\�=lWq�@]��-C��@^�<�C�@_���P�0@`_7�,��@`�q���@aiC��u@a�z��@by!�գH@c4[��*@c��g�h@d���R;@d���ḝ@e9Q���u@e�8���d        ?���BO}�?���2`R?�/.T/�?��&�(�?�v�o�=@.[ C��@H�w �@&��H�!@�)�@�@w.�%}@ ^@�d@#2��@&6�N!�`@)i�����@,�y�S�@0*u����@2o��>H@3��Nzo@5��m��@8t�ч@:;#c�@<x�b2&C@>�4�`�n@@�ރ�j@A�Zm���@CZ({G@DZ�Ȇ��@E�$��@G���bL@Hi�@�@I�ɊM�@KE<��ط@L�.�T)@N>"��ط@O�V�C��@P��	���@QtYc-Fk@RBR=�@S�h�X�@S�Jb�w@T�2����@U�S��S@Vy���O�@W[:Q5�@X?���X7@Y'0��n<@Z��Tj@Z�P���H@[��)�l@\�"���@]�Xp�v@^�`$�d@_�07��
@`f_�պ�@`�����@ah���x�@a�F[�l@bp��5�@b��Q���@c}�+}@db���@d��A��@e�]b�Q        ?ňv$0��?��%�I��?��U@��@ ���K�@y��V��@9Ni��@�S�@q�N10@"L�4c�S@&3ڗZ�@*i�dgxG@.�ݣ��@1�IV�>@4_e�!��@7�q~�|@9ͅ�a�@<� ��^@?�G��'1@Ak&�>@C	,p�J@D�ֱ�W/@Fm�1BF�@H3ӴE�@J�F�o@K��G��u@M�1�~β@OȕX�˵@P��ly>�@Q�&����@R���2�@T�r�k@U$` j'�@VAq�v�@Wc�hh�@X�.TA @Y���)�j@Z�ֿ$��@\�&'26@]Yˊ��@^�V2���@_݂�+�g@`�!�S��@a9ƴ�2]@a��9=�@b��_��@c;����@c��@d�!x(b�@eOۥ�%@f��*'}@f��v��@gw=(�[@h3q�\@�@h�a�C��@i�GѨ��@js����@k6�h^�@k��%Ei�@l��?�@m��Œ��@nX�k��/@o%�Q{d3@o��"l�        ?���$���?�d]���?�0�ǵ�?�R<��oN?�:���?�:/��Q@�vD�@
��bD��@�"dI,�@�1v��@�r7p��@��h��@ f��"M@"`��@$�p4���@'Jt}��<@)�N[-��@,�7��`�@/�xoJ"@19�$�@2�4���@4S|�ٓ�@5�K�t�@7�f���@9W�U��@;�e�KK@<�`�@>Ɯ�z��@@V��5@AOi���@BM�����@CQl��@DZo� ��@Eh�k�O|@F|�\�|@G����O�@H���Z@IԄWW�q@J����m@L(��t@MX�i-��@N������@O����y�@P����J�@Q%��&��@Q��M���@Rp
^�@S��8eI@S�$���@To�<�@U�G��y@U���9@V�����@W7���@W������@X��"��r@Yb�ewHS@Z��Y�A@Z޺�][@[�o��>@\a��<4@]&ddZŉ@]��N�7        ?�=�	bw ?�!�^��?�6��<�A?�����?�ly{��@!���9@����5@�~�3��@�H D�@���e�X@!%�/+j@$ �?4,~@'O%{ �@*�ͮ[[�@.A1�ɷ�@1 Qj3�@2�~�7�@5��G@7*t�&�r@9c��Z�@;�:d���@>��d@@F�SE�@A�P@���@B�;��,@D2����*@E�1�l>@F���@Hrd砡�@I��@KsT ��^@M \��J@N����M@PS`��@P�ı�~@Q�T]n�@R���؄@Sy����@TZ�-�U@U?��}�@V'���%<@W:���@X#8jz�@X�UC�$@Y���-��@Z�^�G&@[����@\���Ml@]����@^�42x�@_�P���@`{.��G�@a��&}@a�^c4�@b�#�O@b�He'@c+�����@c��M�&�@dI'Ц��@d��S��@ek�?�+:@e�A1g�@f��}t1        ?�*r�B��?�%df?�[�ƣu?� �@�u�?�o�[0�@s@y�}�@�6a��@flx?X@��9k׍@�����@ ��߇�Y@#��~�O@&�cNDq\@)܈����@-P�r�V@0yf�<[@2_��Q�@4\o�*�@6n���J@8�X��(�@:��2�)A@=4r��@?~�~���@@�۽�a�@B=��j��@C�c�,��@D�+߹6�@F>�r�z6@G�ݠ\�@Ir+b��@J�O>k3�@LP1"��@M�S���@O%9�'��@P^r��@Q.���@R�(��@R��,&s@S��B,n@T�(�=�@UtC����@VY�i�!�@WC���7@X/���m�@Y���a@Z��;�e@[	�:2<@\���'@] � ��@^ ���h�@_`3�).@`of�@`�3|�]K@aw��C�@a�7l���@b!n���C@b��8:�@c84�y��@cŽBZ�@dT�<hw�@d��b��@ev����@f	�v���        ?Ɲ��C[?��IN��{?����ċ@ �1}p@	��Av@��+�@1D�8�@
�<EW�@#Q��t�@'xdU?�@+�<�;�@0c�q�n@2�ey��@5�����@8�7-@;�Ώ3�@>��yq@@�-i�D@B�����!@Dp:V��0@FC�����@H&ay̒U@JB�?��@L����@N($��u�@P"�:V��@Q8�wO��@RU9?b~�@Sx� #��@T�����'@U�Nx�<@W
V�B�q@XG����G@Y�U:�@Z����@\$�� �@]zմ
$@^֠���@`%l�4@`���ﳘ@a�}>u�@b?��+1�@b�1�IkY@c�9�rIB@d|��Z64@eAz�H*�@f���)@f�p1��@g�ڳ/m@hm����@i?e��	@ju�PH�@j�����@k�S�D@l�{�h>:@m|U��@n\��)�@o? "y�w@p �Wȡ@p���@p�L؋J�@qp!�H�z@q�Y S�        ?�jz���?Σ���*�?�����?�c�\���?��q��G�?� n6�i@_'��_�@Ñ��w@�{Щ��@����t@��g�@�Ipx�@�����@ �[~@#�)!#@%Qi(��f@'����@*r�N@,��G���@/6�^�@0�*sYI2@2R��e[�@3����I@5/�aU��@6���&@81D�l5@9��_$>@;TS�v4e@<�H���@>�+���@@"�r�_@@��/y�@A��|I�@B��_??@C�6�
�@D�/U���@Ex�^�=C@FhNlJ�@G[QO�%�@HQ����@IJ�,��@JGPA��@KF��db�@LI+Tm�@MN�	'�@NV�F5@Oa���ͼ@P7��<(@P�����@QIyݜ-.@Q�RGS�U@R`s	.�@R��?��@S|zL�y@TWc_j@T�h?���@U/�����@U�.(��@VW��GS@V�`o� @W�9�G`@X/�7�@X�>�TL�        ?�Kg��@�?�_�9�rJ?�l!|C�0?��ϰ�?�bB��@c�JÚ@���2��@QǑ���@���@��y��@ ��@N��@#^y�o:@&i����@)���q��@-
ٵ�͆@0O�Pv�@2.�J��@4!�z!�@6)��3Z�@8D�-Ya�@:sd2!��@<�x����@?�+�@@�Y�g�@A���j@C5)�e�@D� �44@E�7o�@G1Rn]RS@H�J�Pj�@J �nF]@KtU̪
�@L�,0�k�@Nqe<;� @O��c��-@P��1Z?�@Q������@R`�|x<@S3���@T	��=�@T�}X.@U��zL�@V��Sj($@W���t@Xi{���@YST9@Z?�4j�H@[/�&�%�@\"l�q@]D!�¨@^���@_��,�k@`���I�@`��o��h@a��G�@a�Q�rı@bQ�~۽@b���`�@cr��@c��{��@d2�v��@d�ÙM�@eK��UNO        ?�$ۦ�?�Z�Ȍt?�J|]|?���>$?�Z�hk�@cњO�w@��r�d�@V�NP��@��fx#�@����h@ �j����@#h��!@&u^� @)��9
 �@-0��1$@0Xn2�շ@28�5�Ba@4-�@��@66��}!�@8S�룻H@:�����@<�Bx��@?��q�@@�׼O=@A�͓�Ι@CA;�-� @D����@E���͆@G?�#��3@H�Z��&@J,���@K�Ä�C�@L���wuI@N�ƨ��=@P��p�@P����@Q���Bk]@Rgx|ͫ�@S9���V�@T!��{@T��vl�@Uß�5@V��Y���@W��mEK@Xi���@YQ�,�*@Z<�꘏�@[*K}�@\E2�@]൥}-@^Ev@^�hz��I@_�<��F�@`|\1ÒG@`��C0@a~�J��H@bٮ,@b�6&��@c�,�9\@c��?C�>@d��ɮ�@d���ǺB@e.Q��`�        ?��ϳ+?�W��?�6'It�S?��bbr@�'�dn�@��S�w�@!]ݐ��@U�A�e�@!�O܇pb@%QQ�Z�@)T�{�@-��~˷@1�<ID@3w����J@5��ߖ��@8���Y�@;R��-��@>&�-X�t@@�d�̲@B�D�N@C���諃@E7B��/@F�԰��@H����@JIP!��@L˦�$�@Mޟ�:,@O�[��~�@P��;ǌ�@Q�S,B^@R�b`���@S��/��@T��� IV@U�B�E�}@V�ˇ�>w@W�y�X�@X�:6G�@Z��8�@[2�iE�C@\S��7@]w\��R�@^�M�B�&@_��`��2@`|����@aO�̓@a�X���@bN�)��@b�|A\u�@c����n�@d.9�q�~@dфlVm\@eve���@f�H�H�@f�׌h��@gn];�t$@hc,��@h��|0Oc@is�Yi\@j#;�:f@j�q���@k�8�R@l9���@l�S&;�        ?�/�P[�g?��yYft;?��`ۑ�?�u����T?��K��`�?�42J���@JN�B�@	�_5�cr@��ݖv@:O�>�(@����w�@����z�@�[D�l~@!��XC��@#��_nX@&�tB@(���A�!@+�����@-�;�f�~@0<eZ���@1�ͦPE�@3��$@4���x��@6���9@7����@9Kԭ�	�@:�Z��b@<�UjEu�@>X��"�@@49�\@@�Hz>@�@A��{L� @B���]L@C�7M�s�@D���E�m@E�R'�cu@F�
�4�@G��ܫ�h@H��A6|I@I�-E�-&@Jΰ�tY@K��E@L�����@N���Ls@O.@�@P'��1^�@P��Ӥ8�@QM�f�@Q�t�FH@Rz�n�@S��ǉ@S�D���@TJf0�@A@T��$�@U�FZ��@V'��a@V�%�3�@Wm���@X��<�@X��!��@Y`º��\@Z	�r'o<@Z�@���        ?�!j%<�?�o�޴�?�o��;�?�'S4���?��6,=�@z�Y�ܟ@Ua����@�7�Gg`@�	�6��@��e��
@��2�@"�� N]@%s��[@(�.���\@+�{-�@/5�E�@1d�0�@3B.�~8i@52�5�,@76EȲ�b@9K��� M@;sCj|��@=�	��@?��a�g�@A(1c3�@B]A-9�y@C�ky4�>@D�V.��@F+�~l)@G�P��k@H�	���A@J=o�4�u@K��""@M*x\P�@N�B��@P��Q@P�.E�`�@Q��\qv�@RV*?r�@S!�H��@S𸣹�@T���@@U�f�i@Vo\k��^@WJ'�n@X'�=�B�@YaU���@Y����@Z���y��@[���NL�@\�B�-@]�xO~-�@^�Q*Q+�@_x�`zf�@`7lW&R�@`���bĊ@a1U��}@@a�0/��P@b0K*��@b����z/@c45���b@c���uU@d<�����        ?�wWh�?�c��R>�?�:F�,m?�3�/5t?��pU�}�@����YU@�_	hP�@�
w�\@��r�J@K?▂@ �/�?�!@#�fU|Ʉ@&���t�-@)�_�21@-RL�MG�@0u��* @2WVp��@4M�P9@6X/f@8vk��@:�
й}�@<��xa@?@����a@@�a��}@B���y�@CU�S��@D��6@E�Cn��@GU�+��\@H���@J()�^@K��b��@Mv���,@N��j�ۘ@P�L�}@Pۦ���@Q���]@RwB�ټ@SJ�ߞ�@T 1,�S�@T����<@U��o'�@V�����@W�s�Ҭ�@X~?%�&@Ygd��@ZR�{Z�@[A��$��@\3 4�Ѽ@]'���W�@^�.:@_��?V�@`
�p)��@`��z�'�@a��<�V@a�.4�l@b�vU�@b��@cezn\9@c���@d.��@d�COuG�@eCŬ�        ?ĳ�R��?�9bk���?��]�?��;�U6'@||2��@���+o�@
"Vy�@>��9^@!�t���@%J���@)S��B|�@-��!���@1�ٽ��@3����[@6�s�3�@8���O��@;}x���@>^P9��(@@��^~@B8ȱkz@C��t��{@Es�6P�@G#�r��@Hߡ���@J���Ea@Lx��j^@NV�V@P��h�@Q8Yç@R@��L@S�^STQ@T!���j�@U.ԟ;��@V@��޴�@WWY�F�}@Xr�9�^�@Y��\���@Z���v�@[��S:�@]'涪�@^>ՁI�@_t�;魋@`W��y�@`����$�@a��̎�@b;0�'�@b�oh-��@c�����@d0���f@d��f`�@e��Ͻ@f7I/�1Q@f����@g����@hM�?��e@i�$�w�@i�Ω�*�@js�V3�#@k.Lx,@k�o���@l� ɺz�@mg[�P��@n(��r�        ?��I��z?�F���s?��r��B�?�j%�1Ⱥ?��&]�>@ �}"@^O��N@E.:9�0@�)��g�@iǄ���@5��Q�@B�Ն(k@ G�l�@"�����g@$��j��@'g�~o@)�4@�Ѩ@,�|�/a�@/z7�8��@1.��@2��1q�@46���~�@5����R@7l�q1�-@9��ƥ�@:�љ2�@<��d�]@>]�~�|@@Q]�5�@A
�t+@B &���@B�qA�z�@C������@D�MX���@F���*�@G��ԛd@H$Ւ5O@I9�#�� @JS�Z���@Kr1d+1�@L�����@M�Iʝ�H@N����@�@P
M�&
I@P��&`[�@Q>�y�Y�@Q�[�D@R{7?�^@S92=�@S�U�F�@Tc�.{F�@U
I�DA@U���2�@V\���@W^��O@W��χ��@Xd����9@Y�n�D�@Y�1hzx]@Z|5��p]@[1���_@[���ww@\��p��1        ?��~�D�q?���+�2?���DF�?�_�CSka?��@]�@�i�R��@�P'<@����j&@<�4@?,o`f@ �L�B�@#�ǜ��h@&�. �?|@*)�!Li@-�b�%-@0�%�`�@2���N�@4��e� H@6�z��g�@8ϭi��@;�>�]@=]��wi@?�mt`K�@A�u�@B_
��/�@C�˹Z�@E-�7@F^�����@G�(��Y@I38��ű@J�J?X@L' �x.@M��a�`�@O9s7��H@Pf֛��m@Q4��)�$@R��j�h@Rڒ�6`�@S�ƻ�x@T�`Qγ�@UmT"	�}@VO�N��@W5`�Qb@XӶ|�4@Y	�R�b=@Y��!�O�@Z��6��h@[���|=L@\�S���@]�4'$+.@^�P?��s@_�a	]N�@`k1]��@`�M@as��ҩ@a��CB��@b��U��@c
���@c��cq)�@d!~R��@d��lW��@e=����@e͐�]�!        ?��n��U?������?�;H�Fp?��@=�?����;i@q���_@#*k���@�o��@t�j"z�@G���	.@ @f�w�@#�+�5@&
��ƻ�@)5i!T�`@,�vfnFa@0HIP9:@1�=�)/@3ǈ$F)@5Ś��@7����@9�(B~@<1v��B@>y�ND��@@i� 5��@A���D�@B�z�@D"$H=�@Eo��R��@F�R�*@H"�}/�@I�f>�ޖ@J�5n,�@Ld�P��7@Mޒ�+@O_*|��@Ps;��&@Q:-��	@R]Ö�@RѼ/B@S�=��6@Tu�Uq@ULv7h-�@V&��Z�@W���!e@W�!��,~@X�}��r@Y����3.@Z��ŧ�q@[|� X��@\j��G@]ZQ�Mq@^ME[�K@_B��`[@`��^�/@`���s-�@a�����@a��`4�@b�HiC@b�bgF�#@c!"5
9@c���.&@d,G�l@d����Y        ?�m��0?�ڀ���?��}I��J@ y��/@]T�K��@&l�G�@����o�@Wĭ�U@">Y��n@&$�g��@*[K��b4@.ݥ\L� @1�_��p@4\���b[@7�0!O�@9ч]�{�@<�����@?��$�	@Au�qj�@C�0��@D���8\@F��et@HM�a	�!@J%|ϛj@L	9����@M�֖�g@O��}�Xg@P���'k�@R	з o@S�1E�@T/$�^��@UJ()�@Vji��@W���4�@X�Խlr!@Y�9��@[�9���@\YQ�W@]�� �,@^�"ho��@`�����@`��0��@a`A�N�K@b
�u�m�@b�Ϧ��@cf�	^��@d�E@d�(���@e�o�\4�@f7���J�@f�����@g�c�`�@hi����q@i(�H�@i����l@j���pJ@kq�m��@l8.�"��@m �%xt�@mʗJ�@n�`��O@oc�<ߎw@p�!TQ        ?��B�R?Ѐ�n�|?�G��$$�?�q/� �?�JY9�Mb?�D��3��@��(�v�@
�x��A/@y�&̖@�t��ZL@�@����@�f��@�D��@"9;���@$��/�T@'����@)����a@,S�4L��@/���x�@1 �|bd[@2~�^���@4��Ճ�@5�
�F@7@��@8��#�;�@:���o�@<h�x�@>6��]��@@inK�@@���&�@A�h���@B�Y���@Cꕳ��@D����)@E�x
U�1@G�YYQ�@HP��@I2���t2@JN�j��@Ko���ʜ@L�p>���@M���. U@N�)z3�N@PqXg-@P�e�~�@QFlT��@Q�G\��@R��EE�@S)�@�3@S��z��@Tu�Q#�@U��p�@U�Ԗg�@Vv�Ǯ��@W%Z|�e�@W��|���@X�>. @Y<e��bn@Y�UbǤ{@Z�	�p2�@[c~�k�@\����F@\۔˫�        ?� �'&��?��[�˛?�_!�4J?�����?��&J��^@݁�M@$�4�Y@1 @	�@z-�> �@Q�K�j�@ H ����@#��0�~@&�'��L@)I̙Ku@,�0�.�@0m��y`@1�jXe;"@3���o�t@5ޕ\��|@7���=�@:�EsC@<V���P�@>��!��;@@�.G�g�@A�.��P�@B���ѺI@DB^��@E�,�B�2@F��s�#@HLI�>@I�AIW��@K#���@L�0b��^@N�x�@O�m��I`@P��\��@Q\�8G�@R)!��Y�@R��u�@S�hIO�@T���!F�@Uy��\�@VT���s�@W2����K@X��w�@X��~��a@Y�	 0�!@Z�6��@[����@\��y��*@]��o��@^���y�C@_z#~�:�@`8�q���@`��Fʢ@a4N��t�@a��0|@b4�홒@b��+���@c8*#��k@c��K�w�@d@hG���@d�M�
�        ?�C�d�M�?�	���N?�L��=�G?��`��d�?��Y��@S1�j;@����_@*2&��@�X'�i@Y��D@!V+"$��@$[6D�U�@'���eN*@+����@.�kx�٬@17��,�h@36�\:��@5LS����@7xw��@9�m���r@<��/��@>}��� �@@>wL�@Aɉ�Hq�@C�� @D{KMᓞ@E�^J�e�@GR����j@H�����@JN&ٔ/�@K�c��@Ml`(�;x@O�F�j@PV��@Q+�g��@R����@R�7ZN�@S�QD��@T��:��@U��c��@V�^2�_@Wp�lu�@XdL ڃ�@Y[u`��@ZVx�͒@[S���ˑ@\U'o��@]Y����-@^aZ�r�R@_l=%ܟ�@`= a�d-@`ŭ��T@aO��P�@a�O{��q@bhZ��@b���Y��@c�ƩGO7@d��W�@d��]���@e>�C���@e�iby�@fk2G��@gJ���        ?�!I�e�g?�df�7?�Q8�ر�@ �|�/a!@	 ��t@�W���@��<N
�@P(�t� @"�	��v@&�5�&�`@+Q���;@0��o��@2�r�+2@5.�Ao|�@7�G�:@:�>*f�[@> ԥ?ޏ@@�r�Q;@BF�ڹ�@DD��@E˽�{5�@G���ͮ@I�ev���@K���{��@M�]l�3y@O��)bM�@P��=,�@Q�Z��@S2�7��@T9x_q�R@UdQ{�s@V����yy@W˭���@Y�ՋW�@ZK;�s��@[��.(l�@\�诿ί@^5�-�r�@_�5
��@`v��6�@a(����p@aݱ��xS@b��Sr�@cO@�'@d��IHo@dʭ���@e�L羧I@fPi�Ig�@g��/�@g����_@h�a��َ@iy#�q�@jI;oGU(@k�K��@k�N3w�M@l�;�8.@m�b�|�@n{�&��@oYJ��D@@p�HY��@p�p�"�p@p�p�b^b@qr~�N��        ?�\���Ͷ?�7QN�?��jcJ�A?� ��>?��Ù��?�M���#@ �� ��@	�H��k�@ٹؗ��@D����J@�%G-0�@�(~�*�@����}�@!��]�C@#͠-7�@&*+&q��@(�97���@+.�|��@-�j6��"@0I�<�u@1�}SA��@3(Ut<�@4����E�@61n��=@7�,|/@9b���@;
 A&@<��.r@>t�g�@@�����@A�`D@A���8e@B�sԙ�v@CΠ����@D�
��@E���^��@F�U�Z<�@G��\�@H���Y&�@Iؔ�q�@J�+{{H9@K����\�@M�Cs@N-���@OL(u/�p@P7#T�J�@P���E�@Q^� n@Q��z)F�@R��ݱC�@S&�4R�r@S��v#��@T^�"��@T�{#&��@U���|��@V?�`,@V��Y��c@W��z�@X.x����@Xֈ�m[�@Y��*��@Z+'D-@Z׬���        ?�)�`�Im?�B�t�y?�M~�@f?����"E?�<�/A@K%Y�0@o�?��@@�|Ar@��O'�1@��9�)P@ {~z�Q@#W��ձ�@&d�~'@)���K��@-��W�w@0RG��@23��5@4*��>iz@66j�E@8V%���@:�J�_��@<ϬMa�@?(�*W��@@�d�j@B�e���@CP���c@D��g6�U@E�;�*�*@GX�cE�E@H�Y�|�@J1��.�@K���Z0@M)��L*�@N�Z&��^@P c�_�@P�6@�"@Q��=�[@R�� �p@Sa^�;C�@T:j%��s@U����]@U������@V����f�@W�4�3��@X�ج�z@Y��5DƁ@Z��^�%:@[y��~=@\o��kj@]i%|
�0@^e^I���@_d��yã@`3W{i��@`����w@a9�i�P@a�59��U@bF"E�@b�9w*P�@cW�n��@c��MH�-@do	��X@d��#mD�@e��/��)        ?�EJ�w�?�)��C ?�Y�Yy$?���j2k?�fP�) @j�F�(V@��O���@\����@�"�l��@�W�5�I@ �|��}@#r^D){[@&������@)���ˏ�@-0��÷@0e���6�@2H� �A�@4A4t��@6M��آ�@8n�k���@:�:o�*�@<��U�g�@?E��@@����r@B J��@C_�ns�@D�[�p@F	"��}@Gj�8a@H����@JC���P�@K�&Nl�@M<O@_@N�x?j3@P)�~��@P��R���@Q�`�|��@R�BY�u�@Si��8�\@TB6���@U2)�f�@U�p��xD@V�⫂��@W�x?�z*@X�"�eL@Y����h@Z�{��~g@[z��?�@\n��wj�@]e֛Z�@^_�b���@_\�4���@`.&�=l$@`�@���G@a1�n��@a�`�Ά@b:\	�@b���H<@cH@cй�e��@dZ�U6�@d圣2�!@eqʯ�)�        ?�ټ���p?�T��7��?�2��l�?�Et��w@��z8@�wwNb"@1�kY	@v/�ŧv@!�4q@%|����^@)�Fz"!3@-�ڋA˞@1O&�Y@3�U�S�o@6\"���@9RB���@;��^K@>�_�Y^ @@�=�A�@B���G�@D)�qo�@E�fi�L@G���y@I[k%�\�@K/�j\#@Mf�##�@N�>�Z/�@Pw��lh�@QxA7h��@R~C�La�@S����[{@T�-n ,x@U��A��@VʪE��@W�k�%�E@Y�#�@Z8�~ǦJ@[f�JK�@\��C�@�@]�-�@_*��)i@`&�oW�:@`�/�^ @am���Y	@bZ��^;@b��o2@cg���@d���9g@dÇ�Rյ@etbnޚ�@f'9\�ã@f����j@g��� ؁@hKu<G�@i;1��@i	l��@j����@kA:?�@l,�V&B@l�Z�*�@m���@nT6T��@om���        ?��{2"W�?��|!N?�<S����?�X�cd|?�$�▽?���܄q@��*x&@	*˺�@>�]��@�^�o@�O�2�@S�m�1T@a���R@!Tw��c�@#��S�'�@%�h�c�@(`�Z�Z�@*���ܫl@-�٬M�@0&�r+@1���܂@3�L�˷@4�8N�$�@6
��{�@7�EK@99�v���@:�Zd��@<�U�E�@>I�����@@�����@@먄��@Aղߒ�@B� [��@C���L�@D�4Jmh@E���g�@F����1�@G��n@H�q��r�@I������@J�\�Ή;@K���;W�@L��ZA��@N4����@O"ŗyU@P ����@P��4��f@QD�}�c@Q�q1"j@Ro��'�k@S:�BM�@S�n��@T;#i��@T�T�i)7@Ut��)(b@V0�g@V�����E@WV|c��@W���%�@X�a�r{5@YDVӣ;@Y뜳Wl�@Z�/C�*        ?�(K~�s?�+����]?�4�����?�����?��ne�!@4�;J��@Q�Gǯ�@-Vٵ�)@�!���@�Ì:��@ h�>O�e@#@����@&I�1��g@)�2Wv��@,�g����@0=�ǃ,�@2�W���@4��;�@6VA,"@85�Nk8�@:f&A�@<�T�F�@>��@@�i8Q�@A��?S@C5p���@D�-yb�x@E�%�oy�@G7.G?@H�m�3W@J
���@K�O�l�@L����(_@N�A0�@P.{�{�@P�i{聏@Q�#9d�@RlL8��@S?�FX'@T�W���@T��?�Qb@U�}��@V�x�]'@W���c#�@Xx�ê�N@YbḊ�@ZN��H��@[=�Jr#�@\05	��v@]%3���@^�38["@_P~%�R@`
+mY��@`�����@a����@a�b�?�A@b��k�X@b���XM@c�O�5�@c��q[�@d+Jh�v�@d���Wq@e?v9�6�        ?�!���?.?���7:?�=>j��?��@�jj�?�G��gWN@WLOd��@�@nFW@NƇ8	a@�=_a�a@�v�QFR@ �����@#g\妿�@&v�Y(�,@)�f.R4�@-"�D@0]�0�&@2?Ð�[@46�"]�@6BM�5��@8a��Xj@:���M��@<�-�7�@?0�g]��@@��?�@B
3Ѥ�@CO�o�]O@D��H�@E�0�{�@GRJ�5��@H�,��B.@J%�t��@K��s?@M�^@N�`2H�h@PsE�7@P�.�4P�@Q�TB��v@Rv�vo�r@SI���$�@T��/�q@T��LN��@U�-�IK@V��g���@W�n[��@X|{�R9x@Yd��Q@ZP-��H�@[>aUM�&@\/qc��W@]#Tk�.@^�~0(�@_cO|�~@`����@`��\��@a���@a��b�m�@b�@�?�@b�_C�y�@chZb@c��z�j@d&w ��@d�A+�~�@e9�R6%�        ?�q�a�p�?�
ᱷ�W?��9�]��?�� �e�@Kc���@gq�@�?�U @��@!to��ބ@%/��%�7@)6Id혅@-����@1�y0[@3ve��}�@6 !�m�@8�	Z*a!@;l��d�@>N�ɠV@@����+@B0C���@C�+Fp�@ElhP�S�@G��W�@@H؂[�@J��b{E�@Lr���@NOD��:@P���@Q�Xz� @R�U���@S��`|�@T	��?@U*���@V<j�?�@@WR���@Xm5��ɏ@Y�N�j@Z��Q���@[�{�.�@]h/g�Y@^3t��@_g�Y�<T@`O�o�qT@`��gL\@a���}@b/h����@b� �w�@cxi�R�z@d���@dȕ�Lҋ@esJ�[U1@f�r�~7@f�Ϣ�=@g}����@h.�y�i�@h��D�&:@i�~6uYf@jL�f��@k7�r��@k�V��p�@lw��:��@m4W�7�@m񄸔�\        ?�v����?��r-�?���N0?� g�3?������Z?������K@Qꉼ}@	�!-�ڇ@�-�j~@�_�T�@5R<F&@#dm�X@O�r��/@!�-���@$-	�!�@&�܉0jO@)!���O�@+ñJ��@.6�K�y@0��Z��p@2 ��@@3�,�
&@5/�rh��@6������@8m3�7�@:!��b@;��Rc�@=�Eƍ��@?h�G��{@@����qo@A�^/4�@B�����@C���nw@D���4_�@E�����U@F��23x?@G��>T)|@H�I���@I�4�7�@J���@L;2=~�@M(:��@NPx�,�I@O|�Ҩ�d@PV�P�	@P�����@Q�Z��+�@R+�h��p@R��.�3S@Sn9j�Q@Tk�9g]@T���Jm=@U`��=PK@V
qx��@V�.۵�@Wc�9J @X~姺@X�G6�@Yw1_��|@Z+�[�0�@Z�9!{[@[�Jd�b�@\T�dU        ?�`�E"�#?�fe� k�?�o�A�ɿ?��n���?�d��d�0@e��i�@����gH@S~�FM	@�^��@����@ ���O�@#aDd�@&lϣ�ؖ@)�b�T�s@-_J>�@0Q��ؤ@210p8�@4%��OC@6.1�7�@8J���X:@:z�mP@<�LOcfK@?�u���@@��ؑ�@A�u��;@C>��~.@D�S����@E�M��~�@G@e��[�@H�n�j��@J<6�zd@K����@Mz�%��@N��6�d@P
��t�p@P�8qD�@Q����@Rp�{m� @SC�B?�@TF���@T��]�@U��ȁwF@V��,#%@W������@Xy�^bVt@Yb�^p�@ZN{O�Q@[=<T���@\.�<q�@]#6��0�@^X��V@_-�\��@`WH���@`��VB@aɭn1@a��H��@bi=	tu@b�"z�»@c[~�@c�U�33�@d(Ȃ��V@d�r���@e=ON�9`        ?�`Ѻ��?�;(�J��?�j˱���?�	�>�.?�x��ϼ�@v3�=��@�pVi6�@b��{@���n�@� )�S@ ��(�7�@#m�,EC�@&y���@)�A�:��@-�Ze�q@0W�
zr@25��ƒ�@4(h�!q@6/4�@�~@8I^�+b@:vd�f�@<��8b�@?MtG@@��pO@A������@C1)���|@D{��A�@E�B��J@G(E��@H�**��,@I����@KdE�ە@L�.g�l@N[#҃L`@O�ჹ�@P��:�T�@Q�p|���@RMMq���@SW����@S���	@TƷ����@U��g"@V| �� @W[:i�>�@X=6c�W@Y"
�9c@Z	�����@Z��E�}@[�5Mw}}@\���P�@]Ì)'%@^������@_�e��s@`UUQ~t�@`Ӹyģ�@aSW����@a�.M^�\@bV8l�L�@b�r=�K@c]�PQB@c�g^(g@djP��@d�����        ?Ń�æ�?����A+�?��[��?���[�@D�!�>@,F�6@�M���@7G	tw$@"*���!@&D��@*?a�6�@.�a��&d@1����,@4H5�z@6��ɡ�@9��{�~@<���os`@?�x4���@Adv�[*@C����@D��-���@Fn����@H7��<��@JrFyq@K�R^�)@M�%���@O�Z�@@P���:�@Q�	�@S��M�@T"ȥ�K�@U>6qM
@V_5W�O@W�����S@X���(@Y���!�@[/�\@\T�oF�@]�r����@^�!d��@`�Gɏ�@`���|��@ad�:[�@bQ�">F@b�2$8�u@cqa(Û�@d$�Y���@dڊT��@e�v,�@fL�w7"�@g؏��}@g�B,�n@h��J=�@iJhȕKs@j�EI:@j�و��@k��j;��@lig��'@m6+�q@n� á@nՒ#�@o�(����@p>Q%�*�        ?��xL~?�E"߄��?�gl��R�?��8���?�7�>�h?��Ä��@�^��_@	e`��6@����@�,Og@�*�L-@��?��@��1R+@!��RI2@#�+)��4@&Cd�I�\@(ȕ�ȫ@+i��K@.$]	�@0|���q@1��Ҁ\@3w���p�@5�c@6�n�-x0@8L�t8�@: �t:}�@;�=�gJJ@=��i��@?axԌM@@� �^�@A��V @B�#�nN�@C��g�^�@D�H�;t@E�B���@F��_��@G�̔�˗@H��;@J W�nn.@K#�'~@LLE�v�4@My_�VV�@N�)�CI@Oᓗ���@P�FɊ�@Q.!U|s@Q����a@Rt �ń@So����@S����6�@Tme"[Iz@U�y�7@UȒ��Q�@Vy(t��@W+�ceX@W�)�z�[@X��/�;n@YN�{u�:@Z�Ng��@Z���2�@[��1��@\B,f�_@]�p�K�        ?���� �?�/�n�Y?�(�ሴ?�Ȟ�H�?��C�
@-����@IV��C�@(���ˁ@�_R�@���\�J@ f'���s@#>��L3�@&HQ�-@)����V�@,��]`@0>��()�@2ό��@4F�L�@6�i^�@8=�q�e@:ohIјN@<�uZ_)@?m���@@��g �@A�p�'-@CA�x�C@D�8:Ϩd@E�K��#@GI��Y\f@H�����@J"(~���@K�Xa@M�[O@N�H�7}�@P ��9@P᠙9��@Q��9}%�@R�م\��@SUl�ܼ�@T-8G��+@U+���m@U�8�W]�@V�R'}��@W�i���b@X�qg��s@Y|\��g�@Zi��@[X�U���@\J�Lߪ�@]?�d#q�@^7�����@_1�Zk�'@`h���@`�B��Y@a�Q��@a�@���G@b�b�@b�;	W�<@c'� ��S@c������@d6����@d�(k�@eJv/6�        ?�FX)M?�;��YX?�s~j��y?��� �?�����0@��[�n@���~u@NY66�@~t��@	b}��@ �����@#�yq6�@&�/��|�@*��SP@-����+�@0�M��S@2�Y���@4����+l@6�j
ڗ�@8�E�-��@;�����@=ZkY��@@?����@Akt���@Bf�
�j�@C��E��@E��c\@Fu���@G�2o��(@IV	2܍�@J�~Ҟ��@LYn���@M紶v�@O~.�k��@P�\�6�D@Qa��.��@R8��|Լ@S��W�H@S�x�<�Y@T����@U�v!�v@V��m6�@W�!0P�"@X��hL@Yw9��s@Zn�{Oz�@[j���@\hv�5v@]j5�y�@^o<|��@_w�ci�@`A{�);�@`�͍�jw@aQ�	 _@a�#۩\@bh @�[-@b��i���@c��z�@@d1���[@d�3�d�_@e:�C��(@eϡf�D @ff��'z        ?���X��?�����?�k3:,�?�����@����@�����@��=_Ɏ@5>�M@"3)3�@&#��!ts@*h�]K�@.��qm	�@1��,$"@4���f��@7FP�bP�@:&pg�&�@=)���@@&�n#�@A�3��@C{��q@E=�a�� @G�)��@H��&�@J�m�,�@L�I��<_@N�mJ[��@P�ϽWf�@Q���g�@R����@S�;E��]@T�i����@V)���@W^C��%�@X����\�@Yۇ�9m}@[#|�R��@\q���;�@]ŦV���@_�z��_@`?�{�kN@`�߻@a�mZ�|@b`��f��@cX ��w@c�t��@d�G�"K@e^�M_�@f$�d��0@f��p&]@g� �G�@h���($=@iW$���@j)�j	�@j�}�S\@k֓��h@l�p4Xa@m��? @nk	="��@oK��|rU@pK�Ϥ@p�����@p�rYp��@qr!w���        ?�ނ?��?�tݎ/k�?��,9Ҕ?�$�����?�S���`�?���/@�Y#���@	{dլ��@���+<@%���S�@�{�B�@�p�7��@��a.4[@!|N��{@#��a��@&�V"�@(�i{�sm@+%Fu(�@-Η�!@0G���u@1��m��@@3+Q�~�B@4��&Q�@6:��z�@7�KWb�@9t̌�C@;�<��m@<�M.� �@>�]��@@.f�0��@A7�e@B�*	�@B�R/�ś@C�y"��;@D��sɕ6@E��*@F�����@G����c@H��jvg@J	�ص�;@K�:ԟ@L4:Z�E@MN�Αw+@Nm�y�A�@O�>xn�@P[=���@P�6!��@Q���XJ@R��e��@R� �є@SV&�u\}@S�928@T���%��@U5��}�@U��22�@V|��dy�@W#2?�g�@W�?�rC@Xt�?��@Y B>*ǎ@Y�.��k&@Z{��r�F@[+ʅ��        ?��i���?֬~����?翄����?�H����?���v��h@�T�2G@�g'뾘@�Mubp@-rn@.2��@ �
��%@#��xȷh@&Ҫ���@*	�i@-��ɱ�@0�☶��@2���{o@4�w���j@6�TS��R@8����P�@;�8�L@=_)�_��@?� ��@A�Omjo@Bd�3�q@C�@�r�@E
�k��F@FkN7�,s@G�J�l\�@IE�?C@J�\�-� @LA#���@M��5 �]@O\f��&@Pz�.3q�@QK'�s@R3Lb��@R��ׄc�@S�����@T��!� @U�	j��(@Vx�qN�]@Wa�!@�@XM���@Y=]k!@Z0�0��@[&F�D@\+�_+@]]�z׌@^�:��V@_��1|W@`	�sv�@`�Y�Q@a���ç@a�x��$>@b)��5��@b�eM�4B@c>e��$�@cʽ
�+@dXg��܁@d�a�9T�@ew�=�e@f	3�6�        ?����ӂ?����?�%��\ɂ?��.���?�+��O"@CQV��@h�ag�@=�
Y�@��#�m@���ƍ�@ y�yd�@#Ut��<�@&b����@)��E�­@-��6
~@0N�@��@2/��Y��@4%-c3��@6/KP��@8M`��x@:~�z�n@@<Û���@?��.�K@@�:#c$�@A����Z @CFg"�/@D�tOt��@E���o�@GL��e@H���rn~@J$W!��@K��Z�$�@MD���@N���D@P&p��1@P�߃���@Q�#�˝�@R���<�@SX+{�@T0�a�19@UH8x��@U�J@�{@V�y����@W������@X�&���@Y���1�@Zt�Ej�@[f$;�|@\ZF��Vb@]Q=��@^J�
׼�@_G}�>@`#W�|�@`�DȓM5@a&� ���@a�_`�@b.�{z[�@b���}@c<7���@c�����@dN�1��@@d�}�}V6@ee��q+        ?�q�,�U??���2?��/�od@ ���<@v�{�;�@9h�,�@� ��J�@y�*�z1@"T+ZjTo@&?�nnL<@*{/���@/�@��@1��֒7@4u2[F�@7"<���@9��m
ٍ@<ܲ�X�.@?�/���@A�y/n��@C+D@�=�@D��,|@F�_�HM@He��rЉ@J>vy�/T@L#�Ca4�@N�ɂx�@P	��O@Q���� @R̅4��@S'���@T=L夋@UW�'�!'@Vw����^@W�3aK�~@Xǣ�z�@Y��)�@[+��{f�@\d�� �@]�ޖI�@^�A��@`�[�@`����J@aeXd��@b��|�C@b��ȕa,@ck�I���@d����@d�q�U�@e����@f=k�^Z�@f� �l�@g��5�@hp:�f.�@i/ҁY��@i�_�V*}@j�ܜ�(@kzD���@lA�z(D�@m
�h+4�@m��@�@n��E��@oqj��F�@p ���N�        ?�P��m��?�nj{9�?�綵�oF?�7ґ�2�?��qVgp?��=�;j@N�*Y��@�2�/�@���%@��e�@@�&��@څAV"�@�+��R�@!����@#8����@%�]�R�'@'�6dE!�@*ou|I\@-i��$"@/�v6���@1>�t3�@2��L�C@4$S�)��@5�R��Ȑ@74�&�/D@8��$��@:l�W�/@<�g�� @=˸��@?�!Z�N�@@���G��@A��&�g�@B{�M���@ClZ��|@Da5C�G,@EZK��2@FW����_@GX찑F�@H^V�ԘB@Ig��}��@Ju}�Kq@K�FꝜ�@L�C(ͅ�@M��V��@N�R%�:�@O�E���@P��&�]@Q`���@Q���|@RI|�M&~@R�5K�M@S|>-a�V@T�*�@T�s+f��@UTj\ޣ�@U���1.@V�����@W:p�SZ@W߅���@X��:��@Y-����@Y�V4��@Z�$Bl�N        ?��;�?׀~�[t�?�tԯ6�?���`��?����e@w���?@ ���N�@B^�'�@���!o�@*Fr�}�@!c�� �,@$h�M�!@'�U=�)!@+��]�@.���qւ@18�
U`@35���
@5H��dO@7r+oPl1@9��4a��@<�I7W�@>mP��a�@@t�m2�@A�1'�E�@C��Pg@Dj�����@E�MS�r�@G=/�#��@H��N��@J3�ߥ�@K����7@MLx�x��@N�pBG@PCH�Q(1@QۮO`&@Q�_8�1@R�����@S��l�@T��M�v@Ux�Uv��@Vc���@WR����$@XEh��B @Y;dӉ�;@Z4���@[1�#j\$@\1���r@]5&A�/G@^;ġh��@_E�ʹ�S@`)>iU�)@`�@����@a:�|R�@a�ٔ#�@bRf)l��@b�k�nD�@co���@d �:�@d��G]@e&ϲ�~*@e��ыS@fRT�;@f�H���        ?��;eM�?�YsGkU?�8��%?�C�(Bx?��=��n�@YmX��@) 4>ݤ@k��ι@��h�J@Sش��@[��0��@"`:��L@%?d��U@(I�׭�(@+}�E㮜@.��Ŀ@1.�r�"@3�~�	>@4굄JPn@6��v`�@8�o4n�@;
	�Wnw@=62��R@?r~4Ă�@@�@�ij�@B�&�>G@CB��@�@D~i,�I@E��s�˚@GD�dX[@H]f���R@I�!2�{@KO>
��@Lwύ��k@M�2�A�@OSF(\%�@Pd�C��@Q#@�>�@Q�[�׵@R�@���@Sn�f�E�@T84�xP@U*::w�@Uҹx�%}@V���$�"@Wwsf��@XM�2D��@Y%��.�@Z ̮��N@Z��_�v@[�G4���@\���I�@]����@^hGr]P�@_P�ϒ�@`�F�z�@`��\Ny�@a	����@a�U*���@a���W,@bst7_��@b�Λ���@ch�Sb8:        ?�Ӌ8�?�O�;xj?�.!�&?�d��#d@�V��xz@�1���@-n.
@n�K�>@!�.d$��@%s�Atz7@)���x�@-���݆@1BV��AA@3�yx�y�@6F�M�@8����2�@;�k�|��@>���E�@@��G�F@Bnd1��@D(B�'i@E���w�@Gq3���@I5� �D?@K��eI�@L�:"��@N�)��f@P_J`�
@Q^�� �@RcX�{P@Sm�3+�@T}N�8>@U�ժ���@V�����7@W��Gx�@X�\[��@Z�j)@[F	��R2@\x�l�;�@]�>�,@^�[�P\@`���H�@`�>�@a]ٸ�q@b�qEF@b��/�*@cX���9�@d�T4@d�@���/@efr��#�@f�ypq�@f��?�F@g��@�'@h>�==@h��� �@i�v��@ju��9@k5o���=@k��	�h�@l��[�@m�IP�:�@nH��wC�@o��}Z�        ?���A@�?�<a2��?�=��k?����G ?���]p�?�����>�@���U��@
8��14@Br���@�|��`o@_����@O�5Ё@|7�Ҧ�@!�|���x@$@�æy@&�ܙn�w@).�';�@+�>u���@.� �wF�@0���z@2Z��W@3����{I@5 Up@�s@6��zs�@8Q��.)@9��H���@;��)>sl@=g�1@?-NvWB^@@~&���@AjCB��@BZ��@l@CO�z2��@DImM F�@EG*��@FI0n��@GO/��&@HYO�;c@Igjv��@Jym,^��@K�H�!Y@L��]>e*@M�Q�ˆf@N�e�ޅr@P��q�@P�7(��@Q0%��Z@Q��"�޳@Ra<E}}@R�W�<�@S� JE�@T7��zOc@Tנq+M@UyM�y�{@V�+��@V�pJ
�U@Wg�u�]@X�CU�@X�n�^�@Yd��\�G@Z8�� �@Z�qT��@[o5:�%�        ?��h0��?�ˢ�c{�?��4�z}O?�^ww!��?��'O�D�@���@8ݩ%@�͇PRT@4O��}�@1�xp��@ ̈"��@#���{@&�si��@@*P7L"�@-��e�@0��~L��@2y���@@4uE��0@6��e�@8���p�@:�Vx��@=*���թ@?��x^�@@���H.2@B<@�.�a@C���bZ@D׈%y��@F1ܒt-F@G�k��w4@H�`�{�@Jq��/�@K��@@Mm}��@N��ںq@PC�1��@Q;a�C�@Q�p���4@R�ر_s@S����@T`G�g�@U<ƧMj@Vv����@V�I�F�@W�1��5�@X���O@Y��l[�@Z���/��@[�q�UH�@\��@�@]��&T�@^����@_|�u�B;@`=��*�@`��t���@a@�W��@a�gǇ7@bI�":5@b��D'&@cVQnjM@c�D׿�L@dg���mK@d�FݮsD@e~���
        ?�#A�{B�?��^(�?�@�{?�W?��%6��?�AW�޵�@N1�f@p,�+3�@=�^[H@����1�@�Qr�}@ m�Ί�@#B�d'r@&G�/0.y@)z5B��,@,�P�ޘ@01����@2��~0@3�E���@5��"9A&@8��Z]@::x���@<u<ڸ`j@>�󢯵�@@�XoZ[@A�عjA�@C2���@DPt��~p@E���lg�@F�{��@HY�પ\@I��^��7@K1�,=b@L���T<I@N%�2ߋ�@O�����@P��&#�@Qe��@R1�D�-@S5U-��@S���#b�@T����փ@U���4Α@Vc�^g�@WD5��_8@X'�j�F@Y#�k4@Y���4�@Z����^�@[�W5�@\Ŏ:G��@]��<��@^�p���@_�Z3@v@`U'�MS�@`�!"�a@aVhЄ=~@a��%�#�@b\���@b���O�@ch@8��@c�����B@dx��[�@e�.٨        ?���%q�b?��N,�c?�vU�;�@ >Nb5?
@�}LnbQ@X�gzr�@P�e{@�����@"e=?(R~@&M����@*�Js;��@/�ES�@1�6����@4kպ3�@7���@9׋�+�@<�\2��@?�{�\/�@Am����@C	�NjA�@D����M@Fj��̛�@H.�+���@I�#*
�@K۱a>k@M�"�9{u@O�6Ê�O@P�����@Q�$��	/@R��l���@S��1�1@U`��@V+��(c@WKzU?�@Xp
���@Y�*"9�@ZǾ[�M�@[���T��@]2=�u�(@^nR(7ʯ@_�ر�e�@`y�� %�@aw�;�@a�-��Q:@bm�ٟD�@c�>#��@cŰ9.�9@dt��H�@e%k#�^n@e�<nA��@f���r�@gC�BC�@g�C���@h���b�@is���@j1B�T�q@j�HSk�7@k�(6s�@lv��(ɕ@m<8�GG@nw*'��@ǹ�Oj�@o�R��h        ?�n����?�)ԇG6?��~k<��?��=��|?���K.h?����ϛ�@xç�d@
/-o5/@=��*��@����l^@Zٌ΄q@I�P��@u ���u@!��@$:
�b�@&����n�@)";��%�@+� �**@.k#8a�@0���_@2-�o��@3�Q��@5F��wO@6���u@8'�*t�@9�&�>=@;r
s���@=%J�{�@>��ع4�@@R�E9`�@A9(qU�@B#��q�@C99BKK@D��8	�@D��ږN@E�5fFB�@F�
�q,�@G��D~@H�Ǌ_�@J�o��a@K�&[��@L�C�@M/}Ѩ��@NE(V���@O]�k>Q�@P<�Z���@P�`�Ő@Q]M���@Q�↤�@R�o�D@S����@S�4
N�@TF�M���@T��{�m@UzK����@V�x� �@V�����@WP��0�@W��~�Xn@X�2㩼�@Y1�Ĩo@Y�<��^�@Zw怤v{        ?�8���
?�`^%��~?�p-�|�;?�'���?�h�d�jU@h<��Q@�l����@S��^�(@�).#k@���(D�@ �����v@#Y�eC��@&a�\���@)�<ʧ^#@,��kWE�@0B�h�Jl@2x��;E@4N���@6�5��@8#�>���@:K��X�@<�k�a��@>�#>1��@@�j��@Aˌ\��@C	�T³�@DO�=�7�@E�����@F��)@HO�(e$@I�|m.r�@KG ��@L��k�Կ@N ���@@O���c�@P���й@QK���}@Rf��1�@R�)���@S��׃�@T��v��@UU"͓��@V,� ^7�@W�XU(@W���>@XÝvsW�@Y�%az@Z�cN��Q@[sN�e��@\]��$��@]Ku�-@^:�V�a@_-cK.p@`�7}�@`�}s(w�@a	Md��@a�L�pݴ@bwt��C@b���!��@c=v?@c��IW��@d�}�x@d�CԖ��        ?��/����?�z�G�a?�W�"]?�K�S{/?��S���@��V�*�@,�*Xf@���b��@,TA��m@'(�K@ �ZS� @#�|,V+b@&�+��@*�X�u�@-r�wЋ@0����@2l"6@4eF?^�@6rV9�@8�mn��@:�Ո���@=��Ύ@?h�H-��@@�+]�Q�@B(�J�p@Co��3Ͷ@D���[��@Fk��we@GwQ�d�@H���Q@JN�����@KŪpC�@MD�L��@Nɮ��HH@P+*F;��@P��:@Q�c�_@R��׋�@SfK{�`@T=<ض�h@UU�k�@U�ޠ�
@V���-I�@W�	����@X�?�Z�R@Y�a1�Q�@Zsd�@�I@[bA>��@\S�jx@]H]}�¬@^?�z��@_9Z��8@`�o &�@`�u��nD@aK�<�@a�e��p�@b �w���@b�Wt�=@c+&�݄@c�*��0@d:^1�/�@dý(��t@eNC?Ґ�        ?ŉE���?��̼3?��7�s?�@ `��b@s8����@25f	C�@�}Mʌ@Zh),�@":%��3�@&�4pZ@*@�]��@.�C�@1��|��@4.�' ��@6ȅeEP�@9��f�@<S͟H�@?B��m�2@A&}��@B�s�4�u@DU
���@E�{8Z@G�l�-|@Is��!�@K>��2��@M1QB+@N�7>?Z�@Po0pS.�@Qi8�n�r@Rhf��@Sk���F@Ts��ƾ�@U����&@V�(��<@W������@X��m�F@Yߺ��L@[���@\(b#*@]R����@^��ܐm%@_���r#@`ta]���@aζ{�@a��=BH�@bOӭ��O@b��Q ��@c�m�6�@d:�gȯ@d�9�Ǌ@e������@f3���x@f�M�M�@g� ��R@h:Y�b��@h�� ��@i��n'��@jM+��ة@k ��`>�@k���iu@lkǿV��@m#.�zu&@m��^)�e