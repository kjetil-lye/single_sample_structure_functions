CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            h/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_75/N2048       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-030          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190901T140713        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              ?�����"{?�㎢�?�r@��?��%X9��?䈮s@F?� ����?�j��[0�?���5/?�2x��F@�����@�Yw�t@
�@���@��<�"@���Y��@��]��@�*b?Q@Aӥю�@ L����@ۡr�3@ �	Ń�@"s�Ԣ�@$	���@%���K��@'^ۚ��@)a�
��@*�LM��-@,�d�I�U@.�v�|�!@0F&���@1B�.� @2E?�y�@3M=B>%3@4Z�;�Sq@5m����,@6���T�V@7�o�#q@8���c�@9�����@;�����@<LPEE
@=��J�:S@>�&��#@?�+m�)�@@�k��N@AFW�KL@A�󗫻�@B�����@CAp���@C�����@D��F�� @EPu�[�{@F_�u��@F�]<�@Grf�)3�@H,t���@H�7%��@I���ɚ�@Jf|A�j�@K(`/o��@K�-d$k@L���4�@Myt�@NB���        ?������X?���\o1?�Ě2�y?�p{9u?�w��?�Eqe��?���?��z�9�@����)@��;?&@�$��@��]�.,@h��vEI@xX�4a@�j���@�k���@�o�%O@ ����@"d��@@$+|�T@&MՖ�@'�ϳ�A@)�vN�6�@+�h/,@.���`@0����@17�:�Y�@2[�,�hh@3���$�@4�J^y@5�� h�@77�be��@8���0@9��t�H�@;(̚t�@<��Z��@=��rwU@?V�E�D0@@d�^�@A!]���Q@A�U'@B�����@Ck#��\�@D4썼O@E�%�Ag@E�#�dD�@F���Wy@G|P?�>@HU�24+�@I2��(|e@J|JQ��@J�r����@K�s<�ã@L�v���q@M�w�
@N�mrǞ@O�S����@PC�/,�@P������@Q<2��ܱ@Q���j�@R;��e@R��0�L        ?�x_"�Z?�v!��ޕ?�tǳ�?ச�f��?�pa�G(?��z�i?����?�f�N�@^!�1�@���TF�@<î<5O@�*�\B�@FҜ�@�:n@Ƙ�{�@GѾ���@�8YF�@!�
Q�=�@#ZJpy�@%=}1�@'3L��I�@);b̀t�@+UjQ��@-�"���@/��h@1�?��@25���3m@3m^�y@4�]z�'@5�zOPJ@7E��A��@8��C)&^@9��ǰ�X@;e:u�h�@<Ԏ�f��@>Kz��f�@?���&ъ@@��q���@Anns?@B8�S$2�@C\˦@Cץ­*b@D�m�&~!@E�����7@F`Z�ގ@G?q8�i@H!�`r�@I�eP3@I���RQ�@J�H�jݟ@K���I@L��Y�M@M�+��@N�RL��@O��=u�@PU���is@P����n@QY�$6��@Q�E�'��@Rd2�Us�@R�j��@St��u;�@S���g@>        ?�2z/�	�?�Ǌ��a?�ah��K?�F_�|�?�.A�i@ Oe0s�@ٲh]�@"�`2��@��|�@j�+@�W\�@� �9�@!t־l8�@$���(@&� �+�|@)��@,���Z@/�0&�E�@1o9&�D@3X��O@4����@6����@8��Z�s6@:ni���@<g7�n։@>n�N�@@A^��q[@ARz�P�q@Bj=��p@C���y�@D�H
��@E�[��v�@G	���*@HA!9���@I~�����@J�V��K@L^y��@MZng^ !@N�+���@@P�Bu2`@P����O�@QgR�gUB@R��;�#@RԥP@�@S�@����@TLrp�϶@U2Y4��@U�x���@V�;��Tc@WZvL��@X$݌��@X�-���@Y��eg�]@Z�\^/μ@[bk��8.@\7��`7o@]W��$d@]�&_�1�@^�(���@_�Y���a@`A�D���@`�>QyH@a%jq��        ?��?>�?��34z�?ϲ���/m?�(�Wa@�?�ý�%�?�5̘��?��f~�?�!�b�}D?�W�M1D@��(7@ª����@
���qǥ@���G�[@���`��@P4��@�%v�u5@Ǟ��@�3���5@��4$G@ �4���T@"4~S�<�@#��T��@%RϚu�)@&�0���@(��5�{@*T�ž@,�J�@-��7�r@/�Kʢ�@0��<�A^@1�T#�Ui@2���m}b@3����\S@4�j��K@5�����@6�X�>(i@7�lAq{�@8��i8��@:	l4L@;&3��"@<G��Z@=lh5�@>�����@?�ћ7d@@yK�5P@A�楢�@A��l��m@BM�G0s0@B�֥���@C��c︋@D3-f�uZ@D؅��@E��[��@F(f��c�@F���u	�@G�:�y@H,˘�wy@H�-|�#@I�%�z��@J?�h�d@J���u�@K�h��#�@L`�o�V        ?�2t] �?�[�w/��?�J��?��_�v�?�-
���?�ǳ�Q�?��W�<�R?��R!���@"����@R�RB�}@��@���@d+�G�h@�� n8@ͷ5@v�@���b@�nl@A@f@L�5@!Cu��@#
h̯8@$㧗��@&�ہ��O@(˱���@*���p�@,��OT@/),D�@0�����%@1�2��q#@3����@4E�f�B�@5�"���`@6��\�@8l��@9tWx�,�@:ҤiJ�@<8:�TB@=��j1@?�"r�@@I�<E�@A
�����@A�)XY�@B��r�_@Ca�2���@D0;�Y
@E�#��D@E֘�O�@F���O�@G��!o Q@Hg†F�@II-���@J-�|MC�@K߇�G�@K�6��M�@L쁅.3@Mܶ��@N���/��@Oſ�3i�@P_B԰��@P����@Q\9�3As@Q�����@R^���l@R���'�C@Sf��,9`        ?�����O?�[2�0�?�K�t��?�\MN�=�?��ǘ���?���U��?��;7���?��,{��@~�P�@<ppK�@
R��.��@��:�2@��ʺ@��"�%K@D8v/��@'��惘@.�W��@ +��_[|@!з��E�@#��x~#@%J���0�@'��P�@)v��yL@*�G'��@,�����@/��g@0�ߩ��@1��8N)�@2Ź9?~>@3�M#H#@5�S6@6D3�
�@7{P�S�@8��*���@9�^��%�@;F#aV�a@<���=�@=�j�V�@?Glظ��@@Tv"�0�@A�7�e@A���_E@Bw����@C3ʸ M
@C�Zu @D���m@Ex*.��@F>�*� @Gp� �@Gԅ����@H�64���@It{�?�o@JHO��ҁ@K�7�$@K����_�@L�〪��@M���$�@N����`@Os�����@P,g&=��@P�)���
@Q�
@Q�>��        ?��$EHe?н
�/?��L��k?�3�[��?�Y<4��@ ?o��A@��
��@��?�)W@qL���y@;��Y�@V��M]�@�J�ߛm@!8�c��g@#��O�0@&Tf��@)Jh�V�@+���*�N@.��;:l@1����@2�7D��.@4I��?1	@6 [����@7�E�S�,@9��F�^@;rg8�@=[Z��l�@?P����@@�����@A�ĪղZ@B�z����@C˱:s҆@D�M�`ey@E�8ާe2@GZ��z�@HE����@Ip�w3��@J�*+@K�6b��@M_�R�@NN�����@O�����@Pl�Zͼ+@Q.��3@Q��R�n�@Rf-%b;U@S�ǻ@S�0B@Ts ��y�@U&\AYc@U۬�p�@V����@WLqj��@X�2%p�@X�1�t��@Y�{.f�,@ZE��:��@[��M��@[͢�5�P@\�Z.P�q@]\�_�ݤ@^'$��'�@^�/��@_��D�@        ?��}��#?����٨?�5�Q��?ڿ�~��?�a�β?�?�ȟ��Н?�C�� ��?�ɢ�LRu?���?#@�� h�1@�ZPqq@
o��.LG@�~@�N@��
7�@��%@`:|F 8@�Cw�@��̈́��@z��{$�@ ���%��@"5���Yo@#��.C-@%b�;��@'�0ڋ@(�\�@O@*�JG#�"@,O5���	@.'�gߖ<@0���^@0��8a@&@1�����@2��]xJ�@4���h�@5$�)^@6 �3��@76�z�0@8R�.��@9q�feUn@:������@;��4@<��Ĳa�@> �qN�@?VȚX�I@@H�lX<r@@��@A�\qt�N@B.6��V@B��#�@C|	��M@D%񱫔�@D���(�@E����E@F/O�V�@F��c�!D@G�S1H@HI�[��@I �r3�@I��B�:�@JtF@1x�@K0�j���@K��h@L��}*@Mpv{��[        ?�3�(ݚ�?�����?ѥٮ΀�?�:"?���?��4�P�?�?��j��?�����p?��%�7��@r���S�@?����@	_�%ڦo@ϩ�[�@Fl�pm�@�Jb&�@r>�rs@=1�N��@*$�~>�@8+´�@!36�h��@"��Q02@$�L�R�@&U�ؑ@()�9O�@*D)ܸ@+���oF@-�2�݁h@0�8�!�@1i`r�@2#��W�@3=g6��@4]g�ކ@5���a�@6��,��@7��~�s@9Ö�d@:W�X.�*@;�4o�.@<�$b�+@>2���@H@?�M����@@o�Hf��@A�U���@AЈ�Q�>@B�����@C;�
\@C�����@D�\?Nz�@Enh���@F.��k@F�_Nw�@G��7�O�@H~  �^L@IG�����@J�����@J�εS9(@K�C�>b@L��F��@MY.h�$�@N/�K��"@O��zu@O��D@P`R9:��@P��[��        ?���Fa��?�-WI5��?�0��u�?�wB��?���O?�oP��?��(94?���X�@{Tcb�@L_f;M�@��C��@a�=&<@"\l��@���E�@�UΆV@�D���@!��,<@!F����@#7���@$�Ğ3@&�*�@(ק�R@*��_q�@-��I`@/?�����@0�>�^U@1�8��X@3 >OYU@4[0L��@5�^Mޙ@6�z#?{@8<j�G�@9��,�@:�bA��@<c7���@=�~0�6%@?M���C@@f���9;@A*Ҡ�@A�2'�n@B��X@D@C��g�@D[�qu�h@E0�Ĝ�@F	NQ�z�@F�9�s�@Gă��f�@H�&�f=�@I��7�@Jv\v?#�@Kb��R�@LR����@ME�&0�}@N;�3��@O59�;�@P�zm�@P����A�@Q ��NI@Q�[HQ#@R!�>E�@R��淨@S/7��M@S�U�oq        ?��r>_&?Ј�I��?�j�鿧]?�޳���?���S@ ��;�@� u�w'@����r@Pw�ERA@k�@4�� ��@�h��@!,x�L.@#��z,ɍ@&R�2��@)�6�&@,�^��@/U``�@1�\\�@2�V:�@4s�r��r@66&M:�3@8��z��@9�҃
�@;Ғ\���@=��vy�@?�u*�@@�o�_�@B3H��@C"���@D94Z[�@E\L(�j@F�MǘN@G�� �@H衙hFN@J"�ii2@Kbd�hB@L�u���g@M�ܧ�ɇ@OA�7h7@PK*6Dp�@P��� @Q���u�@RY���p@S�B��Z@SĻ�M^ @T}�Lg�{@U9m�sS�@U�A��@V�Z�Y�@Wy�`o�@X>?�:�@Y�*���@Y���@Z��5�B@[f�5cB@\5P�jJ�@]�ص��@]�
\/@^�w|�@_���K��@`0*Ws��@`�۲f�M        ?�hG�J(?��bn	b?Ϊ
i!�?�F� ��?���^/?�?��x�Y?�伫k>?�H�b �?�E5��@ifP1@�!d��6@	�����@�09,�L@���@G��F� @�o+�@V��=2@��=�[�@H�eնM@ �c�j5@!lG`<�@"�q��8@$_��%��@%�(�~�@'{��+�@):�G�a@*�!H �&@,m ]:�@.$��G�@/�u	~JZ@0�3؜��@1���<�)@2�ufm��@3�s�VU@4��38�@5��%�|@6����5@7��!0O�@8��c	�@9��S�q6@:�&'Q5�@;��JϞ�@<�����@=͐79�@>�H8G�c@@ �h��@@����O@A�Ņ�@A��5�@BEK��?�@B�Oޙ`b@Cp�N��X@D�~��S@D��{�<�@E<���J2@Eؑ��@Fu��"��@G��}o@G���IH@HU��p�(@H��R��@I�wJC@JA��$P        ?�򉨷�;?�Z��qE�?�=L��?�=]�ۜ�?�ˌ#��c?��v`��?�{:e^j�?���ȅ �@Su)�\@�OU�H8@
?��҂�@��9_�@�Wԋ��@{��@<|��Ն@!�	�$�@+
$!P@ +`��T@!�!��7@#�h��@%P�Q���@'(-�G�@)�^7@+(Χ.E@-
MmjU5@/=a�^@0�`�:=@1�Ҿv\c@2�[����@3��8���@5,N�_�@6`�X��s@7���k�@8�#�JW�@:%X>t-^@;t���<@<�<Q�,@>$��V�@?���ka4@@wa�d�=@A.���K@A貍q�>@B��Rk�@Cf���@D)Qf��@D���I@E��G��@F����v@GR59ڧ@H#@Ξ�_@H�<���@I���<_f@J�\9�x|@K�u<��@Lb7m@n@MC�T��@N'�V�_�@O>-^=@O�ni_Lv@Pq�Hf�D@P��9 @Qa l1�@Q�Ɵ���        ?��$GW�<?��K�M��?ьz�^?�x�_��?���#3?�*̙�z�?�����	?��=�FmL@U�q=�@zd��@	-kB|�@�n1�+�@&��H@�ȅu_@2�L�s@�j'$�H@�:��@���,�l@ �� I�@"�tI#$E@$:,�8u@%���a�8@'�Tr�@)��v�Y@+m��j��@-[��Z $@/UϨ7�@0�'�x�@1�s+qz�@2Ʈ�ּ�@3��nA�@4������@6��@7=#�1�@8h�wP��@9��Tt�@:�?�'�@<[戊@=M��@>�S1%Б@?ް�n�@@���x�@ABD�C�%@A�r�n��@B����@CQ\�q8@D|&0�@D�:��@EuK`��O@F0���W@F�Boٯo@G����@Hp ��u@I4S�c�@I���f��@J����@K���H@LZ0y|Q�@M(�+@M�g�P@N���2 @O��Z�˺@P;�r(,I        ?�M,C��?�$iBi
U?� ��
�?�$sk�u�?�3���;?�V����@�/6�+a@
�+��@�m�Z�@n�G�6@]ǑM�@��~d�@ ���S�=@"��W"m@%f��2˓@(y���@*�5�Ν�@-��%}K^@0A��Z�@1Ʃ��b@3XN�A6�@4�&��L@6��D�@8Ty�ߧ@:inN@;�t��Y@=�48!G�@?��t���@@�^5C��@A�ԘL��@B�ʸ�A@C��)ّ�@D�<v���@E��13�@F�<��`@G�980�@I	_'P�@J&.=OSM@KGԣ}@LkAG@M��pIX�@N�g�T:�@O�� '�@P�
�	pV@Q.�5�`@Q̸����@Rl:�ϻb@Sz{��@S�m����@TU��s�@T�U�n�{@U�>���j@VL��v>@V��Wb�R@W��@g�@XR��MK�@Y���_@Y��;�]�@Zf�,��@[�~'j�@[ЋmF�@\�����@]@[��Y}        ?�W��[?� ù�?ϔS�49�?���Q�?䟗�p�?�!E�	1?󀉦}-l?�@mɏ�?�T�[g�@�0P�@��#��@
�J��AG@4���@̜o���@1�
�@�����>@V���	�@*/3
j@�.B��<@ �E�s`@"~�H0M@$A���\@%���?�@'iZ�HF@)&)@x�h@*� �I@,�sO<@.���:;@0HT���p@1C�b�@2E.�U=�@3KΩ���@4W�/�f@5h���#�@6`��@7�։o#�@8�I����@9��S�R@;
����@<9�齅@=md�'�@>��-F�@?�l4<w�@@���K�s@A4��T��@AپL�S@B��D�(�@C*@2�n�@CժmQ��@D�'��A@E2����W@E�B��@F��NV��@GMf_��P@H�cH��@H�j��@Iy�B��@J74[�@J�{� �@K��%��F@Lz����@M?��b(�@N\�r8        ?���+��?���?�:?��t�L�`?��,�,��?��w�K݈?�H��r?�|-��c
?��[�g8@��L��@�/tEN@�^!�x�@���h��@���
�@r���/@|���n�@�=yeVK@  �9��@!�{y�a�@#�?�(��@%�MR@'�qu' @)�(�X��@+��W�)A@-�=C??�@0�5�R@1<�4�*�@2o���@3��qW�@4�Ib� @68F�6;x@7��KSl@8����=�@:I�u�~�@;���	@=&���K@>��F, A@@�]���@@�V�+@A����<�@BhP��Vd@C77���@D	��B�I@D�f���@E��"�R(@F�0ܚT�@Gu(�E�@HXY�N��@I>�D���@J(���y�@K��^!@LޟB^�@L�@ ,@M���g�@N�b'L�,@O��|Jg@Pr��{�@P�D�fl@Qw!~`��@Q�y{�@R�I�ڞ�@S�.%@S�I�0l@TtՓ�M        ?�'=�
�?������O?ҹM� [?�eȓ`�?�x��)O?�G�n0A?�"��p?�Ţ@�D@����%E@��'�@7�ԓ|@�a�ed@o&՛MB@!0Q�P�@��^=��@�VǤ�t@Y�[�@ �[�f�@"j��p@$2��Uݮ@&D��L�@'��_g�@)�Hڬ��@+��Tk"�@.piŪG@0/��y@19D�}H�@2\�%�d�@3��S�c)@4���n�@5�v��C@73���z�@8{R8ok@9ɋ�?�Z@;|�l��@<zGZo_@=�!���@?D�we��@@Y�|�3@A�$/�@Aѩ�y2@B�93�x@CU��Ѯ@D=Q�*>@D�ĉ%�@E��^���@F�����-@GR��Q@H'�M;.�@H�	�+�@I�7�æS@J�^�k�@K��n�*h@Lw�P�R}@M\���f�@NDD洼�@O.Zlɰ�@P�ٱH@P�<By�@P� U�f@Qx%yf �@Q�1���@Rp*��<	        ?�U�Xpj�?����B�?�����d�?�sF�WT?�T�n�@ {T3��I@��)�b@k�(Y;@���-4w@���P3@�4���#@`�tB^s@!��:�'�@$/+[��@&�h�@)���o�@,�J;�`)@/�o{&h@1��X�i@3>�.ob@4���N@6�,z�# @8�.c�@:��P#a�@<�>)��w@>����@@U_g<�V@Af��	N@B~IGfa'@C�n�űl@D������@E�FZ,�@G=�f�=@HR�]�@I���~��@J���&�@Lx�ߺ@Mg�0ǴD@N�&4��@P	�����@P�9�]C@Qj��!:�@R)4R�*@R�ץ�@S��i���@TK��+RG@U
��~�@U�)�@V�nDkV@WT1;���@XRk-@X��oI;@Y���Ng@Z��y���@[T	W�|�@\'�Z�)	@\���x�@]աƭgd@^��mb+@_�y�PM]@`5�cm�h@`��{@a�A��        ?�e�eBL�?���[=?Β���?�6�L���?��B@�o?�<�f��?���  L?�WgK�Z�?�d���[@�y�N�@ i@

R��@'��Tzf@Gq�,��@���7�)@(g�E@�Z��@GAѣ�:@i�a@ y���@!�ÙI[}@#�o�@%��*�@&�t�j��@(qHg;��@*-�msl�@+�`a\@-�4�J��@/�K��B�@0ɻ|(4V@1�D��/@2�-�A�`@3�a� ��@4��_�@5�b2�Y/@6�ޭ�u@8�7�@90IF�a@:S�]�`�@;|
��{�@<����l@=��5Q��@?D�B%�@@&&���@@���\�@Ah��UQ@BXo/@B��F��m@C[�	(�9@D�3S-�@D��$"=	@Eb�V���@Fb� @F��,�8�@G}���@H5+,ż�@H����%@I��<�h�@Jhd�B�.@K(%�qD
@K��om@L��u��R@Ms5,���        ?���B?�C茓D?� <����?����׮?�(���?�jN�U�?�SFѮ?���ŞK�@Ꟍ��<@��	��@
 ���4@�YU3�@�EGn�@S̭��n@n)8@��3�@�[?z�@ 	4��Đ@!���mU(@#^^OH@% �'w�@&����@(����@*�,�Q�@,��� 'D@.�ݓ��@0u�b��s@1��b)R@2�]r�Ml@3�rSj�H@4�+4Dy�@6o��_�@7U'�_5�@8�=��@9ӘZ�S@;"���@<j��V-@=�g\��	@?����Q@@=.47]@@�A�U~J@A�*���@B^�;��@CVZ�X�@C؄<nݛ@D�a��)@E\��Q>
@F#��Gi@F��β٥@G�#���t@H�Gg3�@IUk�0�@J(N5	�@J�����@K�f����@L��Y4_:@M��b�!@Nj�"#5D@OLB�~=@P�`+o@P��g�`e@P������@Qs��޺        ?���(N?�>p�H7?�(��%�?� �p�[D?�x�>?���v"?�n0���?�ݠ�5|@���@�`�^n@
9�]|8�@ӍQ		@�?s�o@{�U^@>yU�6@%��NC@1<�^vg@ /��IC@!��L���@#���]
@%Y��w*o@'2�G�[�@)S
��@+.M컳@-��`@//����@0���Sf@1��5F�@2���0ǥ@4	��I�@57�+}�@6k�?��'@7���/]R@8�vb�@:/&��0F@;|�(0�8@<����]@>*:��)@?��>�D@@w��h�@A-OZ��#@A��&�P@B�@C_�_�%@DʪY@D�:Tk�@E�P��}�@Fr*��@@G=J�Q��@Hր��@H�i� l�@I�-z��@J�Z����@KZ�lt>�@L4��@M�Qn�&@M�^�Qc@N� ް�Z@O��R:j�@PK�6oq@P�k[��@Q3�N�f�@Q���T*        ?�f0�q�?�-@����?�
0d-��?�:Ա�?�I�}�.�?��)FEؠ@ŝ�~@+I{2�@����f@�f&� �@��}�T�@#6,�h@ �/�1y�@#Niy�Dl@%���U��@(�����@+��<$@.}�X�@0���/@2jgF���@4�t��@5�U��@7�5�W�@9p��<~�@;U?щk=@=F�h+�@?E�$��@@�}��a�@A���1L�@B��37h1@C���j@D�h#���@F!�y�Q@GK���@H{��Xg�@I�$��vW@J�J=K�(@L,�eh�@Mswov�@N���B�@PŨmϚ@P����t@Q`�jMtN@R͖u��@Râ�>	@Sy�q��@T0��@T�Iˤ2]@U�'kl��@Vgy���;@W):ύш@W�eJ_�@X��O��@Y|�E���@ZH~J?�@[��Z�{@[�|��l@\���5gj@]��U��@^bxF���@_;7���@`$��@`y�÷c@        ?������7?�A��u�+?�ó*���?ك�ȗ;�?�ra��j�?�w���r6?�b�ճ��?�����?���/���@���@��@z�EV�y@	=T�WD@A*,e�@���]�@�˂^@^�o}]0@؁J�Ú@m�s-y�@Mu�I@�%96�@!f�[rI�@"�#q��@$p�,eC.@&7��,�@'�}����@)Z}���X@+�0_�@,��wU� @.����E@0D6��@17t� �L@20:ELqx@3.B��+�@41{��_@59�M�vQ@6G8��؋@7Y�����@8p��V1@9�5��
@:�M@�9�@;�3/�a@<�ۻ�M@>.<U�_@?bG��@@Myr��@@�g#\�@A��,��+@B0/?7@B�ltL�H@C|��D�f@D&��W�@D�z���@E�tm��@F0�N{�@F�ò�1@G����@HMI�	��@I�ok��@I���� �@J|Z�"\�@K:�Y�(�@K�����@L�^g�Y        ?��.��Au?�� ��?� ���?��ϣ�?�~nL�?���i^?�3k�_	?���SO�@��}��@�s�UR@	��C���@t�_�d:@�p��f@8tw��+@�Jt.��@����BW@��![9�@��|�@!��:3��@#B�q���@%'!a�@&���*c3@(���D-�@*��Fp@,��,�@.�S���1@0Zi[d�%@1lm���@2�u���@3�Is�s7@4����p@5����F@7'転z@8`�yp@9�En��@:�T>N@<,,,k,N@={��Mm�@>��B�"@@̦M�@@�劬ts@Ax�.>�@B.(�@��@B�@�m�@C���?F@D^.���@E��Y�@E�5�Ѯ�@F�츯_)@Gl����@H5�;�Z$@I����@I���I�s@J�N4�y�@Ks!���@LH5�<��@M��U��@M��)�@NԸ+�G@O���2@PIGwiE@P�S��@Q,j>�p"        ?���e^�8?�lA־j�?�e��$�?ߒb�"H0?�r���X?� �w&	�?��{��A�?�L����{@I�G�}@G�8,�@
�W�s.h@I�=�5�@#�)��@���\w@��5m��@����,@�����@ l����@">��7@#�#�KV@%�ɉ�9@'��Q�@)yh @]�@+x�<���@-�~X�@/�Ml̀�@0��1��h@2�NG �@3+mj28X@4WL$`+�@5�uO�F@6ø����@8h�%�@9J�?�Qz@:�>���j@;���[�@=E�4�l�@>�ޙ�,@@���@@�8z)M@AuGN� �@B1AѲO@@B��!y<@C���s�@Dv\�R�@E=�v�`x@F��{H@Fԑ��@G�ba��@HvP\y��@IK1��ݧ@J"�����@J����@Kه�eKj@L��Z���@M��m'�@N~ס�4@Oe�s�7A@P'n���@P�EKcW@QP�'��@Q���2PT@R�{@�        ?��gt(�?ϤWn_�8?�t��?욅�NZi?��]pF�'?��S)�x@�OO6��@
�4��@�Qu���@:����@,!H���@jp���@ ym�|��@"�bQ̫h@%k���c�@(Σ��9@*�,�7�@-�z�{@0mZ����@2�����@3���у�@5U���@7M DtG@8�ouso@:��!�@<����@>�6�8�@@N����@AUz \�@Bc�@_k@Cv�0i@D�����@E������@F�e*v�@H���@I3�Z�@Jj��ɛ�@K��E��9@L�1�k�@N2-M,��@O���:@Pin���!@Q���2@QĠ��@Rv9e��K@S*s"g|�@S�F�.Es@T����m@UV�%�h�@V���@V�	Ħ�-@W�w�O�@X_V�֯@Y'����@Y�X&��@Z�ld���@[���m��@\`��8�@]4�8yEj@^xX@^㾅uGv@_��.�m@`M�Vx�        ?��j�B?��U���?д���&?ܡU��R?��zd�L?�Э�80�?���?����,�z@ �����@8#9�v�@,+����@oS���@��[�@��:�@~)��4@2�p�0C@	ǂ"<�@N��@ ��F&�;@"*�-+%@#�����@%���W��@']� ���@)7V�]]p@+�fT@-W��^@/�s��@0����@1�)!�@2�� ? �@3�|��^�@4��e�k�@6*��[@7Z�)5�@8�.��?@9ϖ��~�@;"(V�c@<\�=]�@=�U��>@?ه'V@@.����@@�,X�f @A����@BH�BfW@C�jE��@C��ڹ��@D|�f2P@E=(֞٪@F �J�Ȉ@F�Q�ٍ_@G�H�^@H[��a�\@I)�=��@I�]غ�(@J�]�i�@K���e]@Lz�Ab:@MT�ð�@N1��xy@OyRC�@O���޸�@Pj���@Pݠ;u?�        ?�EL�K��?�1��?Ӈ-�YU}?� ���b?��I2.�?�yF��?�!��`?��Xy!g@f�`�c@�[�;��@G~�s$�@�"��,@M��JYB@$��z2�@&g�cIT@QƱ��@�� ��F@!��H�K@#b@�!y@%F�"�ia@'>$cn�@)G���Z@+c�	I�@-��F@/�1p�fC@1�S��@2A��Z@3{(g�ʩ@4�����@6i���@7X"E�r�@8���g(e@:/VU��@;|L�ҳ@<� vG��@>e0��n�@?��3��@@�б�@A|ڍ�=@BGtQ���@C��@n�@C�/�b@D�>�f�@E��@`lp@Fp�k{�@GO�z��h@H2D���@I��o�@JN:�n@J�b�ͫ�@K����]@L�zGi%)@M�<��p@N��t�)@O�
Ǵ�h@P\��i��@P݈Y�Q�@Q`W�5@Q����@Ri���zb@R�}�'�@Sx����C@T�0Ą�        ?�h����?�pR�D?Ԅ����?�6Ŧ�?��E'C �?����v�?�m�K�@ _��YG@t^��@�?��@����@�W����@\�%�v�@\���@��<:�9@�S�Z�@ �23���@"��ԲSI@$t)���@&s�B6�'@(���s�j@*�M��@,��Gx@/3r��@0��|Q�@2��@@3B<f���@4��YZ�@5�kO�j@796��§@8�P��@:��DVc@;z�;�@7@<�Sׇ|�@>y��P��@@D@|��@@˘���@A���i
�@Bi�v�&@C>#��-~@D\h�G@D�3^��@Eў�ė@F��w�`Z@G�xAZ@H�	�#o�@IrvG�1@JcN��f@KW�����@LO ���@MJ�Oi1@NHA�a$@OI��>I�@P'7�,cE@P�+���@Q0���@Q�Փ>�@R@�Q�*@R��5$?@SV��ň�@S��o:��@Tr�gC�@U�Y��        ?���0��?ї�W-�?∅�Ӗ#?���2��?�B�KC�@&�3�@��zyui@�����@�^��u@�O�O؅@	ɗ.,�@��R�Y�@"zu��"�@%5&����@(���@+$v/�;�@.W  ��@0��q!G�@2��x��l@4g��Iˢ@6JGQF�@8>m6�+@:C�P�98@<Y��	�@>�T��M@@[c����@A~�WA%!@B��yxy@Cܛ�s�@ERk�@FX�����@G�*���@H�O�t@JJg����@K�/�u�@M�[5zT@N{�~���@O���-�@P��g�_4@Qu]-J@R8ͬ�=o@R�÷���@S��aL�@T�Bls��@Ug�3�@V;BaR��@W��j{@W�v��M@X��i֌@Y��+�_#@Z��Xn�@[o\߃7J@\W��w9@]B�QG$�@^0M%C�z@_ �̸��@`
	�G\@`���h�@aP-qU<@a~�
�]5@a���tnW@b~�@��@b��i�x�        ?�u�́w?��~���?Κo��Q?�:~�ī?����Z��?�>���F�?��!w�}7?�\s�P��?�m�3�$:@�/G�@-�Y �1@
꒻ٝ@E���@\,&l�@�C�&��@0B΢�@�M��%O@��&j>y@U�p��W@ ���8_@"*�m[@#��w���@%b$ĩG@'�+�@(����@*�����@,o�����@.R��9�>@0!��^{@1�rX��@2"���@3,F��4�@4;�Y<La@5Q �J¼@6l'��G@7�Ҡ�"�@8�Q��@9��~�)@;s�]@<F��+�@=����|@>���&@@(��ϧ@@�����(@ASQ|7'@A�1�06.@B��֯$u@C[d�Z��@D�&Y�6@D�R��C�@Ey]F��@F2��t	@F�w��@G�|��]e@Hl˃b8@I/_pq�@I�4���@J�Hy5�@K��v�+�@LPi�@M�AZ�@M��]��@N��O        ?������?��d� Ο?ҿc���\?�6KG^�?�u1e��?�E���?�!��r��?��"6��3@���<]�@�q7#��@G��@�ܶI��@|���@3�#�v@��%T�@d����@F8���@ �86jQ�@"���5+@$T�%��(@&3�ċ+R@(#�>@rM@*$�^�y@,6y�[�@.Xd�sGp@0E.�@
�@1f�/ں@2���,	j@3��6B��@4��r1#@65��U�@7|-�7�m@8ɤ�Z��@:a��(@;yq�t`�@<ېz��K@>D\�j�@?��>�`-@@��B$)�@AR�n)�@B)O��@B؄�'@C������@DjZ�<�K@E7�D�^@FN��@F�]ic-@G��Ԟ��@H�� N@IfRO��X@JD�B���@K&b} �T@L
�N:�@L��`,�@M�-�y�n@Nǉ���@O��r�!�@PT#Fu��@P�O���@QI�j���@Qƚ̍�@RD����B@R�a�(        ?�QԵ��?��/��}?��NEc��?޹�����?�jg(�gD?��B�?$�?�#�!��5?�~�2��@��9�@�&�q��@	�?�uDc@qrO˃�@��Eb�|@<#DeT@���}�@�hjyyw@�p;~(@�#��Z�@!�Q�BC@#W���HH@%��~@&��~�@(ӯ�g�@*�p�|�@,���Y,@.�@e�/@0{`B���@1���&�@2��j�@3�����8@4�^�e@�@6.�/��@7f�U^@8��g�Yl@9��cc�@;2K]=�@<����SG@=��dev�@?4܌�M@@KYj�؇@@����(@A��5���@Bn�&yn@C*�Yn��@C魸�@�@D��,y3@En�/���@F5~��E@F����e�@G�9�˙@H�%?
&d@Ih��d��@J;O�\�@K��w��@K�a�n�@L�Vv_�@M��U��@N}&��Y@O]��#+�@P �N�C@P�0��\@Q���<@Q{�e5        ?�_���?�!u��E?��v�젇?���C?�4�2��]?�eR�6��@
����@*���@��;\1�@�J����@��g�@U~���@ ᳪ��@#^@���l@%���nG�@(��H�ܖ@+�2���@.�s �{�@0�y�(@2�z\b\
@4Mg��>�@6����@7��7���@9�����Q@;��%D�@=���_.�@?ϓ���@@���&�;@B�(�@C)_����@DL��,�@Ew4�L�b@F�`6��@G߉p�@Iq�ڒ@Ja��Q�@K�`r��@L�@���@NTM
e��@O�tӷ�i@P�T�@Q>�}p�@Q�x��"@R������@SnQI�S�@T.���@T�N��@U�t��(@V�)�h�@WKjY09@Xuf��@X�,
�@Y��/�N@Z��Ÿ�@[l�aɺ@\GEc���@]%e��6@^P>�Z�@^�'�ʚ�@_̓�#�Y@`Z����@`��ݫoV@aFB�Ug        ?�!ޅگ?�7�x�05?��uM���?�@�j ?��D�(1.?�Q��0?�����?�?�n��
?��Y7�L@0�?�S�@��s	=@
퀹1��@5P��^ @��"$�@EM��l�@ɳ���T@l�%k<@+vg��J@����y@ ��W-|2@"���<��@$$4a/@%�N�"^�@'m���	�@)(.+��@*�V���@,��u��E@.�޺5S�@0Be��7@1;�,��i@2:v�=�@3>^w��'@4Gem��^@5Uu�r+q@6h{9�	L@7�a��)E@8�c� d@9��SK�@:�QE0@<V���V@=>�Yz��@>rN!94@?�r_���@@sy�v��@A�-�L@A�kb"@B[�m��@C�;N֕@C��x�1�@DUJ&5��@EI��@E�Ư���@Fan��ai@G�qji�@G�k��J�@H~����@I6�#� �@I�64?@J�T���1@Ki��d?�@L(�N�R@L�H�@M�0X��        ?���߉��?�lK��?����&�?�B:k?�É���?�{
t�t?�e½"_;?��)\;@�"��@��r�`�@WM�@VH;a�@�a
�R%@ZN���@:�5{�@A�@<@nW)�^�@ ߛ��wf@"�Л��]@$e`���@&A���h�@(/+ΓH@*,�3�AD@,:#s|�/@.Wk�i�@0B��@1`b/ZE@2���:�@3�n��f@4挼�c�@6!�f���@7d!�E�*@8�c��@9�|�xI@;TQ�=�s@<�ɆEu@>�K��a@?�7�ҟ{@@x~�3'@A4p��@A�$�K@B�F�$��@Cx����@D@��#@ET1j�3@E��^�e@F�}C�Vz@G|��ZE@HSA]1�@I,m�⋛@Jn���Y@J�=�� @K�ԃ�d^@L�+��o@M�<��o@N~{T��@Ojz��8�@P,�25��@P���Ƽ@Q��-�@Q�r>��@RD�ʓ@R�a����        ?�h\ԢBZ?���^�?���M��?���DhS�?�pP�[)?��Q#j�?�%����?�}�݀=@ƽ]�>�@��ľsP@	�`'E@c�ʔZ@�m:��@/L�`��@�n�Z�@��Ӊ6
@�]��N�@�U��s@!��0���@#C�!��Z@%OgJo`@&ָ�$�	@(�����@*�e����@,�[pj�@.�R�3@0gq�)�@1|G�p�@2�H���@3��'`�@4��ν@6�>���@7Jlu�t@8�L��s@9�{��k�@;�mRK�@<cf�B@=������@?����@@:�O�%�@@��4��@A� ���@B^}h�@C�5��@C٘����@D�FC��3@E_�dK�@F&����l@F�l��A�@G��5�N�@H��`�]@I]N'�,@J1�
eA@K�t'��@K����@L��㟢V@M��)�L�@Ny�=��@O\X��p�@P ���߂@P�5��Ts@Q��:��@Q~��;X�        ?�+1����?��p�r�?ᮏ��>?�O?�(��?��� ��@ P�#zR�@أ�^�@C�0�@��GΑ@_��5�4@���t�J@ X ���@!c���@#�j�U@&��Ne�@)ef�{�@,UEփ�a@/e|o[@1J��ҒV@2����@4�C����@6kc�
y�@8=����@:Gi�q�@<
_��ׁ@>��m��@@�^�/@AkZIjc@BH�v��@C5/o �@DQ��'�@Er��D7@F��H"=@G�����@H�|^;E�@J1jw��@Kn��(��@L�9w-F�@M��v��@OEĿ�S@PK���%@P�8*h'�@Q� �J�@RUX~��@S PL��@S�y�\@TtWRۋ@U-�e��@U���,6�@V��t�@WhI�	�@X*Ǐ�uJ@X�j�)�@Y�+�҈8@Ze
�=@[I���ʾ@\���gW@\��E3�~@]����TP@^�{+���@_^9�i2M@`nǽ@`��rk�        ?��Uj�?��5�`?�V,|W�E?���2�?�W�Ȋ7W?�$��
'�?�-���B?��I���@ 3�.�u|@�A�1A@�h��o@�,��n+@
� lg�@_p;��@ԽH�6@i��@w@��-�@�b����@ڙM�8M@!q���l@#�SL^�@$��A"��@&N���)�@([����@)��Pļ@+��0#�@-y	�o*@/`�`"�o@0��P���@1�ظ���@2�4���@3��j���@4ųG��@5٣8�88@6�l�H@8u�Q�@93-�^w�@:Z��yc@;���-�@<���+ρ@=�g���@?'�~�@@2�1I�@@�W��@Aw��iE@BQ�3� @B�#�$�Q@Co���+@D���t@D�"�=@Ey/��-@F+J ���@F�d�G��@G�y�I)�@HM����O@I�Wו�@I�l8�z�@J�B�"��@KA[ ^@L�J3��@L�:�M�[@M�����w@NR�b\��        ?������6?�� ?�'�?�ԱGJU�?�1��Xe?茣�jR�?�R#n�0"?�+>����?�ɓ#��@����,@������@
�T���.@�.'Po�@X)4�@ l����@��~@��kI{@԰ %�E@ ��G;�W@"1��ű�@#�A�z��@%�x7K4@'�<���1@)�@ɋn)@+{?ͅ��@-��/���@/�3g4@0�W9Ѥ@1�:��@3�<N|@4B=�yDG@5pkD���@6�4�8>@7����k@9"5��Y�@:j< %`8@;�y��A�@=֧A><@>g9���@?ǋ���@@�����@ALЛv\�@B�Q.�[@B�3����@C�U���@D@�p�|�@Eca�>t@E�̶-*@F�ӡ��v@G_p�&�@H-�'<��@H�N��@IцrՏ�@J�=��
@Kp3�>@LZ(�nH@M7;\krx@N�&k^@N��"Ǿ�@O�3�q�@Pa��i��@P֐. -�@QLLd3�c@Q�.�)�j        ?�.T�#a?�����?��|�I�M?��,.�?至�T߈?�Q~%�-?�-�����?���3۝@��0J0@�(���@��St�@����w�@jg���@z���	@��*_г@�M�^�P@��]�_@ �!�Qpp@"Sm�`cn@$Z�lv@%煃��@'ɓY��@)�/P�y�@+�qe�Y@-���&@/��?!Y@1��|�@2)�IB7�@3NV�	�@4z����@5��ʫ�@6������@8%�U��@9l�M@:��c�*I@<Y��dm@=geT���@>�ƞJ�N@@6k�N@@ͣi�1B@A�!8�Z&@BC�#�>K@C-@��@Cū��p@D��I1�@ESs�@�@F�y0Ee@F��	v=�@G���j@@H�wU襇@Ih��m@JAW��@Kj�}S&@K�7�@Lݶ6&z�@M��dy��@N��I#�@O�!����@P?]DC@P�c�08V@Q.�,P�R@Q��ÁA�@R#��"3        ?����� 
?�-���t�?�/��+?�I�u?��)���@ ��Xz
@[�n���@�N��L�@��!�7@���@���X�@�#�e1@!ŧ\�؄@$Z+�k�@'�6�/h@)��dk@,��9�@0� +��@1�(Խ��@3O����@5�Z@0@6���R@8��#L\@:���4w�@<��J�$(@>���@\@@L��yĆ@AZOfLǦ@BmȢ!�@C�J�.0b@D��:XŠ@E���4�@F����_@H'g����@I]k�ܶA@J����@Kُ���@M�,���@Nj��1��@O���^��@P����K@Q4��Jv@Q�j=���@R�BF@��@SJwU�fr@T����@T���V��@Ut��#�\@V2a6�GH@V���@W���\қ@Xw�+r�@Y>�[�@Zq���@Z��9��@[��Y~@\l7Kkq@]<��A��@^�B� >@^��0.�T@_�à9�@`Jd�C	�@`��x�        ?�Kj�[b?�F�x�?��D�n?ہB��p�?������{?헸���?����8��?�zX��?��B��8@Zd{���@�)ZvW@#G(��@pA��a�@����@f����@�k⭏,@�����@O7�s�@*|�Klk@!J�Y�7@"�b�Ò+@$--f�!�@%�[B
@'{��e�H@)4����%@*�Z[@,�M��S�@.�Xx�A~@0E"j��z@1=o�� 9@2:�0��@3=��p@4Ev/?�@5R:o�؎@6c�W��A@7zk��<�@8��Y��@9�����g@:�6���@<N�l;^@=0ݸ9��@>b��~P�@?��]`�@@iАN�=@A	-�P͗@A����-@BN#��@B�#-Y@C��uƳ@DDex[ؙ@Dﺇ[��@E��9bh�@FL���@F�u��@G����
&@Hd��Zg�@IG���@I�@��>�@J�D��$�@KI�(�@L��O�@LŲl��$@M���/k�        ?���s��?��aY@�?�U`�?�F��f�?��@$���?��$�_?�l����I?�#��d8�@�\ݻ��@�{��@]C��@y����@�e�&�@],=�@=6e]��@C�
@DB@o�-q�@ �"zí@"�5? 6�@$e��/�f@&Bi�� �@(/錒�3@*-�m��7@,<O�Ě�@.Z���}�@0Dq�ѣ�@1cUYO@2��౅�@3�.��@4��׸�=@6*ַw�A@7oE�Xt�@8���oq�@:�'��G@;g�'y�@<�%�L^+@>1\�C@?��>l@@�Z7�u@AIݭ��@B�P[�i@B����@C��8Q �@De�B�	@E57��N�@F����@F��ͦp@G�qI:U@H�sK�`@Iss8+@JU��N��@K;�A>�@L%g3��@Mk{}�@N �S�e,@N�c,�o�@O� Z5?]@Pp�+�;@P�>�@Qn8�^�@Q����Y@Rq:��@R���        ?�L@���:?���E1H�?�����?��q���?荂���?�V�Qc	�?�6gIe�?��(RbJ@��P��S@�) �B@ ��@�w�PH=@|��54@/�P���@
c�c6@�|�%E@2 >_�=@ �t��e@"u��QE�@$>iB\�e@&+�,�]@(��Lr0@)��)���@,�kP'@.#���M{@0'/�?��@1D:;D�"@2hᆹ�@3�4g|�@4ȟ�Ɍ"@6�͎�@7E��6��@8�����@9�"��@;6]l<f@<�v���A@=�Z��=�@?d�����@@k��7�@A'�Y>#�@A��]4B@B�_06k@CpO��-:@D9[�A�@E{�;�@Eԩ��W@F������@G|�\!�@HTH˥��@I/o���@J��sA@J��L@K�w�j�@L�F,9@M��X^�@N�x�ˡ�@O~����i@P8��D�@P� �i-U@Q.�;�k�@Q�!~gb@R*��@R��;i/\        ?�=ت$�?����R?�ŉ��(�?�xGh��?�9��<�@ gn�[	@��$��@C��Λ�@�$�Kj@{e5`_@�
0@z�@"q*�@!u9&օ$@#��T�i@&��r�[@)w�.��@,f�S���@/u���@1Q!�1@2��|ە�@4��8�y@6l��&�@8<�#���@:�>��@<�I��A@=���@@ 	M�@A:?� =@B|��?�@C*����Q@DD�ŦN@@Ed�Z�*@F�'��@�@G�=�Ik@H���P��@J��@�@KW<�@L����>�@M�L��<�@O("�T@P;���@P�D�6\I@Q�
��@RB5�o��@R��B�@S�����@T]�babz@U"ڝ7V@U��d��@V�����@WL���D@X�%�*@X�砦�@Y�o�P	�@Z]ݠ#��@['V�c5�@[��v�=K@\�U#��+@]��qʴ�@^a>$��@_4��	�!@`�T)$R@`p�|��        ?�ÜpM�E?���o��?�#�d�Un?گ\���?�V':a*"?��x�ׄ?�;�ý[N?��g�L{�?��K�@�;`,�@~�74 �@
p�v@��Vn��@�Wx~@�݉��@g�f�@ �PE@@����U�@�hi~@ �G���@"?[����@#�yA3��@%nV�׉5@'��6��@(�A�
G@*��)�ۮ@,`H���@.9�s4b@0�T��@1�����@2oA�(@3�u�r�@4$E�@5~G�u}@6/�	t�.@7G�dZ2�@8d�QC@9��GC�@:��ܷ�V@;�%OJ��@=���@>;��	@?uf�X8@@Yx��@@���!{a@A�/�@BC�
���@B��<L��@C�ྵ,B@DB�hh*@D�sTE܃@E��&�n@FSgUf@G���?~@G��D��@Hw!D�@I1�l�3@I�=�Kg�@J��<�0�@Km*h�L@L/�]ߧ�@L��yQ'�@M��΋�        ?����&�?Ì��?ԂbQr�?�sq�-(?�����?��W�$7�?�MM3�@ I��>#.@Ww���s@��_��Y@�X�by@pb�io]@<��Wl@6|d��U@\� �kP@�L�![8@ �� @"g��q@$N03="�@&H���=r@(Vo��4@*wF�:��@,��9)w]@.���	�>@0�zީ�@1�~�L�@3V�T�J@4]���M�@5�Ri9�@7�OFHY@8d��#}@9̿Zo��@;=���@<���	�@>6 ��L@?�z?�@@�`x@Ase���@BCB��[@C��s"�@C�Z/Sq@DɁz*K�@E�ZVcw@F����,�@Gp��ٴ0@HZ�C��1@IG���I@J8�Q��@K,��|)@L$��l�@M�Mŋ@NS�+��@O <�)B;@P����>@P����1@Q�a?W@Q��J&m�@R-�\��@R�����j@SE(�2@S�%S�d�@Tb��H@T��G���        ?��U���?���w2�H?�g�HN�?�� a�ؚ?�^�&1?�v���R?�rb$�6?����rL@3��"@��w$��@	Q�4�8@_5b���@P5�@}t� �1@��j^@�?5�n�@��\@�SX:3�@ �����@"����32@$7����@%�ы�U@'���3`d@)���+��@+y�V��@-lii���@/l�-Q�@0�=J[@1Ƚ>�i@2�i)vVz@3�&G�<�@5��].@67n�k��@7a��!�>@8�֢��!@9�}(��@;��0�-@<C=�Ǡ�@=�,25@�@>�]0�@@]��n@@��.E@AjZ(`�=@B-i�@B�A���'@C��\�}�@D7��$��@D�/1e@E�㴸O�@Fj��}i^@G+L����@G��|�S@H����@Iz'BF�w@JC�CY@KDƶ��@K���s@L��h4@MC��-@NS�T�@O)Բwms@P5'@PnMnI�Y        ?��W�q]-?Р���?�<���?� ���-@?���6ܬ�@ (h ���@�f���@ܧᶅf@ee��@3���@T��"E@��p�*k@!C\��Y@#ȇm
��@&q��a�'@)=����{@,+#�)n@/90.Q��@13|�=S@2��M��@4�mM�@6S~]y@8%z�:��@:��[@;�lzЀ@=��QE@?���Ԃ@A&�?F@Bc'ܩ�@C/ؔ/7�@DMi�`��@Ep��Y��@F�r	�0@Gɷ�.f@H��U��e@J9U?x�H@Ky��م�@L�/W:~�@N
A`+�"@OZ��33q@PX*F�|@Q�:X
�@Q��nu#�@Rh(���@S6M�0�@SԽ�|�u@T��	[�@UKB�@V	欺:@V�
);�@W��_v/>@XTZ�@U@Yp]��@Y��k���@Z�\��6a@[�(^lu@\S%n�n�@]&N���P@]���F��@^�����@_��L���@`D(r�R@`����        ?�f���?��U��?�p��W�?�<��a�?��й��?�
4qH�?��~�dx?��~�Q�?� �*7�@OS�8�@�a�|JB@	��X�@�t6��@����@?Ϧ �a@���W�k@��'�)@�0�q@V�Br��@ ���Mj@!|�42o�@"���@$|[X��@&5u��@'��j�כ@)N�l]�@*���<�@,�t��8�@.Va��@0'%��@1.��@2�v�@2��S��@3�÷ @d@4�h��@5��)۫@6���o��@8�G���@9˸G_�@:-�-�!@;E]��@<a��Y�!@=�8��<a@>��u���@?���#��@@}�_F~�@A����@A��C��I@BKb��b�@B���ݷ@C���xN@D* X�{�@D�4uwg?@Er7��C�@F���@F����@Gk��.~@H�,@H����m@Iuu�I@J&��2��@Jٟޱ��@K�6On"�        ?�y��-?��/��W�?�ÉM,)&?�i�Q�މ?�(���?�X\���?��#e֏�?�!���d@�!��H�@^'�Um$@	�1� c@�
K�@]���z@�)�@�d��@]C��=@L�'���@\� �b�@!F��{aE@"�(�O�@$��7,�:@&k�s�@(@�'.m�@*#�C��@,�p�ѩ@.Z<#@@0�Z��@1x�G��@2/��vV^@3I*����@4h�3~�L@5�����S@6�����	@7�� ���@9$�T^�!@:b�ٲ`@;�2����@<�n;�Z@>>I!z?5@?����"�@@vIH`$@A%�����@A�A����@B�9���@CD�ǲ�@C���j�@D���cGZ@Ez��@F<���"X@G ��YP@GǓ�3K@H����L@I\+���@J*	��w�@J�?d�@K��_�5@L��@f@Mx��|�@NQ�غ]L@O-B�u��@Pizd @Pu?��O�@P�!?D�s        ?�����?�1�O�(&?��5��?������?�YZ�?�L�G!_?�]V��?����>r�@��nf@�=���@
!���@�u-�g@ƪ8��%@]����@�u��@��\��@�I��@ \�c��@!�����@#h)$��@%+n^i��@&�bi��@(��S?�@*�d~$t@,�P����@.�Y�n@0{�2�{@1���!�@2����g@3��h�#@4�x�3@6!�έB�@7U�c��@8�+'��@9�M��c@;>�7�@<a�׼a�@=�%�Oc@?	��3�@@3$���@@�����@A�?�w��@BMEQ��@C��ӱ9@C���X4�@D~����@E>��S'@F8�-�@F�9.C3@G�_l�e�@HV����T@I"�Ϩ7�@I���|@J�#�p)1@K��2$@Lh>���n@M?ҩ@N�F��O@N���7�|@O��|�yc@PWuZ-�@P���تX@Q9{@��s        ?�Q;���8?���ٝ?��m�۽�?�񆀺�	?����]?�!��w+@�q1�@
�����y@��+Rr@U�s�h@D�Z�@|�N �5@ }�<+-@"�}-s'@%a})zv�@(���)�@*�����@-�`�2n�@0Kr=��A@1�^�V�@3l�����@5Ľ0;@6����l�@8~��� �@:H����@<'�w[H@=��ҥ=@?���~�@@�~3	Ճ@A�!�E@B��R��"@D{��8�@EGE׫@F**1��@GE~��@Hdꀌ�@I����@J�!<J�@K�X'��@M3;qJ~@NK���_@O���c��@Pc�g@QY��^�@Q���)F@RQ�q%�@R�n���@S�\��F@TR`Ë��@Uws�bh@U������@Ve�>e'�@Wdϔ@W�>�O�@X�z�C�@YF����L@Z����3@Z��U}l�@[��L-�@\F���.�@]�nҵ7@]�K��00@^��W���        ?�;���2�?���{!��?�:����?��7y��?�'�9jR?��@�}|�?�2nc`?�Xp��?������~@D	|��7@�\~��@	�:sDo@�'���@
j*C3@U�@�#@���p�@E�JW�@�P��[�@�����Z@ Akpv@!��N%�@#C�k�@$��?��@&wW���@(#�����@)�@ҟu�@+�i��C�@-pG��&@/K*F�@�@0��	�R@1�V�c:�@2�j��s@3��f<�@4��1Q�v@5��� �@6�Ҩ�7@7�#��x@8�����@:� >�@;<\g4��@<h��]�@=��J{��@>�
�QQ�@@{"�@@�S�)8@AG��l��@A���@B���Ϸ�@C<�{�@C�zz@D�+�n�U@EE:���@E����@F�[R��@Ga����@HK��=�@H�����8@I������@JP�e�Pn@K_8�"a@K�H ]7�@L�6�Gl�@M`'�E        ?������?�UI�j�?�8��Kc�?�7s;}�?�����F�?���S9|T?�}�tz��?��ɀ:@2s��@5g�H�@
R?
�#�@�e��z�@�y2��R@�-P��@]�+Ql�@K����@^x�S��@ Js�-��@!��M00@#���s>$@%�
N��@'a�^���@)P#�}@+ND��@-[�=�?G@/x*��z�@0ѧܼ�@1�o��Z�@3J2��@4=�V�@5n��c�@6�	x _K@7����S@9+^K�8m@:w,؂��@;�I	��@=!���a@>���e@?�$Id@@��Ŗ�@A_�>@_@B���+W@B����M@C���E�@D]�Y6�@E$@��@E�L��@F�R%kF�@G��ܵ@HY��m�X@I-�����@Jgg�SJ@J��i��@K���D2@L�q���@My���@u@N]U�Y��@OC�<t�:@P%��h�@P����9_@Q��<�@Qz���c @Q��c�F�        ?����m�?�5^y�?�9���T�?��d-��?�*>��?���aNp?��Rg$�g?��[�z�@%�ԁ.3@VǲL�@�^�i��@g 9~v@F��e�@�Ϙ�]@ŀ�+��@�7�Ԑ�@#���_�@!FX\�@#R&��@$��f�@&сSN[�@(��}�x@*ۖ��;�@,���z�@/(�1F�@0�!��E@1ۇ���S@3
���*�@4A��J�@5����=9@6ƞ��@8e<Q@9h�Z��r@:Ď�s�m@<'t@�@=�Vv��f@?#�n5�@@<��A��@@���<@A��qY�)@B�����D@CMҲ��0@DJ����@D���K�@E��ZR�@F���N�@Gl&�}N`@HHz��@I'���0Z@J
e�%M@J���2�@K؎ٱ2�@L�0�G��@M���#�@N�~���@O�%�-�@PHcUHzn@Půf�)�@QDtƥ�@QĮɔ:�@RF]W`N@R�|U�v@SN
��H        ?�L��� ?���DP�?��pk�ƭ?��22��?�&�4�Vf?�N��WE@�Q�萘@i\��]@�{�#�@�+�[o@�=��>�@�P�@ �G�/f�@#7�u��@%ϧ_��@(�����@+e�似�@.bL��P@0�"��*@2\��P��@4��kw@5�$:�w@7��Y�@9eh�[�@;J�#-Xi@=>$h��X@?>�#8�@@�3��@A���4�.@B�>u�y@C�>}n��@Es��@�@F'�N��p@GT,1
�q@H���+@I���+�s@J�
F�3�@LAU�H@M�߹ۋI@N�m+`��@P�Ď��@P�J~4��@Qu�ZC��@R(��lI�@R�Z	Z��@S��n~��@TRdbv@U�-�_@U�x�x'�@V��V^��@WY^�R@X!���=�@X�9�J@Y�����@Z�� ���@[\(qh��@\0�A�0�@]/��'�@]���Ψ�@^�ٟ@_�?$J.�@`>\��@`�
J�^        ?�
��?���#�N?� Fr��?�ԠWT��?�j�i��?��k�}>K?򢰯ٮ?���Є(?��^/�@A�j��@�0�x�@	�|�U��@���4�@Y13��@X����}@�1g6�@KYq!~@�3�baR@� ���@ F���^@!��q�@#JF҈�]@$�p���	@&�!����@(/ �u��@)�5aSc.@+�,�&�@-���%U�@/^
��m@0�M+��@1�.뵧�@2��?�@3�v�}�[@4���|��@5�Gk��@6��
)�@7�1v��@9	lϞ�@:-9���@;VO�N�X@<�P����@=�/^��@>�ޱ+�@@�"i@@�B��@AY4��W�@A�y�!A�@B��Np@COꥨLF@C���0@D�tTى@E[�7�u@F�1�5�@F��VH!H@Gz0,�XY@H3�H�@H�P-��@I��K��@Jlez�)�@K.5��t@K�1��@L����@M�
ei�Q        ?�;��d?����\?�zY0�S?ߦ[�̠I?�ENz�?�Ԭŷ?����6��?�Rˋ��E@L�G��@Le2h@
�Z"��q@O�ؔu�@'k��@�����O@��o�@��	@��m�@ rq5�[o@"!�՟�p@#�dƹ)�@%��k�;�@'�%Hy��@)���&�@+�O*�@-��d��@/��Y_��@0��h�@2s�>I@38W��se@4eR�y�@5�JI��X@6�$��F�@8���h@9^Z���@:��+��@<r�?@=^G�dԟ@>�r���@@n�f��@@˺�#?@A���A�@BCmR�@C¡�ڮ@C�
��:@D�4v$Q@EV?G�w�@F" S��4@F����:@G�Gi�@H�$�,2@Imo����@JG��@K#]���@LK;/��@L��]�C@M���Vi@N���F��@O���?�K@PA���o�@P����D�@Q1f�c@Q�}ʿ�(@R%*O��        ?���4�-8?�^dv�?�Q=��ё?�kdI�9Z?���&��%?��_HZT?��Y�8�?�)�0,1@4���l@/��r�@
�Òp��@+@�|�@E>��@��
���@��� @v�3�`@��1��@ dE��1@"mp98@#�h�y
@%��5�s�@'���L$�@)u�ܨ�P@+vqO��,@-�� 9�T@/�-�T@0� �M�a@2���ot@3.'UxC@4Z�͠/O@5�u�U�@6����$5@8
<�]�6@9R.��@:��IR
�@;��<w@=Q�ㅣ@>��e�S@@>�Zy�@@�9_�E@A~9T�&�@B;4=��@B�b*�@C��p���@D����/�@EL(zK\n@F�1q}@F塓��@G����@H�-�\.@I`��Q:�@J9�)e?@Ka���@K�ʆ҆	@L����@M�v�U@N���ڭ�@O�l����@P9Y���@P�<TU9�@Q(Z��y@Q���-I@R<����        ?�[�s�}�?�+��,�b?�	�v�iw?�:_o ?�J��,O ?�����@/u>{@/��gQ�@��R�@������@����{@�U��&@ �1��
@#Wt�4�@%�d�Z�3@(��4��@+�І�\�@.�N�D1H@0�<���@2x§F�@4'\�1��@5�dV�@7��L�U@9�sm���@;rH���@=g�	_��@?j��G�F@@�W�|�@A�٪:��@B��zK @C��*��@EP"�=@FD��_8�@GrPX�:
@H��+�QP@I��%��@K��T�@Lb΄��#@M�(V#�@N�֏م@P);��.@P֦���e@Q�ò�/@R9���C@R��?�Ni@S�.���@Ta�pd@U�B!�@Uޣ+Y�w@V����@We����@X-h��@X�����@Y���W~@Z���)U�@[b�%���@\6J��T@]!b��@]�R��@^�ٳ��	@_��iޠ�@`=j<C)�@`���p�        ?�B��G?��`�r?� T���l?ٴT-2V�?�け>R?��h��?�~�m�<%?���^�"D?���}.d�@'e�@�4�C�@	H��~��@E���@��ٱ��@������@M�����@�����J@E�e�P�@�%��N@�bޣ˱@!9/��d@"���>rS@$+��@ت@%�[�N!x@'Ic�盰@(��c?g@*� 1�Ǵ@,B/@I�@-�
��i@/�e,��@0�-jٝ@1�����@2�x����@3�g��ރ@4���(V�@5�]�<*@6�?xz@7�P�N&�@8��7�C@9���.�@:����@;�PE�3�@<�}��@>���w?@?4f��]�@@-��8/@@��"j�@AX.��^?@A�|ٯ��@B���ٌ?@C&j�x�?@C��zK;@DcL�c@EJ�3Ȫ@E��B��@FKKb&C�@F�C��W@G��ޏ_l@HB�˸@H���Q@I�C
�!m@JG9~t�@J��ERC?        ?�v�6?����?�����?ޖ��E?�J�$.�G?�p)ЏR�?��f��g?�H��#b�@�� � �@z����@	��aЬ@!ͦO"@q��>�k@�:�s$5@�x�QO@uh��@e��RF�@w�U��@!S��G:4@"���E�@$��{��@&x>'IU�@(L&�Q@*.��z,@,��6��@.�)7�"@0�I��@1^�L��@20v����@3Hۨ��B@4gs
#�o@5�"[1@6�фrr2@7�i���@9��nV+@:Y��l�V@;��=#R@<�r�@>/۔ӑ@?���"�#@@l���;�@A�h+�N@A�ɰ��@BE �Y@C4�φ׬@C��50@@D���5@Ed�Y�a�@F#½%8�@F�5���@G��-Cz@Hn�*�\�@I6��F��@J ��7�@J̾�@�q@K��FCĆ@Lj�5�l�@M=�U�@N�g�D@N��I�@O�ń��\@PL:
��@P�����        ?�+pXg�?���R�o?������5?��AGh�?�{ҼZ�x?�C�S?�2��D¥?����T��@�;˸��@������@	�D�w�o@p����@�Aӓ
|@3��λ@�*v�;@�ՙm1�@�
jz�N@�Tgb�@!��94B@#6D3j��@$��Ė>q@&�j���@(�sBB��@*����՗@,v�B��@.zg�^{s@0E�Xz��@1T��Y~B@2i�"��@3��I	��@4�Q�rf�@5��q;F@6��"�@80T;
h�@9i����X@:�q	�'�@;���(G�@=6��y��@>���"}@?�-'��@@��l$@AI �n��@A��5b��@B�j)@Ce�� U�@D��5��@D���"�@E���o��@FW�M\bv@Gݠ�h�@G�Gv�@H���z�Q@Im�2���@J8��1�@K��IX@K��7ұ�@L�1.U��@My���d@NN�{VҶ@O&V��B�@O���u�@Pm���J)@P�K[��        ?��݊˿?Ͼ�N:s�?�z��k$?��~��@?��L��T?����c��@�u�p@@
������@���/A�@`3�6�@�;��@-�nk�@ O�AIe@"�:����@%$k�3�@'�A!|�@*s�Vm��@-FQ�.}K@0D;��@1���MW�@3/�>u�@4��D�E@6wϽ���@8-�N���@9�3��}�@;�L3�O@=��hH$@?vΝ�.�@@�)�k��@A�,B�ߖ@B�X���@C��|'Z�@D�ІE�d@E��t�,@F���s5�@G���q/@I�@��@J@�SX�-@KhR@�J@L�=���@MĎ�9�@N�3�V�*@P�h�@P���8A@QXG7%X�@Q��C�
@R��Sm�@SFe9��x@S��0+�@T����&@UF3?e�o@U���v݈@V��b���@WW	��_@X
�9�l)@X�Ú��@YxR�$�/@Z1�Y��J@Z��Iq�@[��ɯ��@\h���@](V�]t@]�Dӈ��        ?�!����d?������?�3���]?ٸ*��p�?�p��x�?�W�v�?�~�9Y?��W�¾�?��Nڐ��@*%����@��v�@	��f�̋@���B�@��i`�@Iʯ��I@����^�@?�}�>�@�o}䖏@���;sD@ F��!�@!���I}@#O\�o��@$��!O�'@&�'�T,@(>�]A��@)���@+�b�~D�@-��\@/d��G@0�Z'ػ{@1��񆳟@2���i_y@3��F=��@4ȪM[�W@5��w��@6�%R�	@8�~.1u@90l��\�@:W1| �@;���h^@<����L@=�R%��N@?#�wD��@@1��=�|@@ӑ7�|�@Aw�����@B�7�ay@B��q�^I@Cs!rJ��@D ����@D��k�E@E�����7@F7yQ���@F�1��v@G� h]�@HbA�Q��@I�*��@I�e1:�@J����r@KdX�@�i@L*,�ȌV@L�x��@M��;�        ?��XFH�?�5Ho?�?�X&�<�?�����xJ?�}���P?𨠰q�C?�M��D�_?���֗@�~�z�@��Y_U�@
�Lؼ�@�u&a�D@̅��d�@ha4>�T@*����@;��iS@,�H��@ &�ɟ�@@!����b�@#��ǐ9@%T%��X@'.٢۵@)v3R�"@+����a@-((	��@/5�$�"@0�i����@1�8Oy��@2��S��@4�흃q@5C���@6y�z�[)@7���O��@8���1@:C����@;�h���@<�b#���@>Eiw�d�@?�kL��D@@����@A>�5�E}@A�?�^�@B����w@Ct!N�8�@D65�`@D���D^@E�}oav@F��H{�@GYh<�w�@H(�MWt@H��x��@I�,��%h@J�"���@K�1v@L[n�lqF@M9�,��$@NhV�3�@N�u&͍�@O��8§�@PeD���@P�@Q�u@QPZ:;��@QǏ���        ?�G�?�&?���'��?��&m��h?�*B�-+�?�fxT~0?�jbA�[?�T&��s|?�	�.�U�@�K3�1@��dv-@X�`��@G�ZI�@��QA�d@h�F��@P8��@_���˩@��DX=W@ ���@"�����1@$�[Q(�@&p��� �@(f�]��W@*mz�
L@,����@.�2�B�@0r��@1����\X@2������@3�ym0�@51���0W@6t��ɡ@7���`��@9>1m�@:h�F��Q@;ȾO���@=/��;6@>�W���@@���ȥ@@Ʊ��@A��J�D@BL$rS�_@C�߻q�@C޷�n�1@D�ը�z@E~{�l�@FR�1�H@G*�Y�@H��MF@H�){�u@I¸�y�4@J�;⎹'@K��b%��@Lu�y��@Mb-I۷@NQ/s]��@OB��U/�@P��.�!@P�s�tY�@Qx�O�v@Q�ԪU��@R�ۮ��@R���¨Q@S�,ڛZ        ?���R�t�?ϛ�:�@?��QU�f?�z����?��o���?��-��<@�H�`@
�
X��/@�}�!�1@A#[�O@:2��@��>��@ �(��i$@"�DJ-�~@%��+��@(H bs=@+!�@&�@.�s�5�@0���"��@29�����@3�=�

