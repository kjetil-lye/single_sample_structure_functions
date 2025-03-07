CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T101311        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?��zJ��?��-�;�?�4�Յj?��y��?�}'��P?���x
�?�1��9�\?��s���@�3B�HG@��$P��@��N���@|J���@�dq:u�@Pvf��@"ֈ�R@ ���G�@"J}`t��@$�ąU"U@'
zx�$@)�S� �@,O($�@/"<���@1
��Ǌh@2����@4.H#3G@5ׯ��N�@7��g�k�@9Y;�~�'@;1g5��@=.{�%�@?ZҐ�@@��=�]�@A��_<�@B�#�E�@C�خL�C@D�����Z@F+fB�@G3x%�`9@HiCj��@I��xƤB@J�P�RE0@L3�$ۍ@M�s�#@N��fA�@P_�={b@P�-��^�@Q�=�A�/@R@��f�@R��< ~�@S�r#S�@T~�3v�@UD|���B@V�c��{@V�;t�J�@W�h2���@Xwjk>�1@YK<�]L�@Z!�A{��@Z�:]��@[�YV��G@\�/��|@]��f[g@^{�ůy�        ?��mY"�?�"B�^7?���?f��?Ҭ�O���?�r�}r��?��V�?�"�c�?��ys�h�@���&��@㋦�( @�����@�[F.�@L���I@L1�`��@�q&��@!-y��Mo@#����@&h!tv(�@)G�V3�@,S"&$��@/����"@1u�g��\@3;`���@5(�N'�@7�T��@9	����|@;!�����@=M�(��@?���4C�@@�L-/L@B#ҤG��@C`�K��@D���Jq�@E��٩m@GN`	��q@H����@JE	A2j@K���A8@M	��b�@N�]���@P����@P��Z�@Q�D�<}@R{�����@SS�N<w(@T/����@Uic@U����@V�D�*�@W�@m��@X��{�>%@Y�h�0�e@Z�[?e��@[���g��@\��{�r�@]����@�@^�a�u��@_�eZ%q�@`pL-���@`��n�7@a�·��@b��hh�@b������        ?�v֋ �?�3=�Ti?�s7�Q�&?�2����?���;`X�?�+��S�}?�����H?�ʅ��A @3ٓ+�@ȶ^�/@&h��)
@'_`��d@!yΰ<@���w{@ $q5o��@"�?M`�@%�](+��@(�����@+�hXzO@/F;� !@1W,�߰(@3<Pc>O�@5;��@7S_��ڇ@9�F:Z�@;л�P8@>5��!�
@@Z$�b4�@A�/��d�@B��>d��@Dd�q�2N@E��2�Wz@GVoP�V@H�۴���@Jzl7��@L�dW�_@MѢ�a;�@O�>�P@P���{��@Q��G�nz@R��+|w@S��GT�#@T�]��z@U���}\�@V���&��@W�����@X��7̋@@Y��4��@[ �t�н@\+����@]\��:x@^�Z�i��@_�B��@`���Y@a0<4�5X@a؈�l��@b��i�-]@c2���|y@c�A�٢4@d���o�@eQot�-@f4�v�@f�u3H��        ?�,���?�����?塚Ht>?��js��@
�h�-�'@zo	��@4P�u�@#�M6-^@)�әx��@0B�g�y[@4	�J�&@84��)��@<���Қ@@����@CVU�@FVZ@��v@I\�Ő3!@L������@O� /*�@Q�:f%((@S����Q @U���W~�@W��	L��@Y�[�0�Z@[��ܦ�2@^M�뉙@`X��s_@a���u�@b����)@d-u|�&@e�2c��n@f�1ɶ�@h_`�@��@iٮ��#�@k^
i���@l�d�� @n��2���@pjɫ�A@p�dt��@q�:���i@r�����C@s�QiR7�@tqw_�y�@u_D�ءi@vQ��Wr@wH����@xC��wD@yC�OLI@zG�V�Z @{P-*��}@|\��^�@}m(>4_�@~��Q��@� ��˧@�[=��-@��X�]�C@�}]i�.�@�G?�D@���{2@�>�؈�&@��4[���@�s��r��@��c���        ?���=�?�� &m�?���E�R\?���4G�?��ՔD�?��-�D/�?��N��W?�%�� ��?�8S�s�@k���@�����@�ʾA��@���� 9@�``�H@iV��e@]B XO@�Q��ϧ@ ��)_�@"�sZԲ�@$��A�9O@'*�p~��@)y�fƁ�@+�|El��@.g���@0�:&$�@1ݾG��,@3E�C�"�@4��u��@6<#!&!�@7�ԣ��]@9c�^p�@;	� |/�@<��U�Uc@>y�@��@@!�~�dO@A�Rؼ@A�I��7�@B�!&���@C��D�@D�#Ce�@E���l@G �ސ
@HM�ѧ�@I)����@JE3E�@@Kf�>ѱ�@L�m�O�@M�u����@N�qo-@P�g3�@P�t�B�@QN�<�	Q@Q����@R�p\mP�@S?��2S@S���3�@T�(e*%@UF���@U��z�X@V�����@Wc�0���@X�e��q@X؈1��I        ?�G���?�;�+	A?�)�T`R5?���a�?����G�?�����?���Sk�?���8���@ �=!XE�@a�08�@
���-�@�@�[Ѫ@�n5Nh@��`�}�@6��;�@ f�O��@"����j�@%��`*Y@(a��Ig"@+g�Tb�&@.���!@0���P�@2Ȟ~��@4�^E�y�@6�	5%Wu@8���-�3@:ЮjN^3@=m�]��@?\��O��@@��8�@B � �v@Cj��g�N@D��0��@F�ʃp�@G�56v@H��7b�P@J�&P��@L
�LJ@M�׌�}@O?����B@Pug4Mi@QOeczD@R.�)�C@S�m�^j@S�g�©3@T�C7���@U�(Tn�c@V�cWO	@W����k@Xټe,ޥ@Y�t_a�@Z�3n�@[�~�b @]�E���@^0��y@_P�3�@`:��8H�@`��F�'@af��W�@a�H�@b����o@c8��"��@c������        ?��ɓu:b?��`��a�?�+���\?���YoT�?�Ğw&�R?�@��st?��:Y?����^�B@Z��)v@pD�9��@=݈���@b��?@>�N��@D�+$=@\�`��7@!
p_C|H@#�=���@&Mͩz��@)4�Y뼬@,IX���@/��;!�@1}�>�?}@3L=�;��@51Aס]@7,�u�\�@9>\����@;f9Y<�@=�"ޡ,v@?�����@A0�(�@Bp���n�@C�J��[@Ej�?�!@Fp~9��l@G�Gc��h@IP���'=@J���a��@L[R���B@M�LR=U/@O������@P��9Iy@QvZ}ٗ�@RU)b�/�@S8��2��@T!�����@U��ͱ@Vr#O��@V���)�v@W�gW@X��ˊy@Y�P�ޥ@[�K봋@\9�O�@]%��ص@^<`ZK�@_X}:j�@`< ���@`�a�G@abˉ�o/@a�\Q"4�@b���3�@c,�9��@c�ϋ��        ?���̭�#?љ��po?�\h{7�?��H��@x@����@��'��^@�?��@ŋ@|�@$��c�l@)nMݡCd@/c��G�@2�sD��@6����	@:t�D��8@>�ԻjO�@A�ƽ��@C��9�}�@Ftu+ˎ�@I�g	3�@K�0�ʴ@N�|M#��@P�nO��@R�t����@T>���t@U�����@W�,���@Y�-�ĺv@[�ֱ#�@]���}v@_����|@`�!����@a��c�@@c΃�I�@dE�u�q~@eu�t�t�@f�6u�
�@g�/�$�@i2����@j�h���@kՇ�O(�@m1��)@n����?z@p #�7@p�����@qu�@Fa'@r5��P��@r�D )f@s�M�08@t����L!@uXij<�@v)����@v�&�+�@w֥:N�@x�)7ƃ�@y��.i�@zs-
(�@{X�G[�@|AIb��@}-,���@~?i�9@{2��@��Y��@�~*E��m        ?�B���W?����?�ūFmX?ם{��c�?���f�0'?�~x��V?����}?�J�!
i@��@�� "T@���6	�@��-z˻@"�z{^@�vЅ�{@���G�@ b׻ ��@"���?Y@$�n�0}@'k���k@*+��k@,����@/��\
@1Rj�p�@2�[b�@4�C�Y��@63�z�+@7�nab1@9��/� @;��Ǡ�s@=�}�!l�@?���W��@@��ٮ6@A߷m��e@B�
x��@D���D@E9"P�5@Fe˓��(@G�˞d<@H�'!�k@J�����@KaI�$@L�I�>w@N
	���@Oim�@Pg���3@Q ��b@Q��Hp��@R�k��|�@SVP���@T��J<�@T�e�"3�@U���Zv@V|�G?@WM�%g!�@X#)��!@X��~cc�@Y��Q�@Z������@[����Y�@\~M2�2{@]f�ub�U@^R�W�K@_A|�Y#        ?��ti��?��`��?��Xr��?Ө˛���?�E�b��?�J���Se?����)�?��Vڰ� @��#���@���Dz�@�`�w\Y@iХ���@6���p|@c@���@���h$@!���~�@$����@'hJ�f~�@*k�)��?@-�߭'�@0>��V@2F[Cz��@4$6�(�Y@6�m��@8#v�p��@:D�&�!m@<{����@>Ȗ�z��@@�����@A��C觥@C�#`�l@Dj-V(8@E�=�b�L@G,��&�Y@H������@J����@K�`ǋb;@M-�p	4�@N�h�G�@P5c�_�@Q��:�@Q�N7,m@R�m	�#@S�?/Jc�@T��M��@U�Ȝ�<�@Vvf�VJ@Wm�S �T@XiaxM@Yi^�z2@Zmx�U�@[v0�_�@\�8�#��@]��+3G�@^��[i@_��ߤh�@`p�J�@a�xk��@a�f���@b*0���[@b�R���3@cZo��P�@c��L��        ?��B$%�	?�mC���&?Ĺ^ˠH?�QRNXR?�5ԑ�?�Xn���?�vS��Ns?���ؘ�@�t��@	tm���@��J6�@��9P��@� �$�7@�S���@ k`b��@#�.�5�@%�����@(�kF��@, @龍@/gw�r@1~Hg��>@3a�{�@5]7����@7qD�7�@9�z��@;�A���@>=�QX��@@X���%@A��y��s@B���X�)@DM0rl/@E��Y_�@G*�Liʭ@H��n�<@J6���i@K�l'(u@Mo��e@ObK!�n@PkJ���x@QM�����@R5y�<� @S#�l�@T4����@U��#�@VV�}�@WA0U��@X�x�SY@Y)���;�@Z>��k�@[W�<���@\wLx�a�@]���+��@^�?YZ&@_�u�p]�@`���^/@a2�7��@aѱ(�q�@bs�M�E�@căꇒ@c�43Ur�@dj9��@e�Pt@e���3        ?��l�A��?ٸ0���?���啭@ �d�_LE@l���@�޼ߩ#@׾��1(@$�uj�=@+qށ'�@1�苭�@4��b�G@9Q�{�c�@>����i@A�G�
O@DX]6���@GL+�<K�@JqC��@M�6$�@P���y�@R��\���@TuM�d@V��B��@X���i�@Z�&�#@]+kO���@_��<�E@aHJn;@bR�~ ��@c���P�@et�]�7@ft�6Խ@g����@ik�^�k�@j����@l�+u�\@n0�h�@@o��E']�@p�ͬ^��@q�_�)@r�|�@sz�=W��@tj�?�n@u_�g���@vY�'�-@wX���@x\��j@ye�7��d@zs��4@{�rHa�@|�I�@}��Sꎾ@~�k��%@�&��@����z�@�.�a2��@���Z�{v@�ej�O(@�X��@���o-�4@�I�wa#@���Q�y�@���S(@�A"�c�        ?�P7>�2�?�3N{�?�-��Y&?ϣ�8x��?�6#�J6�?�
Z��?�;�D}9?��\x���?��J<�3G@�5@b#��?@	{�oY�@P`P@e@ŷ�g@���D�@��a*j @ʦ���@.,и��@ �̩�ŋ@"�*ݹ�z@$��]2�b@&ʸIx�@(�P3ؐ�@+.^�g�?@-���=�@/�b��@14|Lz�V@2~C���@3�r�^�@50��.�@6�im�+@8�iķ�@9�0Q]sN@;+.���@<���PQ!@>6����9@?��M�@@�6���@A�|�ą@B{=:�W@C^h���\@DE��'��@E1�73~@F!��3�n@G-�ޙ�@H�HR��@IK]���@Jʖ�@K�̞%�@L��V@M&���q�@N7�3�D�@OL`;�j�@P2�����@P�ￊ�=@QQ9�x�@Q�o�D@Rw�K���@S�b�R�@S�t韤�@T?4�Q�@T�ː}��@Ux4&F��        ?�8���%?�����?��d$bΧ?��pL�?ܓ����?���&>4]?��Gbo�?���ߕ?�tҏb��@Y��d(@	���/�?@��I���@lT���@�A0S�E@��a@�j!�@!ĺ��v�@$;�R��k@&۶C�>@)��+��@,�ƐGv@/�Nw�$>@1z��#�@3/�{R4@4�/_P�@6֓ ��@8ǵK##�@:�t�f��@<��5�?@?D�u�(@@��U�a@A�{�S@C�J�;�@D>��2�@E���ӎ@F�X�'��@H)�5؍@I�Ú�w�@J���@ѩ@Lgq@Θ�@M�7f��@Og� �^@Pz�Q��@QE��l-�@R6E�L@R��+��!@S�jY_@T�I�1�@U}�a��@Vbu�>@WKGw%�m@X87$E
@Y);����@ZM�%@[b���@\qql �@]q�x@^Y.rh�@_#/�=�@`ۜ���@`���w@a* I<-f@a�����        ?�OGS���?�%E��>?��9Sړ�?�X~�p�?��u�-d�?�]
g��>?�t����?�7�<C;?�%΢�T�@2s�q�@	|&����@q'M�ݓ@	�nm4@�u	��@��,?|�@�� b�z@!Ғ}V.@$P��XLo@&�򸟃S@)�5��@,ƻs�Y�@/냝+�@1����>�@3Wfm"�@5&5g1��@7�.�4@8��93��@;�Փ�S@=#���%@?R�t�@@�<A�D@A�-����@C'5����@Dc<��P@E�+��0@F���r�@HLm�؈ @I��,�@KRJ���@L��o/�@M�2�q�@O}*����@P�0cL��@QK�_�@R��.�@R�LJ�Tl@S����@T��9��8@Ur��h�@VS.��t@W77��-�@X @sE@Y
n�>�@Y��3�R@Z�|���@[������@\����@]�m;�,)@^�s�q�@_����~@`s��O=�@`��
�;�@a���D5        ?�
6����?�A7gX��?�/��?�ѥ��"�@�=Q��@�q�(@ꯢZ��@ ��}F�@!�6L��@&y�����@+�`c��\@0�/b�@3� �NH�@7ml����@;"kB�@?�\�@A��q@C���t@F<�c @H��w��y@KLS[i�p@N��b'�@PjUWyL�@Q�c�/�@Sh����z@T�P�5��@V���j�@XO�2�D,@Z`�%և@[�.Zw�@]���C@_���(e�@`���P@a���<@b�����@c����@d�)L���@e�!���d@g�
+�@h9k+�P@ia�]Wt@j�L��s@k��6@l�.o��@n97l�@o|�p�d@pb�b?�@q	��(��@q�_ H�@r_;�BY�@s�[�;@s�&��}�@tr���@u)$��8�@u��s�"P@v���Z@wZ��	@x�*�j�@x�
�O�@y���LG�@zh�S0�-@{2X�]3@{�:OQ        ?�������?�(�g��;?Ɩ�t>}F?�s�
���?�I,�:�?�L/#\?���" [?�����@>�q�V�@ξ@T�@ib��_�@+N�D�@iJq*�@�?�!k�@��<�F�@ˑ�uhm@"���\�@$_�{�1:@&Ц�o=�@)ch�j�@,�Ŏ�J@.��8x]�@0���@2~ՉZ�K@4�}߽�@5ȇ3vy�@7���+�@9S7�.I@;0�����@=�_��G@?��
@@��"��@A�$�O�@B�!��	@C���Ɍ�@D�_6`2@F(�{��@G]���^�@H�Hs���@I޴�L�@K*�T�D�@L~����@M�(º��@O=Y��u/@PT䄰u@Q`ٍ �@Q�zn�@R�gx �@SP%d@T��!h@T��ԫ�@U�=!���@V�5Ia�-@W`�d�R@X<�e
@Y��@Y�����[@Z���;�@[�x*֔@\��v��@]����l@^�Â�.�@_�E�c        ?�R�\���?��RGa?��[#��?հ� �8?�
�n0�&?���G�?���V?���v��@\;�i��@
;�3o��@uX,jЍ@5Xf�;L@]�̡#@�L�b<@ �:����@#�ִ���@&��ۋ@)����ɽ@,�<�/`�@04/5pG�@2ѻ��@3�I�9x�@6Y�݈�@8&�{�^�@:``3���@<����J@?l��g@@�Mz=_�@B�?��@@Cr׬6@D֩�Z�@FF��{F@G���Q�@IGz��@J�G����@Lve93@N�����@O�M�=j@P�}�>"@Q�_���@R�Ō�UH@S��,E�=@T}zj�@Uw�"_;@Vx4�&��@W}�׭@X���M�@Y��G@�@Z��d��@[��:�*�@\�:��%@^���9@_=>X�3�@`7�/@`�/^Z@:@ap`��@b�&S�@b��H��@cY��� �@dA��a�@d��:k^�@e[���l�@fU�XN�        ?��Ll��?�46���?�� jڜ9?�z���I ?�*L=�?�1@�Qh?�����]?��i�Rs�@�o�6�b@����=+@!�ȓ/�@����Ob@aaK[�@��`@<�nx�@"�?��@$���E/@'�ш�%�@*ʣ3�
�@.Q�7Y�@0�R7DM@2��ns o@4�*߮�P@6��>�T@8��n��L@:�Y�c@=�O��@?��<�.	@@�=����@BE�dТ�@C�}t.�f@D��^��f@Fc�|�_?@Gَˮ@IZ��M]h@J�ܵ��@L~sӈ��@N �

X@O��F!�@P�Đ��_@Q��.(k@R�]UK��@Su�X�N;@Tf���S@U\�U��@VWy��M@WW\M	�@X\0�"O�@Ye���@Zt֧f@[���#@\����@]�򴄀�@^ތ�-�@`iS�af@`��a��@a/��_��@aɶ��B@bf�q�@c��@c��p�8@dHψ�"@d�A���G        ?�AK�_L?؊IJH%�?�<np�@ 3��H��@���h�@}Fʈ�@��O3@$i�r��X@*��4+S@0����H�@4�Ȉ>�W@9GH�.@=ۋF�j@A�l\	�@DJ�B~@GFR���@Jt�ŀ��@MՊe�@P�O�#@R����g�@T�8�8Z@V��<�xU@X̿�_?c@[�s�#@]g��G�@_؂�'�@a0�O�@bG�"�@c�Ŧ�!�@e?m'WQ@f� ��`:@h+����@i�GGjwu@kC���~@lߗ�}��@n�N��i@p��+,?@p��H��@q�+U�|�@r��_�U%@s��$Q��@t��1��@u�@���F@v��p�63@w��ם��@x���z�@y��XC}e@z�0�y�@{����@|�J�7@@~�����@Gb�H�@�:(��S@@��A�L�@�n�Ǵ:@�X���@��W�P^@�Q��n�@��=�L��@��"}jo�@�L�z���@����b2@�����%        ?����^E?�CQmu��?���LxS?�P�H��?�3�OT?惀���?�# ^�Q?�����?���z0@ Z����@^�<�h�@W���@�P��@�-bt�@��ɱ@����@_n��B�@��$��@!��Z�y@#�Ƣ;y@%��j\p@(%i:xb�@*oeHގ�@,�v��s@/N�mn��@0�ĉ�Y@2H�m�'@3���:�@5l��v@6�3�I�@8$�YH@9�):���@;S(���'@<�͉�@>������@@<��UI @A$�56�@B�EplF@C_���@C�9)��@D�t�*E�@E�����@G�g��@HڄQ.�@I"	��b@J9S&wY2@KU�+p�@Lwټ�@M�Y����@NȖG$"I@O��+/��@P��C�@Q3��'$0@Q�Չ�ֿ@Rt[bX8.@S/'7��@S�J���@Tf��)��@UC{(s@U�z��@VmQ'��@WI��V@Wќ�jD�        ?�'r�Ɠb?��]D&
G?���Œ�r?�$�*ə?�ז�U|<?�q�I��Z?���He?�8$P��?�ɸ/Mb�@M@4;��@W gI��@�����@)��%,�@�t.ԔE@n�\�$<@��|���@ �5��@#\���@%��o�@(�)}��@+m)k�:K@.l��s
<@0��)��@2p���V@4+ ��2@5�wv5�g@7��݌��@9�\
��8@;�~�dҦ@=�<Q��,@@8<��@A)���@BQ���e�@C��G2�e@D����,@E�4-u�.@GJ��X)@H�����6@I��H��@KaV;GD@L�dE���@NE�� �{@O��]}��@P�$�3�i@Qm��`2�@R: zp�@S
"K��/@S�_����@T���B�D@U�|+�@Vs�2�@WW�p	}�@X@hP�]�@Y,��xJ�@Z�b�@[Z?�p@\	u�x��@]kot�@^4���@_ˌP@`�W�@`���`�@a�\��        ?���y?�N��Y&?�*�B�R?��I�?୓EPb�?�p�Eʆ�?�q�r2?�-�Z=�@8��C@N1��i@I�|��@����@�����@��b�T@Ll����@!�U�@$*��m�|@&��Z�7w@)�~���@-*��@00R��vh@1�V��Ӭ@3���\�4@5�+�32V@7���;}�@9т���@<c��L�@>G3/÷�@@Qb����@A����܏@B�;fY@(@D�>��@Es�H@F�P&��@HCv6�@I��ĵ�@K<k��ϟ@L��?AZ@N]���8\@O�<�@P�MT$<Z@Q��11�@R�DW�Q�@Snz�(k�@TVy H@UC89�|S@V4���*@W*���-|@X%����@Y%C��>@Z)m[���@[26+$t�@\?�*���@]Q�#	]�@^h'ZV@_�KbA�f@`Q��
@`���@ax��[@b�rR�@b���:�w@cB�Q�V�@c�H��        ?�|�R"?����X��?�!|�й?���e�@�?���@_����@ȹ#���@��k�g@#Y觲c@(|�A2�@.8�̓@2E�#�Z@5�'�J�@9q�]8d�@=s(+��@@݊�i+o@C$;��	@E�E=��@HQ��}@J�Z�4^@M�Q>�j@PAbc�@Qɜ�1�@Sb;k�}c@U(z�5�@V�M?�q�@X���;T�@Zf����@\P#�Ua@^I5����@`(�7�<c@a5*����@bI (M;@cd�4�B�@d��n�@e���g�@f��n�R@h�aiF@i\�+�x2@j���3��@k�V\�e�@mE��E �@n�)� ��@p�P-A*@p�����V@qm5xˈU@r'⽸��@r�lQ`�@s���Ġ]@tj�wDJ@u2��j@u�^0-�m@vɨ��k�@w��z�@xm+6�Yu@yCR9�w@z\�71@z�D2do�@{���Oh@|��i
p`@}���T@~��I�"@m��}�        ?������}?��F�.=?����!k?�Șm��?�-�ŪW?���O�P?�%�S���?��m�6��@ ��R���@4L�H��@
�M)a�@wu��@��FI@���+��@>7���@��6; @ _�m�'@"kq����@$��X�7
@&�^�RN@)4+��@+��8��*@.?���s@0v[��=@1�r��@3I��>x@4�Ѧ�&@6MhjpR@7��.~U4@9�d7'@;.�Γ��@<�F�x[�@>�v�i�@@=�P=zB@A+l>���@B�g���@C|�ɱ@D��'�@EO~/@F%7u���@G4��<��@HI[q�t@Ic|S@��@J���*=Q@K��M���@LуԺ��@N ���)@O4�i(?@P6�o���@P�G�}�@Qw�&#�@R�5IԵ@R�	��L�@Sj�J�@T�~�K@T�Q�K�f@Ur��ma�@V$�3��@V���	�@W�&�7�-@XG�O{�@Y�2��@Y�m����        ?�NU��?�u�mo?�4����?��v�a#	?�f���?�w����?�#(�+)8?��C�ަ�@��� �@N���@/�D�&@���e�
@eʓǱ�@��}�Y@?5b2�@" �ReTO@$�PK�P@'���+&�@*�u;��C@.�Fӛ�@0�c�|��@2�/��/@4��A'@6��p�@8�e$(�$@:�TL�@=;rO��l@?���e@A�3�̙@B]�^�F@C� R|V�@EI��C@F�� �>�@H �b�j@I��a=�l@K�7�a�@L�V�"�@NW����@PU�9��@P�8�"8@Q�f4���@R��E
�@S�n[���@T�,�&�w@U���
�n@V���x@W��hN>�@X�sǭ?@Y�vQ�@Z����T�@[������@\���;@]�����@_$�S�j@` �t�k@`��Zy1�@aO��^%�@a�[�ls@b�n��v�@c&�YO�l@c�3��g@dk�_�	�@e��,�X        ?���1kK?��F�3��?���Y k?�Z���h�?���5?h?�\!���?�w��	G�?���dK�u@ɬ ?y]@	{:Ib��@��5`C~@�8!X��@�uU�@�$�P@ {ݫ�Z@#�sa��@%��|�/@(�]dy@�@,5M��w�@/��H�@1��[lVg@3���{��@5��V�X@7�~9�6�@9�<f�#@<6�T!�q@>��_�]@@�n y�@A�Q�D��@C6^zX�@D�}5���@F��I@G���#%@InO��0@J�-j�r@LG=>�R@M�t5�@O�W�ʇu@P������@Q�~�bL�@R��C��@S|.=-�@Ts���B@Up˂>S @Vs1��-D@Wz괒�d@X��Ź�@Y�!�Y('@Z��.L�s@[�
N�w6@\�>���@^C%~@_A���\)@`9>=���@`�,	@aq<�C��@b��K@b�f�a7@cW���38@c�q�ݨ�@d��R��@eSn��nd@fzq�t�        ?��o`W��?ע;V�?���Vl?��(+@
+m���K@��,��@s��H�@#9>��X@(��5�b@/|��_��@3^8"Ć@7[�nw�F@;�}4�a@@5M���8@B��{�k�@Ep��[�@HO��2��@KY ��6@N�zl�y@P�u���#@R��=u�@T�?�y4@Vw*�|��@XtY��K�@Z���
:@\�m�k4�@^�܃�/B@`�P�s�{@a�H�m�@b�C�� �@d4/n'w�@e{�Ldܧ@f̖�R��@h%���z@i��F��F@j�EL-@le��>�?@m�C�bJx@oe)1-K@px�����@qB˪ԏj@r�3f�@r� �ZC@s�;!�k@t�<S[�@uq�Z�@vR�$_�@w8?}"@x!pۗ�@yS��1@y��Q�@z��n�A-@{�Of�@|���ص+@}�azT~E@~�N�ۮ.@�ӿ%U@�z�@������@��C���j@�<;�H@���� ��@�&���        ?��q���?�s.��v?В�c��?�T���1+?�vU%�2�?�ߦQRJo?��)?�@�k��L�@	�\?i/@W����@$���@J2��"@�}6"-@ ��`Aڮ@#�r�56@&v@����@)�&���@,��D�a@0 �9)@1�"��J@3�e��@5��\�@8���@:5�\�c,@<��u�J�@>��l��@@��:��@A��4���@CQWj$�@D���H+�@F��&F@G����@I6ڟP@J�W��)}@LFp��@M� ���@O�q�*�/@P�����@Q�����@Rz_"�=@Sih��Z@T]����@UX�<W�@VW��,�@W\�.�+#@Xg|DI�@Yvްz@Z��S�)@[�Y�~ 3@\��}8��@]���	R@_�c}p@`"\S��@`�A��s@aX��H�e@a�Irי@b�m��@c>tr@c�S'�@d��j�s@e:��ț@e���{F@f�
�J�        ?�v�B�h?��{�P��?ɭ3��mY?�7�6��?��(����?��#&zR?���t��@�r���A@��� #i@Y�@��@��@�T}@6{�0�@��,kY@ �_Yr��@#T(�=Ј@&Z����@)��<��\@-q�"Z@0cb��J�@2Y;��\@4kw%���@6��#�@8�z��@;J��
��@=��؇��@@5A)��@A���J9�@B�r�~M2@Dr� EA@E����@G��UQ�e@I'Z�@J� uÃ@L���H��@NP��մ�@P��!�@Q�o�<@Q���M(@R�)�d!@S����T@T���n^@V�b
F?@W#�.y@X>����@Y`� i�
@Z���>�@[���E�d@\�s��N�@^'}3��H@_h�M��@`X"4p�@`���@a��kV@bU��j@c���!@c�~��@doHq�*I@e(zPk�@e䬬Te�@f����x�@ge�h��<@h+3��@h�	5K"�        ?�8����?�=Xm�^�?ɩ��k�)?�����q�?�h�7h��?�q͛�0W?�HV�y�@b6_��@����A�@doZN��@V���1H@ip���@鹐]Kz@��k-�@"�-8?@%�w�.@(��}�>�@+񮪲{@/|"�H�@1�|��U@3�9v@5��C�)D@7�QH)@:/` NW�@<�*aX��@?�O�@@����5!@B8Jܗ{�@C�=�E4�@E�#f�@F��v#�@H1A���X@I�A�_!L@K~�K���@M9�UJ��@O��դ�@Pk�O��{@Q\���@RT�3��t@SSW��@TX_r_�@Uc�]2�f@Vu�LB(�@W�����@X��m��E@Y��1gB8@Z��؇@\1H{�}@]jw@^�Y�/�@_�vI)@`����^@aF���p@a�*d3�@b��׈p�@cUx���@d\.�(@d�e�[�@e���S�@f?��z��@g^!dY @g���N~@h����        ?�O�&T��?�%'Fa�?�����@wy\�{@���;�@1}��@&�?�B@-Ⱦ�'&M@3R�#y�@8X|�qW@=�h�Ts�@B'� �X@Eu"c�l@I"`m�c@M��-�@P�FhDY�@R�nAB+�@U\(��o@W�	��/�@Z��̼@]q�fAt:@`5�)t~�@a�����@cc����@e<E��@f���*=@h��x��@j���w@l�J�Ȳz@n�~z�9�@pSJ�4@qg�	˽@r������@s��Κ�3@t�$$]@vұ�f@wJ�	V��@x��d</�@y�Oȟ�0@{5�q�&@|�tÂ}�@}�.�)�{@i�����@�pc+�# @�/�gIz5@��"�_\�@��n;���@����+�5@�T��Q��@�'��S/@�����v�@��J�T}u@���_Yd@��0��"5@��\L��@�jT�~Q{@�XX�|@�I���,@�>�ܡ@�8��vQ@�4�k���@���~�@����/�        ?�O���?��0�j�?����=?���@�;Q?�ۣv���?�s�{��?���'@ q���@ӛH�4�@
H,���@0��4@�醘�A@>�u�@?�av�m@����%�@"U�k0@$����@'5�=I
�@)�#C�{@,��"]�@0���@1�2���@3YJ�s~@5!�SE�@6�_lv�@8�0</m�@:�g�=�7@=���@?+�?�=G@@��P@A�B��"�@C.P�Ki@DF�Lڜ1@E�-��>�@F�&^�s3@H-^}���@I�ɥ�J@J�Z�~�y@Lg��ݽ@M�װ�@Oec%���@Px���Y@QC�����@R�}��3@R�T���)@S�+���;@T�R(ʎ�@Uz�m1ً@V_j`H��@WHJbh}@X5W�ܒ�@Y&��$p<@Z�Z�#@[K�c��@\�VD{,@]`v�Ƒ@^��uB@_#��ߩ�@`�
A�N@`��pȥ�@a,Z9L�@a�5/�Vp@bH��t�        ?���2�4n?��ƽ��?�HԲ0{F?��E�*J�?� ��k�?�q���?��.����?�gb���@1v�1�.@	� vƠ9@D�WW��@�`�+�G@p�:��@��6�Z@ ��Gm�q@#V�\�f@&-�tR��@)7M�G�@@,s5� b�@/�1d,��@1�v|�Ҩ@3��L�@5�2\�@7Ä��@9�
�V�@<>z��i�@>��4'�@@� 8�U@A���E5@C'����h@D�i�ng@E�ڙq@Ge�]�'(@H�Y4�4�@Jq�]im^@L���@M�7sZ�@OU!�Zd�@P��-׆@Qf���%�@RL��:}@S7�}'>@T(c���x@U?�\��@V_����@W��b�p@X[����@Y*/n7@Z:3~\�I@[Ob�I��@\i���%�@]�$���@^����.�@_�3$�xt@`���"	O@a���Ј@a�����"@bW��Ū�@b�����u@c�(�@dB��o�@d�S�3@e�򐻐�        ?���E�Yr?�e63�ܤ?�p��q�>?�ì ]�?�c/�z?�����K�?�_�����?�G�Z���@Ӂ�ƍ�@A�D@n��+$@�`�M��@���{�+@�T�6m'@N'�]@" ��o��@$�<5-xw@'�7���@*�;Z��@-��-�@0��I��@2a�^���@4=���|@6/��$�@87:�v@:S�|�(@<�M�M�@>�m�pQ@@�����@A�0���@CPL��x@DV0T�@E���Sk0@G��X��@Hp* N�#@I������@K[Y[�H@L�P��z@Nj�utR@P .�(@PωG*�@Q�o�7�6@R{�V�P@SX�}�$]@T:b���K@U o����@Vv%�@V��L�@W��u)V@X�{�A�@Y�Fv
ۣ@Z�=��3@[��C�@\�cɸj�@^ ��r�@_�o��y@`�L�@`�j���@a2����@a��j�yN@bW�&F@b��I)��@c���V�        ?�z��&?�YI�@��?�	c��@�}�	6�@>F���@��6�@ i]��xl@&.e��)@,�F����@23�n��@6k;��=�@;9%�@@���0@B����@E�d��@I
q/ǜ�@Lt�g�ce@P#���Y@Q�+�G�@S�o���y@V ԩį@X^@�?��@Z����w@])�͡T]@_�zI��@a/ގe�@b�*��gR@c����Zd@ez�~�e�@g;�- @h�W�y&@j:)��#�@k�"��N@m����@oj�4:�@p�=�<�@q�,<�t@r�,�W��@s�3�6�:@t�5��D�@u�&[��h@v���r��@w���jG@x��°�@y�Z�Ds2@{
K��,�@|4���@}e��Ŭ@~��#�J�@�9��c@���\�@�.�"H�3@��sK;[b@�|�ϔ&@�(+�9b�@��
�X7@����`\�@�9��6j5@��
@@���a�@�c:�3We@� ���F�@��_���=        ?��{/W?�?C���?���b��?��r����?᧣���K?����#�?�T�U-%R?�3ly	� @S�)}�@���QG@
�$Mk�J@]<��@��w3X@ese(��@�.�t�@���@ ��䜛@#�[� �@%L�X*2@'���oeb@*1��e�@,��0A&�@/�+<�5^@17���U@2�0�ݺ�@4AR$d��@5��ï�@7��)r@9;� ��@;c2q�@<�����@>��a9"B@@Qc�Q�@AOA�&;@BS�o�e�@C_���@Dp����@E�?7X�@F� 4G��@G�w4n�@H�9Ġ�@J+^?�F�@Kc�9"\�@L��T�(0@M�jt��@O3���u@PBF�cI@P��+��@Q��jmE@RO��M@S�o�@S���V�@Tw3����@U5F�U�@U�S>6��@V�SσqQ@W�BO7��@XK$MS5@Y͸'�9@Y�Z�Y@Z��E6�t@[��7K��@\f�����        ?�}:���%?�j�h
g?£}k5O?�L�D�?��*���?����A3?����_?�BiVgX�@%���#@_:��_@P�_]!�@���TK0@�~Fբ�@���FG�@!PuI[@!r�Vx�@$ ��p�^@&���v@)�w<��"@,��4~�@/�˼��6@1�`�8�}@3�Bd���@5d�
��@7]�
Ҝ@9j�v5�,@;�����T@=ŉt=6}@@	3Z S�@A: ＼�@Bu��@C�\���s@E	�2�_�@FcgrC�@G�e[�3@I3|�aIu@J�J[k�@L*�N+l�@M�����@OG�ڏk@PrR�A_�@QEF"�@R���>@R��fH�@S�`�'~�@T�Y�44m@U��6�@V�q�i	i@W�{b��@X}�H\�T@YxS�6�N@Zw�v��@[y��L@\��@�-@]��5W@^�	�p�%@_��M�@`b��*�@`�s�|@am�
�@b�-�F�@b��T��@c9��3,        ?�V�]ʉ?��T��?�I���?��hd��?ߢ<�D%�?��N0 �?�j�����?��� ��e@&B�@����D@��84}@�^��@���}@	�u2@�ht��@ �Z�@#%�'kJo@%̬?z/�@(�;*��@+�j�0Q@.��!'Y@1��K��@2�naB[�@4���jI`@6��'�V�@8���v@:��5�)�@<����@?+��a�"@@�z��/@A���>��@C;^�4ӌ@D���T�@E�2��6�@G?=����@H��] �@J a5z71@K�c���@M*�0��@N�I�@P.�7=?v@Q,�i
@Q܎���
@R��7��@S�a{.�@T�ɏ���@Ut+~�֤@Vf�?~·@W]̫S��@XZ�URc@Y[#��z�@Za)�;l?@[l<�Im@\{�YE�@]�O� @^� 3��|@_�[�g'�@`u�Ӹq@a	�h��@a�F��l�@b9*���H@b�|���&@cr<R}�y        ?���")o?ՖD���?�Wr]�?����#��@l\�n@�\��i@�����@"!���@'���T@-�)��J�@2h&�1�@6>əs�@:p���\@>�m�D�Q@A�Ȣ�vm@D�����@GY�X ��@JO�EP��@Mpz��k�@P]��6@Rw�Y��@S��rL�r@U��Ak�@W�Z��@Y�ԅz!�@[�!�r��@^$���Q@`6E#��@ac-���@b��)B�@c�t��V@e"pKK-,@ft�+���@gϪt��@i3�l��@j���앙@l|��@m���:��@o*f�]�@pU�Jwص@q"#�5�@q�X<��@r�1�!_S@s�	=�B@t}
�.�@u^3�=�f@vC~�d�a@w,�+��@xe�}��@y��yP@z�l8>@z�CA�I@{���r,@|��.�ǁ@~ >OG�#@	Ьʪ\@��"�W�@��T�ƺ�@��X^@��qL�}@�9�\C�@��3�1@�\%��m#        ?��� +�?�@)}\dk?����!W?���I�?�TC�1��?�'AQ�!?�Z���?���/.@ (w�@Eԅ'XW@	F
�h1@V�WA[�@�m�@6�\=��@�TV6�@Au�hj@ Ͼ[;�@"$5�9@$T�6 r�@&�;��v@)��h۟@+��BM#�@.K-~�L@0���{��@1���E+�@3���~�C@5+�Z+@6�:��rR@8e��.@:#��F�@;��憙@=�hf�U@?��ϡ�T@@�}��p4@A�����@B�a��!�@C��?;�@E�!�w@F/u>�@GVLq�,,@H�1�1�@I���@J���@@L7�X�v�@M��֓��@N� s�a@P��nDm@Pö~̠�@Qv���@R+�eN�@R��c@@S���G@T_��_�@U"�-7�:@U�G��-<@V�6膆�@W}O�}�|@XL�*��@Y���@Y�fB@Z�1ڣ��@[�	1��@\��낊        ?�X�W� ?���i��?�0�v޵y?��;���?�٥9��?�W���W�?��h��~?����;@z"0���@��O��@�u"�gx@�&ђjT@C\^���@U[	Eb@�w����@!Nr�@#�^��4�@&�g���@)�S�N��@,�E���@0��]�@1��<CSk@3��b�n@5�#�-"{@7�Z� �@9�����@<0}k�W�@>�9��M@@z�X��@A��I߱�@C_T���@Df�� @E�r���@G=��c��@H�~xnls@JB���@K�1S�@Mt�H��>@O���,�@Pi�$f�@QI��\�o@R/���p4@S�] ��@T��'�]@U��� @U���T��@V���D@X�I���@Y����@Z#@=�f@[:G�c@\V���5@]x�JFL�@^����@_�ˇ��@`�@��@aO��u@a��*�'�@b[	'���@b���1�S@c���?ـ@dN�&�@d����+"        ?����D�?�߸7/�?���
8J�?р$�2?�2�y�?��<���?�L�14�?���dXn@����@#=�U�@�����`@*�f�@�
���N@���� w@ ���@ �ی�0�@#V�Hy��@&vGuo�@(�-.��@+��Wg�@/"��5��@1Bz���>@3	��#�@4汼ؖ!@6�mg�]�@8�ϥb�@:�a^��	@=2M���l@?zU�3�M@@뫰 �@B$�\-�@Cg���@D��J��s@F^\�QC@Gos�MH@H۳��ry@JR�voj@KҔz�9@M]%�/��@N��
7_I@PH6KX�o@Q�_8�=@Q�ޜ���@R�,��c@S�qPti�@T������@U��8�?�@V~ߌ��,@Wu��L�@Xq�Y�dM@YrY�N�@Zw�!���@[�+<�j�@\�?�b-�@]���1�@^���zd@_�Ϩ�F
@`~U`[ou@a��_�@a���/@b>�?,@b����@cu*�'�        ?���^,?ҳ�.}Α?�+o�˸?�n���y@�QS[��@��9l��@&��x��@ pz�ۆ@%��%~��@+Cr#M��@0�� !�@4n~P=@8YSO,�@<��:3@@�㪺��@Cv��9�@E��>V@H�	� \l@Kx�B�bL@N�R��Q�@P�ڙ�a@R��ڸ%@T}�Pe��@Vb!�1��@X[N��HQ@Zi
�M @\�2[b@^��_�~@`�+@x�@a�e4I�W@b��"��@d1��'@e~�v���@f�<l�݃@h5��uR�@i�����@k,�3-�@l�a<�ġ@n)���9@o��%���@p���M�(@qra+F�@rH��|�>@s#�3�3l@t���<�@t�
���>@u�����t@v�y��h�@w�o�S@x��kaף@y���ڿ-@z�̹U��@{�Kg�i@|��ɺ�@}�'k��@~�uK�-@���z8@�z״M2@�	I��@���c��@�,lQ� @��S:�@�W�{ˢ        ?���P9�?����� ?Ǚ91�z<?׃�D
?��W�E�?�pmv�~?������?�E�j-��@6����@�<&c�@�_uX��@�C!@$h.�\@�^ro�G@���Pi@ bˈ1�-@"�����@$��@�w�@'e�_'F�@)�Wkl�=@,��;w��@/�zT�@1E��U�R@2Ҟ]},�@4oX��]�@6ì���@7׿6�@9�+l�>@;}�?���@=g�G��@?`�ɋ�~@@�TT'(@A��j�ڈ@B�mS��+@C�zu��H@E���? @F6Qm�<�@Gf=�y�@H�҉))5@Iڷ�- @K�5��@Lk�なx@M�w�K^�@O?��=�@P<o��y @P�#�"4@Q�6b�>@Ra�dV�g@S`���@S�p���@T��L"�@Ult����@V7_>�@W��@g�@W����|@X��zR�F@Y�Gp�
N@Z^8����@[<Q�FC@\�����@]����@]�i���K@^�����        ?�|�B�Ъ?�~Ћt��?���O��?Ӝ{R0�B?�9�>�*3?�4૮RC?��4�?���D�'�@u �f9@��&�G@���M�@Z�d�^@%w���@P}4��}@���7�@!���JT&@$����+�@'_q�u��@*d�#�}�@-���s4)@0,�`^;@2H��έ@4*1��4�@6"͝#�@82�܇`�@:Y�RFN@<��9(oy@>�Y�	�{@@��5p�O@A��+�9@C9:��@D��۶��@E�*����@G`����@H�A�i^�@J\�lXJw@K���@M�)T65�@O(��՟@PkR�	=S@QG�x�)�@R)��3�@S��5=@S��X�Ӆ@T�W�~��@U�S�6@V��܉@W���%��@X�um��@Y�n���@[p�W�@\�����@]8�gZ�@^Y\ϯ@_~�f�^�@`T���8�@`�A H@a��D?6�@b#�]O�y@b��zv��@cdq�$��@d���@d���}:n        ?�u���,?�+�l�?�m|�I��?�.+�3o�?���X��?�,ף �m?��<��x-?�ֶ��=@@)E@� u�b�@HQ�פ@@�;�$@C�*�+@�<�>,�@ A�\�4@"߂�wj@%�yn6�@(�:[���@+���&�@/]��_@1~KKb@3gXQ s�@5i���@7����BH@9���n0�@<pH��@>i�`�'@@s{6P	@A�	[���@C�h<2@Dv��N��@E�ϑ��~@G^g�E\_@H�z����@Js�bW�]@L���K@M�~�;'Y@Ohh���@P��K6�@Qvyk
a�@R_�cQg@SN:�,op@TB�5�V@U;"�_>@V9n+rF�@W<��1�@XE��6qz@YSOhY\@Zf+��A�@[~�e�@\�xU��@]�W=M@^��RY�@`� ܠ�@`�>q�3@a;	^#~@a�<_��@bw�ZjH&@c�o��@c�"�j0@dd��⠂@e�T��c@e�3�L�        ?�n0���e?��f�?��(��?����~@
�A���@��|��@@^	$�@#��9k0@)�&�8��@05��j��@3������@8:��2�@<�>2S@@�����@CWqe��@F$J�U�@I�yBH@LF����@O�����z@Q�v�#��@Se,C@UQ^��2�@WSJE|J�@Yj���E@[��b(@]؎*@�g@`k�
�@aL�bJ��@b���j@c�Z���	@e*/�ڛi@f����ɀ@g��	G1@ia��I@j�M+t��@la$i?�@m�pJ�L@o�v�#�@p�h��5@qi��pe@rC�ɵ�@s"q|�{�@t��<��@t�vϭE�@u������@vʃ�J\@w��WO1	@x�G���j@y�:`g�@z��=A@{�!ω�@|�
Q��x@}�7��P�@~����!�@��M*Z@����k�@� �,���@��� ���@�F�F�l�@���>31�@�u4��I@�~��/@�����l�        ?�ֽ��b?���$?��5���4?�ި��?�_MR�?�,�>�b�?�9��?�TZ).B@ $�� �@Շ�﬷@	��Y��4@��.�z~@h�<�3p@�Ù���@�����@��dg�@ 6۝���@"BiJ�>�@$k^O��t@&�~R�4@)���G.@+�k���@.0�"yQ@0t��Q��@1�35�@3W��z�#@4ݪؔ{�@6qu����@8�!bb@9���=	,@;}�e�@=F�y�Sb@?>ޝ@@�@�;C�@AxHPӶ@Bv���%�@C{>�8�(@D���!u@E�����@F��T�%t@G�F��@H쳙��@J�]/�1@KB����a@Lu�/�RH@M��m�$p@N��v�B2@PJ7c��@P�ɑQ|�@Qc�Ju~�@R��v�@R�-���@Si=�m�@T��i�/@T�9@$�D@U���~�@V?�r���@V���i@7@W�L�A�>@X{vj9�[@Y?([&6�@Z`ɀ�@Z���<        ?�[���?��8�)�?����)$?����Bb�?ு�|��?꡸��S?�X���?�����-�@���U:@u��e@UU��{�@�2��p@�dQ%�@0#A�@�KE���@"��Af��@%o���@({�򼺬@+�-��w@/8��S@1t���8<@3g�Sۢ@5vz,�s1@7�8�3{@9���@<E
t�T�@>��lG@@��IAߋ@B\%.�E@Ci%��@D�G$k��@F\����@G�mzl��@I�_�%�q@K-�Oϸ@L���n\@N�Z�4�@P:|"�L@Q(� �@R����>@S$ꥧ�@T5��Y@U#i�E@V27K)j @WGn�R�@Xc�j0@Y��i�H}@Z�-�:��@[ۭ�˔9@]iõL@^KYu9�@_�u��e@`iڝ���@a���F@a�DJ�@bg3�+@c�K(��@cɜ�B��@dk��7@e893�@e��"�@f�Ͻ"w@gt��;o        ?���8\�?�5�>�ݺ?��[-��?ҥ��V�?�a_ӹ�?��LA��?����^)?�J��?@}XNvm@���q�v@6�����@L���@�,%��d@�X��p@�ݶ׌@ �B3���@#*R��@%��4`�D@(�/�D/@+s�}�&�@.��[�@0���@2��_��@4Z�c(�2@64 ���@8 G���@:�~�*@<0V�)R�@>T ��]@@Dܹ�%�@Ah��Y�?@B�=�%�=@Cʍb)&j@E{�GR@FN�k�w�@G��I�	I@H�{$@JT�&�=�@K�uH�ES@M,\���@N�OMB�@P�$�;@P������@Q����;a@RifS@S8���4@T�ʥ�@T����W@U�����*@V�ԹǢ�@W}�lT�@Xc+�(I@YL,�Q��@Z8�	)yK@[(�b�@\6�\[@]�,U@^"�(�@_
�ga�@`�2K
�@`�ӑ5j�@a�O�_T@a��9S��        ?��Z���S?ԉyO�8E?�Zmq��?�q���@eڽ!�@�6!4��@�ܭ6�@!g;pT�G@&�:�F)@,��%��@1��1(�,@5PI)n@9O_����@=��9n@A$ҝI�@C�G��~@FFY[nʿ@I�0�*1@LrkQ��@O$�S�H�@Q3�>Q�@R�;$E@T���#"�@V����_�@Xy5�F�@ZyU$��@\��Q�@^�I7![@`s[b�k@a�m0�d�@b�B	��B@c����/�@e7�T[�c@f~]Z2@g�F0Q�@i$s[_kV@j�����@k�#�� �@mZc�X�@n�e�+@p(+��@p���,{@q�ۮA{@r|F���@sJL��m�@t�ZQ�@t���'}@uɛ���r@v���%h@w�4�Rb@xh)cK�@yN�����@z8Xh���@{%��.�@|2�%6@}
;��H�@~�Ԯ/x@~�q%�H@��l?�@�~�(�@� e�\@�@��ng�@�
��H�        ?�^5!r�?���s�G?�|ys�L�?Ц)��?܎���e?�
;X�a�?��(|�?��G�M��?��F�`@��,@�}(�@
�rCq�g@�u kR@�Y�B�f@r'Ϻ��@��i@���7o@{u�}k@!���Ȇ@#�#5�I>@%����B@'؂���y@*^GAs�@,}
��0s@.�R�W�z@0�j,��@2�?R@3u���A�@4��l��@6Y~����@7��%�x�@9k��fX�@;IB��@<�ƀ�@>]
��k;@@��Kp�@@�(��9b@A�4����@BǫT�" @C����w!@D����d�@E�vG�C@F��;k%@G����[@H͊ �Q�@I��;?�@J��D���@L�P�s8@M8�E��@N_5zЕ@O�H�o�@P^$֡��@P�L�@Q�%qNK@R6S=�?�@Rؑ�� �@S}7'-q@T$>jc)@T͡`�	@UyZ�׉�@V'f���R@V�����!@W�e�y��        ?��i����?�
�b�O�?�\e��T?���Ȯ�X?�r�
ì�?��D)�ߛ?�8�݊�z?�����:?�m���@��y���@�]Ĉ�@�ï/@�O��:�@eu���@����U�@*��o�@!W��y��@#�P'Z�@&W����@)g,h�@+�D�� �@/	QG��@1� ,7@2�cm�F6@4��Ar�@6f��&-�@8O����@:K�l��@<Z�WKy�@>|I�;��@@X>��y@A{�v�e@B��5�@C۱��]>@EMm�@F_ 9ۺ�@G�_c�*F@IW	@Jc]�' @K�1L�@M9o�u�@N��z�E6@P E�F�@Pۜ#1�@Q�*�`P@Rn�N��@S>
��+@TP��S@T�u�$��@U�rY�t@V�A�N.a@W��F�=@XkA��f@YUgm:��@ZCI}F-�@[4�-h@\*+���3@]# �`�/@^��w��@_��{��@`��Q"@`���$@a!��Ɇ        ?��:����?�ze��Q$?�B7��	?���w�?����9ҽ?��2��7F?��J~?�]Is�V�@ Ak��e�@�'6�T-@
Y�B�@09F?��@�/���@0� ��@-���ke@|�����@"�Տz�@$��
���@'(��!�@)�;��C)@,�+�|��@/�v3�O@1�dN���@3Ph4��@5��M
�@6��il/@8��>ۑ�@:ڽ�G@<��3Z\@?��iG�@@���ܿ�@A�z'b��@B�.�$��@D(�j[�!@Ef�Q�d@F�����@G���=@IT���U@J�M��=@L��:��@M�9���@O
V^��@PC��ｲ@Qj0��@Q��-*Aq@R�6�7�@Sm��a�@TA�zy��@U��TU@U��__��@V�q>��;@W�>�q�@X�p��@Y����t@Zz�F;`/@[m��o�@\d"/ZC�@]^�GbP@^\·|�@_^��p@q@`2D[@i@`��DX @a=��^a        ?����?�`Y��z�?���o?�(a�~@ RH>��@RЧr��@k���@��)��@"�\�}[�@'���ԉ@-'8�7~@1����6@4��@8�IG]�a@<of�|N@@J����V@B�V�O�@D��9�@GQ�6r@I���@L���pb@O�����@QA��@RкS��Z@To��@VVLT�@Wܻ�ĥ�@Y���pL�@[���{5@]t�3��3@_p&^���@`�QI�7@a��e���@b��;�@c��ieC�@e�C��@fD��c�@gt2�f��@h�8��l�@i����U@k-��z{6@ly(���@m��y�9E@o#�m��	@pAM���@p�m�C�@q�wV�i@rcN���E@s�@Jrx@s�@l��@t������@ugϟ1ׅ@v0˛"/-@v���z@w���{�@x�nW4@ys���=@zLC�"Ú@{'���u�@|<I��M@|�4�c@}�/6��@~���w?        ?���{
��?��#�b?�)�e�?��̧��?�I"��?�dq����?�1#���w?�G�<�|�@��x@�h@X�Y�(b@~u�˾C@���6��@��z�"@�]ߒ@�����@xj,�@!HϪ�H@#s&N]o�@%�)E�V�@(%��}�@*����<@-RPf��V@0
ޢ��,@1{}<��@2���뎏@4����@6%r^��@7�V��@9�oo���@;P��|��@=%|FK�@?
XJ�@@|���@Az��oK@B�\��K@C�{���@D�����@E���"�%@FԤ�i�
@G��K�6�@I$�����@JU�}��@K��eӃ@L��P�#{@N�T�|�@OU_���@PQ���@P��i2�@Q�ݔ3s�@RX�L��@S
���@S�*;�i@Tx.�C@U2�A��r@U��׊�@V��aW
�@WrV����@X7r7�[�@X�����@Y�Y�:�@Z��}�F@[eZ�FV@\74�޿        ?�":��?�g��?½6\�ß?�X@�=^?��F�dI�?���يq�?�*R�8?�E�Ƀ��@*N��]@k>���@gW��K�@&%H*�@�`�뇝@��׃@^�,��@!�NO'L@$6���K�@' ����@)�a�g~@-!��w�@0<&�x��@1�o�]T�@3״Ə��@5���o�@7Ρj�s@9����ҋ@<��ۙ�@>i�l�f@@d�>V�@A���0;?@B��>W-k@D6�pVe@E����:@F�J�Oy�@HidS�@I�9�cZ@Ki��X�@L��'җ�@N������@P�Q#��@P��'Kj@Q�U�+i@R�fY�<@S���R�@T�����s@UpOLtg@Vd���T�@W]�h$��@X[��7k@Y^I��@Ze1%��b@[p��7>@\�Z>'@]�Y��@^��z�t�@_���'x@`xmj���@a@�d@a��s��@b:60��@bԪ����@cq_i���@dQۈ        ?�B%~p?�>��%�?ĥ�pG?�D�����?�x��6?�T�w}�?�vr�>��?�����j@�+���@	x�ͦp�@�;M�@@�܌ߝ�@�z��"@���@ o#��/@#
��Zp@%����@(��Ѕ�@,N��Od@/sK��BT@1���zօ@3k:��@5i��Me @7��{�o@9�l�{K@;�v[6��@>\dͲ@@kSݻ@A�?�po�@C	zr���@Dj�����@E��2l?@GP�x���@H�&�N�@JeF�@L �8@M����@OZQ�Q�@P�����&@Qpm0��y@RZu'�"�@SJ�n��@T?=*�ϫ@U9���'@V:AkJ1}@W@�`��@XKxj�	�@Y\e��m@Zr�����@[��&HO�@\�q�?�H@]׉:s�@_%���@`"+�@`��v�J@aU|���P@a�����@b�Ȋ�
c@cA�W��@c��� ֪@d�/E��@eF���@e����]        ?�����??�~����E?��� ��?��uUf{@���4@�ǞZ"�@ps���\@#�K���@)�*U �@0S5��
�@4��n�@8@PryP@<ȩ�BW.@@�<Vr	@C{9~�@FL��'�@IK��@Lxp ?�F@O�ç`f{@Q�����@S���ek @Us�ۈc�@Wx!��Q�@Y�+��A�@[�vq<�@^ņb��@`/o��G@afE5%�@@b�D�'.@c�K�X>@eG0��:�@f�͕h�9@h�s3�Y@i�ZG[@j��J[ES@l~�`/8�@n�iQ�@o��GZB@p��DP�"@qtr�	�@rL���@s)=^A�@t
��9�@t��g5:q@u�����@v�S1K�@w���]�C@x���`n�@y���3@z�%�6��@{�(�vzO@|�b��?@}��7�1�@~�2�:U�@�q#�9�@�p�0�@���nG4C@��7��j@��<�h@��v&Q�@�>5t��@���s��@�i����?        ?��)Rnz?��m�O?�Kj��Q~?�[����?��=��|�?�W3����?��M��?����V��?�����bN@8�D(@����@ W�J�@����W@���ʋs@KWj,�@� Y%�@�g�@8�@!�lB�@#�h
��@&.��:�@(��k��@*�i�AJ@-�ދNs:@0 �;?�@1�M.ܣ�@2�Ϣg�@4~xKS@6=i��@7��h�@9[���J@;��t�T@<��S[��@>���֋@@M�՛!�@AG�<�@BGy��ȣ@CN�8���@D]3��&�@Erd���@F�kH��@G�<9��?@H��Oas[@J�4�@KA�����@La��}$@M�ZC
��@O��l�@P/N l�`@P���o�@Q�����q@R;|p0+z@R�p��g@S�xY��*@Tc��ܔ@U!��{0�@U���|��@V�� P�:@Wn���@X8j���@Y��U�@Y�7c=h@Z���ǎL@[}�{n��        ?�1����^?��� V�"?�]�� U?�fJm<?��op�]?ꉇ��&�?�~>�?�ZK��@��2KO@SE�U�@N�����@��L>�@��m�a@��v-��@R����@!��(��@$1�L܍�@&�+ʎ�r@)�,�_�@-"��>�@0>!HW�@2�����@3ގ,��G@5�U��M@7���1@9�>R�O�@<8��?�N@>��G=�@@x�n�j~@A�X�Q�y@CQp��@DY�K4B�@E�^�S�@G(OV	@H�j�F?�@J#���ƚ@K��t$�@MJ��[&�@N�f�,c@PN��@@Q+/���!@R� \:@R��T�	@S��޿#@T�M���P@Uǒ�q5@V��.���@W���L�@X�C�V�@Y�P�ƞ@Z�4��@[�㥐E�@]T�TL�@^*|�K�2@_LRm� @`9eש�@`��&��@af��z�@b �.���@b�;���@c;�OGl@cܶ�gX@d�A��X        ?�j�>?���A&?½��K�?ӆclQ^?�<:�'*?�RЌ�0�?��k7��?��ݺ�@��Z9�$@
��篚@2a��@��7;�8@b��Ȇ@��$)m�@0�W��@"���x@$�y�A�@'�'�gr�@*��7;e�@-��ø@0��pT�@2w�@���@4])���i@6ZY�B�:@8n�g�[�@:�K�[�@<�QՉX�@?8�2�@@�2t?��@Bz �#@Ci0-2�@D�FH�#@F*�����@G�W	Ij@I2��~@J�/�i��@L49W�J@M�96��@O{��2@P�Y@҅m@Qvxu���@RZ�'�5�@SDg`�1@T3���@U&�q���@V�Ș"@W gF�}@X���N@Y&�Aq��@Z2Ӿ`��@[C�n�=@\X�N�@]r�q��@^�;�GN(@_�Ekr.@`m�p���@a�TmR@a�4c��@b6��p�@b�pU]�@cre��@d�	ǣ@d��,��h        ?�;�'��s?����?�6�Wת?�\)��"?@7Q���v@��YE�Q@�͈SB@"�(�p@'��Ӎ?@-��83j'@2j�[�@6E�]<}�@:|RY �@?b)�9@A�����@D�Ӊ�O�@Gp�:�@Jm�O@M�h���@Pt��]S@R4��R��@T	�#��d@U���� �@W���D��@Z
0<�&�@\4��S�9@^s��pǩ@`d"��A�@a����@b׳���@d!�D�@et��"��@f��aJ��@h;a��'9@i�$b�XU@k+/C�Ѩ@l�v��;�@nC��'��@o�}�@�7@p��3@q�U%|�r@rwa��B@sX�ڣ�@t?�b$�@u*I�Xt@v8����@w�TPQ#@xɟ3@yܖ%��@z4�)x@{G���@|XQ��k@}*��:�@~>$���@V�.�;t@�9���@@��!�7)I@�\�>|�M@��r�?u@��?M��@�!b��Y@��R��@�Y�CB�        ?�_�T��?���4?��K��lj?�8H?-B?�ޱk���?�����}?�嘁h�?�^���r�?���0��R@ �4��q@����n@	D�u���@��%@�<q�j�@k�H�~@fX�˭�@�e��_@��ԟD�@ �j��Y@"���[�A@$��}���@&��{~�3@(����R�@*�pݨ�@-��J>�@/x#�b�@0��0���@28?��E@3�CTў@4� ~�$�@6@���@7�5�=.�@9$Iq@:�˄�@<0*Cm@=�L�y��@?dj�+H@@���W*�@A`*��
p@B>}����@C!���*�@D	�}��E@D�Z�=@E���"��@F��"�l�@Gع��l�@H�a0@I�j�M�@J�'T�@K�r�u�@M��l�@N�����@O2�@<]?@P(���0#@P�鱾��@QMb�.��@Q��U���@Rz�2��@SNؐ��@S�
���@TM�l��@T�]�у@U�=&&��        ?��.�V]i?�bG��i?��r,	&?�d��w?���K?�G�+�7I?�yD���B?��=m��?���e+��@�f}n��@	'�U}>�@�2s�@�j��f�@N�	x3@3(�þ�@j?RԎ@!yxZF�.@#�ڗ�e@&|c��)�@):?�SG]@,�mc@/-!l�Z@10��J�@2�J,���@4����@6r���'X@8Y�$�3@:S�4��@<_C৛@>}���u@@W"Zl-�@Ax�����@B����[@C�l��@E���)@FWݓ�ݛ@G�͝&�d@H�}5�[�@J[�j�S@K���5w@M4�j��@N��JJ�!@P����r@P��fG2@Q�+�@Rsl�e�@SD����@T����@T�@!��@U��
P��@V��v��[@W�G�ݫ@X����"@Yp?�
@g@Za��=Xg@[V��!�=@\On7��@]Lp�[@^LY\��\@_P\�L��@`,f\@`��'e�@a9%A�ZJ        ?�� �=�?�f݂m=0?�	j3�[?ϝ;"�?�$Հ3��?�w60�?��>#?�8���b?�Ac��@��$��@	V�����@5 |�j�@��^��k@rQ#��K@[C��\J@���7��@!��b�[�@$6��W0@&���@)dC�~@,P��ߝ�@/fú�@1Q�vC�@3y!��@4�
{���@6�SyIS?@8�2��x�@:��k�
�@<�/R��4@>��{�G@@��}:��@A�܈��@B�"��z@D�F ��@EY|�I�@F�f����@G�\��J=@IXI�@_@J����@L.��ۊ�@M���,�@O'�z�@PX�	<�@Q!��x�@Q�٦] )@R�(���o@S���l�b@To	e^8G@UL�#s�p@V-��t��@W[�r�@W����2E@X�*���@Yڪt,y@Z�[&�@f@[��ʓgY@\��2��J@]ûOZף@^�2�8�@_�J���@`l~�Ƥ�@`�|��@a|�:~        ?�=1��?�
/-��?�R<Ǟ�x?���J�B!@Ɔ<�,�@�7&�@�x�)@�y�3@!��A�)@&U���J@+�^�w�@0�Gi�%�@3�`z�Ȯ@7E��\��@:���љ@>�i1A/�@A�j���?@C�C�x�@F
�i�@Hn4�-%@J�ͮ���@M��B��@P.�2T��@Q�$�*A@S{>��@T���@V;߹6C@W�+���@Y����O@[R}��]1@]��yR@^��ݡ@`p��0L�@ak/P��@bl�<�@cs���:'@d������@e���H>@f��H�t@g�eJ�	@h����zr@j'f� V�@k[j�'U@l����\'@m��Č�@o;�le�@p4KA~�@p�qBN��@q������@r8�-oh4@r�n�)`�@s�/'�C@tV�f��@u*���@u�XR���@v�Gp�@wP���<@xM�ɝ@x�U�ia�@y�l-��@zvL�đd@{F.\ݏC@|�1��        ?�?*��!�?��~It��?��v��N?ڗ]7��^?�L��A?��q�-�j?��r�DpK@ A��V;@��5���@
6Cْ��@g�� @`h`��@�\�@Ս}ae�@ O��`�@!��⶷�@$���;@&��F	@)D��A	�@,f��8@.�ؑ��)@1	o����@2��B�˧@4Qz	o>�@6���o@7ߡ���@9���|*@;�8���@=��D��@?˛v2�e@@����_@Bt��i@C7�����@DdU<H^@E��U�@F�Q��~@H�uܝ@Ii�Z�?@J�`!���@L'��,�@M�I;x{�@N���G�@P6�"I_,@P���9�@@Q��ڟ��@R�@�Կ@SO�IBl	@T 4��0@T����3�@U͒�*V�@V�a|C�D@W�@���@Xp-oQ�%@YY#��@ZF �'��@[7!��m�@\,#8<l@]%!�c^6@^"yˏ�@_#fR�@`����@`�X�;$@a�%��        ?�'ߓcP�?��q�)�~?ư^�޾S?�VA�m?��葦?�S��F
?�ɓ�M�?�o��.]�@�[��^c@
�fDBؠ@�����p@o`�Ϳr@�G� �@��x^@! Ս�%@@#�&t��@&~5��R)@)�j;R��@,��@��@0��0��@1ڪ#�1|@3�8V��?@5�%�ʡ<@7�^��@9��D�I6@<��nz@>g9?C�(@@d���x@A�3�ɔ�@B����x@D5��N@E��;��@F���@Hb3_Ͱ�@I�G�Yy@K\B$w~.@L��f�s@N}�n���@Ps��@P��;��@Q�cW@R���H�@S|e@��@TcrE��@UN��,E�@V>�-��@W37��+@X+�L�|@Y(t�oG@Z)@[T�@[.d�7�@\6��Q@]Cxkc�@^S��uY�@_h1���@`@�(�@`���<��@a]�j3�@a��7AW:@b�,P�pa@c��x�@c��Ƶ�y@dF$�ܞA        ?������?�.��?���1�?�c� $�?�cx=?�D�>~#?�e��X�?���z~v@���g��@
r��R%�@��9��@I�'�u"@j����x@�k:I�(@ ��k�@#�.��~@&rq?��@)~�s3�@,���/@0S�v�@1��Ѭ~�@3�[�Z�@5�"	c-@7�㦩�@:�����@<hNn�@>�
Z�df@@��ط��@A�K�_i�@C;h��y�@D��*b�@F��4�@Gx�*�g�@H��e+z�@J��\?@L�qƐ�@M�����@Of�7]G@P�����.@Qoc�n��@RUc�eMu@S@��9<�@T19��h�@U&��Hi@V!�f�@W"	B5�.@X'>�W"@Y1�=��@Z@�21�@[U1�s&@\n}4��@]��c��m@^��no4�@_�����@`�E%���@a	 �9>@a�*.~'x@bS���ݥ@b�q[�-�@c��H�R@d9�yg�@d��A�@e���O4�        ?�6J�Y_-?�2�蔭?�H��F@956��@`��@b�ظ��@!=�}^�@'.3`[�@.���"@2��?��@7%q�;��@;��eWD�@@�^N�@CH-�Xn@FD�d^@Iv�v*��@L�ETj�@P:�pQxz@R!T�GU@T!A*�
&@V:}�S�@Xl���@Z�Bǻ��@]}췒@_�m�:a@au�er@bnj��2@cу�_��@e@���m�@f�����=@hC�k��@i�&>:�@ku!��	�@m�	��H@n֧��*7@pL�iZ8@q3���@r �	�Ӽ@s���q�@tYj;@u
��ˊ�@vX�v�@w��+�@x)�V���@y?ka��@z[�Q��@{|Z��{@|�q�D&@}�C8a@ȔH�l@�~�/��@��m�@b@�^/4L�[@��+30�@��!�R�@�TO�#��@�Ic,�@������@�c�rԪ�@��̏��@���(O@��ܫ��<@�Iqv89�        ?�g<�e�!?�V�AI��?�Fl΄ڑ?�[8���?�]wdH|�?걕�m�?�᠝��?��BLC��@ ꅤ�B�@hyj0	@
oLZ�@�O��N�@
k}�ދ@Y��`@����j@�H�Se�@ ��Ρ@#`K��\@%d��D@'�9g|Y@*`b�@-�0��O@/݀+DC@1f"ZB�@2��
4�@4��d{��@6,V��a7@7㰇R�@9��eЌ@;�0޳�@=iG\�U�@?`1ϝ4�@@�pbx�r@A��켒@BѦL"��@C�v�g@E
�ڟ�@F9`%?�@Gkq���@H�=��9�@I��A*�@K/���x@L�򡅴�@MٚE�q�@O9�w��@PP��4WC@Q�k��@Q�|GS�@R��h��0@SGD'�\q@Tb���Y@T�Tq�
f@U���@Vz��J�@WQ5 N�@X+����	@Y	����@Y�h�"�@Zї&���@[�F���@\��LJ��@]��V�@^�$T�        ?��,0׍�?�J�Qx�8?�;�4�S�?�8�F��?���'(z�?��G��?��)��?�^�8��@F�'xyR@�JĮg@�2C�V�@A��^@эi@6��2dE@����1@!����@${"`�	�@'O��̈�@*SK��9B@-�߬��@0s���;�@2;H��,@4C!@6���7@8��%1@:?&�պ@<x��]�9@>�Ƿ�[�@@���+�@A��b�I@CB���c@Ds�<�`�@E���G@G=H�Y�@H�l}:A�@J2cE@K�"���/@MR�j�9	@N��*��@PN�]��[@Q)�Ǻ<@R	����k@R�$�b��@S�Ԟh%y@T��"�@U����@V�j[B��@W���բ@X��8%B@Y����@Z�����@[���@]c0k�a@^"�3S�@_F(�ɮ;@`7M�l1w@`�e'��@agA�	�5@b���@b�%`���@cA���.@c��j�_@d�ktGUd        ?�oMt�?���)$�?�(��9?��U�Ol?��N�?�c�)�s�?�i���?�%�V�v�@{�Rn��@�

B�I@r�>�v�@�� $�@&�OCz�@'����@��4���@!�4���@#�� 5/�@&^
j�Д@)@�^��@,N���M@/���{C@1v��V"@3>3}T$r@5�#�� @7�s��@9�r]��@;+�R��@=Y�U�q@?�C	j@@�谑�@B-�&���@Ck�
�ؽ@D���W@F�c��@G_t8��@H�6�e~@J0���@K��ю�@M$���@N����-�@P�,ʻ@P�k����@Q��z@R�� �Z�@Si�,\@TF}"eco@U({���@V�oC@V��e�wW@W�]*�@X�nmYC�@Y�4��:@Z��1Cfd@[���pq�@\���$@]�Y�蚭@^��o�@_���s�R@`�{�΅@a���i�@a��|�&@b,e���@b���s        ?�b5���?�b '���?�H|/�5>?�lB�Ə@h�:Q\�@ "� �c@�� L�@!|@�J�@&��U>�@,�>5���@1�I��4�@5��e��<@9�?0�|�@>�Y%�@Av9ǂ��@D	�B˕@F�4��_�@I�Ղ��6@L�$�!�g@PkR�O@Q�Q�8��@S��xOuM@UlM���@Wc/ǰh@Yo9g@[�Y�j��@]ƁT��d@`���@a8��D��@bsJh���@c�"v���@eT���@f`ց��@gĝsO�@i2���2�@j��5GaS@l-/?�M;@m��D�@oPI:�4�@px}ꙗ�@qM�,��@r(N���@sÂM�,@s�>
���@tջ�s �@u�9?u�#@v��r.��@w�+�D@x�����@y�
��}@z�m"�b@{�г��@|�5w�Q@}�=.�&@�*R�@���r@���	�3�@�;�mKľ@�ӊ]��@�m˗��n@�
�-e�@���}�@�KdW��        ?�`	V��?�FO��߿?�r1A 	5?�Z��y?�/��?밊 �G�?�+�2��?��',��@_4S�f@�D;Sg#@��TP@P�}�T�@a�KZ=�@��i6�{@Hk,�:p@�Ӡ*�@!�QD��@#B^���5@%�~on��@'�&nI@*z��Ŵ@-�O"�T@/�(��D@1b���kI@2�vz�X@4pm�@6T�^Sh@7���;�\@9rv�q��@;:�x��@=����@>�,�@�}@@s�0�I@At$��o�@B{l%:]�@C��[�@D��D@E���@+@F�x���@H���]�@I77u@p-@Jn$��~@K��s�g7@L� �y�@N:��4�@O�j��df@PrC�'�@Q!�o��@Q�2��"X@R�
��=@SC'(Ʈ@S�g����@T���o��@U����	^@VGA:~Q:@W�@W��;��@X���T*�@Y|�PC@ZQl�θ`@[)lM�D@\����J@\����        ?��Sױ%?�aXؙ?­Y�?�i���I�?� ﮷?�(&�4I?���}�g�?�ե@�m�@�Q��m@H�-�S@4�YB&@�/v;@u�4�A�@���w�r@_壮��@"5x�$YN@$�յ�X�@'�♨(�@*�pgϲ/@.<K�IL@0ܠ��˷@2���da�@4��
�_�@6�ch� @8��H�@;���S�@=Q���s@?��(pJ@A ���@BgD�V{@C�+���^@E ���4@F��\S1k@H�Y�
�@I�eq k@K(�@L��*�O@N] ���@P�71��@P��rC�0@Q�Z��1�@R�5`-�t@S�|&4�@T�*��s6@U�=6G�~@V��QO}W@W�|{�L�@X����Ĭ@Y��yO@Z��T�}@[��<�m]@\�IZ%%@^rYL��@_="��f@`5Y�#B@`λ�a�v@aj�D&�@b	��
�@b�߿�|@cM*��r@c����j@d����]@eEc����        ?�r>�&NK?��Bj��'?�]P�x��?���\�?��}-��?�G$��?����?�$��&�:@��B�@]UFu:@\��$�$@Q�)8�@˲��@�ԬN�@g��cq�@!�˩��@$A�*��y@'ퟩ	%@*�ƙ�@-;'�*�@0K��C\@2e�$3"@3�Y@��@5�$G'@7��-�@:.{��@<IAY2lR@>�N�p8;@@���0@A��_@C��~�@D^LE�K�@E���=u@G*�7��E@H��--��@J#���@K�Je�@MI�NV'�@N�MS��b@PM�\ʸx@Q*����@RD;Gա@R�5`.�@S�"�-0@Tժ5���@U�+O�1@V�/]@Wϴ ��d@XظM�3�@Y�:"�<@Z�7����@\�؉>%@]3��L�a@^X�4;@_�ڝ��@`X�Z�k�@`��OY@a��*u?�@b/��
ٛ@b�*˳�K@cwG��51@d>ωr@d�{6��        ?����K�?֞[��'L?���Z���?�Σ�M�,@	Q
1��x@d�n5�@���|�@"��>�@(h f�G�@.�
�� i@2��e5g@6�I٤��@;D5�H�@?�$?�2@B|}���1@E-SOCI@H
��d��@K�H)Ȼ@NH)Y�6@P�˦<��@R����[�@Tr�ŷ�&@VayAPZ@XdԂ�B;@Z|���@X@\���@^�u�1n@`�+"�@a�ۍ���@c`��r@dV��)H@e���º:@g&��|@hfV�vK@@i��Ku�@kKA@2�V@l�����@nU���}�@o�́\q�@p&�@q�6З�@rlmR��_@sH'j�\�@t(b*�r?@u�i�@u�O*m�}@v���a@w�zg��@x̞9qeS@yǊ�G� @z��x��;@{�ul1�w@|�`J���@}މ-�@~���==�@����7B@����@�4Q���@��s$���@�>�� R@���::�1@�h��@d@� ��c�        ?���c�?����U?�6)���F?ͪ���`�?ًIOv(y?��j��?�k�}<�?�[+����?�O��o�@ �>��@�|���@�wX��@{kV�yQ@�d4,�@S����@$�sv��@"�f�8@MAv�`@�g�b�@!�)x�B]@#g��	p:@%Q�2g�@'O��~�@)as�PeJ@+��9T��@-���Wv@0�� �@13{��H�@2kKs@3���r�@4��|�O@6F�s��h@7���lÍ@9z=%�@:nZk���@;�WP���@=\O}�}�@>�!7bJ�@@4շ5��@@����]Y@Aʴ_���@B�-R�V�@Co@�@��@DFܑ+`E@E!�*�$�@F lkc4\@F�D��M@G�o����@H���@I���d��@J��e��@K|�Zj#7@LrG�^��@Mj�2-�@Nf�\]�'@Oe��@P3�G2U@P���e�@Q:�_�@Q�y�*T@RG���GF@R�Y{�\E@SZ�i�o�        ?��X�4d�?�{�9�?��A�D��?�#_%�j?��*icX5?�0�E�?�p��<=?���?���<b1@�t��3@	F�6A�X@0����@�<3x_�@�@�(%@{o=� �@Ȧsv�@!��#��@$2�,@&ب|~�t@)��U��;@,�L,:@/ȴw[�@1�9%�@3F�~g�@5h@6�uw�@8��ek[@:��<�|�@=��BA;@?R�9
�@@�:&��@A��b��i@C1���:z@Dr��q�W@E�@jixi@G&ӠH�@Hn{�=@I�.K-^�@KE2�G�v@L�{�c��@N@����@O̰��@P��(@Q���@RS@�L7�@S+F�W@T�ǘ��@T��F] !@U�6nH��@V����F@W�VA��>@X�����@Y���\�7@Z�Y��,y@[�D�@\�Z�R�@]�M��5�@^��!�y@_������@`d�|�^�@`�O>o�@a�M�)_@b,z��        ?����9g?�v۫�?��?��â?�X�Cٶ?���V�?�D���?��򣛽?��5	-G?�9��6�@���6(�@���O��@�Ӯ���@~j���@iD�@�ڄ��@#���|�@!V���iQ@#�l8p�u@&]�fob�@)��[�@,
���@/��W�@1-�'�\@2�����@4�^�[��@6�6�E @8p�}�@:sT��z@<�T���)@>��c7�@@w��K��@A�����@B�%����@Dt�}@EPE�#�@F��`�q_@G���pP�@IT�Ԍm�@J��-�@L/�6�n@M���4�@O.��*�T@P]����@Q(��q@Q�QO�1�@R�"���D@S�Zac�
@T���Nb�@Ua�A��@VGCD���@W0�n@X���O@YGJ�	Y@Z���C@[����@\%��7@]���[�@^Aa�k@_8׭� @`�f�G@`����G@a+8�&��@a���<�        ?��+F9Q?���#,;�?��Pct^E?�Bb���@ ���M�o@	�铪f�@���b)@8�$6�@ �Ǧ@$�A��mO@)՗׿*�@/B�(N�@2�p�?Ǿ@5˺)�
@9=1��v-@<��ui4@@i�E��^@Bz��R�3@D�Jv�O�@F�"n�{@IVѾ�4@K�P���@Nn�2�@P���` �@Q���؜@Sik��@T� #�t@Vr|>|@X�\��.@Y�]��:%@[We�px]@]��n��@^��C͈�@`Pf��;S@a<�Ans�@b.W��E@c%�vx@d ��p��@e!�2lr@f'�7�1�@g2$���`@hA~��h�@iU��\�D@jn#�N2@k�B��M@l��t�@mҼ����@n��׭��@p�/Ԟ�@p�'��k^@qJ��Gɾ@q�I ��`@r�� �3�@s)ɩ�i�@sͤ����@ts�#3"@uw�N#c@u�d�
�r@vqK��R�@w'b��@w��S��F@x����@y4<�V�q        ?���ą= ?��0�R�v?���ZG:M?�޵����?�SB��?�M�^��?�"�"gAN?�4��&&@��!�8[@F]D.p�@e�Q��w@�q�ؿ@��Ʒ��@騧�!@{���?�@Lc�|�@!-���4@#S���3A@%�H�%gL@'�1�2�p@*|0�f��@-�t�d@/ד�/w@1X�o_d�@2�W[���@4^h_4�t@5����@7���x�@9R_�^�'@;8��,@<��|��@>�qO�_�@@XH
�|@AU�21@BX�&�c�@Cb��̩�@DsP�t�<@E�k�#�@F��y=�d@G�¨�)j@H��2�	@J&3eo�@K\���+�@L�L����@M���Y�q@O$��FJ@P9�sн�@P�����(@Q�7"G��@RAclO�@R�w�_�@S�nӥUg@TcE(7�@U�N�@U�}����@V�ՠ��L@Wb����H@X)�2΢�@X�?�o�@Y��tx�@Z�D96@[`�d{b�@\5i�WY        ?���V-�?�H�ꯐ<?�Z>����?���E�^R?�xn�)�E?�79�0�?�!���Z�?���e�J@����@���%@�n�8@T���@�)mf@1N��@��R}@!�`�ZX9@$]j��֙@''
�.�@*����@-EF�^uZ@0L�c�-W@2���\@3�=$��@5�ngA��@7�,n�@9����e�@<#��v�S@>j��$�^@@c�U�P@A�3��p@B�뱅Q8@D/s�P�@E���
�@F�)͔Q�@HZ:���@IҴ�4�@KU���=@L⼓���@Nz7cM�s@P� 1@P��0r�@Q��Ѯ�@R�"�"ϩ@S�JP��@Tnrxo@@U]��p�%@VQ�Rfϔ@WJ�9]<�@XHx���@YK(>BS�@ZR�}�N5@[^�u���@\o�Ŧ</@]���K�5@^�����=@_��
!�L@`qR`�m�@aq+��@a���1�@b4��奂@b�l�h�@cl�fP�@d�}�~        ?���ܜx?����:�1?���Ç�+?�=��-�G?�d�Q�?�q��h�?�4�$^?��!�4@b⭡u�@u�^G��@@/���@b6$PX@�6��@��'M,�@Y8Z7��@!��-ߢ@#��d�8@&M6 ǰu@)5l��sL@,L-`�zO@/�`����@1�u��9@3SW��t+@5;E��B@7:)�@��@9O�hfD@;|~�h@=����.�@@�'�0�@AD�6Х@B�C���@Cֵ���@E07e�8_@F���u�@H&I�!�@I~sT���@K����7@L�hZ��@N-�p��(@O�(�XS@P�f�	��@Q���q$@R�՘=jc@Sh[��@TU�>�	@UF�%�K@V=���[@W9����@X;Z�@YAJ�y��@ZL��@[\�|��o@\r2o��@]���u0@^������@_�4��5@`|��\�I@a�!FP�@a�l-��+@bIn6��@b�݈�ZB@c��f�C
@d+�� 9        ?��?�D��?�{YW�>�?���ꪯ�?����}�@	M�%��@��$?@2��}�@"_5�(@'ݾ��sa@.N��@2}
i�r@6I#2�@:l��S�@>�[t��@A���bd�@Dh�pƢj@G"H?ܒ@Jn���q@ML$q�@P 꽲~�@Q�>!(�n@S�Z�P�@UdLͷ�@WLR���@YG�[@I@[V�� ��@]x>�%�@_����%2@`��D!L@b&�JBp�@c\���7@d��?I�@e��:-@g4�ϖ�@h�>�3[@i𖱀�@k[��A�@l��n��l@nJʼLUx@o��]G�@p����Z@qw�h�~r@rF\`�(�@sżN��@s�3��_@tɝ䟃�@u�����@v�QKU��@wp�����@xZ�m��@yH���r|@z:h+���@{0�>e @|)e�-b�@}&��o¨@~'v_-	�@,��6R@�4�f"@��4@�(�΄�@����T��@�=����@��]@T�        ?����!�?�d��k�k?�Fx�ʴ?��f��BR?�`sp��.?��a��?�\n��@��e0�@ ��]ߚ@+T}30@��H?7�@���vS@��G3%@/F���@!y��(P@$�`�
L@&�XǾ�@)���:@,��I  @/�r��@1�u'SzT@3r*g�@5N�u�@7@��k!@9GL����@;b����@=���n�+@?��	@A�P��A@BN3@�S_@C���۔%@D�	d��)@F-RRӯ@G�m􄇯@H�L�b]�@Jd���U�@K�PJ@MdᎷ��@N�6�'+7@PE����@Q'xw��@Q�~��@RŅ
���@S�6���@T���E,�@Uo�]�@V\	��2e@WM"�S�@XB�r7Vi@Y<��g�@Z;sS�*@[>z)���@\E뮒n@]Q�h��B@^a� �,@_v����@`G��M�@`�C� �@af�-�\�@a��眎�@b��3��@c%�N���@c�ӑ$.        ?�bk��?���C(��?��{w'7�?�d��^�?����?-!�^?�t�\rs)?�y���@� 5�/�@
����+@�<0�@f����@��4��@&�]�y@!h?�8�@#��a<@&�Q��,k@)��E�G@-6�m�}@0E!C�R@2Jt/�G@4h�r~�@6L��2@8:Åo:�@:u��2{�@<ȩ�Ҧ�@?3���%@@�NJf�s@B(�i��@C����@D�Q��J>@FV�l4.�@G�w���V@IYŪ_#@J�wR$�@L�y��q�@N3�����@O�+>��@P����L�@Q�43�}Y@R�z�K@S�s�r@T�Yv�n@U���US@V���=h�@W���@X����Y�@Y�U�s�v@Z�/����@[݀8�Hb@\�E���@^&|:?@_S$ḛ)@`B�Dh�@`�a®B�@a|��]M�@b���P@b��"�*@ch��R�@@d����@d����K8@elZ{��1@f�`6q�        ?���P�Q?�w��.�C?Ǎy��c?��2�{�?��{� �?�WH�	A?��l|y,�@ n�����@��xj��@���F�@��!���@u����@Ԙ�Ŝ�@��b�l@!���Vn@$��6�D@'ˢj��@+����@.��6��S@1�44@3�U�@5����@79&����@9y���@;Ԓ6�(�@>I�C~�U@@lzII&�@A�R+X@C"��ֲ{@D���?�@F�p�׷@G�����@I'�9�@J�|�!�@@LtA ��9@N-T��'~@O�6��@P�z�L�@Q��-���@R��h>O�@S����@T�~�Y ,@U�Glf��@V��L�(�@W����@Y  y'��@Z�=9@[BԯYF@\m]G��@]��ʮ@^���
�@`d�0dS@`�6A�b@aK��Wxd@a�u@b�FPdL@cH�[26&@c��D�σ@d��֩6@e_8X�@f�����@fѹl�I_@g�by�>        ?��L#�?�=��%K?�n�(�'@�^��<0@{X�@��� 9�@"�U ^��@)~h��\@0�_��Gh@4�a`��@9�R���@?	���b�@Bn��.	�@E���� @I oG�m@L�<<�$j@PFjJ�/@RW7�I��@T�����@V�7�fĉ@YA��ЛW@[̇�
��@^udΙ]�@`�$�Y�@bY4���@c�^����@e!���/@f�M)"!�@hlےSa@j'�z�d@k�{���@m�
+��@o��W7�@pЧ��@q�jѓ��@r����*@s�ͮ(�@t��u��@v�s��*@w;���g@xeAM��@y�b��%�@z�#:KG@|	{>�? @}Mb
-@~��U@�*��@���7�v@�N���x"@� �O��@�����@�nJ�l�@�)�{�k1@��-�>x�@�����MS@�n^���@�6	�z�@� �����@��o�C�@�� jɭ@�rǭ�e�@�I^��-?@�"�CL��        ?���_ψ\?�wب���?���+�J?���f��?�-#'%?�2#��?�t�Ȭe�?���,��h@
��P�@ȿ����@�;��^@��W��@+=��I"@�r&T�\@c#��^�@f�&���@!��-�@$D42M%@&�����e@)1�g�O@+�<8/.l@.���F�@0�����@2DoM�@3�wN��@5��4z��@7<��U.W@9��5u=@:�7�L�R@<�h$�|@>�j|��@@`��&�@Aj֒1)@B};�� 
@C�@�$�;@D���z��@E��y�xv@G�G��@@HJ���j?@I�����@J�m-�X�@L�5$3@Mr�X�,z@N΢���B@P��S)�@P�q��94@Q��E��w@RA%`+��@S �o�@S�/��MW@T����@UP[ �(�@VJr�J�@V�i�ח@W���>b�@X�	��X@Yko��F@ZFҮ�w}@[%%�O�@\^İ��@\�s�T#@]�\|_?�@^��B�        ?�oDZ�'�?�"�M60U?���:�6?һwkЮ�?�yfa	2�?�	��X3�?��(B��?���!O�@���̝�@�� cc�@���[��@��v��@5W���1@4��W>�@�.�E��@!&�gg�#@#�I{(@&nzo<Y�@)X�T&6@,q��t\�@/��N��@1���@3j}"7@5TXѿ�@7T�rZ9@9l�����@;�`�R	!@=�Z��;@@�Ed6~@AXd	s��@B�Oֱ��@C�|0���@EH�}N[@F�Y�{XG@H �J���@I�|J��@K$��͆@L�NB�N@NTgDH��@O�0M:��@P�K�=`@Q��ι[A@R��� @S�r%2��@Tp��T	@Uc���w�@V\R��[�@WYؒv!N@X\i[�C
@Yc�}�y@Zpt�o(�@[�ӭ�R�@\�L���@]� 2���@^ҵ�K\@_�6��@`�C,�>@a&�{��@a����@@b[^����@b��SU�>@c��j�w@d:�A�         ?��y�v1?�ׁ�9�?�,2���?��h]�|y?�/{mڑ?�7e�W�?�_��Vs@ �����@�r`��.@}T��s@4��9~�@\�㚄@�Ca1�$@ Ű�;@"ˇb-��@%˄_
�@)Ս��@,}�Ѱw�@0��⁰@2 �M�@4#�+_�Z@6V�,��U@8��/3>@;>�϶}@=����QX@@(NR@A�r�F�@CrVx�@D� �!@FW��5p@G��]�&@Ih,�UM@K'��Jz@L���/�V@N��O�'@Pa�)��@Q_b!DG@ReV�6YS@Sr�a�X�@T�*Bk�@U��z�M@V�r[��l@W�q����@Y(��q.�@Zc�i�C^@[�s�l��@\�X#�@^A���w�@_�J�>֮@`}&�f�@a0Ѵ�C@a�#9 �@b��[@ca�X�5*@d#���@d�c.R@e�ﰤ��@f�aUh@gPF�[i@@h$@A2R@h��s<}@iּ�v�@j�7���        ?����v�?؇	�$?�a�EX�@ pS�gH@�^{�"@��+:@���1�-@$�r3�k�@+&q��@1(�W��@5*E��ɓ@9���l��@>nT��~�@A��O�'�@D��$O@G��q�;�@J�r����@Neل�A�@QY��@R�Z(G<�@T��Uܼ�@W� ��@YM^,�@[��Ю@^���#@`D�\4��@a�˾2�v@b���"�@dO��V��@e��|ӽ@g=M�!�@hŦ�5��@jY�1z�g@k�v����@m��1�=@o[�^}�@p�FK��@qvSq�$2@rc�,�*@sUq����@tMe=sc[@uJ��٪c@vM����@wVi@xc��Q@yv�)�y�@z���1@{��+@|�L�J�@}����c�@"D��4@�)�j�@��%�P�%@�b۟�b@��iN�@����@�Jh�|8@��{�0
@��&�-�@�F�~�q@����c��@����y`�@�W��        ?�6�'��?��*;<7?�0_��.?���b��?�4��>�?�"���E?���'���?��j-d�=@� �!�@	Nc�Vȉ@*~;�r\@���#h@Y`��q@.%��N@Ny���@!\�]ɪ�@#�cAMs�@&6���B�@(��Ep@+�x�:m>@.���lʛ@0�y�&@�@2f>��-�@4q[���@5��Ј'�@7����@9v�%��9@;eZ7�z�@=eW�Ε@?u�w<�W@@�xC���@A�c#�C@C����@D.���D@E`3/�J�@F��G4�B@G�����@I$7�6j@JuHm��@K����@M.�5+@N����h�@P�8Z@P��t�z@Q}��I�-@R@b��:@SģM�@S�ږ�@T�Y X�@Uo��U�@VDE��-�@W���,@W�u$�v@X��~�B@Y��5�KY@Z�3��/@[�'�� @\xl����@]i/���@^]Yf�l�@_T����@`'����@`�+x�T        ?�Q����4?�6���H*?��_��@?ԑ\����?����9�{?�Vx�]l�?��&u�$G?���C�@�9}�@��z�O@̂� ��@��uIh@�F��=@ ����@��g�Ft@"NL�\�=@$�����@'�V9���@*���^	@."d>@0�!�4�@2�'[,�f@4u Nڹ�@6n���b@8Y�@:�OUd@<�,���@?7*�)��@@�\���[@B�O$@CZ��N0@D��vO��@F�F@Gzy|:�2@H��]@Jo!v2@K�|[!�@M�ai��@O+��/��@PjhJ���@QC�\3��@R"�%�@S2�B��@S��3�M�@Tܞ�C"Z@U�X�|�#@V�~�	S@W��\НS@X�j�w�@Y�Xz��@Zב�-fo@[�	��h8@\�l&��@^����@_6���>M@`-|�X@�@`��L!�@aX�s��@a�&����@b��	���@c+��g��@c�^.��I@do(�C��        ?�z�gAR?��k6P�?�D����h?��f���?������?�	I�@.�?��)9!?�B#k�'@�T���@
�e����@�5T��@h�,�n�@�z�ļ@�}8c@!&����@#������@&�����:@)����M@,��9��@00{^��@2<P?�S@3�����$@5�#��VJ@8�O��@:F�n��V@<��<�-@>�����@@�?9��E@B���>,@CWX��Q@D��{�(�@F#,���@G���7�@I �Enu@J�[=���@LA�ad�@M����@O�Q�z�@P�F�	�G@Q�U��@Ro�׆D�@S\����@TN���<@UF�#���@VC�J?�L@WF>D6H�@XNi��@Y[2d>��@Zm����k@[�[�Da@\�TK"60@]ĆM��_@^��V�@�@`>��z@`��&#@a@���@aބ}FS@b�d!�@c" �7Eu@cǽ���@do��{�@e����@eǿI���        ?�˕�Hay?��M�	�?�@���0�@~c��Y@|�=)��@;dy8��@ ����G@&H8�)�W@,�,n
"@2?U�)Sb@6u!��
@;�:삗@@�q?@Bէ��5@E���]e@H��',��@LT݆�f�@O��4�X�@Q�%_�1@Sӭ8Msj@U�O�7�@X�-�@Z^���D@\��磹�@_6y��,@`�>�Ў�@b7;��g�@c� -v �@e�ɵt�@fzJ'�E�@g�cvo@i�
���@k&&(%�<@l˜���@n|R�@W@p�f&@p���-s�@q�<��@r��9M��@sʜ؃l@tì7R-�@u��x
 �@v�|�v
�@w�oA�@x�̄��6@y�P�4@{5D��@|"�6:@}Dzz�wM@~kGt��@�nO�!�@�c^g%0@���ۙO@���t�'@�:Wy�=C@�� ���@��H�ؚ�@�&�H�̿@�Ϧ5�?P@�zҝU�@�(M��=�@��G�z�@��"��b�        ?���nN�?�{hZ�H?�q$���?ЛX�b5?�x�O�=�?��_d�4�?�{c�9$
?�el+��?��@��)��0@�H�t;�@
Vg�eWz@JI�8�\@R����@2�H��t@E���@��t�k_@�]. ��@!Q�!)�@#;O�z�@%<��t��@'U����@)�i�_�@+�}%��@.'���C@0L�N@K�@1���U6m@2�$�SЀ@48.�5�@5��Ǣ(�@7	���F@8��o<e�@:J�~�@;��q�~@='�� ;g@>�D3V��@@9h��@A�Fq�@A�+Z6�@B�H|[ۑ@C���σ@D�ĜnJC@E�g����@F���}�@G�?@�_4@H�aܰ~(@I��B�Ԙ@J��;�Д@K�KQT��@L� �+�@M�a��@N�S���@P ��3l@P���ɲ@Q$Ƭ�Yh@Q����:@RP���@R�� ��@S�$���@T"C�^�@T�Z�ݛq@Ube5�/@V]�<�        ?����﵇?�Q��f�?�7���+?�h�鵡�?�6rH�۔?�T4wj�?�D\�9o�?�*8�օv@ 2���@����e@
{ԥ��@U����r@�I��Jb@�M�N~@��D#�@ �3!�@"����SG@%' ��݁@'�}�m�@*�4��R@.bQ�0�@0�6Y�j�@2h��i�w@4<���T@6&��M��@8&g&��"@:;�8
41@<f�fý�@>�bǣ@@~�臗G@A�&�L?�@B�B2�6j@D>�Fwa@E��r둗@F��t&@H]{2R�]@I����@KPz�%L�@L�{Y!�L@Nl�DG#�@P0���!@P��H^@Q�'����@R�K��,�@Ss�(EJG@T[��+WH@UI!�Ù�@V;}��L:@W2܂�_@X/8X8o�@Y0��;}�@Z6�a0��@[A���1�@\Q�U'C@]f�<K�&@^�b���@_��x�]�@``�>�K�@`���l3@a��s܁l@b#A��Q�@b����@cZՊ��(        ?��k��Ci?�L|��?�(�Z�ݴ?����b?��WF�?��B�|?�wy"�˒?�XYh[S�@ C
����@7�w��@
n�?�Q�@CJ���@��n��$@_&�a�!@oDb�@�:l�y2@"H��`Y�@$т�2m�@'��?���@*bw�+n�@-jJ�E�@0M��b}�@1� R�@3��@h@5������@7~?L@9}*N�C�@;�&��!@=�hq�^@?��
C1@A 5��@BQI9f@C�_*�\@DУ�tj=@Fơ�4@GvtM��@Hט���s@JB oq@K��xr�4@M3}�I]@N�<�A�@P$Ax�<*@P�c�:R�@Q��pK�@R��#��X@Soe���_@TM'��@U/9�M/�@V�6>(@W 3a���@W��=��@X�r.@Y�:m#��@Zԅ
�@[��,�e�@\�Ri�:@]�Ê�K%@^�1^cd@_���L� @`�q�1�o@a�'>^@a����"�@b/���/        ?���?��?�NԆ65?���f��?�*��>:@����W@W�&��H@
J��@���_s�@"�j���@'��f�R@-!��ѫ@1��"8�.@4�I®C@8|���z@<Sk��@@6RA�Z@Bc�ƋO2@D� a�V�@G ��7@I��.Z��@LZ�@0�@O%����@Q�K�s@R�s�e�P@T]ӓN	@U��B{{@Wk	��W@Y'pRh�@Z�	-IE@\ɤe�@^�0���@`Q�Sn@aQIȢ��@bX����@cen���@dyCb/�@e��W��e@f�3�@g��i��@i�\�R�@j:�r�0�@ks��O�x@l�����@m���Lvc@oB�^�@pI;=��@p�H��к@q�2;��f@rR�'�;@s�&���@s��t,5@tv
���@u1�BC�6@u�h��{@v����s@wu���@x<���@y����@y��2d@z�H��0@{qP��|@|D���0:@}��x        ?���� ?�!��æO?�h.t�9?�y��3q?���-_��?郷���?�;���=?��6lx��@ :�{��@\��|w�@	�и�@S�z@o� �@�\�@lK�5�,@��k.�@�����@!��J��@#���IN@&9��.�@(�5B�e�@+ ^l��@-��f�@0����q@1zO�WZ@2��8IA�@4b<4��@5���; @7|����@9�}��)@:�x�0��@<i	��@>CikB�O@@	��8@@���`ٟ@A�v�@B�c6߄H@C�<W�@D�:=ށ@E�մ}F�@G�\o	@H�U��@I9�[;�@J\��&�@K��<��f@L��: A�@M���@O��a�@P,���m�@P�9uli@Qrm�X�@RH��H,@R��i�V@Sn�ڋ)�@T�l'�A@T��흫�@U��q� 2@V8�n)@V�aHy7@W�c\�@Xj�B<9�@Y*��u!@Y���"�        ?��e���?��s9A�<?�a�z�?��r��?�X ��?�%�,��(?�ҏW�u?����`@ �:�%@��ky��@*�\�@��,�m�@A �ds@�|�C@Z3��@ w���<�@"�l }�@%�qY��K@(i߇�~i@+j�Q�p�@.�Ob�V~@0�x�Lf@2�Ka�q@4��{��5@6������@8�펙��@:����@<�X����@?!���J@@��F�@A�T
$�@C;�T���@D��`�@E�Z̫�F@GEH�k=@H���_a9@J)��{�@K�����A@M7@D�z@N��BJ@P6Cnr�@Q
�|&3�@Q�<J��@R��4@S�?$�@,@T�7u�4�@Uz����@Vl3��+@Wb!
�@X\�r="/@Y[��B�M@Z_0��(�@[g1�X�@\s��G}@]����`�@^��$V'>@_�e�tu@`h�^�@`���W��@a�45�W�@b"��xˑ@b�[�F�7@cT+:ݓ?        ?��8VpԚ?��f����?��Ys�X	?Ґ҂U$�?�[�K�?��y�?�
wfD�=?�}ǟe�@������@�$�}c�@�!7��@��u/h�@I5���@O���z�@�L� #�@!;�QW��@#��`W@&�~"�.�@)y�a�`s@,�\�oWJ@/�cȑ�@1�5e���@3��!z��@5o߭L&@7r�U,x@9�#���@;�J��%�@>Q��W@@2�,�d@AmE���#@B�?���:@Dk����@E`��G�@F�E���@H:v�-g@I��#��@K?�m��T@L���i_@Np��t�N@P��hm@P�9�'��@Q�<1$�@R�CE��@S��~$@T�PJ���@Uu+No�@Vn9!/Z@WlvA7�@Xo�d��@Yxq-&�z@Z�'���Z@[���?�N@\���QL@]� ���@^� �?M@`�8x��@`��抦@a:g����@aՋ�Z@bs-�9�7@cLm&�@c�₦�^@dZ�FJD�        ?��aUB�?�D����?��`�dH?�Ϧ���@|�o�@�^�@6����@ l�5
��@%i�3j��@+$o��x@0��)�D4@4(~�@7���,@<�	��@@<0����@B��B/HD@E�N$5@GŨ�^�@J� l�hP@M��}���@PQ\@Q��C��g@S�W3�/@Ub"��Z@W5�;�@Y�@��5@[)�c�t@]݂��i@_&�[f�@`��UWc@a��@�A@b�Od�@dKh�z@e>��@fwv;��@g���wJ@iB�U�*@jQ�u���@k�R����@m�0XT@noBJ9P�@o�N7%q@p�Vb��c@qg�2RU@r)��E}�@r�"�ϋ@s�=�F�@t��E��@uUȴ@v(�����@v��[��9@w�c�u@x�S2N��@y����#@z~;>�\>@{f$A��@|QQK�*�@}?�}t@~1Yq��@&"�+��@�#�HE@���Yz��@����Z        ?�O�Q���?�"l�:^�?�0����?��T�AV?�²7��?�0�X�?�˩`�O�?��u���V@�I�(�@	&~��@�Y�3M@����u>@�~`��@�+���%@���I�@!%��Un�@#v�W��n@%�a����@(�w��?�@+D�k{�w@.'^�h�@0��'�@2,3&@3�:5��@5��py^�@7U��"�@91���@�@;���p@=�}��@?-Xɂ�@@�)�@Hu@A�2�V�@B�9�R�@D���@E>3����@Fy���@G�1n� @I�p�@J[R���'@K�3�'q�@M<�X�P@N�fB2�@O��]��@P��n%X@Q~�H�@RD4��Ӻ@S;�p'�@S�(S�z�@T��b���@U���-e@V]��^@W::�k$�@X9S͖Z@X��k�<�@Y��%�#@Z��Ā�@[��aQр@\���vXC@]��@^�P�o�i@_�1�w/@`V^bO1@`�w})F�        ?�s�gKOj?��pj�O�?Ư�j���?�/�:�B�?�%��_��?�E��i?���0&I?���Đ��@�,��@
�B�
�@�K�ZR@���\@���%q�@2n{���@!Vo��2@#��,�@&��n�=V@)���&@,Ϯ}�Y@0(�p�@1���8�d@3й[�7@5���
�t@7�8]n�@:����,@<Z[y�H@>��r��@@����\�@A�>ҩ|D@C2�a���@D���,�@E�����#@Gs'�'�@H�gv��f@J�1H�	@Ll�yB�@M����@Op�i�/�@P�����3@Qx����@Ra��L�@SO��]D!@TC,�ts@U;�vP__@V:/�q@W=�j��:@XFܩ7�@YU;\�T@Zh�=6D�@[��	*?)@\�OI/z�@]���|��@^��;���@`�X5�@`�2?,(@aC{D���@a�X�"�O@b�����%@c'��w
B@c�E�A]�@dwP+�W�@e"�j���@e��0��        ?�Xԛ�=�?�
t}2�?�0`�S?�ǟ���h?��g�?�FGvk:K?��)^���@ n�[��@��W�q@bt9�@�.'�p@�� ��@�3����@ۦof'@"'�ZMt@$��m��@(�?\��@+V���L\@.�s
(H@1L�^S�@3Fr{�t�@5[����@7���7��@9����N@<<�<���@>� )�8@@����g@Bw�ٵ�@Cm��h�@D�w�@e;@Fc���@G��w�[�@I�����@K4n�E@L�p� @N�l5��9@P;`�ب@Q(M�L�;@Ry�b�-@S�Pg�@T�qN"�@Uc��~@V&xN�1@W8�z�_�@XQC��1�@Yo�"��@Z�����@[��[E��@\�.��l@^(���^@_f4[=@`T�X�@`���*�K@a��	��&@bL�T#��@b��tɂ�@c���7@d_ǪX5@e��xB@e��	�
@f��&��N@gM�Q7�@hۻ�AY        ?�h��>?��B�r�8?��ŭ��@fkV�;I@X�Eu@���@!��H2ʣ@'�}��C@.�V���@3i��E6@7���@<�Q��� @A�;��!@C�x��S*@G�i��@Jij��#@M�3~�J@Pߖe��
@R�Йӫ�@T��=
@W/Ԥ`\�@Y�H�b��@[�΀]@^u:Zv@�@`��Zƫ`@a��Z/@cU��*�@d�)(v�>@fS����@g�V�lז@i�����@k1�gu�@l�ҬN�&@n�XΎ��@pA6t�)@q0|����@r%�X<@s!�˻nG@t#N���@u+-�k@v8�m��@wLϡf��@xf�:�o�@y�kH���@z���@*@{לg��@}�h�g@~@B<p,@|�� ~�@�_����@��&�8@����IO@�TC�8�@� �+�}@�����@�bO�@��i�,@��lf;@����[AG@�E��1y@����0�@��뷻#�@��s���        ?�E)�y?�f�_V�T?�Y�^A?�m^�A?�h���Y?�d���u?�UL�>?�኎lWQ@ ܘ+���@Mwո�@
A����Y@����Ğ@��D�'�@��T�@��L[IH@9z`f�@ ��_���@"�aU�B@$���@',�Z�l:@)�<�+�@,!�&�#<@.�	�!�0@0�JC>_@22g ��@3����@583���@6�]I@8s��v*@:%�_d�@;�]|�A4@=�'�eb<@?��vi z@@�%�$��@A�8��Z@B��m}P@C�3�iU�@D�E�_f@E��� �@F�Bϝ@H	3ⳇ�@I-WH@JWm2D�u@K�ii\F@L�@!O4o@M���j@O:T��i@P@���_�@P�3�]ͯ@Q�����@R<��v��@R��أu@S�f`#��@TRг�@U	r*x��@Uð�o�r@V��l���@W@���O�@XL0��<@X�ɻ��@Y�~5�r@Z\-��n�@[*���        ?��9P�?���7K�?»���\?�yf�1�?�(���j?�+E
��?���(��?��4nr�@��hT@ࠆ2��@��<<4�@n��B@?�RM@p*��_�@,�J�@!�"9_@$�6엗1@'~=�e@*�
�T8�@-�ާ�@0��蟎@2bX�{�!@4F�s"mA@6B���/@8V��Kn@:��u��)@<Ă	���@?��A�@@��!@�@B361
@C[����@D�2�dw|@F�nw~@G��v͈e@IW��d}@J��U]0@L*u�x@M�e�B�N@Os�`/6d@P��r@Qu_=�H @R[��H@SG<X>L�@T8��Ya@U/�����@V,"^t#�@W.P��{�@X6s,�~@YCv<��@ZVg<+��@[n��4��@\�����r@]����@^٣���G@` ���@`�-Х�S@a:����=@aڂs��@b|Ɗ�S�@c!�s��\@c�zZ�o�@ds�f�@e!�Yo�        ?�f���^�?��e�m_,?�,����?���7n��?ߟGm?�g���?�qD�5
?�����t+@�.I�@1x��@��`��@
�1G&�@�Lm��@lT�D"@�v����@ �(@��J@#	0��i@%���z��@(nα��!@+a��Qʥ@.~�Y�-<@0�ր�@2����y�@4f�x�`@6G����V@8<,��'�@:D����P@<a�'�F@>��09u@@jL(��@A��1C^�@B�ܮ9�6@D	�
��m@EQ���W@F�[�;�@G�W�5�@Ib���3�@J��4r�@LF���+@M���N��@ONPAMX�@Po�Ը��@Q<��0��@R�u�S�@R�͆Ls�@S�(_��w@T��.c��@Uz��'g@V`[�u�@WI�BȾr@X6���W@Y'����@Z|���@[����@\1�ʱ@]��s@^�

j>@_�H��@`9/�	@`�W���@a#7qV�@a�ԑ��@b:,�B��        ?���֜us?�8\��]<?�r-��-�?���sN��@c��D�@�yȍ�@ŕ��)�@"&�B�o�@'�E��[�@-�<�l�N@2l��C@6@��ZK�@:n7?�D@>�Re�v@A�Z.z*T@Dt ��@GAUs��@J,h�J�V@M@#�.�@P>y�%�@Q�Ά��j@S�<�k�@U���:�@Wz5�/�c@YyYظ�@[�R�v�@]��f�j@_����a@a��<Y@bE��� �@c|T&k�@d���_5n@f�axZ@gT��&�@h���;@j�� �@k{M�!�@l�T���@ni��8|�@o�aʄK@p�����F@q����K�@rT���~@s&�K�@s��S��R@t��|h/�@u��be\@v��.��y@w|}f6�v@xf(�F@yS�T��D@zE$���@{:sy4�~@|3��i�@}0��E�K@~1�s��@69b @��+�@���0��M@�./�
�U@��cw�Т@�D����@�ҙ�O        ?��~�^�?����Р?�,��	�?�T�w検?ݲ̞�P�?���e��?�j�9o?�RER#�o?�'	y�@s�ni@��45ϰ@���e@_�I\ @1g�O�W@9�5�z@w��`5@�K�/�@ I�`��@"7���@$?�i���@&a_Iy@(� Rh�@*�� �r@-\hح({@/�yZ��D@1?o�!��@2�4��+@4 �3^l�@5s�Au.�@6�5~�@8|'n\A@:�exn�@;�k�)�@=_�k�S@?��xh@@mvx	��@AT�[{��@BAz��@C3�E��@D+��Q�@E(�s�X�@F+��@G3���\�@HA(���@IS�|�W�@Jk��\��@K��cG�@L�{Dy>@M��S`,@N�s�\�@P}/�˝@P���TD�@QQsX�Zq@Q�����@R�-1��	@S9#���@S�w�B�6@T�"f$�@U6�҇@U�b�{�R@V��g��@WG����^@W��F�t        ?�U*�V�?��[�m.?��2�30F?�Pk�?��?ް:�wޛ?�l(|�D�?�[B��}?�+1���v@ �V��ͼ@��Y: @uþ�*@�+g'J�@w=`1�@_@��@�-w�~@ �k�ʏ�@#�ZX@%����@(�OoP=3@+��[5W�@.�@�~\>@1��g/@2�^-���@4�ˈP�@6����-@8���g[@:ɉ7��@<�.�x��@?;Y*�W�@@�l.�)"@A�@&r�@C?��c@D�ͦT]�@E�Z*Èc@G9�p�-�@H��
�@J��_�@K������@MYsĒ�@N��<:K@P��$�8@P�>~�@Q�IxX��@R�:?@SrEݰ�@TT�6@U:E.��~@V$���<s@W���@X�^�@X���1��@Y��H��@Z��`�z@\�Om�+@]i��>@^�O}��@_*���@` l���@`����K@a<�Fk�T@a�nue�j@ba��~5>@b��C`�<        ?�����?��N[�}?��C�)��?Љ��U�?�R4���?�T�jFv�?�65���?��m�>@ �sw�v@�f�<H�@
!~??�R@뇡��@nH����@��y��@�$u�W@w
aq@"��y��@$��v��@'7�I@��@*��+h@-��}�@0a3i4@1��;v�@3mK���@58H����@7R��h�@9.��Y�@;
�~&l@= mq���@?HX@l��@@���Y@A���@�@C9�J�2@DL=P���@E��{��`@FӍ���@H#����N@I{����@J���}��@LD�p��@M���;j�@O+?�u�@PU�h��@QM/� g@Q�'dz�@R�� �c@Sw�r1@TI.lh@U2��g@U��y�@V�zӄ�@W��|��<@X�&��%@Yy��c&@Zb�pS��@[O�>�c@\>n\r@]1!�^�@^&�~��3@_u-o��@`�D�õ@`�G���@a��&B        ?�1�!�h?�8Si��d?��7(כ?�V���8@s���@�N%tX@$����@��;[@#�����@(�h�Y@.��Q��@2��|��@6��pR@9����@>��IB�@A2��5T5@C�C��&|@E��ȹ"Z@H�ӓ-�@KYUѣ*�@N:�v��@P�pY@�@R0�3H�k@Sӕ��@U������@WJ�/c]�@Y�9ch@[��r�:@\�Y�O@^�᧔�b@`�z��D@a���}�@b��ϔ1�@c���A@d����s�@f(*�fb@g^ۏdJ@h���l�@i� �i�@k.���N�@l�3]�C@m���P^@o>�	�}@pS��{��@qtν��@qƧߨ9+@r�8�Z�@sGo'�@tMx#�a@tԽ��w@u�f=�͌@vo=���@wA<;�:@xX*���@x�X$�@y��0-u@z��E�� @{�3��s@|mW��K@}Tb�2b@~>MSg@g@+L���@�NH��e        ?��$:˓1?�� ,?��叭�?�15�ܠ�?�`��� ?�.�_�;?��R��6?�r4�UԿ?��1��D@*DIݙ�@�쨓�@pa@�`��R@�LiP�@GJ��,@�
ZhEh@�����@!�"���@#�'z� @&'��a@(~�2��@*�7̦ @-��l�@0sa��
@1zNj��@2��'@4j�W*4�@5��AZ:K@7��a���@9;���@:��b�@<�K���@>��q�b@@1m���@A&���2@B#�sqx@C%��W�@D.�����@E>��[E@FT�����@Gq{J+i@H��f�F�@I��$���@J�]+���@L"���{@M]�	���@N����@O�%���@P�+�@QEP,��%@Q�t־��@R��zK:@SU��n0K@T��#��@Tā���c@U�F�K@V>���=@W c:���@WĴ>c�@X��C�`@YU�(:t�@Z"�$�m@Z��x�p        ?��� BK�?� �(�?�j���?�0��N?�/Mz7S?��l�\�?���pF�a?�vϱ�S�@�6���@��?�d@�Rg<�s@�=5�:@�]C}�J@�����@A7/
��@!�!;vx@$:�Cp�@'�'�^�@*��"��@-RA�T��@0]ŖF�@2*�UkG~@4�N��@6u��J@8!=-��@:Mï�J@<���"��@>�<��@@�I�X@A�l�)y�@CF!�0?�@D�[��f@F
��3@G}-�k@�@H��yn_Y@J�}F�2@L��Y�=@M���O��@OfH+c,@P�c��,@Qo#|5��@RUYM��@S@�u�,�@T2 !�W�@U(]�>&�@V$
o)#~@W$�Ւ��@X++
��@Y6�"���@ZG�cN@[\��B�@\wpފ�q@]�1�}�@^����N�@_�~+M-@`�I�l@a#͡�v@a�����@b^i�o4S@b�D���@c�v`��@dG���@d���hLt        ?��_v��?�|��y?�IaC��w?���|�?�� ���?��%�V�?�1*�N?��)�]ʦ@ r4+O�@D�L�@
đ��@z�d��@��7C@��h�@�U�-�@ 'm/���@"�#�@.@%$�}�b@'�qJ��@*���wK�@-�<h���@0���Ӑ@2I@�R@4�5�f@5�QH���@7�]�07E@9�װeI"@<�ҭ�@>=\(���@@Alq
�@Am?���#@B�B{B��@C��V��h@E,U�s�@F=̯�@G۞��{�@IAd
kb@J�z�5�1@L(����@M�O����@O4�
BzH@PdBDi�@Q2�Ȧk�@REx8��@R�i�t�E@S���F��@T�ΕI�.@U{��92�@Vdq7(�@WQ"�.�@XB��B�@Y7i.��@Z0?��B@[-�����@\.�&���@]4*�D�@^=}Lٷ�@_J��l>u@`-���W@`���J�~@aD�9Y�@a�L�$��@bc��ڸ�        ?�U�� �?���1J�?�K{bM(?�p$��@���-5@��G��@�LH7f@ D� �J�@%;W@:@*���*�@0�cGK��@4	�5S�@7�E�nU�@;��Flwk@@+�e�@B��-��<@E�p��@G�(�JVI@J�8���@M{��=
@PKu�[@Q��+��@S���R@Ub�����@W:�f��@Y#��>T@[`~��~@]-Em>v�@_M7=L��@`���s@a�h���@c "�@d?�K�Dk@e{��8��@f��_ ��@h��)m�@id��{s�@j��&@l+*���@m����w@o_�qwm@pJ
x��@q��p�@q�7ڡn@r��ER�"@stך��@tI�� �@u"��բ�@u���~?�@v�p�E�w@w�8�#Y�@x��^
��@y�f�&�@z���@{~�i6��@|v�|��@}rU� �B@~q�G���@t��9v�@�=�����@���s��R@�I�`�q�@�үΘ��        ?������?��v`O�?����I�?����,�d?��;𐩑?�Z��i�E?�
���5?��ڐF?����m@���@U�ӱQ@Ho�<@�?���@����@��rpy�@[���@�����@ �����@!�'T]�@$�H  D@&"hy�@([�s��Q@*��GI�@-l�qA]@/���՗@1�?[-0@2{e��3>@3�+�x�@5V���a@6ֻ"܀@8bBؐZ�@9�uD8�@;�2W��e@=JX�
�@?��m8@@d(S8�@AK��|��@B9tW��@C+���7@D#o>ץ�@E �$��@F"�xU�@G*4��M@H6��@�@IHgL��@J_���]@Kz����7@L�P�G�@M�~��@N��5�m@P��6��@P������@QB�}2or@Q�e��@R��3V�@S% � �@S�"��`@Tqt���@U���1@UƔ/���@VtV\{�z@W$4;F`@W�)�:1        ?��N�?��p�{7i?����� ?З
��L?�vsC��j?�{w�l�?�Z�3?�@�io�@ =��@��$�6@
���@W��J�L@�MA�u@�#u���@�z���@ c�"�@"��3�%�@%p��F�@'ێ���5@*ʲ�)�L@-��o��@0��;�@2N�ƸV@4�_{�@6 ��OF"@7�5[��2@:�2���@<(��Ng@>_��S-@@Uy���@A�!!���@B�ĳ^|�@DL��#@EO�_��p@F���rX@Hcr�t+@Iq���@J�Y�5�+@Lbr+��@M��ŻQM@Oxj�2�@P��+2��@QYg4��@R.����@Su@��k@S�QR�V@T��s@U��}��@V������@W�^��'�@X~�P��@Yu�Ἄ@Zr����@[rxƴ�=@\w]
�@]Ւ��s@^�ʄ�N@_��\��<@`Y�#50@`�J��L�@au�-ց@bڸ��Z@b���$7�        ?�\�{'�R?�>�q_��?�:���I?�T��ǟ?�t���?�'�i��?��×�?���Ѯ�@ ���.
@��N�@
$87J`�@-��x|@z���ۇ@1�D@>��@�F��0�@"-�z�a�@$�z�E@'g�����@*C���Y@-Iū���@0<��:@ @1�ۆ��	@3�dj˼@5}��~'@7fm[
o�@9bv4��@;q�� �@=�\�h�w@?ɼ�.qV@A���P�@B6	�<
6@ClE(��@D�q>�@E�qO��,@GD*�+��@H����ڈ@I�j��q@Ki�}�ի@L�z$��@NW}�ws@Oڸ'���@P����#@Q|�=��@RJ�ͭ��@S:M]�b@S��A`�@T�v_��N@U����@V�?a�J�@Wof�n��@XX\y�y@YE�H��@Z5��#�C@[)��V7f@\!����m@]Qk��@^���?�@_f���@`�K�@`��|%Q
@a���z@a�;Q���        ?�S� f?�T����?� ��s3Z?�B}�<�I@ȸi�(@}P\��@([ҕ@�j�(�@"І���@'ԩᐧa@-oլ -@1�$��}�@52.�J@8�;i�f3@<Ћ�v@@��֬��@Bƃ�Dt@E*c�;�0@G�����@JY��}@M$�t�ѷ@P�K"��@Q�S:A�@S'տM�@T��X�C@V�z�9f@XQm���@Z)s��j+@\�(T0�@^	WїGf@`; ���@ag���~@b&��4�@c@B����@da���w@e����#@f�iU�Hy@g�^!~��@i/K�Y�@jt �M�6@k��u�v@mB�fQ�@nkt���b@o�TR���@p����@qOp��@r	6E�{�@r�0��l[@s�U���@tI��̕@u�Y�@u�X0)Ȭ@v��H��@wu��F�@xGl���@y�L t@y��}pZ�@zϳw+@{�{�k��@|�(�*�@}qm(P��@~W��-9x@@eH�e