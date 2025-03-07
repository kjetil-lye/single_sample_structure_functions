CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T103552        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?�(��#�?��;�`�?�x�x���?���M?��y��q�@ �p׮�@e��T�@�5���@�}OsA@9��&�@!��i$�S@%��I�*@)�x�p@.��X�@2s��@4����O@8	!0�h�@;j�h�c@?�2+�@Ay��Bϝ@C��t�@E����@H"�8�R@J�3�}��@MD�=��Q@P���"@Q}T�؎@S�*�h�@T�-ܒ6�@VRv�e�@X���X,@Y�@*P#@[���)@]���2�E@_�jc��@a ^�0�@bg���w@c@-�:��@dn��3�h@e����2@f��6M.@h4ު��@i�q�Ӏ�@j�+�@lR�`@m�\��@oA��ճ#@pc�����@q+d"B@q�ը�@r��Γ�@s��JK*�@ty�����@uY3���@v=u�qǉ@w&}�;�@xK~��@y��g�@y�6i�F@z�Pqb��@{�+@��@} ƍ�j@~#f�!        ?�WD:�9v?���f�$:?��t_�vX?�*��\b?��H���@���٪�@��um@�/�ـ�@ � f	@&١�%�D@.49
�tw@3y�g�n@8�����@>���?�C@B��j�ђ@Fo?��@J�]�`�"@Op�pu@RU�r��g@U3���!@XT/U�ks@[��
�@_c��c�@a��C��@c�FE���@f
��~��@hs3�C�@k�l�@m�mm�1�@pJ5�_��@q̰���@sclʃn�@u�F��z@v���<�@x���f�l@z�����%@|���wJ�@~���%�9@�h�yL��@��SQ���@��YD�<@���Gp,@�4ZC)�!@����f^�@���r_&k@�I5��8@���WI?@�>��쥑@�����p@�e�����@���=���@�_I����@�>����@�%�j8�@�`5�U�@�7��@��7�<�@����-�@��3���@��^���@�!Гh'.@�;�@�Z����t        ?��u.�Id?�by��d4?�I;Y��?� �m�\�?��6��Ν@R�R=�@	;+˰@�G��_@#�-s$�@*�3gLHk@1Ð�/�@6����@<�S(&�@@A��%��@E�̠|��@J]��%�r@Od-k��@R}�Ĝ�@U����<Q@X�Y'�?�@\�.1~�:@`W9'��@b�0���@d�a�c�@g[ݚ�@j�[Fc@l�S�]�@o���WAz@q����@sA��p��@u
b6��@v�X_*��@x�'<`�@z�U��X�@}u'y0@T�tj@��yKj��@�
�:�	�@�LR ���@���|F�@��> 4��@�V@�U�@��|����@�?���:�@��#'�<;@�UK�(W�@��+oMG�@�J�l� @�"���@�����U@��E��@��N{H��@��-�-Q@����P�7@����̖)@��LI�@��З%Li@��
ɻ@����A�/@��~!�¬@�Ù���;@��;q��=@��Xy/E�        ?�pY�|�@��U�(�@-��彿@>�]"�W@J���É@UP�I@^���-
@e )I�˅@k��o�p@q�� �ai@v���y@{	�S]s@�C�qy��@�L~GI@@��E�&�@�@���'@�0-xep@�7�j,ȯ@��a"��M@��ܡ@��V	�n;@�W�@�J�BJ�@��F�+Mq@�[���X@�!I�nI@��qL��P@���XqI@��u�i
@��I��@�&]�c/y@�7Z��5l@�g+r��@����؀�@���S�\@�<��1�@��jQgpD@��Lh�@�|�sL�@���q��@����R\�@�%z�k�@�������@����g3�@��S��j@���q@�j�`=0e@�ZƮx6@�P�efJ@�L� ��@�N\-��@�V%Q��@�c���E@�w�E�>�@ˑ�4�-
@̱��F@��#�?/}@�����@��N��@з�1�Z
@�Wa�C.@���v�O@ҟ�Ή�*        ?��*�Ys?�����`?�ɰ����?�c��G�G?�����?��
Cŷ$@)�#Y��@``f.4@�ܐ;�@���n@�~^���@"���]@&eN��b@*_�9~]<@.� ]N��@1��zDA@4/�+<@6ݮs&Iv@9��Td+�@<���;@?�C�ǵ�@A����r@Cz98rz@E\�I�d@GV��W�M@Ihۦ�8�@K�@!ޅ@M�c8f�b@P[H{�@QQ�;_O@R�6�h�
@S��w}�@UG	��]�@V���G�@X'6YC\^@Y�M1��@[7L6�n�@\�	��@^v�djگ@`�-���@`�a���@a֕��@b��D��
@c�>~r�@d��	�@e��*>f@f�az��@g�����@h�[H�݂@iēǚ�@j�@Ȭ�n@k�`�4�&@m�3@n?�]̑�@ol~�U��@pO8�X�#@p�鏡�@q�O���p@r*i?���@r�4���.@st�{�@@t�� @tɷ�Q�        ?����)�k?�K��� ?��t Y?��ۄe?�j �֠?��$#ᡥ@ұ�G!b@ͨl�@E@!��`��@"�� ��Y@)O�.Ю�@0�a���@55:$S��@:�`��V�@@q���^I@D�Hc�@H�G��@L�l��5@P̢~iP�@S���Vd�@V����@Y��h�tk@]�;�Rh@`��D^/�@bב��@ediI\@g��?��@j?�D�@lА¤�@o����(�@qbrС�@r�y^��@t� 	\M�@vz�6��@xY0 |�=@zN?�F@|Y?|�6�@~{��,�@�Y�����@��s��D�@�������@������@�=&�9%W@���V���@���!�@�`1"U%l@��2_b��@�[��0�@�꺒� X@��F�h5t@����ل�@�n�*�%@�M�%�#@�1�G��@�����@��vO�i@���d�@@��i�@��vĆ|�@��.:@��2���@�%<��� @�=�� �)        ?�hPʼ!�?�P3�Q?Ӄ)�O{^?�
z/�:v?���U)�@����\1@]�l�@":�&��@R�/l_=@#7�2W�X@)RS�0_�@0GF_m#%@4�my?�@9\�I
<(@>�y�Wp@B�r
�B�@F@bA@I���{�@N.�'aZ@Qlo��P�@S��W
F�@V�F�G݈@Y����o@\�����I@`%����@a���R�u@c�@:}@e�A�~@h%�Ⲵ@jr����H@lޤZ�?�@oj0��fk@q
��-�@rp[7r�@s���T��@uk��=!0@w���{H@x�~VS
�@z]���o@|#����@}��E	,@����.?@�����@���0t�@�����jv@�y��A*@�%�F���@�H5Ѡl�@�r3j�{�@���Ң�
@��Nn>�m@�dId@�g(j�*@�����>�@��^$�@�7����@��r��@��%)��S@�^��=F�@����Π@��S&D�@��~9�@�rצ	��        ?��fh匁@�8 +�@)>;�DI@@9�Ł�@F(�(b��@Q�
�b�@XZ���8�@`�q�1*o@e���Οc@k`=�g��@p�Жy�@t�X��e�@x��p�.@|鰲�)@�Ӯ�?��@�cOH���@�$0�@��F��@�;��j�@���̼�@����/�@�m�x�@�g����@�z�鵍�@�����U�@��fQf��@�T�^L�K@�i�T���@��	����@�����@�wm)�k@��?���N@�nq��b@���o�q@���`�5�@�D��|A@���/�@��;�|L@�ȏ�$�@��r%]��@���ֱ�@���_�@���6��@��y	Z�h@��L��e�@������@����m:�@�o/���@�1��w(@�\Ɯ%�j@��e\Z�@�Ò��Y@��D�t��@��:9s:l@�C��Fcj@����)�@i����@�=� (�@��*��T@ĝO�vI@�P�S	��@��3��@����N        ?��*P�w?��N4���?ӆ�f�ޠ?�o�.*?�9��؍�?���q96@ϰj'��@�4t l@�"�@.(k��X@'[�M<�@"j�.���@&����@*-&����@.��;_,@1��'��=@4J��%�@7��AM5@:��ł@=0/��7@@D��j��@B
�9+�@C��c>-@E�z撞<@G�;+�p@J 9��@Le���y@NŤ�O�@P��t41@Q�\K��@SA���h�@T�R�:�@VPK.�@W���G�@Y#�a*�E@Z�p��?@\d�qI�@^��}/@_ؒ����@`�,�z9@a��U�@b�{�IRD@c��
��@d����o�@e����Ћ@f����E@g��1Kd@h��ΕV@j�"�`@kA�;�@�@lqr���@m��L,�@n��Kez@p3_Z@p�N�&}b@qa�TC|�@r_��0C@r�LOm,@snuc��}@t#�)�	@t�x�/E@u�Xfc�>@vW���        ?�Ӏ�Ѱ�?�q��M�?��B}�rR?����3�?�+Kn�C*@1���0@���o�@.�* @��4�@$���&��@+7\���@1��LP@6M��@;��,˚�@@���q�@D��K�B@Hx�j�@L�9�3��@P�/c�@S���!}�@V}�
20@Y��c�O�@]��8��@`h�p�2�@be��|��@d�����5@f�<��@i1%��0_@k�ص�7@no��y�@p���tL@r#	\���@s���X�@u[���;,@wo��D@x�JF �@z��2<�w@|��#�8l@~��>�LQ@�tv��$�@���Q��@����p��@��7:Z�@�f+� @�`��$|�@��jB��@��_�nN@�l�w���@�۪>X9o@�U����@��KI��H@�4�z@� �����@��õ��@������@��P(|��@�ik84�@�P΢�CY@�=t{=�%@�/VZ�CK@�&m�2�A@�"�Q�@�$ ���^        ?��x�J��?��%ю�?�1��Qg?�b�*Je?��.ԕ�	@�7:��C@M
�q��@�J(�-@ ��*q�^@&������@-���M~@3	�%T�9@7���z@=�<ߒ�|@A��
��!@E�pX�J%@I�"��{@N�=�(�@Q�|�N��@T1���@W�]8@ZL��,��@]���.��@`��)�J�@b��ZW@d�J\es�@g��2rY@iecJ���@k����@n�b�Y�@p���@r+d��p@s�b�6�]@uY5`�@wCp}y�@x�I.�@z�J-	+�@|�sji@~��-@�I@�_r��q�@�vA�m�@��z�� ;@��4D�*`@���x!y$@�:�<��@��Ih�@����g�@�>o�}��@����@�"�b���@��1P�۱@�~3�h@�����P@���K2@���Ŏ�@�l�2�~@�O�W��6@�7��l��@�%���y@����O�@�Q��(D@�Pe��@����        ?�=ɭ�@��17:h@(s�pQ@9����@F�w�w�F@Q�����@Y��bI�@a��jQ_�@g\>�\i�@m����]@r��zyU�@v��r�@{*DC@n@�j��@��ѭ@��&,��N@���x�8�@�7V�'v0@��1&1��@�և���I@��I3���@�
�2�S@�R��{@��Y�
�y@�A�
�@��jT�[@�V��y_@���	�U@�M�!�{@��h@ª@���8S3B@�9	/�-x@����\+�@��`�oD:@��O~Z��@�W�����@�[Z���K@�g�Kʔ@�{)�1Y@��$�@��vy��@���z<x@��ub��@�Y���!�@����@��J�V& @�B��}@��%4�k@�G��@���j�;�@�v7v5X�@�5�x|	@��Ѣ���@��׻���@č��w{@�^Gp��X@�2�d�Q�@�,!}�2@���{�#@��s��B@ɭ<���@ʖ#�M�@˃/W�I        ?��B�6��?�`"I��?��h��$?��� �?�,| -?�VY���@��8V�@
�����@f)KD�@�@���@J�nl�@ �{�q/�@#�(�2`:@'F�&� �@+9�H�@/5�!���@1�)�!?@4.kG��N@6����f�@9^&��?`@<0B��Q@?)�D�@A$J4���@B�x�
|@D~,��S@FH�*��]@H&�ODL�@Jb�<�7@L&8��@N7�[l�f@P3��t�@QTRo���@R���9�@S��+ �@T����<L@VAo=ԭ@W�����@X�`.z`�@Z`1�Vy@[�y9�@]Q�W�o@^�fۉ|D@`5<�h(�@aoAV�B@a�1<
��@b�o0�9@c��+�@dd"��@eG}�:�@f/!҃ړ@g�ʟ@h(w��@h�~�T�@i���2�@j�����@k�!/d��@l�����@n��[��@oߴ;o�@p�� oF@p�'�}p@q$	G�ڤ@q�l�Ƚ        ?���
���?�H�Ē�m?�e���\�?䟣�ôU?�NgS~�x@�f Uva@nU��@io�cY�@��o��8@%3��@,X��%@2t��O@7~�i{1@=Y/��A,@B����@E�@�6�h@J2�`�<@NڑWs�@RP�OT@T񢙫6@X���s�@[���)�x@_9�#�Os@a������@c�⨮��@fҠ�@hppG� @k]�Z�C@m�!z3�@pLv��v@q�,I��7@sc�=�=�@u�p|��@v�I���@x��!A�@z}�p�s@|u��l�@~�_�SU@�Q)�M�@�ki>�.7@���ž��@��[�N�@��N�o	@�:	��@��L�+��@�޾_�6@�@h犱�@��F�;�'@�"M�S.�@��n�g2@�L5�Ap@��\%ݏu@��\��ÿ@��A��n:@�[�jR9�@�9��q>P@��ʵ�/@����?@��KWc�	@��v-�O@��-���@��f�6G�@���@$�        ?�"~,��?����EE?Ҁ�CE�?��J�qy?��89e�h@ �z�[@
���)w@�6�r�9@��-yf@# fV���@)ix���.@0w؍�c�@4�)���@:�k'��@?�9m@CTrc=�@G�`on>@KR_�Q`@O�����@R���ekT@Ue&�9�?@Xx��9�d@[����i@_i3���@a��q/ؖ@c���2<�@e�L�l�@hK%�nm�@j��P�z@mrB���@p2z�h@q�a�,�B@s$���Jg@t��v��(@vxn�/��@x?�*���@zF�ѕ�@|
�2�+�@~�~|�m@��l�U@�*"p<TN@�K$$M�@�v�d��,@��௢�^@���u�V@�9u �t�@���j��}@��j��@�]�AjL@��)��k@�W����@��	M���@���kW�@���t���@�h.T>��@�EMV��@�(c�3@��E�R@@�����` @��`�h�8@���j��@���eX�@��v.9�        ?�~��φ;@|��?@)e�o�m@9����@F2�x!W@Q�q0��@X_C7hO@`���OX�@e���hj�@kS��)q@p��<1@t�`tq�#@x}'�� �@|�j��@��hf#�N@�YJ��1+@��g}@������@�(���L�@�w���@�z�njt@�P�3xʷ@�=�]1T�@�@�Q+Z!@�Z�C��@��Jx|�5@��/('�v@�d��@�O�
|@��;i,�@��4׼-@�="��ߨ@��7Dv�+@�� �kf@��n G�
@��V�t@�����o@�R8i�|�@��ޓ�@��õ�W�@�����@�����q@��mG@��M���7@�{��m�Y@�x=�e�@�y���s�@���)]�@����m@��n�T�@����/@��Z���@�䷄I��@���Dh�@��|��@���v��|@�C��׶�@��IM�9@�y!�^�@�붩�@÷%����@�YT�"�@������        ?�z�.�-�?���8xz
?�{LΡFg?�����"7?�u4zy4@d��;�@�1b���@�����Y@���K�@"��{��@'"�Q��b@,��9�7@0�v#O�@3��r,@6�M��Q@:u$��i@><2[��L@A%[�6ߧ@CQ	`@E���][@H��W��@J��[D&@Ms�,���@P,Լ|�w@Q��l��@SJ����@T���s�@V��:H@X��暁�@ZewPo�@\Y���{@^`^h+��@`<���Q@aR(ˇ��@bp����@c�%��@d�s�j�;@f�S� �@gC��tR�@h�و:L@i��S@k?>qUƅ@l��n.@n�1`Z�@o�K���1@p�?���~@qH5)�@r!B�@r�EG�@@s��i�T�@t��<�9�@uYg~/E3@v5��
�@wh]
@w��10��@x�JC���@yϕw�'@z�����@{���1�@|�U(lyV@}��qTB�@~�ܑ��|@��jkeP        ?����('!?��jUxv?�[	N}?���0ՠ@ ��0�XU@!�aM��@؃��x@ D��	@&p�	�^{@.\��$�@3��O>�@9�r��Du@@�3��@C����@H#�^��@L�P���@Q*.��tk@T"ܫ�ԇ@Wf�I��@Z�Vx��@^����5@a�S\�`x@c�]�0\�@f3Y�ץ�@h��L&�W@k����z�@ny7A���@p�x�8u6@rl�i>�u@t&dL��@u��H���@w�$���@y�}b�@{���3
@~�'���@�1�@RF@�_v��#x@��<8V�@����8�@�0���2�@��I=LW�@��
���@�m�7?�I@���Eco@�}�*1�H@�r��@��}�U&%@����9/@���r��@�}[�`@Z@�h�%Q��@�Z�,�@�Rw�eގ@�Phi��@�Tt��&@�^�k��@�n��"��@��� T�@��Y����@�Þ*Xeq@��ԼYz"@���D�@�&�Q)J        ?�� �:��?�T|Yܡ�?����ab�?��nT�@I wy@��j6��@k)
߮@ ��b�@&p�Uo@.A�A�2@3���,L@9e�$��w@?�g��@C�*�|�@G�o!�6�@L�d@�A�@Q#ц5]@S�e�EZ�@W3|�@Z����@^�Mx �v@ac!=m @c�=��}Y@f)ae��@h��� �@k\��y�0@nF�]У@p�Q���@rO�#��@tb�?f"@u��4p}N@w��D�T@y�P��@{�|}�I�@}�?�� =@����xj@�K��D�,@��pqKs�@��]��8@�z�E7@�{��@G�@��v ���@�]f��O�@��=e�u@�pI
[j@�=h�%@������@���<G��@�����@�{ʭv��@�h����@�[�K�*@�T�0FRi@�TT�̤y@�Y�f';@�exT	G@�w,�*@@���3�1u@����Xc@��O���n@���l��@�)F ��@�/;h�R�        ?��)�;H�@ �gk@6�-@���@Gs6����@T1x��@_)c�U(@fV�ѓ@nf���@s���e�@y@��S�@Mэ�2@��zE@�@���l��@���q�@�PPv#,v@�H�+��@���k��@�{ܷ��@�zh�>�@���W��@����r@�Q��lF@�6!US4@�3����@�J�6eiH@�z���@���V��_@�&��1�@�Ьgs@����~,@�qC���@��.e���@�C{`�E�@��&�_0@�G.�� @�ۑҡ~.@�|Q7�@�)iz*�@����-U�@��E?s @��>��^@¬N�
!�@ák�>ݼ@Ĝ�����@ŝ���o�@Ƥ���7�@Ǳ_l�%@���@�@��3�C�>@�����@�����@�F��e��@�t�Z�ʮ@Ϩ�+�ܱ@�p�ޤh@����=@ѱ����3@�Vj�%=@���>�H@ӦF����@�RTO�@� `"��@ձ&��        ?�	�1څ?��5%��?�d-�&c�?��/4��7?�s�s��?��p�6�?��˶v@r�e�@
su�VGU@���Q�@(�c"f@��;ez�@(N�Z�T@"{"hi!r@%����{@)�j��;@,��D6�@0t��Y��@2��2K�@4�}�Z�Q@7m��Au@:�Hk��@<ٽ��z@?�/�G�@As��G@C2��{�@D�ԯ��@F�6l_�@Hs~���@Je���%@Llr���@N���|=@PZ���@Q|fl�B1@R��8�<@S݈9�aw@U;��@Vg
�k7�@W���Q@Y<4��@Z�:n7@[�z���@]o�VBxK@^���%�@`B��z9�@a�y3��@a�l�i�@b��O��@c�e��h@ds ���@eW��R�@fA/��g�@g/p��~�@h"y���@iK-�@j���D�@k5�R�@lFC��7@m)@}N@n8�ɍ?H@oL�T�$3@p2���@p��=O[        ?�g~�?���g�@?ƌ�s/�?�pV���?��q�I�?������z@����k&@x"�Wg@���@л��]F@$ɐD	�@+Kx���0@1���p�@6&��#@;G���3C@@�<��خ@D3g��@G����/@L����s@Pb�#�A�@R�!���5@U�-�<@X�v孩�@\7N����@_�y����@a��K��(@c��H�5@f'���n@h��Q�y?@kQ��4@m��GnpE@pFn����@qĩwy�V@sWXݻ�`@t����܇@v�#B]r�@x����	@zs��su
@|pRcl@~������@�U�N�@�t��\��@��BWSQ@�ԟ�t�@�_�|;@�ad\��@����r$@�^�u�@��`(�	�@������@���QB�@��s�4@�Y��i5�@�-+�E�@�g����@��Z��4(@��RA�@��a�@��@��o�A��@��,Y�+@�����g�@�����&�@��Y�T�        ?�ߦ=h�?�n}��.?�d�`��?�_�6�6?�Hop�@ RH�@	x��V�^@�:w@2z���@"��J�+�@(�AX,E@0%��*@4�|0��>@9��L@?R�~Q�@B���92�@F��b[�@J��ێ��@O;�fX*@RƱ�@T�Hrd��@WΛ@d|�@[�@O��@^��~.�R@a���@c �a�u@eD6�9�;@g�,��+�@i���;�F@l��sg��@o@�����@q�Г@r�sk,~@t&��s�S@u�J�'
@w�i�+@y`[Ƭ#@@{Gap�L|@}Cg�~)�@T�V�ٓ@���a�[(@�����v@�2qc�g@�9�c�&n@�yj;3$@���ǘr(@��V@�{��D��@��&�!�v@�b(p�N�@������M@�wp�ڹ1@������@�^	sV�l@�8k @�.mF�@��;���@��L��5~@��fi$/@�ԋ�u"@�ҿ���@��Xu�@��Y��{        ?��/s"�@��2�@"r ~.@.��L��@:ӵ�L!�@Em���@N2&��@T��.؍�@[�gѼ�@a����<@f-��<nI@k(ȑ4�@pZ�E/@sky���@vȖ#Sz@zs���YP@~n@4���@�\�x�Oc@����kd@�$��@�ƫO�C@���R�m�@���(�@���D���@�`[�t;@�<� ��@�}���@��*I�/@���1r��@��Pg�@�<,.��F@�?H�=FD@�k��1S@�����Z�@��[��XW@�2�tZ1@��,�G��@���r��@�\�2#c-@����e�@�Y˺��@��~*Ὑ@����5�@�����h@�j$Q���@�F��V�@�(!�BX�@��#��@����>��@��vs$�@��_���i@��U�H<@��W�D�@��d���@��yr˄@����r�Q@��ԼTT@�'�=��@�E��4=@�43d�~@����
�@�^f8rBv@��.�{��        ?�IOU�DO?�5��m�Y?�ԉ{_y�?�ā=���?�i���?���Ĥ@{�?R��@	E����@�X��b�@-|��:@0jk�5@ٓ�JvZ@#�_�@&v�0v�j@*,��@�@./8o��@1?  ���@3����$@6 �
EՆ@8�n�Fs:@;\�'%c@>E��P1@@��dTX@BF�y<[�@C�ݎ���@E�%<j�@G��Dʲ|@I��S@K���s|@M�õ���@O�2��@Q��f�0@R-"�aY0@Sa�\f&A@T�"���@U�c_��@W>��ۯ�@X��g�c�@Z���t@[x�7��@\�J�`u@^~%(�3@`2��P@`֥8�H@a�_�NL@b�h�w�e@ca���@dE�ۮ�@e.��=�@f�_�@g����@h
 �1@i�)�bl@j���sO@k���a@l$5V��`@m7���/@nP��;�F@oo,�xi)@pIGОә@pݍE�C@qte���-@r��rp        ?�j�,*��?�O�!p_�?�W,յ?�G�n�?������/@0WM��#@�Ek6�@#�wg��@"C�3��d@(�<���@01R�g�@4Ā�p� @:��[�@@!�<KF^@C��i��@G�m��@L�a2 @PyA#�@S/Q���@V(1���@Yet5d�@\�_-�i@`Y�123@bc�tV]�@d�rW�$A@f��;$�H@ia���$8@l+nn^1@n��v�y�@p�!�@rj]B��M@t
����7@u�&#��@w�'����@yi<�n�@{]�$q'q@}g��_��@�>
�?@��p@.�@�P����@�5R��:@�q�B}��@���sv@��E���@�i�����@���ŊL�@�G��S��@��k��Ur@�R�����@��t)s @��a�Q��@��׹��D@�w���@�Y�[,�@�@�\�%@�-i%2�j@��8�@�Fӱ�9@�\T �g@��_��'@��,�"�@�+�bm�@�=�'��H        ?�K�Ǎ�?�<Ѿ>v?̓���&�?�FN?�E���#@ N�/�@
����@l	Y)O�@�����@$�Zm�W&@,$��^��@2�ĕ�3h@7ԑ��r�@>��K��@B�X�m�@F���j@Kf+oWI�@PP� �w�@S;;�1�@Vuwp��@Z�7c@]�x�+@a�r"�x@cY���K�@e�	��Ð@h|�Y��@kW� �_Q@ne|�m��@pӓ����@r����F@te����@vX	l�@xf��L�@z��Gۚ�@|����u�@CRv�@��_���@�6��;�@����X,�@�
�i�@����_#W@�s��tr@��v@ct�@�v)����@�:��C p@�Eũ�`@�{|.N�Z@�wxӉ]�@�|)�Ao#@����t,�@���M�3q@�����:@��7���B@�]8��@�R��?��@����9��@��z\�b�@�8B���@��V���@����߮�@���`48p@�vh�C
�@�8Đ-�        ?��nl@G�S�@'>��CG@8�F99*@E����po@P�K(�@Xz�U�[@`΁LP�@f(�<b^{@lP����@q�����@u�M��m@y���TD�@~�j磽t@���W��@���Ë�@��+d(T�@�2�\:@���I�@�&���@�!WG@�8�7	c�@�m�S�g�@���^E�L@�1�j9EG@��]��mE@����@,&@��j�k@����Way@�����@�����Zt@�Jb��~@��/7$� @��O���S@���Ѽ9�@�m���[@��h��)�@���} �A@���#x.@�ì.��@��W�@���$ߎ�@�1\�My@�Ms��@����UV(@���A��$@�!�&J�@�V~�|�@���2g1@����4N@��S����@�p�3J@�,�jkzj@��z�J�x@ðnѫo@�x{�\�@�D��G�Q@���<�T@���]��'@�����@Ȝ�5�Q�@�|ʾ��f@�`}�'e%        ?��lz�5?�R���"?�r�r�4�?�e%^�ީ?�1!V���@ sOM��@��eIi@"oS�@i f@Ͷ�Xo7@ ��dtj	@$ ܐ�9@(b��۔@,E�_W@0q	�[�@2�����|@5�6�=_@8sM�2�@;|$���@>�ԗp��@A<a�M�@B��	�@D�u�Q��@F�c9�1�@H�Հe�@J��,-�@M/$\i~�@O��@�@P�:S�e�@R>�(��:@S�/�� K@T��%@VP�/��`@W��E�>@YC+:V�@Z�Vk�@\en$רF@^`��x�@_��4S@`��ۤ�r@a���K��@b�Q�o2H@cr�gT�@df���@V@e_�Y��@f^��,@gc+g >@hl�1Iv*@i{��K��@j�h�1��@k�4(I�k@l�_S_�@m��鵣T@o�pd�@p#�&��>@p��{�@qZ�XX"�@q����@r�$v<��@sBL���@s�)���*@t��=�u@uA�ٍȴ        ?��?X��y?��M1�ג?���P?��Âd?��C??�(8$gk�@��/'��@8/���@A��J�@ ������@&��:�f@,��m@2$�\K�1@6�6�r^f@;���j0]@@�L�Jd@Dl݄O~@G�lE�@K��c�u@P/\'��@R��A4k@U%���@X����@[lr}�@^kn��@`�in1�@b�ɱ&{�@d�(z�<H@g	��+�Q@iM����V@k�gyE�[@n5��4��@pm��:��@qл.���@sD��~J3@tɦ��z�@v_��x@@x��1�R@y��N���@{����k@}e���=@SFV~@��y�A@��dPd�F@��x�A�i@��� ]�@�t5_B�@�2��%��@�j���@��>�~�/@���u�d@�J�K�I@����Ǐ�@�3����@��gќ|)@�Ѝ�ߪ@�B��l�@�,�S�@��xG��+@��ݴ{L�@��aM��M@�_i�#�@�@�z�        ?��٫�2?�sZK��?ش���/?�4a��g8?�%��@�i��m@��IGS�@4n{Ug@ %��@@%���
W@,m_��e@2,6��I@6Ƕ���s@<��u�@A	4V�@Dq��L[�@H<(�F[8@Lp]�NO�@P���J�@SK�Qn�@Uժ�f��@XԨ�[
@\�R1S�@_�S�2+@a���I�@c��?�*@e��=�]@h �̰@jdOdو@l����n@o�:o��@q1�OB$@r�x��4x@t7�H�)@u֭3kS�@w���<�@yM�I��@{&��6�u@}���@�A�y�@��>ǓHO@��?�Cu�@��l�ϗ�@��࿃��@� ���@�^
�MK@����qUt@���,��@�U�j�0�@��C�w��@�1�=U�3@������@��h~�-@���g��@���j`[�@���11F�@�gẠ=�@�H�]`m@�/箚*@��ka�@�K��O@��"��\@�e��r�        ?����7}�@҅�)��@-�V8!�@>a�-��L@J�7@T�gR�@\�����u@c~��`@ilҪ/�m@p¾�N@s�P�~@x^���4@|�2�]f@��~���@��kRlN@��aEO*�@���fJ?1@�7R�M�@�m%�;e�@�[��W@�gf�Z�@����-�@�ל�H�@�<s�յ@��X�O*�@�09�K�@����p�:@����@�}4Qφ @�
ۜ�I@����a~�@�T�'�>�@���k�-@�ܻ�a��@��hCy"@�Q��ݤ�@�O�o�@�U���V@�bЛ��@�w�����@���f�:@��ؔ|y@���5�$@�#����@�WvT�@@���<X@��g� @�:�GR$�@��GX�@'@�|�M&�j@�1�#��@��	PS�@§�~�@�h�#��@�,͡+�Y@��Ģ�D@��^ej��@Ə���$@�b]�G�@�8���@��Q*�5@����ޱ�@����]�        ?�ַF��?� ɲR�?���hS?��k�N)J?�dk�g?�!˵�j@��,��@
��en�Q@�:�m@{[�n�@�)Y|K�@!�]΅�@$h�c�C@(n���i@,)$�KE�@0E�d�@2�c��*@5*<b�3c@7�m�	�W@:���|��@=�4���@@��C���@BG��`t@D�u+4}@F[<�Eh@H
 ��j�@J(>�h��@L`g��.^@N����g@P�ߤK��@Q��9�@S%)B�w@T�2��@U��̤�@Wk����*@X�-#��@Z�k��׮@\.��tOl@]�v�@_�^c��@@`��]{y�@a��$�^�@b�P��@c�1,n��@d��[�@e�zG�_@f��Ӎ~@g�k�S@i��@j.z����@kaε��@l���|@m���"��@o*ު��l@p>�Ž�@p�]�Oh�@q��Ż5S@rSoΡ�@s���@sʛ�z7�@t�,Y'ԑ@uQ��^�*@v�|��        ?��81�H?�f/^�?��n���?�H��0J?��'Cl�6@c��\(�@�>Dm�@�e��_}@���Dd@$��|C�@+�����@1�nwc�@6�����X@<�1~*�~@A�Yӌ�@E@����@Ij��@N�b*�@Q��+�a�@Tit�ΕV@W}�q��@Z�:}�@^tc��9@a,���_�@cC즟,�@e�C)@g��e	ĭ@jg���X3@m�X�%@o�p4��$@qqn�Ѷ�@s'���=@t�yb�T@v^t#Ք�@x*"R��)@z	�M�~}@{��WV7@~���dx@� �k�@�&Y����@�Gw�~��@�r}kS#g@��k`	H@��B�U�`@�/Ƕ�@������;@��B%|T@�D���n]@����g@�/Y9�V�@��s@��:@���j���@�l���u�@�=^t�p@����@�횢>�@��Բ�#@��P��q@��r���@��ko�'@�{9	�H@�r���.@�oHTBV        ?P����f?���=��?�zp�f�?�wX�hb?�] �?��]>��@䓈�߃@����z@�_ @!ӻ�T.@(�U�#@/��s؛�@4>Si�@9n$�@?d����@ChIw@F�י���@K(���L�@O߶�5T@R����A*@U]�P*a @Xs6uo�@[� 3��@_c�n��L@a���L�B@c��Dz��@e�����@hA7����@j�=L�-@mb�����@p�^ou@q�s���"@sv��&�@t��Hs�@viQwtE@x/�3�r�@z	���$s@{�-��=y@}����@�	"B�Q�@�,.@�?��=2o@�jga��@����ʥ8@��� �@�*�򲿦@��AAI��@����bٸ@�K�q��@���ifY@�B@��S�@�Ͷ��Nv@����:�@��d2�E@�X&~�@�33��z@���}�@����i@����(q�@����4%@����v@�����@��wh�%        ?�VE�g @-�2�6@&�(T�@74�7��F@DQ�`1y@O�F��@Wύޏ�@_��L�rY@dܪǧd@j��g"�@p��� �@t`h�֭@x�_7D@}�˜�@�	�*v�@���G%_@����y�D@�����@�G���u@@�v)��t�@�gQ�� |@�x=�+�@��	�V9@���9'͘@�nkmv^�@����@�^-�p{@����gN�@�K�C%*G@��!8�1�@����;��@�72U8&@��鿫��@��<̩�<@��D�.@����F@�����5H@�>�_�Z@�)�~�@�E�c�Q�@�v
����@��0-
��@��D�,�@�B]�5m@����y�V@����؟�@�ilz�$@��>�Z�P@�0�1J�@��{}�c�@��{8�o5@���T@�g9lД�@�BAF��@�"H��@�o�	�@��d�ד@����{�@��	Ǹ�@��H���@�У�@��
�:��@��r��x7        ?�@g�1��?�i��Ɓ?���#B�c?������?�Q���`�?�}�' Q@r	�s�@	G�P��M@�- n
^@9�f���@j4,�(u@ ��@@#SU[���@&�~=@��@*�:~�� @.�8'��3@1�.�@4*��
�@6ȍ~�=�@9��C��@<�6��@?�j�u]�@A�^���%@CMj�^�@E+0y��@G!��u�F@I2��@K[�a��@M�8���@O����@Q:+�&�@R�D��B6@S�ܠA�@U>14	J@V�k�qŦ@X0��X�@Y� v؄�@[[��Z@]~ ��@^���ѻ�@`C����F@a.�M�|_@b �E��@c�\�&0@dp'�G�@e ;]i]�@f-�[�X�@gBqz�}@h]�N�#T@i�X8�@j�j�`O@k��Q��@m���^]@nM'!@o��ޫB�@pnx�5_�@q��Ի�@q�4��%�@rtEe��1@s'ε���@s�Ү��@t�R�p��@uWO9��        ?����Sp�?�)QtX�?��l�[��?�R� ��?�����:@T��y�@v{�ē�@����Ua@�P�j,�@%�!�l@,ٰ@�>1@2�H�O@7����1@=7����X@A�3&6�@E�x$��@I�H�f��@N.�9�^/@Q�ly}��@T]�(��X@W_�]���@Z���ë@^)��@`���B�@cf��u@e0�+�C@g�w+��@i�(�8�@l����@oX��Cu@q!�_Ѩ\@r�fTq^k@tIiבFx@u��n@wû���7@y���̡(@{����k:@}�.M�q@�V��C@@��bU�#@�]��q@�H�����@�����]�@�ǒ��|/@�t�(�@�r>�0d@���_m��@�H�ȁ�:@����讻@�JAZ�c�@��i��W�@����DH�@��$����@�h_���@�FW��@�*"��V�@�jg\@�4T:�X@����`f@��g�;�@���ּ�C@�����T@�������        ?�%#�`�?�Ñ���G?�>�h��?��b�~/?�t���)�?��7�Z@	ԡ<w@�G�@XdI!@"����V@)�u�%M@0P�hҍ�@4�u~�z�@9ݤIQ>@?����`\@C.K��*H@F姎[&x@K�׺�J@O�w��;@RJG��iE@U��n�(@W��:��@[*y`��G@^����T@a%�G@cȢ�Ҷ@e9S�B��@gvت�@iճJ�M{@lX�&VY�@o 5�	�}@p�'���@r^ܟތ�@s�zW�z @u�5RS@w;5+P*�@y ����@zف<�$�@|�����=@~�%�Ff@�m [vO@����[��@��u8�t\@����Uj@��Z(�V�@�2��Yl�@�w���+@��]��7@��I�+�@��=@tS@��DD]d�@�b��+hb@��`F���@���\��@�Sb�@�M'���@� ,
�@���2@<R@��&Q[N@��G��$@����0@����>z�@�t�:9�        ?�|&i|)�@�&��l�@%/~^�M�@6r-��2z@C�x@N����@Vs_��Y�@^�/�h@dR�@�6�@i�͟W��@p0��̝�@s����@wǭu�UR@|/zJ��v@��e4f�@�!��i�@��� �3�@�}����@�X~L�X@�ߥN���@��tG�@�ў(�E@���mϕ\@�/�4Vq�@��:`��[@�^�y�M@��N�5:r@�7+���@��^��"=@�*`�[��@��Z�eo�@�a��b�G@�5��"@�޻�T��@��Y/�gj@��8��v�@�Q@�<�@�Y�/v(9@�ki8�)�@���0���@���6�@���	<`�@���7@�P-����@���E���@��)�K��@�G�\5[4@��j\��@�q��t@�HQ]�@�f6tR@��?��}�@�5���@�a�t$�3@�3_��dZ@�	G�uA�@�� G��@��[��Z=@ǥ�}��@ȍ\H��@�yf��x@�iq�-�B@�^44�O�        ?��;sAM?����q�??��v�g?�s��� K?��Ԓ?�m�I+M@����@
�*w��@���۔�@d8I�M@ǡ�rU1@ �0�d@$9��@��@'��G^E@+��¡@0~��B@2liߓ@4��U�@7�U5��@:r�����@=x�.g-v@@V�h+�@B�_Im@CΠ?�L@E��$���@G�6W�U@I�Q-?�@K�<9V�@N7Vߥ=@P6@F���@Qm�̤@R�`�*
�@T�1߶N@U^ЗrI@V�-��<4@X<����@Y�h7@[M�+R�K@\�ׅA@^����-@`#q�\@a`�	��@a���7@bٌ8��@c�ח�WC@dȡI��8@e��.:��@f��.�@@g�+C\/@h�6v��@j� 䲸@k3wM�aQ@l\�B)�@m����!4@n���>X@p ��@p�o���@qIT��e@q���\@r��쀇�@sO�����@t�B?�@t�[��        ?�� �/�?��أQ�g?�Z:�?M?�Uk�O]?���b�@ l�?|3�@
1�y�D�@���aF�@
�w�܊@#H�R�� @)���qi�@0����@5=�*�@;@:��@@FSҳ�@C�쵵�@G��/�j@K��f��2@PO87�*8@R�eAK1�@U��0$4@X��f�J@\E[�!�@_樷��}@a�Gߨ@c�|�9��@f4%m<@h��ɡy@k/o�w�@m�s ���@p@]n�C,@q�/l�	�@sBמu�@t�{�	9@v�A3�@xUJ�	�p@z,��;Ǳ@|����#@~3�_F@�76�|@�'4�s,	@�D��\@�j�|�?@���G��D@��k�MMF@�#�X߃@�iٹ��,@���w@�%Fz�fi@���[~�@����:�@��b�k'@��$�@�TK�A�@�#�"�O@���in��@�Ь�2��@�����s@��R
�@�x�Znv�@�eY����@�V��j��@�L�����        ?���D���?�;�t?Ӝ�WA?��dML�?����7*N@�^�6@���@�Z�c@9��e%y@%U>e���@,K	C�@2MGm��@7/K�k�@<��f�@A��.m�@EU��rMo@Iu�/i��@N�0�N@Q��O_�@T[V��@Wgl���$@Z���T�@^Kr �:@af��@c$�Y�@eY<$��@g��� @j1�ϕʍ@l��gh��@o��w�C@qG�6JT@r�z-��@tp��a�@v"!��� @w�-%�P�@y��{�sL@{�\,�JK@}���c�!@����=�@���%�=�@����U�@�:ݤ�~@�l�ŏ�@����U@��9u��.@�?L�4{.@��P��@��>O%�b@�k٘`�@�⯅��;@�dG�d@�w�� '@�BG,g�@�Y�i#Z@��j�2W@��Ck]�@��� ��@�~B;��@�efYF�@�QM���@�A�@���@�7r.]�@�1���j�        ?�)'H�4@�7�t@%Η-h�R@6�
�]�J@C�D}��0@OO:@VxA�c^@^����@dNM�|�@i�?�Ϳ^@p.�W�@s�i���@w̧�S�@|;&5i@�����F6@�1�mGb@�Ӧ��@�)�X�É@�}�-�i@��GW;5@�����e@����)n.@����I @�Y<8�F�@�����:�@�@N�c@���!r�@�T2�<U�@���}ah@�JK6��@��Y���@��/(�@�8�϶Z�@��e<s˻@���N���@��KJ�@�\`�qz)@�a�n��@�o�*�9@��O��@��H>vK@��?]I�@�����@�7�A��Q@�zJ�!�G@���xC��@�|y��@�x"�@�@���eTz@�'T��r�@����G�6@��ѠeX@�jj8�J@�4�d8�
@�K��=@�֐�dq�@Ůb�$�@Ɗ��Y��@�k�*b�l@�QF���@�;�t�C@�*v��0�@�0GZ�        ?����jM�?���[ܪ�?ӈ-OA��?����W?�&mS�?�8�.���@t�lt�@4(��t@{	�q�@�t�v��@Z뼯v@!�Cx��@%u�
���@)^��K5�@-�H'�͜@1���v@3�7�x�,@6EF;��1@9�{�<@<$w?��@?Zk��$@A_\؟��@C)6h�M�@E
�w߻�@G��-Q@I�h�`@K=�z28@M~n�rK{@O�V!�@@Q$@Ѹ�@Ri��Tu@S�)�l'�@U��6�l@V���Ι@W�� �u�@Yz�l���@[
i�ר@\��_y?_@^OwHt��@`�r/&�@`���Q�@a�!���@b���96@c�aSEG�@d���ᆀ@e��oZ�4@f��۩�|@g��$���@h��(��@jG��۞@k(��J�1@lV�(n�@m��*N�@nƺ-;~[@p���8~@p�;�?g�@qS)j-a�@q���$��@r��wg�@sc��4�@t?��@t�/�/�T@u����        ?��!30/�?�"x��x?�P����?�yU��N?���c^	?@7�����@�
��(#@���2@ ��v7$�@&�[����@.I����!@3�)s�	�@8��|�@>��^�N@B��0? @F�ϋ�D#@J� �Sp�@O��ͩc%@R� �"�@Uf�m/�G@X�ك~��@[�_E�?@_��Kޣ�@a�����@c��5�@f@�(ѥ�@h�v��[�@k=����-@m�ц��@pi=���@q��"Oq�@s��@�9@u'�D6�@v���_�M@x�Q� @z�#h۱@|�H�B�@~����l{@�VN�?��@�m� ���@��G {�@��d\�0@��R_���@�."�P�@�v�{�7@�ɻ3Lϟ@�&���\0@����v�"@��t@���@�{q�!�@� �>vr�@�ɘ��F~@���D4�m@�k�J��@�DC��<@�"�u�A@��<�:�@��ޱu�6@��HL@��>*�o@�ѽ���@��0wt�@�ڧ��        ?��+�?�&2UE��?ԯ��Y�3?��qӾ]?��Re�;^@SLL¾8@K<�+@[�E��@�w�/S�@%f�� �@,5*�̦@2!I��G�@6��^�@<2��:�@A'"���@D���g��@Hhk�J�O@L����@P���Z�@S-Աm#@U���N+@X���b^@\#F����@_����@a��ي@c��6&2@e�zD|�@g��ŗ@jE�?�$@l��y���@o]A��@q�>I��@r~���}X@t �P���@u�baJ��@w9�,	�@x�Wov�+@z��B0@|�����@~���xɇ@�B��� \@�K�y4@�^��a�B@�z���uG@���t<@�Κe���@�����@�H�B@@���4�%�@��b?W�*@�Ef� @����Z@�sn�@�L�4?�@�G%ʮ�@�ְ��0@��ZYS�@�tbTl�@�J��\@�&����@�X�(>@��Z�]!@��!�e�        ?苨��@�%n�/�@*E�)�ȵ@;�8�3@HSx�'_�@S�n_b@[�]��q@b���G@i�@o�0�R�@s�t觥@xVh�P�@}:;�D�=@�M��P�L@�=��,|�@�n� ��@��)�h�I@��P�4(@�GnǤ��@�e˗X{S@����r�f@�
F}�֓@���LL@�;U�w�@�����\@�}h�!Kh@�6�wv@��s���@�R����@�(>'��@��C3�;@�����J@�����	@��ǒ���@��F�@��ePl�@@��C�|@�?��mp+@�l�-��I@�����H	@����b�@�'�	]@�v�]��@��%I�T}@�.%���6@�����	@����@���8O\U@��<���@�H؂CG@�C�{�z@��A5��@ĴP��@Ō/��B�@�h��~G<@�I�>>U>@�/�55C@���C�@�	N}���@��-7��O@���Ib�y@���(��$@���k<k        ?� ���{?��Uf��?�:�+G��?�3#�3W??�pkC��C@��;�?�@N�i��@�Q
2Qi@x?E*�|@#���¶@#U^|�Ҿ@'�X�3#@,,IB	��@0�_���@3f�_k��@6f��
��@9�g��t@=��	H(@@g|�(/�@B`�����@Dy�2�x�@F���C@I	�'�,�@K�i�ihL@N�����@PhR!�h@Q�OA*��@SP�K�Z�@T�]��b@VzyϬ.@X'|�F��@Y�x¨��@[�R]�@]�Ou�>)@_�-Y��7@`���e�&@a�*�M@bڥ/��@c�'�DS�@e�ٴ�\@f</��F@gl>+\�^@h�2���@i���y�@k*�'_��@lyY��yT@m���@o,
��>�@pHQ��@p��h:4F@q���䦲@rsFb	�@s3SAV,@s��T��H@t���Q��@u����GA@vU��\�@w&�q�xU@w��i�h�@xҬ��k�@y��H�La@z�BX���@{n0�<        ?��ğ��?��<Q��?יky�e�?����Y@?���O�d�@=V�@I_��@CE�a�@#a�oy��@*��	�$@1��f��@6��s _@<ڮ�A+@A�J�]�@E�J�*�@Js.͐�@O�2�y�9@R��}T�@U�5*G@YpQj��@\� y��}@`[�ό��@b��0t@d�q��6@gB��B y@i�M�z^�@l��䲅e@o�ᘂ�@qR*~9t@r�{��q�@t��41~@vi`�%�'@xC�b��@z2Yȍ��@|4��
�i@~J�^��6@�:�@�/@�Yw��r@��Q�Fe�@�����@���
@�8,�NΩ@��w$r��@��i�@%@�FJ�ޫ�@���h�3@�*Ņڊ�@��\{�=@����@��o=JP�@���	��h@����H�a@�][�,�@�9pE��M@�S�PE@����xv@������@��\���@�Ș;X{;@��.R��?@�����@��T�%!-@��غ�[�        ?�*2��h�?�ͻW}L?Ջ�[�<?�!��b�?�d�u�kI@B��@�2x���@���vG�@!���ҮU@(B��l��@0v�6ˑ@4Ӫ#A�@:X���m@@Yz�AǑ@C���[�-@HUA��/@L��l�D	@P�x�=k@S}�x���@Vv�;>!*@Y����l@]&3�o@`n�����@bjcHOj@d��O�@f�ab���@i!"�y�@k�+OU@n@f 9��@p�-U�)�@q��W�@su�`�bG@u	�7�;e@v����MA@xd�j�t@z,5���@|�|O_�@}�QSɍ8@�t�^\@��;b��@�
LL]@�!���9:@�B���ܹ@�l����@��Tڥɣ@�� ��z@�����@�m�Us@�����'@�%�>��@��K@�N@� G׎��@���ШƩ@��G�@�F�D�?�@���F�@��b�!�k@��bH�}�@����@�j�Q$�n@�K���ˉ@�1��&(A@�� n�        ?��\��'@�$?��@17Z�E�+@A�Ê�@N����x�@W�����@aXqM�K@g7���]+@nd&��T�@sK�E{@w�jxmO�@}O���1@�_�-m�@�|l��7@�ߖ�
�@��s�b�@�|����@��fFM�M@�i�~;�@���~c.@�����@��W���@��� �F�@���>q@�@�f�Zm�@��p5e@�ȴd�E;@���)�@�x����@�n�E�.�@�xk=��6@��-���i@���[f�@� �	}�@�4P<cms@�k���x@��ء',@���Zf�@�M&���@���@��*��z@�����"B@�j� �@����I@��Dn}_�@�U����t@�%OTں@��Y�\[@�ѭ=��@Į@��"@ŏ��@�t	?��@�]+sg]�@�Jh����@�;���[�@�1
�J�@�*]\�G�@�'��Om.@�(���hO@�.z��@�7 �b�@�":F��@Ъy�Ӥ        ?���9+?�
:�?ԝ?ѓ�a��=?�u	�r�?�"��%�?�.)��@3�
&��@�4�k�A@cZ�g
@����u@�[:��E@��Ý�-@"�2��{@&n��+y@*1��_D@.EdZ��)@1U8s72�@3��>!�I@66�J��@8�{��_@;����q@>�sm@@�fG��@B��X?@Dn��&�i@FI�g��@@H:�:�}]@JB��55:@L`���F�@N�sO��@Ppc�ܛ\@Q�i���m@R���t˾@T%���c�@Uy4��%�@V�C�+H@XB�̒<c@Y�w_w�x@[;�:\�@\����2�@^c�z%��@`��Z	�@`ݗ�nX@a�`%�+@b�>�U\@c�����u@d|K�!9@er�qCr1@fo'm�@gqoh��@hy��d��@i���;��@j��9�0?@k��f_?�@l�UBd�?@m����b@o&���@p+�X�b@p��=��@qe��<�@rI0��@r�rF��@sRi�        ?�˜�N1?���A�?�m��gtn?�T�3Np*?��Y�<p?�v�-���@���&�x@�E�V��@e\�{�@!����@@'t%��@.�@����@3��s��@8i����9@>Gc��@B?o���@E���0)@I��e���@Nn#3�@Q�Yx��@Tj�S.Q@Wb�A�G@Z�`��'�@^%��0@`�:��@b��ec@e@W�Q@ga�i��n@iҗ8��@licYu@o&�����@q��B<@r��z�W{@t%��3�W@uԞVf[I@w�	^�x@ypiC��:@{]�p��@}`��*/@yY���#@�ӿ�:�@����M@�"���V@�Z�nC�@���&iz�@��*L�@�D̍	1j@���:BN@���»@��+��	/@���4�@������@��$�-�@�v��r��@�PM�!_�@�/W&ۉ@��S�U@��Z .N@��T�+�a@���<V6v@��>[�&�@��+���@���.N        ?����FTa?���s� ?ɪ3�?m?޾�;]0�?	�M?��崢��@�Z���@X�Xr|�@����F.@ L����@%ٛX���@,�X�@2.����@6�0��`@;�t����@@�Uls�@DF3�߹m@G��\!�@L��,�B@PF��'@R���j��@Ub����@XBG6h�@@[Z;L��v@^����{�@a���T�@b��
θ+@eb,RI@g#��K�@idjv���@k�ϙ�$)@nE@N5J�@ps�YE�@qӯ9�	v@sD�s?B�@t�No��@vXn<�A�@w�2|��@y��zD�6@{r�:G��@}G�哸�@-�B6�j@��OOhJ@��*�c��@����gj@��\��t[@�Լ�'@���f�f�@�)M�a"@�`SDy�@����^$�@��z2�cG@�7�t��@���D^Zy@���[��Y@�-��d@����A%@���7��@�d��℃@�)��^�T@����f�@��*>>n�@��.�N��        ?��O�Y@��u�@��`=3@0�Ot@��@=Q2�D�o@F��1p �@P���&@V���r3�@]�Ix.%�@c�_~#@g��p�@l��]@qXDH�&�@t�a�J�K@w�#�f}�@{�f�Nk�@��L��@��렞�@�n��~H�@������@����?@�^�Oӿ�@�T����@�9�Cѷ�@���I��!@������@�d�؜�@�Fj?$��@�=��'�@�JLkP@�k� ��@�QV�)[@�w�H��X@���^S�@��ӧ�[@�+᡻��@�}��$a�@��5^9�@�C����H@��>-��@�6/�2]�@��~J��@�V2��N�@�{���F@�Q�b�j@�-���@����4@��!O��@��N���H@��7Ѷ��@���u��2@��D��_@��l����@��W$=z@�����q@�f��@�}���@�=:��B@�c�����@�G��e@��n@+��@�{ر��@����/	        ?�O\���h?�4� u��?؛=,�yS?錘[��?�1؉p"�@@i�Σ�@Ẽㄪ@���@V]�_'@qT�{7@!�0Y��@%�r��hj@)���A �@.e�<��@1�c��2@4v�(I�5@7h���x
@:�����@=�7���@@�b3�b$@B�}����@D��jؙ@F�l�@H��EZ�@KN{���s@M�be{|@P%TSa5@Qy��@R��8b~@TJy33OC@U���2�@WS�S@X���@Z�ih+��@\F����@^�k��&@_�B���`@`��>���@a�`9��@b�����@c��|/�@d�0[h)@e��3�6�@g�񩦸@h!�\��@iFS�Ft�@jrQ��:@k���g'@l�b�3�@nb:fЩ@od�J;@pY��6@q�B�@q�%�i��@r`��5ݛ@sj_�@sˁ��@t��V޷�@uC���7�@v�xX{j@v���1+@w�l�M=@x[/��        ?��(.׳?�P�2�."?�ђ# NM?�i�L`vr?���{-�X@�˓ ��@{��/`|@B�)��@#7���ɵ@*$Cg-�@1C+�u��@6>�h.�@<�n[@Af�g�M@E=ב��@I�?��[@Nk��A�F@Q�&	(�K@T�@��@X!4p��m@[����0@_�����@aگ0h!�@d��eF7@f��I��.@i��b|�@kְ�^�@nÀ�y@p��󆅳@r�(w���@tN�D$�@v"1��A@xa�O�"@z��<-�@|,��̀@~aF+��Y@�W\����@���8���@�ʕ�p�e@�F�J p@�pο�E�@��Ckt"@�J�BT�N@��?ߒ:@@�X��UUt@����&@���9%�W@�(����@�
0Q��@��h'�yy@��m�2�@��L�F�Y@��&��f@������@��lV��@������@��K2�@�,�\V;M@�Sq����@��q�#��@���!�̷@����/�@�;���        ?��Q0��?�	�pT��?�8C�k?�� .&@�o�sa@CIv�@�
SG�@"�@l��@)��h^�@0�Rv�
@5д)y��@;��`̃l@AO��o�u@E<�r�c�@I����@N��aI�@R����@U.?З	�@X��,��@\<��vm@`]"��"@bJ{�б"@d��2���@g#��9a�@iӊR��f@l��Z���@o��|�*q@q}��.oR@s4�K�Z@uzix]@v�:� !�@x�a����@{4��v@}@��U%�@����dd@��n�)��@�?�d:�@��_O��s@��u�R��@�Wb:'@��x��@�U��i,b@���h��@����t�2@�;����@������@���1V@���6
�@�÷1F��@����m�$@����uĽ@��i��@��7�K�@���viQ@����7@�2RI���@�]�P�:�@��vo�U�@���(�7�@�
a���@�(�67:!@��+�i�@�z�M�R        ?�p�@�^�F�@3�vl�\�@D�{�kO�@Q���ό@\�>�8P@dD�H��@k�W�@rI:̠P�@wV}�}Y@}�@��P@�����;@�F�BT@�,��f4�@�n���@��=qx@���d��&@�4a��~�@�-����@�"�?��@�ch�z�@�j�6��@�=�K��@�(KR!��@�,�阽�@�J��a�s@��+���/@��E��,^@�(ɾ�@�awY��@��՗rZ`@�8|��@�v�;ߵl@��-΅�@�p�����@�� ��@�������@�J�G�[�@�gQV2E@�d�ј��@�N^�u�N@�>ڐ�H�@�6 '�P�@�4/��7@�9	��Q�@�D��#Yq@�W*<1�r@�pl��k@ɐs)_ m@ʷ5(E�@��.G�@�Ƭ��1@�S�^@ϔ���8�@�naUr��@��B�9@���U�@�m�S��5@��P���@��ɶ�d@Ԋj2`E@�D�6���@�Dp.7U        ?���I��9?�����?���4u�?�t��C��?�D�0v��?�b��Ф@�J��'�@�L	�-@'��gF@�=T*68@�P� �@#N�=?�@'
�$@+:'mp�@/��i�7 @2M�$.l�@4�k��<Y@7�%�0@:�
;2�@=��**'@@���E\�@Bn|4�`�@DNy�{��@FF�:$�K@HW�1��@J���T�@L��k���@Oׅ�@Pǜ��}�@R��S\b@S`w��Y@T����#�@V,_��}�@W�ޣ�Ĥ@Y,��`/@Z���l7~@\b?ʧ@^,[��@_�p�~�@`�}'�4@a���r�@b����f@c�lz���@d���Tn@e�w�#��@f��W�Q�@g�2�
�@h�'*��@j 凧�@k(wW�0@lV�U�<#@m�J�4j@nȧ�n@p���_@p�C�{u�@qT	$���@r V�N@r�'&��u@sc}��9�@tb��@t�ڌg�&@u�ۀȁ�@vTP�&|�        ?�5p��?�[���?�M�؀F@?�,�#S��?�)����#@P|#��@���G�@�JX�@";]��s�@(�ق-@0U����@5�`wPc@:v=�g�@@]|�D�@C��^�(@G���@Lj�,���@P�"A@Sj�65@Vg37�D@Y�R�W@]-^�x�@`}�V��@b����v$@d�!��j@g9����@i��*�A�@l:"#��(@o
j7^�K@q����@r�=�0�@t;�c4�@u����W=@w��wwԯ@y���*l�@{��Ox@}�usϸ�@�7ĉ��@�!C��@�PN�ћ@��W��1!@��w�܋@�%�YaK@��g}���@��lڶ@�i�P�V�@��ix�7@��ֶ��R@�cGP�C@�eaݲ��@�A���3�@�$rEv@�6=���@��гj�@�����z�@�#�C@���ʊ@��^��h_@�|���R@�#(+@�@
0�]@�cm�X�g@��4"l�9        ?��iqǋ�?��Rυ�<?ێ>RVR�?�>N�ƶ?����g'9@	dP�@���N"@���*��@$tjt��+@+ۀ�5�@2k�H�4�@7�u1�[�@>��W��@B��}�1�@F�&H�@K��>x@Pee	��@SU^��M�@V���b1@Z&3˳@^����@a$.n�@cn�s)O]@e���~A@h�0�Y\@kb���s@nh�����@pϏ��d@r��P���@tP��6�T@v7���41@x8p��@zRm��@|�H_s�@~֖�R@��N�.d8@�����\@�2����z@��g4 ��@���P���@�t��K3�@��}l\Ϯ@���p�;@�2�td�`@��׏��@���Ob@���I�o@����2o@���dCd�@��}��:@��_;r�8@��7_
I@��Ѱp�@�����3�@��%o�@�c��@�2/Q8�@�e �Ӿ@���A��@�߸�H�$@��<��@��C�tq@�f7�럿        ?��5ޯ�@�t��@0�9�*@APB��j�@N��b�@WQ�,��@`ů��dq@fܬG�H@m�Cߵ'@s�����@w�S9J�@|�Z�uP
@��`ir@�+���kJ@��vIc��@�^F�@��,�@��I:@�@���WY`@�)*�z@��ё;��@�QH��@���@}@����o�d@�`(�X@���?H��@�b��@�'����)@� $Xx@��<����@����bk@����׬*@�����{@���% X@�ٲ�!�@� hܰ@�H�lhE@��5;��@��഼I@�=�<��H@���#��@�`���@��hJ�)�@����k@�Rn�D�o@��:q*M@��4J�c�@�����V@ç&��&�@ĉ�r��{@�qf���y@�^�o�h@�Q	Z޵@�H�#8�l@�F܏1�@�H��?�@�P���4B@�^"�[��@�p��Y)@ΉK�	(�@ϧ��Ձ@�e7)l~@�����s        ?��]NA?���ʯ	?�/Bty??�%e���?�^����?�qH�K؎@��8��@M�Ri!5@D�Ю@�W�@�@��Kl@!�~<��)@%#?\��"@)�[ ��@-gP��5�@1҆��@3��l��@6^�xY�@9U�����@<���$�S@?��=���@A��N��{@C��$�U�@E���.�@Gք���@J�7@Lt�z!��@N�zْM;@P��`�(@R�o.��@S�8EA�@U ��ا�@V��Ie@XTq�+�@Y×���@[w��T@];[�ϥ@_(�́�@`w
�lC@an� Z.@bm�%��@ctRE틯@d����@e��Eۋ�@f�'3*m@g־:~'!@i�FTW@j3�����@km�r�2�@l���	"�@m��Xs)@oFM�n�@pN��+��@p��e��@q�F6�5m@rf�
��U@s �O�Ԛ@s�m���@t�G��2@ud%��B�@v,�6;�@v��?U��@w��{��        ?�Ov�bFT?� >e}�?�o��h,?������?�8��mx??�/��#+@�Zt0i@�ɯ�k@3�?�f�@ �?+�#@&G��w��@-�����@2yR��Xs@7��	t@<h�}�+@A:#����@D����@Hp��]��@L���WC�@P����@�@S6@���W@U��f��@Y��Jb@\G����@_�q{p8@aǟf12n@c�q�Z_@e�Z%�@h9�P�`@j�矼!�@m5�|��
@o���v/@qa^M��>@r�oO�'@trE��9m@v� �&@w����|@y���=�@{w�bw�l@}iD����@m좟�@���Â�3@�؊���Q@���c�Ы@� ��2�@�S�N"�@��،��@�Ԛe��@�#��L)�@�|���@�����d@�I%��@���V���@��2�@��5d�@��F.o�	@�u�X��@�G���@��XUp@����x��@��I\�^�@��:�;lM@����Zj        ?���_�O4?�wT��2?�w"�]�7?�I�Pj?�S�6��@ɏ/k��@��f @�?\���@N��8�@%�-~�r�@-=�r��@3(,�Q6@8��h�t@>��'( @C5>!�]@G6)���r@K�d����@P�e�\�@Sؼ��@@V�q�[z(@Z@^�@^��N��@a"�ӗ}@cc��!�_@e�g�y@hg$,�p@k+��>HZ@n,*�B�@p�_�0*@rEfqԪ@t�&�q;@u� ��@w�<�@y�b�g~@{첍9�@~#@�@�9{O7�@�l��E6�@��ZI@��=�i`�@�PF4u��@��p4�=-@�$�)6�<@��i?}�@�)���@��,�d<�@�^���@��0b�2@��0��@�Ĝ��d@��b8��@��}���@�����i@��\b�I�@����X��@���F�@��h3��@���r�tm@�ǹ�<��@��o멻@�	���@�3M���@�b���r!        ?���o��@kܕ[�@$@7D��"@5dt��@BV���W@L�'�6�@T����@\.�|��@b�iѴ�@g��D��-@mmB�J�@q��CB!�@u�����@y�UO�y@}ݭ ��:@�KP�ݎ@�ف"�,@��HىB2@����ݒ�@����B8Z@�
9R�	j@���%c�"@���Hn�h@�����W�@��B9'�@��8so@�^�p(��@��/b���@��Ŀ\Sz@� �W�@�bX��|�@��H��D�@�PUK��@��~��@�v�e}�@��V!@��q��@���z%�@�5�{��@�%��I�@��8-&@�b$�@�����@�)�[�z@�;�4w�@�T*^��@�sZ�<&#@��8ԉ@���3&��@���uS��@�2�ث�@�sF�zqQ@��b�Y�@��T�(8@�.,u�=�@�ێ�9d�@-T�E�@�@�vS�@�� ���@ı{X7X{@�o7B�@�0E!׼@��W�v�        ?��H�o5�?���۝T�?�.)gz�?�&.%;_�?�<6�q�?��bHĤ�@A{�G�@��H|�@M۱�P@ {}�@�'-2p@l���@"B����@%�b�1��@)AR����@-4�<dц@0�p�5�@3��I�r@5sy�`�`@8
��T+�@:ʓ�{E�@=��.Ц�@@b@��@A���dX@C�*��6a@Ey֪3�@GV�@�)�@IIM�mG@KQs"�@Moe?F�@O�5��F�@P�vCՅ�@R&E�Ū�@Sa1��@T����܋@U�Z#�)�@WR�9L,h@X�T2��@Z*����@[���/@].�B@^�@�i�@`.{׬��@ar��`+@a���B�T@b��!�k@c��\�I�@d�����@ez"\4@fo��X�@gk���U@hl�Q���@it?�2�@j��W��@k���F-H@l��a4�@mɎ\��@n���@p��'X@p�s����@q<���Z�@q٧���@ryqn!�/        ?���J��?��as?Ι#Ǹ�6?�w1����?�V
�6/�@ ����@	�iH9@z�Q]ʖ@�֙��_@#S�{k�W@)ޅ =â@0܇�p�@5~�
#�6@:��y�	�@@���m�o@D_0��@H���b�@Lok���^@P��;h/�@S\���Jm@VP ��,@Y�W�R��@]r?�f@`av=vq@bf"Є�@d�o���3@f���*�@iR�c�@k��9�"j@n�u
���@p͋����@rW?��ܔ@s��1yBO@u�A��B�@wrD��@yQ�1�Q@{E��.�@}QY����@slt�7`@��=8��@��_�GS@�27�[}m@�q۬�A@��^(��@��|���@�x9��]�@�����@�c*��k�@���pH��@�~r��Ky@�#�g�@@��!n|�K@��5��@��c\F�@�����V@�z5�U@�n���@�iiqs�@�j_��U�@�q�d6��@�I��@���^�*@��*����        ?����brj?�ͤWĂ?��
$�?�9�,��?�sY��@�O�?@�	"�0x@������@��W�@$�y�t��@+��I�O�@1���\�i@6Oc�\�.@;�7�V��@@��3l�W@D7�Q���@H ����@L0�5]�5@Pd�,e��@R�YMv@U�ec;�'@X��^P�@[���@_���o`@a\J��x@cHz���@eR��83@g{���;�@i�$����@l*h�9@n�vOb�s@p�_����@r�jt�A@s��0��R@u}3i�j@v�k���@x=�x���@y��@�@{�	�6��@}�� �P@t��m@��YW�@�� \��@��PE�+�@���v4!@��ؗ�ca@���&�@�Ji��u@��:L2�@����۶�@�uj��@�Q:(�z�@����Y@��;��C@�4�!ma@��uN,\�@����{�@�c��o@�%�"�f@��I9��@��x����@��Gܑ��@�Q�a�        ?�P��߇�@�w+π2@%�����@6�4��@C��=�@O�F|��@Vt�;���@^��{I�9@d1$xM�@i�![�T@o�Qh5�g@ss쯄�k@wI��D#@{|���9@�����|@�|*�$Ť@� �]��@��t�Z�@���~`�@�(����@���x��@�������@�nL_*�@�gQ�|U�@�x�j��_@��\%�@��f)��|@�>�H!�@����-�@�Nh`��@�p��O@��X�#@�85�d)&@���˟��@�1�ׅ��@���[��@�\i�H�1@��)�'�@��oˇ�!@��z��m@����zmh@��8�*�|@��H0�/�@�����w@���z�@���F�=�@����J9@����8T!@����>U@���Q��@�E��=�@�A%��Y@�vx���@��2{��@�z%���)@�\���Q@�Ź��'5@�p9qo]2@��	��@�Δ�qr@Ăh���@�9N� ��@��BB�9        ?�Ka���?��'S�?��D�#��?��cd<?�B�� �%?��6qu�@��(�.@
�����Z@��ӕ�[@��\�j;@l�͉@!"�^���@$��DM�i@(a�9m@,�����n@0���.8s@2�3��)@5�j�@8`���U@;]��� �@>�����@@�	�f�@B���C�@D�����@F�D!u�n@H�=�/+�@J�z�:.@M�[o�!@O\���;@P�7;1�@R)�X��@Sy�t�dK@T�O����@V=aҾ@W��?a'�@Y0�V��@Z��5���@\Tf���}@]�8��"�@_���Jmm@`����@a�˅2� @bϹ�\e@co�\�@df[q˱@eb�.�s�@fḛ��@gn��08@h~.�N@@i��Fr;@j�t�	SX@k�r��@l�����@n(U˺��@o]T�BM@pLc�x�@p�]��q�@q���?f�@r9<Y9�@r�2@a�@s��bԗ�@tDP-��>@t�l��        ?�A�jճ�?�:�U�?�8�ͨ�?�6��ı�?�*Оa5!@ к�x�@	������@���Z�@�C� �D@#�6/�&@*��7�@1�nW���@6�����&@<d���ʕ@A��I;Պ@Eb�kD�@I��!�R{@N��^�4\@Q�����@T���H��@X6���I@[�+s�Lf@_�
�+m�@a�3#�=@d%���� @f���{,@iL&05@k����@n���J4@p�G�c�@r��{q&C@t<)����@vS��rV@w����g@y���n#�@{��1�a@~����F@�#+��%@�K	Β1O@�~b�9�'@��6P�`@�C�s+@�\�4U�@����%�@�*~o�a�@���R�L�@�&%��@���#u�@�OU��@�z��7$@�S-x��|@�1}bpY@��q�Z@��:H�EZ@���@���ra�@�ޮ���Z@��G�K�V@��*ŋ�@��&��@�mЅ��@���v�g@�8��j        ?��I�V0?�~���?�T^-_I?�p�?�?C7)��@WȊ6��@o�b���@u�v8�@&h�Bk@$� �@*����@1V����@6JY�@;��l���@@�r��N�@D~U��@H��{	Q8@M ����g@P��g�@S��M��@V���	I�@Y�p6�Gt@]qЉ�El@`��~#y�@b�ۥo;�@d��&Y@g�7��@i��hm=-@lav��@n�Z3ŮF@p�ø���@rZp`:�@s�)T@�@u��vN�@wH��縵@yn���@z�j��@|����خ@~��\�k�@�r�n�G�@����=g@��B�[y�@��ĕ�eT@���<s�@�O,^+�@�\V:�O@��4W�e@����M,@�H|�sP@����ֵ�@�>�dQ�@��ulZ7�@�����@�A��0@�H.0@��:�sl@���Љcg@�v�]�K:@�N��?8@�+�4_�@�^n��@��U��:@��ѕ��        ?���b(�@w��hE@$�',�T@5��*�@B�#�~�|@M1D��3@U_��@\��P� @b� >��,@h"��v4@n
íe��@rT���i�@v5��?�@zS>��*@~t/�
��@��;���@�2W�Xo@���L� �@��T�Ng@����!@�3,�P��@��a�<�@������@�Ř&�44@�ф-v:U@����Hl@�1��N��@���4�@�y���b@��	j�<�@�		5i�c@�c��,@�����@�;� 2A@��(���@�CTuW�@�ًa�g@�{���E7@�)���@�q���.@�T�ôe�@�=~"CV�@�,7Ÿ�]@� �u�;�@��}gñ@�§5@�#�]e1�@�1&��<�@�D��to@�^!�JZ
@�}� q�@����M,�@��`���[@�In��@��VXb�@�����~@�]����@��1��9@«3�+B�@�V��ݨD@��܌@Ķ�޴��@�k����F        ?��&�[?� ��RrZ?�	�7�?��f:M?�F\�+�@ u7ǀ�@���@"Id��@&�\[@���?�@ ��;N��@$J���u�@(G(-:io@,�����@0����X@3F�8��;@6A��@9FIm�6@<5�HW��@?�ٹ���@A��w���@CO��<�@E���{&�@G�����@I��F@L&,C�@@@N�t����@P�J�=@Q���R�@S?��$_@T�t���@V(���t�@W�g���@YI����@Z�(f(^�@\��oE֛@^c�([�P@`��F�@a�M�w�@a�iQ�n�@b�b��Y�@c�v���@e
����@f�?�:6@g6]O�@hVڤM\�@i~i��N@j�Ai"E@k�=�zC@mG��@nb��p/�@o�t�M@pt+,@q+�@4�@q�&��B�@r��?@sD]���Z@s��6��@t��so��@u{O *4@v>ꌴN2@w�o�M@w����]        ?�|����{?ò�<.��?�$���l?�q�f}?� e��@	��/U�@� �6;�@������@$#B�x�@+u_�&+@1��rHn@6��Z�H@<cq��N�@A}��[@E=����@Iw��d@N.՝�Jx@Q���
�@T�A,��~@W�F�@�T@[+��J�W@^ㇳ��@as ���n@c�^H8��@e薯MZY@h^^��7<@j�gy�D@m�`���@pY����@q�c���@s�>#�@uB�U�@wpq*�@x�S�r	T@z�㋪�@}�A�@-$D���@���W ��@��.Y�y@�y��@�^(���.@���T[k@�	���04@�q��G�@����7Q@�f[RG��@��1��'@��e��*@��"�B@����7f�@��3
�@���s�N@��C��W�@�����[@��4J@���?jU�@��I�'@���~���@����{��@�����a�@���R`@��n�;g@�,F��        ?�v���;�?���@V?�ۻW��?��<��m?���jҭk@�v�Ge@w#��:�@O
]�V@"�"�-@)hP����@0�ӶkER@5��8��E@;ɭS�E@AM�eus�@E5��P
�@I��5�=�@N����-�@R�1�h�@U�(V�@Xt��>?@\��y@`	ާ&YB@b.�6-��@d}�Lf*@f� ��@i�>LtO�@lm��?��@ol	��X@qL	�>.O@r�0_�W}@t����@v���@x�4��3@z���A�@|�<X7�@~�u�&��@��/X��@����H?d@�$\����@�t�����@��w%���@�:�g���@���@ͮ$@�2�5��@���4G>@�]3�wV@�#\fho@�\Ү�V�@�=a�[�@�$Cz��-@�}���_@��l�@����z[@��mN̾@�6�0@�mf�4@�'�V�~@�A+M@{@�a�GJp@������@��
-OY�@��Ψ�bF@����	�        ?�Ҥa�@?��/@/u�<�@@8��bI*@L����@U���7J�@_�ݨ]M�@e���NN-@lhU���@r#�}��@v��S��@{���Y?k@������@���#���@��`�@��~�i�@���	S"�@�{QS���@�ƾ��@�:���a@��A��C@��<+c@��v��ւ@����*F@�t��kƖ@�+���,%@����CK@����X�@�Ѷ�(zC@��Fb�@�ȹȗ�@�,L��A@�FZ:�@�yA�@��%�wUm@� �+2�b@�U"�N��@������@� [U0ل@���*��@����@��u�#Z@�??R!�m@�q�p�M@�In�4�@�&��@�	֕ƍ @��vLS�@���u�#@��h�Y�@�ͦ�2�@��Z����@��x�z@����R�@���A��t@���4}F@�#]�X�@�4���@�X?�!��@�@z�'@��X|��@�p�
q�r@��J��        ?�ߢO;"?���7[b?φ�5b?�w�%��?��>�F�?���1FT�@ r�[�ls@��vi]_@U��A@O3�5@2��Jq@��t>=�@!���:�@%W�|	�@)�p`�S@-.�E���@0���c@36�YA��@5�ۺ;l#@8����@;���K�@>��b�:@@� �$�@B��Y���@D�GM�'@F����0@H�"���@J���N8�@M�u�z�@O]��N�D@P�
��@@R-�PV�\@S�T�ʐ�@T�T	�4�@VJ�`eD@W­���-@YF��L�@Z�n}�D@\t-�̌�@^
5U�@_�&�\KC@`ɯ���t@a�i�VC�@b�Lqu@c�ci�9@d����3@e�P&n"K@f�4�L�@g�h��@h���C)|@i����P@j��Π�[@lJ
�F�@m6苷�P@nh��2xd@o����u�@po5��N�@qGs�c@q��U�@r]��=��@s��0�@s�\��i@teh��        ?������?��Ȳ�`?���F�f?�`i���?� ?kj�@ X��	
@&�o��J@�8z���@$�Wdt�@,O* �R9@2�)�{�@8�hT2<�@?}8'sJ@C���/�@H@���@Mj+���@Q�e�*fR@T���3@Xm  �p8@\[����]@`Sg98�f@b�W��$@e-�����@g�n�W�a@j́�·�@m��Y�H/@p�W�e�@r_���=H@t=)�	��@v5��8Q�@xJ���@zz�Z{�@|�C�?@.Էr��@�����%@�*���-<@��uxt|@��ϵn@�u,u���@� �#� �@����4�@�Cl�Y�H@���� �@��Bn��@�K��M^@�<��:�@�5�!�@�6GR�G,@�=�?�:�@�L���m@�bTEρ@�@"��@��6#�J@��(��ñ@� 	ϑj�@�8��ϕ�@�x^��U{@���1� �@��k��n@����ފ3@�]}@��o�$O@���*��&        ?��MRf}�?��/��i�?�4��ʓE?�,h�:V?�qN��@ ��t�t@��t�@��VV
@4P�*�@%M�o�#@,oN��s`@2���C}�@7�O��[@>X[n�@B�E���@F���)L�@K���@P��=@@RȦ�ݭ�@U�e�4@Y*�R��d@\ʣ��z.@`[w�;r@bx�_T9@d���<�@g,@��^�@i�8�Yއ@l�����@ot��,<�@qGL�w�@r꛲]�^@t����@vufKe�z@x]cQ��@z\��C~z@|s�(I�&@~�Vz��@�tyyl;"@�������@��R����@�'YMc�@�{���@��hRl��@�H?�σ�@���]���@�G�6�#�@��|���p@�z!�G
�@�\��g�@��-���A@�ӎ�� ?@����;��@��%��Թ@��i}��z@��XT�1@�����y@��@���C@��:��X[@��ᇋ��@��1�V;�@�#(3��$@�O����@���n ��        ?�*�F@����{@#�@�U!v@4e�AvcG@A�^�tF@K��]8	@TMo��@\�\h6y@b�[]�M@h)=OXR@n8.��=)@r�s"/E�@v���[�@z����;@�ĵ��9@����ы@�l*r���@���-�.g@��v���@�|��*��@��p'�2�@���i��T@��7�yT@�(�[9�@��Nv�@�Fz�!^@��.u	@�Kt؛�@��?�<�@�Is���D@���ͣw@���;2(�@�@��nx@�{��
(@���p�>V@�Ƙ�?�S@�^;#ٶ�@�`��^�@�jU����@�{M���^@��m^Z2j@����\@����q�@�&��F�@�:_�Tu�@�u�k��@���I�	@� nڒh�@�P��!�@��a���@�������@�3Z��@��CM��R@ RL/se@�[z�]p�@��̇�!@��䌂
B@ş��P@�f�@�/���P@���0�G@��(2so@ɞ,��6W        ?��v���?�+n S�4?�kA^�?�~��?���OHS�?�`&@��0@�b��@p���-�@%�x���@�@����@�弢�%@��~Sc�@"���p�~@&�	�H��@*^��+.�@.�+^q��@1��~@4��?@6�ԏ��_@9nΦ��{@<k��R�@?��dc@AzE��#<@C@�
�}@E���jE@Gu3&�@I(rbx	@KQ��{�@M���D��@O�ŝ�<�@Q3@�t@Rz��J�@S����[@U/��"�a@V������@X�� ��@Y�c��g@[7c@\�2Tm�@^��7*�#@`$!b_:�@a	��̰�@a�m݇�h@b���P�E@c�t���@d�{�a�U@e��j�Ck@f�v�[��@hg��`@i���$@j9.]���@k^ �޹@l��h�@m�oč�}@n�l�� @p�#�t@p��/Q!@q_?ǆ�3@r���mp@r�J�;/S@sb)ҹ\�@tN/��3@tɺ�W+C        ?��U�M�~?�����?�*��~?��?~"<j?���CW?���U�/�@���0Y@�n�@�Wd:@"v}Gwj�@(�!N���@0�P�@4va��h@9��6~��@?qg����@C���@F�Ac��O@J���c@O��VQ� @R^��m�W@U*���a�@X6,��,@[�S#�q�@_��5J�@atI�}�@c���3@�@e��H�}�@h:�;v�@j�-i�@m!'{oNU@o�#���@qg�蠸@r���fd@t���xH@v9k*���@w�N�S��@y�����Q@{��P��@}��x(<2@Ǯ��=y@��G���@��Xz�@�9m��4@�j@����@��O3$��@��9F@�:C���@��8C=r6@���\�c�@�g/Ǩ��@��;D3�@�c�Фl@�x�K���@�D�k��@�2�<Q@��h͍�@��tި��@��c���@���f�\@�z�F���@�kXs��f@�a
\bk�@�[����        ?��T�
?�B�S���?��9�8P?�+�3�=?��8�J�@ �	ra�@
�a5A@@��n�-i@�����@#�v�۷�@*u8
Z@1;#
O�@5�QPl�O@;o��j@@ݜT2i@Dp�_�W`@Huȉ���@L��1�@P�
 �@S��zQ�@V���A�@Y��<��h@]x@�S�@`�3�9��@b�]��g@d�3m�z�@g3>�1Y@i����@lN��R@oXa3_q@qa�8��@r�?a�@t+�Io��@uޟ�Cg�@w�z��a=@y��:W��@{peC6P@}t�u�2�@���w@���*�#@����LF�@�,:��d@�c!�p�N@�����e@��U�ʃ@�I��"H@��n�4#�@�̢��@��+�d9�@��g��@��ǈ�`@��^.�p"@�p�{� �@�H��Їm@�&pGی�@�	�4�	B@���US@��[[�%�@�չ�f@���T�L�@�Ϭ�dN/@��N����@��%c�        ?�����@�o���@"X��b@3��M.@AM0G��c@K;��a�U@S��i]=@[K�?d@b
����@gxw|�@l�͔��@q��e��@uJ��&@yGYnX� @}�M��@�5�>�|@���?�@��ͽ{z�@��Z�I4@��\����@���m�\@��ooƯ�@��hI~M�@�ץ�7n@��'���@�5���@�����2@�i�Ш@���]hN@�"�0� @���<r@��h²��@�n�h���@��֨ zM@���U��@�<�DK�@��5uÞ@���"'�O@�E.���v@�5����Q@�-{w�`^@�,vAUq@�2�'�L!@�@<�@�T��p'�@�p�Y*9�@���%--�@��\�Dy@���"�X@�)"�@�i~�ե@��1�6�=@� !Z��'@��Z�F(K@�ZH)��}@��C��@��GL�@�}^'�9�@�;4����@���41��@��=��{5@Ƌ����@�X�!)X6        ?�X�xRW?��[��5E?�72��]�?�K��˔?��2�yx?�n��Z@v�!�9@Mm�}�@��P�%@:��Oe@1�3po�@�&�q4@"p=ѵ�@%�3�U�@)vL�[o@-lͨϷm@0خ�<*@3"R� b@5���ܥ�@8,�ž�@:�jf�@=�Sc�Q@@v�ڳ�J@B�x�@Cʎ�v@E��^-P@Gti��d@Ii:��^3@Ks榡�@M�,y��@O�%xz'!@Q
�M'x@R;�= @Sw����C@T�@�Pv�@V��h�@Woj���A@X�L���@ZLS��XT@[�t�("v@]U�zXX@^�����@`E�Gܓ@aP��Z�@a��.�@b�\a�	�@c��x48�@d������@e��>&�@f�B�R�@g��F�@h��~�ܜ@i��l��@j���ԅ@k���|@l�l=��@m�{�{)g@o�(O@p*E�@p���M~@qO���+�@q�Ȉ��@r��`:4        ?~ �kmh&?��[�Es?�r��6�I?��&��P�?�VJP�.�?�,Ϗ�@Zŭ�L�@O[�d�@�؋O��@ ��\Tc@&>J�Mo@-+ͧ*�@2���>�@7x(��n�@<�cuM�@A��{&B@E%k;�[�@Iʑ�(@MvL��@�@Q#�جl�@S�o���@V�{�`��@Yţ{9�@]#i@pc@`a��3�@bQ�7(&@dc�� -@f�w��
�@h￀���@kj2�=f�@n6�P�@pe��'@q�*j��S@s]�[L�@t�N~r�8@v����MY@x\����@z,'�@�'@|��7�@~�
��@�󇿫@�s�0�@�*hh7��@�J� o?@�t�~�0�@��57�@��ݻƪ1@�+'�%@�z�h��@��3��{|@�6�	�z@��S����@�= W>�@�La�4�@���p��@��e�L1�@���� ϱ@�{�R��@�S�>2b@�0�j���@���lO@��e~�k�@��6�        ?��
���V?��c���?�;Ox��?�q����?�	�s �#?�Gs�e��@�Q���@�r�S R@�LO�ڀ@"X���2,@(s�8��+@/�e^�r�@4+Й=ݕ@9%Ce@>�����@B�V~=q@F>f|M�@J@��Ƥ@N���#ld@Q����,�@Tb���h�@W<��M��@ZO�����@]��h֍@`��J���@bq1�|y�@dn�ܡ�K@f�*�-(@h�q�@k8'�@m���R�j@p�r)��@qk(BJ��@r��r{@tL��4�@u����z�@wlqZ@y%}S)@z͉Z�w@|�@�E(�@~op�2��@�,��0��@�)�����@�/����@�=�
�_�@�T�"e�#@�t6� ��@��^W�%@��>����@��X|�@�IE��Qf@��u���@��q(�I�@�E7>�%�@���;���@���|�I@�H�C@��0A�@��-p6�o@���g��@�a�I�f�@�2�/A�@��        ?�N��g �@0��!>@!TK6S��@2k=u~${@@8��^�/@Ipz�XC�@Ru51�@YY~}x� @`��� �<@eX#��d@j���1E4@p9��@sx��
�@w��S�@z��YҰ�@��N�r@��B�j�@�9e�f��@�ͷ��@��#�J@�q��H�@����@�\�����@�_>�G�@���R��k@��.
)}@����
�@���iJ��@��x���@��M�[�J@������@�Ì���@��|�~U@�=Mf)r%@��3;h��@��_�#(@�C�o�8@��_0O˸@�'`k��w@����$B�@�4^'j�@��3��}@���G��@��
�gE�@�c����@�B��n�@�&{�}Y�@��2�t�@��@��@��C7ܦ@�� ���s@��z�U}F@��zy�@��G��@���"W@��'{��]@��P愈@�)��G�f@�#n7翂@��Y�I��@�G��[@��R��^@�uVUށ        ?��Z�:}G?Þ��[ڸ?�z�r�p?�/Pد��?�N�;e��@�qH��8@���<>@|��P@Et��>@�#�@ٯ@#7Nbm*5@'k�5(�@,�7?:@0��+�>�@3cb?�İ@6j����@9����C�@=3qI�@@{p2NЋ@B}{K���@D�P�@F�gNP�@IJ8�XL�@K�B�[@N}#�y@P�w��R�@R0���J@S����7�@UEY"`��@V���@X�z���@Z�����@\k� 1$A@^b����@`53d5:@aB[[��5@bX�s�3:@cw̜w�@d�-�P�@eѷ��/X@gn�Td�@hPT;gЂ@i�i��@j��O�@lS*E�{@m��D��@o-�>��@pTwe�"c@q�`�{,@q�~�Ak�@r��4c�@sx��,@tM��M\@u&�e̠!@v��1@v�Ҕ�t�@w���h�@x�`iߓ@y�Q"��@z��͈	�@{�Ɇ~
l@|������@}����N�        ?��]BEQ�?�xԿ%T?���R�?帊���J?����2a�@������@��L��@|Pi�C@ ��~��@&�A�<@.ˀiӻ�@4�~x��@9����7@@��g�@CŊ��8@H �^a��@L��~g^@Q�أR�@T����@WH��<q�@ZބO�g�@^Ƚ���@a���D�@cҟE�-$@fNvZ�c$@h��K��@k�gM{@n�H�7��@q����@r����h@t����j@v���r[@x���<��@z��؂��@}(��e/@t�BC�(@���GJ��@�Jbb�@��l��@� ��/�@��� �:@�!� ��{@��[&6�@�j�#�{)@�'10u��@��y�x�{@�g��</�@�^A0��@�\Da;��@�b�����@�p�A���@��^Ȝ�U@���U5@�̍0�J�@��K�د7@�2'T�Y�@�q#ܚ @��@~��@��'j��@�^�:v@�_/~7@��B�@�������        ?��b?�?�'.(hvY?�R�O3�?�e�i�@�9�<�*@N���U@\	{�@!�o�e��@)j@��@1�6a��@6k����E@<��O�A@B*����?@FҪ�a@Kr{j>9@P��� �@S��@��T@W&�3h&G@[`�g��@_?`�Zw@a�O�[8�@dt����@g-��^�s@j���@mC���ǅ@pQ��}�@r%���@t��i�@v~��D@x4,.���@zw��ϱ�@|ف�^@ZMs�:�@�� B�Lw@�\Ԅ��B@��i��ц@�Ltte�@��ɫ��l@�{�Ҷ�@�,Q^��u@��UY��=@���[��@��q%�<�@��\��lJ@��uv�AV@��`$�B@����5@���O�e@�)�\o�J@�V..��@��"��Ҿ@�Ȅ��@�L��@�\poC3|@������@���^(w@�<C��@���r��@��T+���@�n�0v �@�2K�(?M@���4	H�@��ÒC�+        ?�w��1(@�Z�vs@1Ȭp2\@Bz_
)�@P����@Y�CkTF@b���n�@h�_q/-&@p_xĈ�@t�0�.�!@z'�	X�@��7�ϳ@�H�kc��@��Э˒@��Փ1@�7�+H}@���h�@����Ɨr@�@d|�8@�08U��@�S;�f�t@�U�a�@����x@��{����@��'qa}@�K�7��@�A6�do�@��#�aӢ@��7j���@��CH�L@���.@�s +j�@��")��N@�]�P��S@��*��X9@��2feL@�(�| �@�ޔ���@���qr@�;{i@�,s��@�${�e�G@�$db�@�+�����@�:���@�Q�c(@�o�*��@ȕ��d@�Çc��=@���7�	(@�5��7CA@�zS}��@�ƀ���@���C@к�X�
�@�l!F�f@�!5r��9@������>@Ӗ]��K@�V^��4�@����A�@�����@֫����        ?����$?���y\��?�o�H?r?�ێJ�r?���|�?�Č�=0u@%����@8���@�@е��o�@2]�#��@D
z���@#��@&�*���}@*�"�g�@/IQf���@2s�8�)@4��"j@7be*OS@:R� *��@=q)�կ@@^�E�/;@BD�l'@C��d�@Eܵ�4#�@Gߧh}@I���<��@L*�N�J@NsK�@Piz'A$�@Q��P2z@R�6����@T?1���l@U��v6�c@W�"�pr@X~�G�9 @Z�H�@[��&J@])���z@^��j��@`@G܀�0@aM��@b��Ԅ�@b�e���@c�#�N�@d�m/��b@e�h�~(�@f�Ӑ��@g�T���@h�@�=�@i��۰�@k :�@l0B��(@mS�b� @n}){Ş+@o�W��@pp�\�@e@q��&*@q�v��?@rQD�:@r�˷�Zh@s�d�@@tJ�e��m@t�
Yg�        ?���Y�?���]�?�b���0�?��<v�U?��<:H?��%�[4@�)R恞@��S�@JTf=@!$7�L�@&�S^� @-	�C�O@2K[Z���@6��ui:@;�#o b�@@�V7!��@C�V�_v�@GIx��V@K'�*v��@Of\�~�@R���J@T�*�fWb@W>Y"��@Z*���@]L吕�w@`S;��y&@b#�b�@d�j��k@f-xv�d@h$�#JD@jaΥ9�@l�����0@o7��-�@p�C��@rD#���2@s��I�1�@u*Ђ��@v���'}�@xP��ň*@y��)�r:@{���!@}���
�/@^"�"p@�����_@��VON�@��L���@���qҬ@��C׭�@�챏J��@�cF�l@�B,���@�y	SL_@���	L@���+��@�MҊn��@����I+@��I`�w@��(i��@�lu�?`@�'�ߞ~�@���A
H'@����E��@�p�5n�        ?����E#?� 0�R	�?���y�?�ȊVVw*?���rj�@�验�@E�Jg�6@��c�a�@���QI@%�uu��@,!�].@2'��# @7t��=@<�P�v�@A�^��@E?�F3�@I^�>�b�@M������@Q�d�6Xw@TO�%�u�@W\�{G'~@Z�qS��@^D"PtW@a2�-5�@c$��@@e^gT�@g��]H��@jC���S"@l�"e���@o��'Jo@qd�t��@r�Ų�H�@t�}��@ve �J�@x<ȵ@z)�'�C�@|.l��@~J���3�@�?(�\�B@�eW��@���J�@��v&��1@� 5,8�2@�w|�D �@��k��a@�L����@�ɬ�H܎@�T+{�O@�몕5(_@��7Bt�d@����;Hs@��Pq�	�@�fF���d@�Rҋ��Y@�E���[b@�?�I�Dc@�@=j`�@�F���^&@�Tlr�	�@�h}O��@���1�+@��E����@���eF        ?�F ��@wm���@*o�N�@;g˚P`@G�lĨ+�@RE?�(e@Z1]e-z�@a���q��@gH68��@m��3j@rH�j%�@v3PDN.�@z�;EE@?\{�.@�1DW�j�@���!^�@��`�$o7@�$m>x\@��ر��@��H��@����&��@� �;���@� M]Bp�@�Z��	�@���.��@�"��L� @�Xi��&@���Fr@�_O>�@��0q��#@��0'�T@��n���L@�'�Ñ&�@���V�e+@�� �B@�P�raiV@���f�@�ļgf�@���;��@���ř�@��r���@�"��@�)�Tt�@�F��;O@�jW�[� @��ﮠny@��T�Y$@��vc�c@@�=G� w@���=���@���C:
f@����H�@�=N�M��@��!ӯ��@ *�>o�@�VbF�
�@���Y&@��G�9�@ŋ���j@�N��y��@�}�?k@��`H.��@ȩMv5�        ?����N��?��u <V�?�I���?�V� �|?�:�-�?����j@q���Vc@
�s���@�'��y(@�h�bD,@Y��ɧ@!]eʚ�@$��3��@(�����s@-&��$�c@0�YP~�@3w�;�/�@66��� @9)��|X2@<Q���U7@?�l`��@A��<�M�@C�j-�W@E��[���@G�|���@I�gP���@LU�J.�@NәGCz@P�F�;�l@Rh�j@S�Sɱ��@U(�h
@V��J局@X-�4�@Y���x��@[�D]��@]h��\ �@_G�����@`�}W���@a�N�(�I@b�c����@c��^�u�@d̰9;כ@e��{@#@g�R{ظ@hJbr��@i�_��n@j���q�@l
o@l@mi��t�@n��"�k1@pZ2狄@p�{p�I@q��cO9�@rHy�RW�@sWb!z@s�u�4!@t�ءI��@uq�`�J@vFx6��@w�!3 �@w�K���@x�,�O�        ?�+󮺝�?��I�O?�o�_s�`?�� Uݎ?��4l��?�KS|��@��� U@�|_�@/p���@ ���qe{@&����O�@-pp[c+@2��LX�@7����\@=���F@A����@E"�LC!�@I
���L%@M^�!B��@Q���B�@S��s*g]@V~�����@Y�9�El�@\��T@`1����@b�$R��@d� �F@f<�R�@c@h�����C@j�M�N~�@mm R���@p
�Y@qpyM���@r�_U
�@to�Ϊ��@v	���Q	@w��V�@ytEP��@{D�J��@}'�X@ �u@���W�՟@�����.@����0p@��\���o@�OTù�@�4�e9W�@�q��e�{@���"x�@�	D_�|@�c*@�9@�����k@�4z��a"@���N��i@��k�h��@�[�YI�@�&==[iT@�����?O@���L�N�@��\��@��=��or@�dh�	:�@�L�5�h        ?�\�>bo�?�'���?�kR�+�?�d�� ��?����*v}@ �&�)�n@
\`���@�M�)@[��G�O@#��u��@*$х��@1�Dv�c@5���w�@;%�v6��@@�=Tr��@D@�#�h@H@�ߥT�@L����n�@P���H4<@S��N2@V���U�t@Y�d���@]A��a@`�U��@b����L�@d�s�+)@gxSuAt@iO��_t@l�㭕�@n��x��@p�M�'�@rp2� @tN�Ev�@u���8��@w�c���@ydP��l@{U�<�e@}[H�>�@v�T��@���?�@��u�o��@�%�G��*@�_!q��@��}��8�@������i@�M���S@��N��+�@�$S]
�@�����p�@�(>C|�@��4߃��@���}��@�����#@�\.�o�`@�<m�,f1@�"[���W@��(#7@��2��*@���s��@��&�:@����_@��(<_��@�	I�闆        ?��\F~��@
��\�H@#��|z��@4�Bil��@B�Z���@L\�՗D�@T�opB�E@\5Fo��@b����{@gó����@m����E@r�83y�@u��^���@y�sI�D@~:�;�D%@��)�q�@�E�C�*@���8{�@���0Ӻ@�&~��@�J1v�3e@�bvB�@��=�@��/���@�Cy�(h�@������	@��_�~�@�t"7��}@�M��@�l�J��@�ܚ��f�@�]97*"@��{��&@���_�@�>�DK��@����7z�@��S�b�+@��Ѹ]�@�Қ�l�@������S@��n���2@��@��@�	a6Cp@�+�u��z@�V��q�^@���Zg��@��K� ��@�	�Xy�@�U;hZ�"@����غ�@�j��N @�5��3
�@��h4j @��;�rQ@�f9Ʃ��@�)g��b3@������V@ļsIf@Ōc�
�@�`�O :�@�9)���y@���<��@��&<y�        ?����U3?������?آr�5�v?��Z;��?�y-�ظ@ �u��@�Q�T��@R]�@� ��lq@��
��E@ re���@#���K��@'�޻E��@,����@0Qf�-�@2�ՅW��@5p*�Сp@8D�0�@;G-��6�@>xN��@@�H�@�@B��@�@D�����@F�����@H� �@J���ߝ�@L���^��@OR�ܲ�@P�=��2@R"�Fz�@SqV�	c�@T�kr��@V1V�U>k@W�����/@Y���@Z�DpN_@\<D�B�@]���K�@_�Y��@`�E��@a|�S�<r@bbKbA �@cL�y}�@d=��Y@e2p��@f-<���@g-q�6׫@h3 ���@i>6o�j�@jN��b@kd� UB�@l��"��1@m��aߏ@n�?LR�@o�a%��@p��c�H@q.�;��@q̽K��I@rm�Я�|@s3.��@s�l�@t`N��G@u��8f�        ?����B�l?��
���X?ъ�x�4?�n-���?�+7!�%�@����`@c'D��@A�p0J@:��X�1@$�b,�D�@+��� �x@2(��.�E@7!��y \@<�ޓ��@A��i|�s@E�{�`@I��4w�@Nu�>tU@Q�Ԥ�R6@T�݃��@W�R٧P�@[0�Ĵr@^��!��@ad��c@c��cn@e�f�m�@h$>�Ο�@j��m� �@m^��J@p�/Yo@q��pk��@s,*H<�@t����$@v�����@x].I�F@zAa3�U@|:��U~�@~HѢ�bo@�64�]/@�R��Ο@�z6jC-@��<��P�@��[�ؾ8@�1s�c@���D��@��14�0@�L�//I@��A2��@�B�'<��@���.P@�3����6@��n��@�݄�`57@�����%�@���E��T@���F�'@�z_�i@�q�_�@�n&�_�@�qe�;c@�{�B�@�����@��nTdf        ?�������?�ݨz��	?Ք�E��L?����y[?�4k�(�P@��_;��@���r�O@�
L�@xW���C@#�5D�Ux@*H���p@0�lŁ�@5I=��|@:Y�h6�
@@*��+@CR�l}R�@F�<�3w�@KzVt�a@Oz��I�@R.�m�^�@T��0^˿@W� ��{@Z�W��@^-�p� @`�V�~!@b�4�:�@dθH�jE@f�.M�>@i8݂��@k��\@n ���@pb\���J@q�Y�!x�@s6�DZfq@t���O�@vK�()��@w��d�$@y��{<��@{g�W�\%@}<��s@#1�ke@��D����@���;�,T@��{q4�@��*���@�ҬU"@����[@�*y��ii@�c�^���@����t$�@��t�W��@�G����^@��T��~@�_I�@�@!��@�����@��t�⡹@����0.@�To@��#@�%�YE@��SY`Y�@���G�(j@��V��        ?�b�=M@�l�b��@.5���6�@>����@J"�Z�.�@Tmm�E�@\����	@cLy�:�@i"0�M�@o�8.�D�@s��Tf@w�`S��@|Y��ԡ@���蒒@�d����@�SH
���@�y�/�¨@���ia�V@�7�θ�@�8��n~@�!�{b��@�A�
"=@�~kеΈ@���\0@�NY��>U@��s�S@�H��3�@��^����@�$3s�=@��X�'�@�8ŠZu�@��nJ��@��@���@�B<$�@��w��`@��E��u@������@��$��@�ܺ��n@���1E�@��}�h�@��1)?�@�H"��(@�9"�z��@�^!�@%9@��H���@���0Gy#@��/���k@�0�@�tA����@�_p�:	C@��;�9�@��ʞOU@�b���@�C:?r�@��� ݤ�@ă��U��@�@1�T@�����Xo@�#���@ǈ��X@�Q� �9�@�T�eps        ?�Mi^b��?���ȅ	�?��/�?�8`�?�?�+����@@X� {�@��!�w�@��0�z�@�໲.(@"��D 
^@'(ԫ�fI@,�ɪ�3@0�#+�I@3�j���@6�+,9�@:y����@>8xC@Ao����@C=S�ɲ @E~��I2@G� �$�W@JdP�ܐ@M�?�o@@O�Q6"�3@QX��>�/@R��Jy@Tolw^�@Vm���@W���zjw@Y�6���]@[c9�f�@]J(�ǂ@_B+���R@`����@a��V��@b�ܡLY�@c�jM�	@e�:|=}@f>X�E(�@gv�y��3@h����6�@jox�@kS�ے�I@l�H��@n G�<�@o�]�С@pz�)��\@q9��q��@q�; N{@r���Z@s�V�fA�@tb�3��@u7+��g@v���ۼ@v�C�%�@w�]SNG@x�	S΄�@y��N@z�֛��)@{����N@|u&>�@}nSQ�@~kCP��&        ?�H���˃?�꽊}�{?���ا�?�P(�?��L�c��@/b��@Z�4�xc@��eIZ�@&Qt�΃@.b1T/��@4�/1"@9���׻@@J��.�@D*�N[o�@H��Z9,�@M�>?v�@Q�2��RF@T����
�@W���3��@[�Y3_�@_� �d@bH<i�@d[�4�~�@f�7Mw�@i�J 
2x@ll���J�@own~0�@qX.��W@s҂p�A@t�ȓc��@v�3;{��@x�9:\l�@z�|D��@|�ׇ�@0����R@�Ź�݆a@��dMͲC@�E��_)@��]��z@���E�|}@�d,���|@��KI��@�c>[�eJ@�� .��@���lY�I@�A��}�@�}>��c�@�_�t�r@�H�<�e�@�7����@�,�mb�X@�'���<t@�)$��@�0e13�@�=�o�@�Qi+�@�jj�h��@���;�l�@��z)�Ξ@��/|Ek>@�
�[ @�"��?N@���c��        ?�*�(+��?ŬB>�<?���pg�?�=�v��@�[���@q��a�=@�y�@!f�?y)@(nF���@0���X@5����s@;�gqC��@A�^��6@E�^C��S@JW9�{Q�@O����B�@R���@U����@Ym��4H&@]B�N�@`����|@b�{��-@eW:�L�K@g�$s��@j��e�Ĕ@m��!%�T@pTa0��@q��8Cz�@s�W���a@u�Z�¦�@wqe5�@yu����@{����@}�U6�@�#�_@�E`�dye@���eҽ@�ٺZ~�@�7�̔��@����$@��u��@����>�@�82i�9�@��=��;@���t�b@�#�{%��@�	 c�Ղ@��m.��@�胊=�@��\l�e@���Vʰ�@��-��3@�����@����@�'����@�I���@�q�^3<@����U�@��K��P�@�f����@�(cّB+@��1��vP@�s�i&        ?��G����@!�7<ٖ@851S���@H��R��G@U7vz�i�@`Kbw�#8@gF@0Ih�@o���l�@t�����@zHܘh@�)�I��@����ڱ@�q�Yl&_@���b�	�@���i�@������@�1a�smq@�1��2�@�F�@�9����/@��)NJ�@���(c�@�s�]@�@�j0�y#@�w�q���@���N��U@�����*@�,�y�8@�����@��v�!�@�[oN��@��M(���@�k:�@���k��@���G5�@��)d�2@�/�"��@��J��t[@��B�Cy�@��m����@���/��@�r��6@�c��w��@�\J|�#O@�Z�є$@�` �`s@�kj�>ջ@�}43l�@ɕ`���@ʳ�թ|�@����v�Z@�X��q@�6$���@�nM��î@�Vcz�@���|^)�@ў6��@�F�s��v@��U �eV@Ӡ�_�H@�R��ذ\@�'�.��@վ��7        ?�j1�ي]?�[4�4?�tl�P�?���'�?�$F�E�?�y���A�@��F��R@oZŮ�'@�t��@��Q���@�7�*Z�@"H?��4@%�� �j�@*	}""	w@.| �{�!@1�
�D2@4F��麕@7��Z@:�v��@=V��(R@@b)�6^@B3�u�@D pM�֛@F'�1��@HJ���@J�� �@L�e�j<@OX9g#&@P�0V=�@RL��2q@S�R�X�@U&�KO�@V�j�eр@X:�;�@Y�$�E9�@[�ȘSG@]Gͤ3�x@_(�6**@`w��c�q@alM��8@bhM��e>@ck���9<@dv%)�A@e����@f�%j2x@g��!�Z%@h��j�@j!�mW@kO����@l��@��@mӏ�$w�@o 8ۅ�p@p:�nF@p�۵��@q��r�8�@rM]Z<r�@s��ír@s�ǉ�Ζ@t����<�@uD��#W�@v J�L�@v���t>`@w��@��        ?��Ao��?��5\�j�?��S�
��?�Hl8�[�?���u���@����@�4�F'@/�Ĝ4@#��h�ÿ@++>�3�I@1��A@71N*W@=FL/<�%@B#g�ǟ@F���>�@J��˿)_@O�T�g}@R���Ѧ@U���&�@Y$[(��@\��?2V@`[����@b�$�^H�@dՠL��@gS}<rSc@i��ݒ�@l��!�@o�Cs��@q�/S��8@s9	 ���@u	��@v�T��t@x�M
���@z�AB]?@}$�iǣ�@m�M�@��JQ�.@�'����+@�t<"үZ@�Χ�B{�@�7l �Q@����Ë@�2N�Ky(@�ŗOdl�@�g�ޘ�@�W��Z0@��)����@�Ӗ@�H�@��ģ[xd@�������@��vG'd@���HR@�Ϳ#�@��k��@�6Sdi�@�*44�ҭ@�Yv�N�R@���K�@��@d�6@�x/�e@�j_�4�m@�a�h�9�@��h��m        ?��δM|F?��oU��?Ѯ-<�J�?�Ɉ���?�B5���@�Mـ@�2X��]@��Q�]�@�tH!�w@$;�;�l@*ډW5J@1\��VU�@5�y7b@;E<�e��@@�C�2v@D�B#@Gݢ�j8@L��Uَ@P[䈴�@R��6M�l@U���,�@X�U�X�,@[ئ���@_J����;@a|qyJ�R@cr*��۝@e�ϝ	�@g��=H�@j6���'@l���� �@oM�B@p��Lj:�@rOd�5�@sʝq@�M@uV���jq@v�{d��m@x�]�;B@z`W� ��@|0y�V@~�`�*@�/ۛ��@�Q���@���u�?@�!��4@�=����@�bh��@@���*��d@�Ŋf�5(@�	���@�K�MO@����K��@����N��@�S]�$��@��UG(��@���6I�]@�S�SH3@����P@���U�;�@���{O��@�pK��HY@�A�����@� �O�@��:��        ?�t�F���@Z��@'O�:���@8���1�@EЇ�<�\@Qj��@X��Fk@ai��+�@f�b�V�]@l��R���@r	97��j@v����@z�n܀��@tsp�#5@�l��\>@�Y�����@���xT��@���ȉ@��3"���@����[Q@��℧��@����<L@�Qm��@���m[fr@�U~~9s@�z�v��@�n�65@��2����@�v����8@�h�@�@�þ�V@����>>@�Wò܍x@�<���t�@�3̢��H@����V��@��7��}w@�� ��Q@���C���@�ȜE�@�=�ɣ@�x�~O�@����?N@�
$k�@�`\�``@������@�'��X@��>�zˇ@��� d�@�Kd͹�o@�o;i�p@����03@ê���E�@�}��;L�@�Us���)@�1l�Š�@����@�����@����zT�@���N�'"@��
�G�@˶�a4r@̲G71~        ?�A��8?����\�?��i!�X?���>��?��^���@ @N�f@r����@e	��@�e�@ڜ����@ ���ML@$a��ps�@(w�}f_9@,�p/ �@0���x�@3�^�S�@6�����@9�x�@Oe@=�����@@L����
@B1��U+@D1�;E�@FM�9	��@H����B@J��8��^@MFA3f�@O�0����@Q9u��ϓ@R�u(��k@Tg�f�@U}��J@W[� ��@X��+�?�@Z1�t�/T@[۠�.?@]�d��j�@_R�3�d@`�(�(l@a|����8@bo�? �@cg3�6�@de9o��1@ei�a��@fr˞�l�@g�S��({@h��%GO@i�����@jӸٗ�'@k�j���@m&�4�@nY,���@o�I��;@pg�|��@q	���q@q��4�H�@rV�!\k�@s�:�"@s����ώ@t`�_Q�5@u⣪lr@u�z4tW@v�A�F��@wCj��)�        ?������?ō0*�P�?��Mx�uq?�l"�5	@��ɽ@La�sP@��FI@}ޔ]�h@%���^�@-v��Ͳ�@3I�	^�K@8����U�@>�F�#�B@C#��@�@GKn�Xp�@K�x��S@P�޿z�+@S��`�Nx@V�!��s5@ZN,د @^)FAG<�@a,W�΄k@coAل��@e�W�-
�@hzs"��"@kDW���@n<�4��@p�$���@r]�D���@t!��;c@u�_�pt@w��#��@z�8��@|+*��T�@~m���Gg@�e0�lhR@���x�@�����@�@���$@��8��m@�|����@���+�Ҿ@�%�fQ�.@��)~}�@�l�Ŋ8F@�%Uc��c@�v+-y�@�`��\�@�R���@�K�s��f@�L��I@�S�����@�bVB���@�xD�fؒ@��]����@����|z�@���@z5@@�5@-�@�P6�L@�����W@�ש��Z@����0A_@�<���V        ?�#���nf?������?�$f����?�U�!��J?��=h`�@	�R?aH�@��d>��@/����@$tQ`�lZ@+��Ln�"@28�B�@7l��aI@=� ���@BI��@FQTԾ��@J�;��@P�@R�^Y��@V�P��@Yy�`N��@]C_�7�@`�Ї6(3@b�蠄,@eS*��@g�a��1@j���@m�,<�j@pb��q]�@r����@s��i�@u�!/��@w�8�x@y�I�)̔@{�d�_��@~�T[zM@�8�
+Zx@�q�voCr@����(A�@�
�R��h@�j���<@���vA@�P�����@���>��@�jY��^@�
��r�@���!�u9@�8R<B��@�����)@�:Q֠@��N=B9�@����r��@��ʸ���@��>55%@��19?�-@��Ԇ�@����6X@�;*\�@�_6�]�@���&��@����0��@��xĲި@�L����@�������        ?��d�l@5�t�D@1�:�a�@BW�/���@O�\ �@X�(��.�@a�,�랳@h�_��C@o�蔊D,@t(����@x��ҩ�1@~Cg�@�!��D�m@�n����@�
�yo�I@��}ʔ�X@��5���@��Qy��@�Ml<t+�@��2�٩�@��*��X�@�����B@�F�i�f�@���r��@����Ul}@�Dt�b�@�@;�1�@�����x@��7�ʿC@��1�~N�@��|M;�'@���b�S�@��e�J/@��d��@��@��%@����@�O�ن�@�����u�@�ΎTD�!@�<�R@�h�D ��@��i�u�B@�	�h��@����l�@�x���hH@�2д0��@��j����@±��a�@�vs~4o�@�>��XGR@� U��p@���]`M�@Ʈ3e�v�@ǅa��#@�`X�m�o@�?��@�!�堙�@�+ll�i@��q�j*@���Hpi@��x�[1�@��6%���@����̳�        ?��S
\l?������?ȷ��H�?�|�)��?�<�P�?���FB?�WެW�@��62C@	"���H@(���l�@@y��@�(�� 3@���	�@!����.@$���l�@(W�N�I@,�H_�^@/��j7�@2�GR�@4eQ�R[d@6���x�@9e���v@<�G}�@>��@P�@A���C@B��J	l�@DF�F��@F�p�Z@G�:��@I�R�i�1@K��sl'@M��0�R@O��h�3@Q��ֱ�@R0O�U4[@S]v��Y@T�+"�[@U�h�gC\@W/IR@Xq��`8@Y�f���O@[4�a��@\��!���@^aè�@_�I)�|�@`���D'"@aag��@b0����Y@cY	Đ�@cܜ��v�@d�l�wJ�@e��(s?3@f�Ƒ*��@gkYM*9U@hZ��h��@iNP�I��@jF�zi?	@kC�<;|�@lE(�'�@mJ��k~@nU4��@ocѪa��@p;\�)�        ?�#;���?��d�ӽ?��(\\,?ݚ����y?����(?���7�t�@�W�6�/@��B��@&N�^��@ ��-�3�@&�X�xB>@-�i��a@3�Kpq@8��0x@=�g�Zl@B�;띀@E��y�@I�j�Py@Nu#ˮ��@Q«�ֈs@T����P�@W������@Z��$R@^v:A�@@a(�L%��@c:�Ai�@er���HY@g�&}���@jT��m�?@m .��"@oӸ3s�@qg·a``@r�'MNqz@t���I@v\�K��(@x-o2���@zIK�^@|�W-�[@~�X�`�@�!`fnbS@�>pSf�@�f��@��m��a@��oj']@�'����@�l�*��@��< ��@�,qK�@�@�������@�����C@��֟A��@�R��@�ݒ�h��@�����2@��u^��@�\y��x@�:;aĳ�@�/D�@���H�@���|�&@��@���@��@<@��\��        ?h��[u~?�D;��9�?���!��z?�I����<?�ּ�iZ?��_�6�@߉�l��@a�;�H@�����@"Շ7��@)�%�E�@0�R�j�|@5���T�@;P�4��_@@��QYB�@D�[	[�@H���+@M�����@Qt8����@T^�� �t@W���۝@[��Г�@^�0�T��@a�1��k@c�)�kv@fy��oS@h�AT^�@ke���F@nMVrת@p�A�x��@rR�)���@t��~��@uܣz
r�@w��7.�@y�b��@{�ņ�s@~OPc�:@�+��[&�@�\ww�s@��ȸ��@���Z�@�6�TX\�@��ӕ�x@��b�@�~Lŉ�@��u���@���;@�1�q,@��E�F��@��Vl��@��[c��M@��)Q�У@�x��}�@�i�s],L@�`��Z@�]r-SJ@�_���=@�g���l@�t[��@��k3�.@�����@�����j+@��k�Jt)        ?�A��r[@ ,;h�
}@^w��^�@*P���@7��q�2Y@B�#�<�@K��J���@S7D��@Y�b�z�@@`�,`���@d��ɮ@i���{@o�SC8�@r��F٘\@u����V@y}�&l�@}o��}�@��a����@�'M��@����-V@�Al�4�@�_�4�"@�ޙ�@���E��i@�F#�3}@���J�@��+�/
�@����nj�@��x����@����$�&@�8i��C@�DZ�;k�@�x-4At@���U( @�d�'"@�X���8@����.@�&<����@���p��@��cM��@������@@�D颍3a@�礂oQ�@�ʉ�ą6@�����a@���s�N@�nȧ�@�Yo.��@�I����@�?ɺ�@�9C�H�
@�8[�)�@�<S-��@�E&X��w@�R���5@�e=�E\@�|kM�6P@��FHM�@���T��4@�n�Z��@��~��)@��j�v�\@�3f�]�        ?��ȿ�M?�?��tF?��..��?�n�/ x?�su재?�D�8 ?��}����@�{�mi@l[L���@m� z@��)��@���C��@�:NL�@ jё&pV@#B�����@&\p^�@)��0�@-[�c���@0�&�B�@2��]��@4�Js9�@7Wea�Z�@9��ĻX�@<�Z5�2@?]SAM�-@A+�nT�l@B��R�h@Da���L�@F�4F�@G��B��c@I˛0��@KÇxI)O@M�͊Ƶ�@O�d�@Q<v��[@R=�S���@Sp|9��$@T���|@U�!�� �@WM+	���@X��!�W@Zl�Bi@[�5�ڕ@]h�E�@^�p�g�@`!�E@`��X0�@a�N�|�@b����l@c��r�U@d����LV@euQM@fn2��@gm	_l��@hr��@i}De���@j��G���@k�HM@lî�AD@m�h�-q�@o>�i@p �2X@�@p������        ?~��*5�?�/R��?�RAXy2?�L��NXi?�*�o�G?��Mt�MX@	�L�>@�m#,�6@D%Q�PA@��a�?@$��h�@+��>�@1���Y��@6F�}��@;�1�P,@@ˠ�@|@D40*��@H���@LD�*b�@Pz1-�@S`�4�@U�r$�RB@X���ڏ�@\/���]�@_���SgX@a{��@c�/��@e�avф�@h;�M6@@j�a�	|�@m8P�S@o�?~8w�@qa�[�N@r����JB@tn����@vS)G	�@wƞ�z�,@y�Ҟ�m�@{j�mM@}X�0��@Z[��^@���l���@��2�YR@��i��k�@�{�m�@�Dm�
3@��GqO�@��
�n�C@���X:�@�oS���@���!O��@�@D��~@����G@�e��yn@���'�@��c˥�@�{�mn�q@�PO�d@�).#֪�@�3�!�@��[IC@���\_C@��T1�L�        ?x�z`�5�?�(X�m�s?�xgF��Z?�S��i��?��C�Wn?�w?�֗@|Sb@�@qE�FC�@���W5�@�E �R@#���%�*@)��Y���@0�;�^v�@5DFO C@:-�qs@?��a��v@CF��$�>@F�T4gJ,@K�<��@O���Q��@RQ4̜�@U�E�b%@X��/C=@[A����@^��-tc@a=3�۹�@c>L���@ea�
K�@g����@jv�
z�@l��K.�@oZl�5@q[4N@r�Q>��@t1!4@u���� �@w��#��@yg���C@{M@K��@}G���v�@V�cg��@���2{��@��ml�)@���-�@�4`",n%@�q����@�����@�/,\@�k�5-N�@��	�]��@�I��@�ɉVu�@�T�d|:@�uq ���@�F4R+�@��=�1�@������w@��%�A�@��Lv:@���u&2�@��3ޖ�*@����k��@���d�        ?�X~�̤�?�p�~�@�̢p�@'�x5�@4d�_�I@@_�2�@Gp�}wt@P,|���@Um��O�;@[��4O@a:S�>�@e%��h@i�^e�|@n^�ޫ�@q�14��L@t�k�fщ@w�H�T'k@{[�/M��@P�$ڍ@�O��� @��o�s?@�ڍ�"@�=4��5_@���U���@�or��%�@� h�hu@��v1�ǋ@�)��Χ@���="L@���di i@�J�7��@�(`S�@e@���<?�@���5��@�S��T@�5�a��@�WkwD�@��X���@���,#�@��-3�h@�K#H*�W@���KI�+@�S0�ߢ@�r���%@���c�Yh@�m�S�F�@���V�@��JL� 3@��5�+(@�s�~H*@�P��b5�@�3K�h@��#E�@�|z�ne@�����^�@��!�pI�@��Hx��@�����H�@��7�#@��\��@�"E��r@�<�i��@�[i<v��