@5����t�@7m��昍@9GǾ	@;.��P@=$S�9/�@?'�&��D@@�'�1�&@A�y�@B�����@C�d���@D���}>@F&�|7�E@GUMP�*�@H�Ȯf��@I�8D`@K�Ũs#@LJ�xp�@M�w�?W@N��Q��@P���O@P�ՆO0U@Q~�hz�y@R2��a@R� z;!�@S�CL�Y�@T^,�"�@Ur6�@U�r}�Y@V��$�@Wg*��@@X/�#�
@X�L�%6@Y��T9�@Z�����I@[k�`7FB@\@�a5!�@]f�t��@]�d�g`~@^���~�@_��&��@`GW�)�@`��T(�        ?� �U�"?�2*Y��?��=1�M9?�=2 
�?�¯g!?�SY����?�9�c�j?�D��VP3?������@6��E@�S��-@
�����@@�<+cE@�C��@MS��f@���@w��@8s�q�t@S���J@!.SP@"�l 'B[@$*V��"@%�հI
�@'�Pz�o@)>T��R@+���@,�!w��@.��SQ&�@0W�ש��@1T��I�@2W/6Q&\@3_Tz�N@4m��9�@5�'�h�@6��>GF�@7����@8ٯr��6@:SeU@;/w�<��@<b}@=���/��@>�(*q��@@�a�@@��s��@AT�6��@A���YG�@B��J��{@CS�ڇKX@D��.�@D�c��@Eg�+���@Fq^7�@F�v��_7@G���	kK@HL��Q@I
|�u@I�J�0 @J��yN��@KRwCV�@L@�s�@L�F�R�@M��{���@Ny�8�M�        ?��d�ja�?� 3tǽ?��o~u�?�E"X?C�?�ɶsO ?�1����?�mx���?�%\\���@�H���@� ��WI@bq���B@9��m�@��Ú�@c���t@E�[p�@N@���@|<!�7�@ �]-M�D@"�m*ZF�@$n�z�<�@&Lu�"˖@(:�g���@*9jẠ)@,H;I_�)@.f辌J�@0J�|am�@1im�]�@2��S#�@3���W@4��
`ؔ@6/q�FD@7s)"�@8�����6@:�Ac!@;h�1C�@<�|	�u@>/���@?�piB@�@@�?�~@AE���a@B)�V_"@B����!@C���e@D[!ق�j@E(iW@E���8�}@F�2]p@G��U�@H|��w�@IXi��Z�@J7���@K�|a�*@K��@�ٮ@L�)�-�@M�4�nHs@N���sq�@O���0b@PP��Z�@P�Idh�'@QG>�l0?@Q�z��ur@RB��G?@RµOT�        ?�碶��?����� ?҉m�8�?��?P#?�:�>g>?�h6~?�珹��?�x�?yM	@c�e-�!@f��bto@
��$(q@q��v=@:�`T�@��y���@�f�V@�M���U@�����@ ~ա2G@".���h�@#�>��7@%���@'���cTN@)��'�+@+��խ-/@-�����$@/�qd!|@0��r���@2��@3AI���@4nu�|a�@5��uj�@6�N���R@8 ���]@9ik�NjI@:��k���@<u�;G@=k�� ��@>�q����@@Мh��@@ӂ��Q3@A�E��@BL����@C���@CГ�'��@D�9�EY�@E`���p�@F-��9@F�A�4W�@G�-6�7e@H���?��@Iz1	���@JT:g@K0�4T@L5![�@L��"��@MֈV��@N�~j&*�@O��vw��@PIp�/{y@P���%�@Q9
�{��@Q��@#�5@R-z[�2        ?�(́(Y�?��4ޣ�,?��ܨ�?�W,Q��?�!a���@ W~ �L@�E���V@*�x�P@���)��@k},^<@��n��@��@!l�t]�%@#�����@&�9�"��@)s&"v3@,d�~��@/vЎ>�@1TY"��5@2���#��@4�A��TO@6z�7GQ@8OI���@:2=0�@<#�ק@>!����@@��aS�@A#xc?y�@B6��^�@CP�t�g@Do�M��@E���9ur@F� �mJ0@G�N�W~@I,r��@Jjv���z@K�E�#�q@L�̤�?@NF��FG2@O����Q�@P{&}:{@Q*����=@Q݀���K@R�ǣE9@SJ��I�@TC��9�@T�i84r�@U�'�9@VDV��J�@W	�k��@W�9���@X��x4
@Ye՟���@Z45���@[�9��e@[��#21E@\�FГ�@@]����M@^^�U��@_:�ĒZ�@`yw!�@`|����@`���
�O        ?�~(�8��?�׫���?Κ�
cJ?�8�'ۦn?���@Mߍ?�:5�0?��W
�|?�S��1�?�_��l�$@�a'�u�@\
eX1@
Ag�MS@(��<��@H���N!@�����@)b��G@��a5��@Q��b�@���	@ ��>�Ws@"�c�v@#�C	�ż@%,��Q@&�~IΗ�@(��k`�f@*I�J��i@,�r-��@-�<���@/Ӱ�
K�@0��l�/'@1ߑ��@2��x��@3�׶tȣ@4�@�� H@6s���@7'F���@8E�;8�@9ivL�o�@:�V�L��@;�T?�@<�_�k�@>+j���-@?heD<�}@@Uh?9Q@@�s_?�@A�&b�YW@BF1Hn�@B����P@C�5�K�
@DL$f|!@D�R˧�>@E�����@Ff\G�t�@G+��X�@G�$U���@H�A��@IR}wx@J�e�c@J�>�+5@K��Ut@L`;�#��@M(��I�@M�A3Q�        ?��u���?�����kQ?Ҭ^_q:�?��=��$?�[���d?�2��ǉ�?����?���D^K@���7@��9M�@
�N�	�@�{(�
!@_�S,�i@Q�6W�@�x�.K@�9K��u@�4y^r@ ���A�@"c���Jb@$,[�9�p@&�jA�@'�/�n�@)��#\#@+���V�~@.��3�@0_�f�@1;sz�	8@2`���&@3�.*���@4���'~�@5�>~��@7< �'�@8��TA[@9�u/8�@;*��2�@<�)��'j@=���/�@?V[�K��@@c���v@A%n���@A���lt�@B��G��@Cdz�m��@D,U&��P@D�(���@E��(_l@F����_�@Gi Bp�@H?�Nޅ,@I��.�@I��~PX@J�V�QY@K��X-5L@L��<'H�@M��tJ�@Nh�jc��@OT����=@P!°7c @P�R��/@Q%���@Q�;*���@R�o�l�@R� ,��        ?��ec+��?�]36��?�b8��?�e�p �?�]4�5EU?���M=u?��Mnf?��}�z=@L��T��@�\f�i�@ 6m��d@�<VY��@0���t�@�(�@�&��(�@ �С�@lh:Dl@!oF��*@#;Aܱ�W@%�uNx�@'
^�-��@)�$�y)@+ �\<p9@-E��;�@/{��W@0�%�s��@2�U���@3@'A#��@4{�1�6@5����@7	����.@8\��	'�@9���a�@;q�w0@<�c2�@@=��&@�@?h�B��n@@s�5	��@A6�<��@A����� @B�v�aȇ@C����xc@Dd#=��@E8Ƕǚ@F7má@F�u'�A@G�y� F�@H�v��\@I����@Js���@K^w�A�@LL����@M<�H��@N0{��_@O'K���@P�B��@P��Vin@Q�a��@Q�vs��c@Rm��#�@R���F�@S��^�@S�0��W�        ?�ȏ7iaG?�s�/(�1?�P~+i[O?���T��e?��;��Z?������I@m��B�@�Z���@<9��4-@�؇�k@I�B@����@!#� ۫{@#�~�i�@&O[�5�@).z*�@,	���i@/�=@1%�!u1@2�_��?�@4�@�j|�@6La��n@8"q�`�@:&����@;�>pT�@=�{��@@S�6@A��@�D@B(���@CD����@Dg@�&d�@E�*o�{�@F�w�?��@G��=e@I0� G��@Jrԯ��I@K��O;i�@M݊�_D@N\�
O�@O���e@P�Lb@Q=͞�7�@Q�S���@R��L�j@Sf�k���@T$��K�@T�+�/G�@U�i�#�@VnM1��@W6���@X�
�̎@Xϛ@Y����@Zr��@[Gҫ�r4@\���G@\��g똒@]�G0���@^�E�Ch@_��-8T�@`=4��y�@`�A���@a$y:$�        ?�!�rۤ�?����)��?�b�_�i?��0�ׂm?�n��E�?�����l?���,|x?��ALLP{?��/�LJ�@$��jK�@�{��r@	n� N��@t`�Ps@ۛ� �@R��x�@u8Np�*@�GP
�6@{��D�@%BtS�6@�En�!@!`�?� g@"٬�9�@$]�k�z�@%���� @'��^�@)+Rn�U�@*��h�@,��KB�@.U���{*@0��ž@0����-@1�y�]�K@2ߕ����@3�,� !�@4�+��TN@5ր�b@6�Hy�@7�� =q�@8������@:�q��@;*B��`@<6T�hb@=Tu���@>v~���:@?�fMP�e@@c�.�@@��D�Ķ@A�n۶�`@B,���P@B�25~(@CgL���@D1� I@D��na8�@ELK��@E�x�I��@F�_S�_@G@�	��@G�C����@H�7A|fu@ID�J��@I��F�P@J��F��@KW6��IO        ?�;X�V?��E)ac?�ei#Ԥ�?�~ϞyL�?��t8F?�����?��`��\�?�#ѩ�R�@-�V�ɧ@#�9���@
p=0�s~@3�2�t@ R,�x�@�o�:I�@d5w���@M�zN�@ZIotc@ D�WQ@!�BtL[�@#���t�@%n��	@'G~˨�@)/P�/n0@+&!���@-+��.�@/?�G���@0���C��@1���,�%@2��6��@4{�)�@59����@6l�J�(j@7��֨S;@8嘑u�z@:+��e��@;w��g��@<ɽ��0�@>!�u��@?����@@q�;7�@A&��s��@A�pM�@B�����@CVEWV�@DZ,��7@D�,���e@E��램@Ff�g�r@G1���L@G�U���@H�n��@I�q�E@JwOd��@KO	�S�@L)C;/q�@M�H�)@M�f)nS@NƳҜh�@O����k@PH���@P��3��R@Q2zu�:�@Q�/�s�        ?�]��3]�?�"l~+�A?�7�6w'?�=���]?礫	��?�
���?�_gl��?�̂A�2�@�� �RN@�9 FP@
/�s~�i@���,@ڔ��@w�� �@@:��n�-@"�+�@.L5K�@ .~+^ϑ@!���`m�@#���<l@%Y�=4@'2�u�@)�U�N�@+�/�)@-tX��@/.�z�"a@0�`4��@1�\;q�@2�KN��@4	��@56���'�@6j��IHN@7�b���@8�}��j @:-�R��@;{��%�o@<ρu0s@>)z��@?�{�e;@@w�e>�@A-����@A恧c�@B�?-�	\@C`פ6��@D"BNm@D�u�2@E�k3J�5@Fw�R �@GC}e<W�@H��X@H�C�0�@I��O�w@J���]]@Kiy���@LE=����@M#�[�@N�~[�@N��n<��@O�	�w�@P[�]}Q@P�s;�?�@QHB?�-�@Q�I<�G�        ?�_�-s�?����9k?�ϦZ���?���b��?���pG}!?����@�	�V@
���P��@����4@L*>0c�@;��I3@u�t^�@ {�|��@"�)o��@%c�4�@(���  @*�a��)@-�Ƚ���@0S�Ӥ��@1�ow��@3zt���@5!����1@6դ��Q@8�&�� @:b�-���@<;�"`H,@>�%�� @@ן��F@AY��2@B[��3�@C�{5�@Dt�� �@E1Y���@FI]L<#P@Gfk!���@H�p���X@I�Z���@J��̇@L�$�DJ@M@�0��6@Nz�M��D@O�Wo�y@P}�Ƌ�@Q!�z���@QǕ���@Ro���ŷ@S��e@S�:�zY5@Tt���i@U%8D�S�@U�����@V�tU�R@WC�@W����`�@X�r?�{@Ys{��@Z1�>�G9@Z�# >��@[���i�@\x��!<@]>���Ҝ@^�)#�@^���*`        ?�U�Oc�?����3A4?�d�F[?ێ5J���?��P��؁?��Z)F��?��k��S,?��`0o��?���*�F�@i�k��@/ɺ�E�@>��6�@����q�@�nv�@�����]@=��.�@�π-@�T0��@gX�$�@!4&Sca|@"�>#���@$]��K;@&�hA}@'�71]d�@)|���@+J�=�!�@-$��Ϗ�@/
\�O3@0}�mΌ�@1|(��R6@2�CRX�@3��e�@4�t�Z�|@5��]@w@6�79D}�@7��ep�@9«�YA@:1��De@;_���y/@<�J(ܵ�@=�����@?X�@@#�o���@@Ƣj=�-@AkӰ��h@BJ�s��@B��S6�@Ch�EQGT@D�׳�@D�chݽ�@Ey٠j3=@F.q? ?@F�$�C��@G��D�P@HX�4���@I��%�z@IԖ_��@J�|�>@KX\ ���@L-� @L����>@M��@�]�@Nw����        ?���uSo�?���Ȧa�?��Eס�?�,����?���4=?�d�� w?�H�L�'?��R���@�$�TV@�W��	@3s?��.@�>�N�@�^f�@=��=@I�@��Ϭ�@A��� @ �}P$n@"}�fO&@$E�*��@&��0J@(~Z��@*/m� C@,��$ڻ@.$ͼ@�D@0&���=;@1BH��Wq@2e`pd(@3�����H@4�Cz0Xt@5��bӯ�@79YKj��@8�38.@9��H�	�@; ����%@<{��N1@=����@?C5i�@@XM���@A*���@A�}��@B��}@CQ���2}@D��e@D��G�@E��x�@F{|��@GLz�P1�@H �~TR9@H�����3@I�*��@J�rK�6@K�\$V�D@Lm��'@MQ���@N8�0�}�@O!À�N7@P�(VO�@P}�#;-�@P����@Qorn�'�@Q��A�@Re��[�/        ?��O@%n7?�@�̒v�?�<�^�??�~x@�?�%>�*�S?���V���?��:I�1?����o�1@��@KG��o@�@���+@]c��u4@��dõ@�r�@�h@����8�@�J-֖�@g�7�g@!5��Q�@"���ɡ#@$��1d�_@&���Pd@(�j�#�@*�l$:6�@,��߁J�@.�6�P�@0�3�h�@1��$B�R@2�W�uf@4@lr@5X�6|@6���9/@7�hR#@94ӟ��V@:�:�
U@;�dy�p@=O���H@>�l���@@�¨
L@@�Z�L��@A� ���@BU���B@C��g@C���v�@D��&I�@E��>�G@FQ����@G&�~L��@G�\�@�@H���)�@I�n����@J��8�ӧ@Ky��z�e@L_Yu��,@MG�f[�@N2�u�$%@O �Ѿ@Px�_v�@P���*]�@P��B���@Qx֣���@Q�4���@Rt�I+e7@R���n�        ?�Y 9��
?���jQ ?����	J?�_�<�?�S�gY!�@ z�����@ �d�@hɓja]@�ܵ���@��1��9@�����@W]���r@!�D��\F@$&�;�0�@&ۜ�yT�@)��t�)t@,�/�!�E@/ɭN��@1��%�t@30,g��@4��
n@6��Kn @8���t�@:{h%U��@<q�""��@>v&[�XK@@C���@ASX=��@BiD;;g{@C��P��@D�(�Qw@E���b�A@F��V�@H4��N'v@Io�-�T�@J�1��@K���ʀ@MB����b@N�]�X@O�˱��G@P�HϢs@QU^�-(y@R	a�q�@R������@Sx}:Wp�@T4
Ъvr@T�#*Z�?@U��YIY�@Vuغ[jm@W;h��F@Xh�Έ�@X�ҪS[0@Y���C@@Zi�j%@[;Q?�c�@\&���3@\�G��o@]��J�@^�R
��@_u/�F=@`* /�L@`�����@ap��}�        ?�~���	�?��m�k�!?�F��Hζ?��.��?�B�B�+�?�g$Z�+?���ùR?���7��o@ &��Ys@��j��@���p�@��(s�@	��]�-@b��b@�Lڀ��@{pxPQ@8;R�j�@��v�@ 5�Y@!���r��@#0v�՝�@$�S
�!M@&�GM�@(X��]�@*+f��+�@,�u@-�����J@/�"5��@0��=|�@2���e�@3�b��@4-��� �@5J��<k@6l S0�@7���:D�@8�A?p1@9�hUyE�@;-%�@<kg��� @=�U���@>�+L^�J@@#Dl�v*@@��K$�@Ayu�{�@B(j	;�F@B��HM@C����R�@DDa�T�@D�O4�@E����@Fvox���@G6���z@G�U�5@H��?@I�1/��@JN�XY
@Kx���q@K��IE@L��cum@M�D�K@N_�GrJo@O6�RA\@P�hn�        ?�I�ʀf?�z�!�X�?�m8�*6j?�+���b?�XM� \?����?��AB�?��<ۿ�y@7�uw$@g����@�6�v@lJ�Fj|@	=D u�@�fo5m�@�p�!��@�%|[@a���@!5�,�x�@"��!S��@$��l�@&�cXuY@(�5:���@*�,�wW@,���6�=@.�B�=��@0��:}��@1��d(�@2ϰ�W�@@3�����@55Ot�x@6r��'��@7��j�j@9��ze�@:S7�ƤJ@;�G��@=	Ÿ��@>n�p;�@?٬�^@@�w�@Aa$�ɿ�@B�F/��@B��
@C�&Rt�y@Dm��Q�>@E8.��K�@F��3�@FջH��@G����@H~�
;x/@IWD��I2@J2�y�x�@K����i@K���<@L�G�+�*@M�~.�[@N�V��@O�����@P>�]�@P�4�a@Q0��@Q��xף@R'����L@R��~v�        ?�mGT�?��PZ�?��5�tE�?�I"T�U?��Xc��g?�;�@�?�y���?�4�ğd*@�+����@�/���@q87@ �q�}�@��63�7@oi�p@S ڥB@]>ݝ'@��@s/@ �ă���@"��3��O@$zX
���@&X���@(H%/���@*G��<p@,WiOu�@.v�*���@0R�F��f@1q�U��,@2�/v���@3��[O@4��a>~@66���K@7y�����@8�S���@:�7��@;j���@@<� j��F@>+�Te@?���<�@@�)�P�@A>WW��	@A����&j@B���v��@C��^+j@DH���!@Ev$Q��@E��\m@F�~��i3@G���lK�@HU�n�2�@I-����@JM̬q@J�&)(�@KØ��@L��y �M@M�1Y={i@NqK�w@OZ���@P#~�:E@P�Ɵ�˗@QIMFv@Q�V�@R�Ȥ�U@R�$��R        ?�o��n�?�zj'�?��Me��?����F�?��M�'�|@ ��I��W@Ns�ۮ�@�`T�6@�y�t~e@��EI�@'镠�@��]�o@!��˫b\@$w}�B�@'<�P�o@*&�eA�@-5y��Ȉ@03����@1���&��@3���k(�@5d�0�Z@7?z0�)d@9*�]B[@;%&@3nM@=.Ӯ�4@?G[�f��@@�=��g}@A����b�@B��>^�@DzM[)D@ELyt�@F�Q�	��@G�=S�$@I����v@JL���n@K���Y�@L�zޡ@NP@��/!@O�&2�~@P�7v�W@QE~\v��@Q�┖�@R�.���@S}Y�Kk�@T@[�R1@U,G~�@U�����@V�T�@Wh$���@X8��[�@YG;��K@Y�Qdm��@Z���X�4@[�:���@\t8�@]Tk.-�w@^7M�}*{@_��/�)@`Efk1�@`wmuT�@`���(�@aed��>\@a�0��A        ?�X4�Ta?�k�io�%?��YK)�?٫�P�(?��^�z?��*���?������?�ۗ�bi�?������@*�[v*@���8�@	�vu��@�.rJ�@ ��`;@N��>�@��	{}@GT�ꥉ@��T@���Q�@ L�Cy'@!��|H@#X�Yw:@$��E��@&�sչ��@(N�&��@*�[�7@+�G�>��@-�4)�C@/�Q�8"E@0ǻ@1ƽj_D�@2˜��@3�E�k��@4��e2@5����y/@7P�O�a@89z�@9`���@:�*�X%L@;���:ӿ@<�M��@>0E��O@?qr��@@[����@A�%D�@A��Cp�	@BT�쮷@C�
��_@C����i�@Dc�CR�Z@E����`@Eϕ�	gF@F�V�C#@GD��o�L@HE�9t@H��v��@I����8d@JLT��@Kq���@K���@L�`;Tm]@Mx���x�@NI�|W"k        ?��C��?�:WKu�?�+m�u?��pu]F?�D�f�?��];�C?�N�j�?��G��j<@��9jl@�p��h`@
�[*��@��S�`~@���B��@ctd٭�@$$(��)@	���@�ڣ�@  ��@�@!ȭSO�@#��Vv�@%J�W��@'$����@)H��t@+��(�@-;�M
;@/(
��P@0�_��%8@1�(���@2��Xg��@4Wz
b@5=�Mu@6t&���f@7�
�@8��KD��@:B�Z�@;�겾��@<�P��>�@>K!zf��@?�I&ww"@@��G+&0@AF�>�V@B�x <�@B�f
�ܜ@C�CӇ<�@DH-d�@E�}���@E�uaT6�@F���;fY@GxT�l@HK�܅�@I!�X��@I�P��t;@J��G���@K�2Z*(@L�>+�4@My Ľ\@N_t�$<R@OH�ΏC�@P,2+p;@P�]���@Q	ڱN��@Q��$��k@Q���        ?���r�(#?�vl�Xy�?�y��8ͨ?ൢܒ
?�}��af??���`2m?�%�@˘?����@o/F��@��A���@Z�v*��@�<���@^�{K�&@:RO�@A=k��@qҧ!n@ːO]��@!�����@#{1���@%b��"m@']j��P@)jc���@+�{����@-�`f��@/���C@1(*z���@2Zgv�J@3���.{@4ק�E@6"f�%�@7u���1@8ϋ"!�V@:1�}�r@;�{��@=�kd��@>�t�I�@@�,��D@@�eƬ&!@A��bG�{@BXp��]@C&��̔@C��G+�l@D����r@E�x%�6�@F���\�@Ga��3Y�@HD���I�@I*���M@J�#�;@K ���HK@K�Y���@L�9{�J@M��q�-z@N�&VR�@OϰB9@Pg��_Y@P��~˴@Ql��@Q�|����@Rv~[Tj@R����@S�c�P5@T��UQ�        ?�6�=.9?�"&��?��/��?�ǘ;�i?�$��+z?�Q6%���@�jzX2�@�HI�:@�!;�@�D�5-�@��u^H@��T��@ �-��@#X�8G�-@%��/��@(�(B.��@+�_����@.��V��C@0�f~@2��$��f@4J���Q@6D�s��@7�6���\@9�:0j�@;�U��@=�z�'~�@?�C��=�@@��ں+�@B��Y-@C(lX�`@DL*��H@Evr��g�@F�q���@G��x��@I�|�5�@Jah�O�9@K�'��H@L�+Y���@NTa�+��@O�����1@P��ǧ��@Q?N~-�@Q�ڶw@R���1P@SoE&A@T/��i��@T�#9�&@U�]�4&@V�m��C@WNL}E˰@X�+�G@X�bV � @Y�nj�@Z�w(]u�@[sG�V@\Ok~�PW@].o��ؾ@^ҵ�@^�ws���@_�q��T$@`b���@`؝�hN�@aP a��        ?���>S�?�3��s��?ͯ"@Hf?�p2
���?�b����?�a���?�U2~��+?����w�L?�v��?�o@�tfG��@uD�ײ@	;O��G�@DE��K@���d,q@<��-%@m��$@�?Idx*@�_���<@D��Z�r@ ����@!�[����@#	<��%�@$� �$}@&9lW�&�@'�G�D�\@)�`�x��@+^�FIW�@--�l߲@/Q\��@0wS��2@1p4���@2n�f9�@3r�ϼR�@4|�T��@5���	��@6��_@7��@8�
a�&@9�d����@;&�nB@<U�����@=�4Uw�@>��Cg@?��6���@@�Q'V]@AD���2@A���룱@B�N�HW�@C>*	 @C�^�~�@D��� #k@EL�ۅ��@F �!{@F�C���@Go�9���@H*���C3@H���"�)@I�4\
$@Jh��� h@K,fM�@K�C�O@L�Jn9(
@M�w=
3        ?�c⼱7�?���c->K?ҏ���@%?��9����?�;Gst�?���,�T?�����B?��VM�	@n��c�@x�I�*�@
ݼX�@�\�~@U�ѿRy@^�7Bl@�I�@ḻ�]�@5��w@ �єIu�@"a��$�I@$*�m�Z�@&��x�;@'��u5�@)�?P�@+�����;@.v��0@0!$җ��@1>�築`@2d|P�!l@3����n)@4��`+�@6��A�@7D��R�@8��BeG@9��옫�@;8~X�@<�~�@=��m�#�@?i>�@@n<[X@A*�7�@A���`�@B��E�B�@Ct/ ��@D=���@E	��P�Q@E�i`�Ū@F���ͭ�@G�-[�?N@HYp�W��@I4�4�@J����	@J�S�W�@K�����@L�&e���@M�#l�X�@N��ZFe@O�$<
��@P8���@P�XSc�@Q-mRט�@Q�� �@R'i��>@R�Hq�}        ?�;�'t6�?��l�*@?��j�Y^?ޭ1H��g?�b&)���?������?���X!!?�w���@ļ�	�m@���s]@	�fE�_U@j��	�@�p-f@7���c@��a���@л`���@��A��@�0�)�P@!��L�>�@#S�"k׻@%�n��@&�ܳ��@(χҽ�{@*�zT�a�@,�kJ�'�@.�롒@0z!�No�@1��v���@2����L�@3�*3Ԃ@4�����r@60�!��0@7i;��n.@8�L�! a@9��B��d@;9f�kJ�@<�BI�)�@=�6 <6@?A-���(@@R�*��M@AqԼ�z@A�?�x�a@By��a��@C7u��E�@C���˕]@D���`�	@E��zJ�@FI��w<�@G�WqN@G����%@H���f�@I�U��@J]i�G0@K6&��@L_����@L�3ã��@MϏȬ @N�i}��@O����#@P?�4���@P��h�ݩ@Q+!^>�@Q��(6�K        ?���IN�:?�C���u�?�wqS-?�?��By?��b�y��?�wh	?y�@jޚx�@
M�
v��@o=8�@}nj�@�����@4B�s�E@ ]��r~�@"�����@%Q�ʅ�@'����@*�K}�K�@-�}��&@0g�}U@1�>2�3@3����4@5[~{�@7��+��@8�$<G�c@:ҽT_�p@<�8�KPf@>�`����@@c��[��@An��]q@B���&@C������@D�pDNQ�@Eݭ�<Ij@G	+Z��g@H:�Г%=@Ir�ʔ��@J�gǮ��@K�+8���@M=Զ4C�@N�S�rϢ@O����@P��g�!�@QO�K�@R/�1@R��v�v@Sp��U�@T,3cO@T��T@U��\��h@Vn'��O@W4)/ۚ'@W���E}�@X���22,@Y��&-��@ZfsJ�@[8��bP@\"�ι@\��|"��@]�(����@^��3��@_{����@`.��h4�@`���o�        ?�?x'2�?�ҨA��?�^�C�PQ?�����?��4I�{?���8z?������?�2��'T?�6�kC4@h�Ӆ�@�8?/@	���ڬ@��W���@,�0�� @{L\5_�@��t&�@q�Q�@�&b@ه�}�3@ Zԁ��q@!��7�r�@#]�T�ԓ@$��I��.@&�9��>�@(>���T�@)����Y�@+��8��@-�ҍ/n�@/b��hv@0�Г<	�@1�����@2�ń	�)@3���V�@4������@5�,A�@6�����@7�:���'@8�1��+@:�.y(@;7�ҭ�@<aJ�@=��;�)@>�W�G@?��c_"@@��OѭO@A:݅�p�@A�+iyjc@B���w%�@C(<9�Ҁ@C��O�=@D{�k�D�@E(�nYR�@EבB�?@F���C�@G;�z�@G������@H��d^�@I`�L�@Jc%�
a@J�0�{�@K����j@LWqx5�@M�"�%n        ?��O_'@B?�7��v�?�� 3�?��q/�.?瓤DB�?�E��:?�E	��xx?��z��@�-�$�@��/`^n@	��j��@��t@���!{u@F� 탏@��x��@��RA@�a��Q�@�B� '�@!�����@#RE�~�@%���}�@&�c�@(�_�@*���a�@,�	��Y@.�;�0�@0j(t�D�@1}�.�@2���4 @3�/����@4�@}��Q@6��dX@7@@�՛}@8y���>@9���?m�@:�g�$�@<J��!��@=�.�\�@>��}oe@@'ʲQK@@��3���@A�q�ڍ@BB��t�@B��4(@C�F��@Du_yX��@E5�/�@E�����@F����k�@G���@u@HQX#d@I�_G̑@I���
u@J�V��SY@K�?���@Lg�b֞@M@
�p@N\�?c@N�ܜ�x[@OՄ�|�n@P[(v��@P̞j�(@Q?"��u!        ?��,�vH?�xF��m�?�jK���?ߕTt=��?�߶; ?��J��?���x��?�Q��2�v@M�sh�@N�f(|@
��4PZ�@X��b@.ߞ��@�H��@�-�F�@�]W�;@��8��@ ~h��
@"0MtY�@#�NI���@%���Vp@'�Z8�o@)��q+6@+���G~�@-�;�{�@/���)@1���z@2%�y�^w@3M[�J@4{uj���@5�͘���@6�:*��@80+<��@9y��B}�@:����N@< �+Pv�@=}��g;�@>�H���#@@%|+8�@@�d���@A�R���@BV;��j@C�u�@C��hH> @D�eW�j@Ej�lD��@F6��j.�@G��W<@G�t/Bw@H��g�@I����� @J\"�Ia:@K89���@Lޑb$�@L�	|W~�@M۳����@N��n7@O�f��/,@PJ��Y^�@P�\�1�@Q97����@Q�=L�@R,kp�x        ?�"w�uS�?������9?���� T?���O1.K?�	�L`�?�$_ธX@��S��@
��y�
�@�1��,�@n���yZ@i��Q��@���ռq@ ��vZ�L@#�K���@%�����@(N<�8v@+��!,y@.T�]-�@0�5fw@2#�7��@3ǥM��E@5y� 4��@794bB��@94��2�@:�R��@<�N>Fek@>��ɆF�@@]y���@Ac��� �@Bo�#��9@C�����3@D���N�	@E�J	��@F�<����@H����L@I17�^�`@Jd�;� �@K���	�@L��j�@N��\J�@Oh$�vKY@PZ���@Q;�t!@Q�
���@R^K�>�@S�Oo��@S���X@Twp5�aB@U/08�kM@U�?�u��@V�����@Wd7a�!�@X%0���@X�,�6��@Y�y�S1�@Zt��[�+@[>��3�@\
]1�Z�@\�;��@]�+�I@^z(�:.�@_N,���@`>2�}        ?��B�^?��?�?�x���L?��`1�I{?�C�\1�?�����|?�g:_1��?����?� �̜@�y�l @�K��P@
�����@��D���@��0�F�@�y�ŉR@fӣ���@��h0X6@��1X`�@m_Q9j�@ �b��q@"$�cK�t@#��?���@%C$���M@&��3m��@(�a�Zc@*G.��eM@,	+N��@-��  @/���`�@0���5��@1��(/��@2�_嶭@3�{iV%@4����r(@5�p����@6�ܟ��h@7��W���@8�6��E�@:T*�@;3)���@<V�޲�C@=~f��@>����@?�ÿ��@@���P�^@A"՚_�$@A�̲�F�@B`��@C���@C�i��L@DL"|e�@D��ˎg,@E�C���d@FH��4��@F�� n�"@G��[eȸ@HU�)b&d@Ik�\�@I��S�,@Js&ʆ�@K*����@K�kW��@L��xw�        ?��_��p?��x���[?Ҷ��{�?�䊅yu?�h:����?�:��1?�U��y�?�����@���ax@�zDڲ�@
���=-�@���w��@X�(Г-@��6q�@�
��b!@�����@�"Y5�@ ��!��@"L��w�@$�PrE@%��7|�n@'�Umx��@)���Ռ@+��s]�@-�UW}L@/�x�k�@1k�HJ@24�3F<a@3\'@��@4��h�KS@5�p��#@6��z@8@m�I�@9��g�s@:�TY59N@<2�VO2�@=�f��ڠ@>�T)@@/y[[��@@�ʨ�"�@A�.���@Ba�R���@C#�Q@C�t�O֭@D��Hg�@Ey��S@FF$.�@G?���@G�����@H�N��@I���sNa@Jqr�*��@KO	���@L/E`=ն@M0�N�@M���Ds@Nߑ�4�<@O�#�"͡@P[���H�@P�r輫�@QL�.Lc-@Q�����~@RBeP[8        ?��^y�۳?��-�.6>?�v��|c�?ߤ!��I�?�!d{?��^1x�?��,�p�?�M�Ա@H��7�@ET��{�@
����l$@BYY(�@a����@��/@�)GE�/@~v���W@�D�@ e�5�-u@"�8�D@#�����@%��Y/�@'~v�
 �@)m;��Q@+k����C@-yV���@/�%E	'�@0���z@1��RФ@3"TM�q@4M�P%�S@5���}�@6�_N��+@7�k/@Y@9@$�օ�@:�q˾�@;�:0Ѵ�@=;e,�'-@>����3�@@?τ�\@@���Ob@Ap�5��@B-R�BY}@B�D*@C���I`�@Ds�x&��@E;{P ��@F�_�@F�Uh�@G�O��|�@Hu�7d�f@IK+ծp�@J"�\�:�@J�K�
�*@K�^W� @L�^C�CG@M����@NGl��@Oec@��@P'�Ȇ@P�uW�s�@Q�g@Q������@Rj��Վ        ?��l��,�?Ј�N�A�?�g%'�[p?�ӗ
|�\?��P�`�@ 2�H\{@z����@��u-��@<~�.�@�xz"Ɣ@n��@j�6LI+@!	8pv}S@#�\\p�\@&oR�@(�%�~�L@+�Pg�I@.�����@0�d^El�@2u_�Z�@4�;9�@5ϝB#�\@7��M�Y�@9^����^@;8�m��C@=s��`�@?�@�u�@@�+�v�@A��a�)�@B�eZԗz@C�_����@D��#��f@E�}o茖@F�q�`��@H�^[@IF��l�@Ju�]H@K���Q�@L�
�f1<@N ӏ���@OcV��-l@PUA�R��@P�$T�ؑ@Q�K��|�@RM����@R�J��}�@S�ɕc@TZ�;��@U�·s@U�N���@Vy�Lo��@W2��`~@W�gM�G"@X��v��@Yk^��5�@Z,���h�@Z�U��&@[����j�@\}"����@]FnT���@^�½H�@^޺֘$&@_��6�@�        ?����4��?�Pm����?����J�?ِ�߳�n?�~��4�	?덦���C?�u���Ow?���?\cH?���^�@�y�3@��o�y�@	~�Z�,j@���!�N@��h1@G�;�e�@����L@BP����@줎d@o@�	)�@ L���@!��l�x�@#Y�TH\�@$���ڦ@&��H͉0@(Q��>9�@*�v���@+�G�n�@-�tȋ�@/�n6@0˄69�@1���@1�@2�)���#@3�)I���@4��{���@6%2}@7��8w�@8?Uߥ�@9ff�U@:�3��K�@;Ý3q��@<�FͫVT@>6$��_@?w-q��@@^�+��Y@AK���{@A�s,�&7@BW�YY@C@�yWI@C��F`4@De�S@Ee��e	@E�K�HE@F��z��a@GF@�K@HI�)2@Hĭi�yK@I�h�$	8@JLxUNk�@K�U��@K݈E���@L��$-�#@Mw��$@NHJ7h�        ?��息��?���ʕ?�Б���k?�#��r^?萰�P�1?�YΨƸ�?�<���'3?��e_�@�H��\�@����m@9�
��@WX"�@���,@MfD�@0/Չ�@:R���@j�Ú!�@ �U&A"!@"��.%�@$l�g��K@&M����@(>����`@*@�`�N@,S�6`��@.vu�z�@0T��:@1u��c�@2�Sq�@3Ύ񏯼@51�[�@6E(a�)@7�3�@�/@8�\��wR@:,|c�bL@;�y���@<�>Wr�@>Q���ާ@?���2�@@�*z7�i@AY)��E�@BUJ�{r@Bޣ��@}@C�D$�@Dp�:���@E>ز�$@F��{��@F��y��@G�_�i��@H��ȱn@Im�G�I�@JL��5؀@K.���;�@L4aS@L�h���@M�m��0�@N�"�Rε@O���Ԫ�@PY?*@PӉ+�#'@QOa��@Q��%9��@RJ䋠[@R�U��        ?�����=x?�Iȿ���?�Iw�x��?���\��?�?��el?���.sF?����� ?�մ�Ѭ�@E�%��@�V�Om@#���ծ@���P�h@=ە�[�@zG3~+@Ů*��@LÂɋ�@��G(��@!��72�@#j#����@%S`B]�@'P
,Ľ@@)_�Im�z@+�~��@-���T@/�UN��@1,�2O�@2bK�w��@3����C�@4�?߹ѵ@687�5W�@7�����{@8�T��@:Z�Az��@;�c�!�@=E�3I�_@>ǡW�}@@(����@@�Q�=-@A���v�~@B�d!Z�Q@Cb�HuP�@D:��f��@E� ��@E� u�Y�@F�-/��@G��?)>6@H�mg�@I�nJ�E@J����Z@K4K��@Lw��`��@Ms�����@Nr��&�@Ou���V�@P=�M�@P¯U�7@QI:��@Q���5@RZ�r{�R@R� ��A@Sr�~u&@TS+7J@T�\q�K�        ?�HNn}�?�����\?��s����?�Dh9�2?�'�͛$?�T�li-�@Vw)�@ć���@쁷���@�@�kr@�پ��@�����@ �Q�'�@#d|�8�@&	qao�@(��;ʼb@+��IJ�@.ϟ���y@1 ����@2��,��@4cy�4t+@6,���@8��O@9�Q���6@;�s�@=���'I=@@ d�L�@A�q�@B*�����@CJa���]@Dp�N��@E�l�!y@FҘ��@Hng�@IN�_��g@J��4)(L@K�%��;�@M9⤳C�@N����@O�-b��9@P��hP%@Qe�mqЖ@Rb~�ԡ@R�1��(�@S����n�@T^��~ws@U$i��D@U����l@V�vp>'2@W��p$��@XW�	�b@Y+����@Z�Z�.@Z�2	��@[�{5t�@\�����@]yAE�n\@^]��#�@_D��[&`@``�wf�@`���O@a<��w�@a~&��        ?������?�cC�i�V?�� �c'?ڂ͖���?�4<
P��?쉂#H+?���`��?����t�x?���uA��@�R�jG�@R4l�}@
:3G,u�@e���:]@h���@�;yUf�@1��T��@�mX���@oc$�Ѥ@7��|�@ �p�%QN@"�y8N.@#�7\P@%.�~[DM@&Ҍ����@(�{��@*=4,�@,�  (�@-���1@/�Pod�|@0��4�@1��E�C�@2�a@3�Zj���@4�&[i+�@5��	wN�@6�e�(�@8�(��@9�g��@:<���@;`���Z}@<��,��@=�V$�(@>�D�݆'@@����@@�-\US�@AL�E�|m@A�bM	>~@B�/1���@C8���@C��>K�@D�$
R��@E6?(b��@E�a��Q@F����@GF�}n@G��;tD@H�؋5/�@Ih���z�@J"�����@Jޗv���@K�J��F@L[�j�8@MK�|��        ?�xh���?��U
�?�z1��?�V�'�?�h��֙?��K+�?�`�J�I?��>h��@NAyW��@���!/�@���@�A�Q�@.�RK��@��}5h@�����x@���+@g��9@!l���<�@#8Q���a@%��{�@'%��@)	I����@+
ļL�@-A��Վ�@/w���@0�9�C�@2
��o @3=�s�Z@4yY<hXv@5�����:@7���~@8Z�y��@9�C#��3@;ګ�n�@<~�oH�@=�
��+@?fz���@@r��V�
@A5W�f@A��L4N@B�p�<�g@C��5�g<@Dc@���W@E72�!,@Ft�\�K@F���1�@G��Y9O�@H��<x9n@I��H�^�@JsY�{8A@K]�֤ 
@LK��,@M<B�I�^@N0�QX�@O&�ä!@Ph�q�@P��f��@Q�T��p@Q�,�3J@R	��@R�a-�@S)K�8@S�a���!        ?��DC�9?�#���?�|~m�n?��$b�X?�p�
k5?�OD��?�E���?��+�2�j@�՜s�]@ȕ7c<%@
0tp@���?@�^��\.@OC�e7@
p�H��@��]��@�2)�@ \�!��@!�7��?�@#^;�ㆿ@%!
�G@&�4�a�@(�s"�U@*�mK*"@,���kp�@.�O� ��@0t�D�@1����v@2�L̣
@3�_F��@4���U|@6���*|@7Mj���t@8�OS�{0@9��'V�@;��ં@<X$b)H@=��4���@>�O�78�@@-����@@�H/@A�E�[�@BG�lH@B�J][zM@C��E-P@DwV����@E7=_N@E�)W���@F����`@G��䟊@HM�� z)@I�/l@I���T�@J���=��@K��tƮ�@L]#��N@M3�M��@N7���3@N��W�ճ@O�Ʌ���@PQ[T���@P�ۂ!{[@Q3c��'        ?����f?Ё�+f�?�a:���Q?�̆��uE?���Q��@ ~i�k�@~����@�N`�@En�H�@b�4$@#�<ݍ�@��R��@!�� }b@#��fq�~@&@��4@)�533G@+�1��Hc@.�b�-1�@1	��.4@2�%�@4Z�:���@6,�]��@7�e���@9�E�|�W@;�}i�~p@=��+A�@?����-�@@Ԕ��n@A�e`�]0@B�.`.�I@DҠ�@E+7�sǿ@FOF{�@Gx��?-@H���
y@Iܓ��%b@K|�C@LU��5-�@M�$����@N��^�5�@PBP��z@P�*'
��@Qo�>�:@Rv톹}@R�Λ�Y@S���!�^@T9��R�1@T�Krj�@U�0���@Vjgަ�Y@W)�s��@W��<Ϳ@X��!&��@Yu�&G�&@Z>zv�@[	'�0ޒ@[�/%�S@\�g�R@]v#<9@^IaF�@_�?�[�@_� ���"@`g�K-�        ?��{Ӣ��?�&�%�)?ͣ6���?�fp.Q�?�[& W�?�U�%?�K�+K��?���+� ?�_謰@�Ik��T@Z6�@	Y� WH@�Kϼ@�-_���@ڤ���<@/J��C@�!y�4@)EP�&,@�ヷ�@�>�&�@!.��*@"�ąF��@$&$Z�D�@%��$�_ @'J*��:l@(�^m��@*�4P�@,P2��]X@.y�Lػ@/�� ��@0��2=@1�p ��+@2��M�J@3���y#�@4�`���Q@5��;�1C@6�����E@7���|�{@8׻�1x@9��ܙ�@;��Ḹ@<!a�X�@=B{�R�@>g�A>�@?�6��� @@_^��@@�'w�f_@A��Շ�@B/�6Na@B�`|��@Co � @D��Ӹ�@D�����@E\;�z@F^\A�@F�X1q��@GZ$v��M@H�z��P@H�&X��y@IhV�D��@JM�D�^@J�	22@K���f;�        ?�3�R�+?�Oܼ4��?�:�(f�?�v��9YT?�|ڏe�?���?����|��?�<���@27�b{@/��#�@���@&4@G��/F�@�H)��@��t�9@����@�B��0*@�����@!-���@"ݧ\�b@$���@&�"N @(�zu���@*��F��@,���ԡL@.�f`{�L@0�����@1���ԛ@2�ۯ@4{�x@5F��d��@6���В�@7�A�4 �@9&�9h4@:
4�@;��t�P@=F��_!@>�BJq@@Y���@@�4���@A����C@BWR��l7@C�X{+z@C�H���@D�w��@E��@q@F\�Y@��@G3��ǆ@H#��<�@H�k#�~@I˭�B��@J��>/2�@K���L@L~�F@Mi��R@NX�dv��@OJ.7��t@P=��S@P��@Q�C �@Q���(�@RpZv@R�S�R��@S�JJk-        ?��vIy?�nDͿ'�?�L�S$��?ݥڈ�?政�.�?���ӛ�?�S>"�S�?�l��W��@z�]��@ҋu��@�!m�}C@1�:��@�a���@\�~3�@� ��]@� ��ʹ@�/?�@z�tm�@ �EmH�@"a�p��@$	����K@%��v2�@'���Kiq@)Ts	���@+2M�F��@-Օ���@/�.o�@0�j���@1��h�)�@2�:@Q��@3�F?T��@4��^��@5��Z�@7���
�@86�����@9d�.�"�@:���v(@;���;�@=��P�@>N���Q�@?�ՙ��@@p��Z@A�����@A����@Bn-��n@C����k@C�7;�0�@D𱽪Q@E4ï�m0@E��;`p@F����@G_�A�7@H{�4�@H�i�/�@I�D�_��@J_9
*�@K#��r�0@K�-��@L��js@M|�g�%@NH�2㵃@OIl�l@O�L{��        ?�ޖ9���?ρ>���?��EaFh?�o��(��?��-�1��?��~D�]�@}�� 2�@
]v����@s&���>@�5՘@�p��*�@��P@ FY�$@"���$m#@%�h�@'�-��@*w�?@-O���O�@0"V�UՑ@1��~!��@3@�u�K�@4�s50@6�����@8P���m@:����F@;�}w�$�@=�	Znd@?�3�M�@@��ט��@A�M'��@B�;�. @C����@D�VS��@F[�1t�@G2��H�A@HS��XWl@IztkM��@J��k3�@K�f�U @M�<�_�@NE���@O���dо@Pd\tF@Q���@Q����@RW��bd�@S�ǋ�@S�V����@T_߃)��@U��,@U�}I�F�@V{�$��@W3��jU@W���9�@X�A*K�@Yh�l�rX@Z)��U@Z���@[��(�@\vo:�7�@]>�m��@^	O՚��@^ճ>�uR        ?�ОgL��?���:�;?�J�A.�x?�Ϥ(o2?�l�e���?���R�ĺ?�I���R�?����,�M?��=t�@�	�w�@s7yo|@
Y"���@�7�at�@r��@�)��l@02o{K@���8#@[�X\�@@�g�o@ w$猖e@!����+t@#p�W>��@$�`V��@&�N�e�(@(;1���@)�<yPTR@+��){bG@-dK�Tф@/0�^��@0�\2n�@1sQ"h�@2gn"�F}@3`K���@4]� 1��@5_A4z�@6e-�D)�@7oJ�7y@8}��s@;@9��զ�@:� ��)'@;�'�hP@<�.��-`@> 
���@?%��{?i@@'����R@@�V	�@AVr�"�@A�14��@B����&�@C*9���=@CɟM�@Dj�����@Er����@E�Ӟ�q�@FW���@F�l
���@G��^�@HSX��,@H���J�b@I�rNt�o@J\�7ay�@K����.@K����        ?�՝�"H�?���0�D?����1'�?�B�(&�C?��Y�Tm?�}��#?�j�y�[?� �Z00@�.��@���s�|@\�C���@S�v�	@�R�V@\�@I�+@<��%@C4#Ҷ@nL���@ ���@"�B&���@$b�NPmz@&>Y��g�@(*P�?Α@*&k�q��@,2Y�I@.M��A�@0<B�Ȁ@1Yk�@2}F�ݭ�@3���Ύ�@4�2��;@6����@7T���n�@8����1�@9�=�k_@;=I�6�@<��ք %@=�t�3�@?_c���@@f9_�@A����@A�Q���R@B��j4@C^7�
��@D#�{�6�@D�6`�!@E��^�@F�o����@GU:��@H(X�H�@H�j;���@I�2E�2�@J���D�*@K��k%��@Lq�G{�@MU�FY@N;+�-6@O#�[n@P��@P~z�~[@P���ɤ�@QpG!��@Q��eS�\@RfȲ��C        ?���Hy��?�F.ǹp�?�6�td�?�9.��?��bD~4?��qp��?�y��C)�?��?ۈ�~@Ƴ�	@�Rf&@
5�h�@��lVp@Ր��0@l�7��@(�'��@8�u4�@
c-�z�@ 26@!�d&��@#k��L6�@%-�z��:@&��W+�@(�>s�@*�Y�OS@,���7��@.��Z	�\@0x�/@@1��L%��@2����}@3�3W"@4�19�Dz@6�SP�z@7T����@8�XR@9�
�ژ�@;���KT@<g���Q@=��,�x�@?���@@:��LL@@��?���@A�NW�5@B[�N$ @C�@�@C�	��@D�Ɨ>��@EY(�&�@F-����@F��r<��@G���@��@H���)�@IP��8��@J#��x�@J��|<�@KЛ۸�@L��3 @M�%yzYg@Ne�o��	@OG-��%�@PY?�@@P�A�t�}@P�M��@Qqz�j�        ?��H��D�?�~u�qy?�\�F�?���e�Q?��Jv��n@ l&�)v@j� �@��w��@,B�k��@�H�$'@�a@D^
���@ ��V�?@#a�D��@%�+���@(�~�<�@+uէ�
@.c����@0��K۰�@2I���e@3�G�Uv@5�<JY��@7P��Se�@9��x"C@:���_�@<�o���@>�]A�>-@@Q�'��~@AQ2��u�@BV�Z�@C`��@Do3R��@E�`9C.�@F�zq��@G�hl��;@H��	�s@Jd�sV�@K0F*���@L`��s@M�p^��'@NΚ���@P
�f��@P������@QI�\+�@Q�����@R���x@S?*�	�"@S�Gw��@T�X�j��@UFU��j�@U�7}�y.@V�����@W^�7�.@X�}{8@X��l�/@Y�L"�w@ZB���@[ 0Hr��@[�S9��$@\�%/h��@]B�����@^���@^�~��        ?�z*�D_B?�$����?Ϋ`A��?�F3�vӜ?�i�f|�?�?�~���?��%�R[?�K���?�J�e�7�@m���E�@�=Jɤ�@	�ۅB]�@�L_�@׳+��@S���s@��9S5�@(�����@����H�@b�=�F)@ 6��@!~=9+@"��o��@$w�
�@&o�^��@'�fZ�@):���iO@*�$�"��@,�ZSw�@.Vl{{��@0t�=�3@0�4��z@1�a�@2���Ð@3Ǥق
*@4����[5@5��_g�@6����	@7÷7�:@8̪7�@9�u���@:�	+O�@;�V5�ʍ@=N��@>1��@?Q�"	@@9��<�@@�չ��	@Aa�-6�t@A��E�F:@B��\p�@C)�s�xm@C��Δ��@Da�b�C @D���i�@E��+ԑ�@FA91��@F�"�U�k@G���-@H.a�*@Hկ)�0�@I~j�i�@J(�a��@J� d_�        ?�N��E�?��ˮnn�?�zP�i�?ߢ8�:?�O?��]e���?��jpJ.?�?��ϝ�@>����@6��@
�h�1�|@%����@:t�$@�#����@n:���@VV?��@af˖u�@ G;/d�d@!�S��@#���Te`@%l�+�	8@'C<��@)(�j�u�@+���@- �h�˦@/2WX;��@0���.�,@1����R@2�7��\�@4n����@5,<#���@6]��O�m@7�2��p�@8�+�@��@:Z31�c@;a�i2@<��FZ@>Z,��@?d�/��@@cW6r��@AFZ�h@A�6��n@B��:2jb@CD&d��@DD $� @D�*�G\@E�����@FQ��$@G��m�@G�~�Q�u@H���4��@I�`����@J\�G
�@K3��� @L�\��@L�Əa:�@M�%I��@N�����@O�D�!K�@P8|g� }@P��Zﱾ@Q!���@Q�3g� j        ?�S�)�Q?�4vz?��a<IK�?��.�Ü?�m�l��?����g�?�!RA>c�?�v-����@�ao�X�@��(70@	�$u$@M���@��Nڃ�@'�b
@ʑX���@��}D,G@���7}@�)Ю�P@!o�u�5@#)����@$���~�@&�v�KS�@(s��ohD@*X�TUQb@,K��eot@.Ly�J�R@0-?R�&q@1:�D� @2N�0�@3i ��o�@4��սM:@5�[P���@6����L@8�Ɩ$@9H6����@:�v�J+�@;�\�>��@=�-&��@>b���@?��汶�@@�J_:��@A7�!��@A鰁���@B�8���M@CUA�T��@D�7�)u@Dʴ�o�@E�:�@FIK��@G��]@G�%�;�@H�ì-��@Ic��e�5@J/�t��@J��ȼ�@K�fc�&3@L��/�@Mu��NM@NLC�.^@O$���g�@O����Ϝ@Pn@�UB�@Pݟ'UT        ?�_,ڊ�|?�&�_e<�?��`'�݊?� =��?�0Ivq�?�R3�Ϋ�@��ef�N@
�r��@�v�_@or�
18@`Q�L@�W��^@ �2��@"��|�@%n�]ȏL@(M����@*�֭eHx@-��%�۟@0K��Y�@1ҬcLn�@3fh��p@5{�5��@6����@8jK� Jt@:-i~��E@;��N��\@=Ժ/FȻ@?�s���@@�KI��]@A�w�	W�@BХj�8p@Cֻ�"�&@D��b@E�A���!@G�^r�.@HS23K@I;���%@J]L��j�@K�Q�n��@L������@M�̙�G@O�x�/@P"�&���@P�J�cp@Q_f�	l@R �h�r@R��b��@SH־^�@S�6c@T�b�lF>@UBޏW�@U�"���@@V�+��҃@WL�yj�@W�w�[@X��ry��@Yf�e��1@Z,�,�@Z�h�\M@[�G
��@\J�W4�E@]�4��@]ƀ��*