CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T105128        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?���Y�9?�+A9Q*?�R��I�9?�E��)?�W�N
�T?�Nf�NJ?�gH"BP�@zE�Õ@�G��@/_t�f\@���>�@^�9�)@���t@�����@!��n9�@$�N3�]@']�U��@*Sd418�@-uP�1�@0a�%�@22[��B@3�m��^@5���+�@7���g��@9���tS@<��H@>I ���@@L�����@A~�&{O@B�%{̌�@D�s��@EQ��@F��&��@H�nǰ�@I}_F�:�@J�Q���#@Lt��2��@M�>iϬt@O��;�t@P�k� j�@Qhњ�v	@R?�ε�I@S߷J�
@S�qP4�@T�P{�Ծ@U�uw��@V���-@W�um�@X�D� <�@Y�?�Q�!@Z�`S�@[���s�@\��NO@]�W��@^��e�Ѯ@_�= �8@`iZ���@`���@a��l��@b�����@b�R�p�@c=�>�c@c�ϲ�|�        ?�^�v���?����k�y?Ջ�I��?�j�q!��?�����P?��,��=@�����@��A�1@�:�ҁ�@�e��n@"�!���@'�O�zh@,� �N�@1n;��m�@4��ÄE�@8fc&Vrw@<gL.mLp@@a���@B��q��@EHpJ�x�@H��3@J�;z�@N m��@P��A�@Rf��w�@T<��@V+��9�@X3ʳ&r@ZR�h_<<@\�`1?/v@^�e5�I�@`����cL@a��Kx�{@c1;e@d������@e�H;�H@gb	L�.�@h����1@ji� ���@k��`�Z@m��T�6@@oO�3��g@p�ɇ	g@qg���^�@rP\Z��@s>��6c@t3]o�^O@u-���AC@v-�l�@w3$�kp@x>r����@yO^����@ze�E���@{���{�@|�n��@}�i����@~���Ll;@�K���@���C�qR@�N�l��@��� e�@��l���	@�8���?�        ?�ǡS7E�?���D�?�؞��P?㺏��~�?�����?�gݐ.c@�*���D@GM����@����.@� ��Y@ i�,��@$m��@(�~�$��@.�\-N@1џ���H@4�n��@8D��E�y@;�0aT;@?�`A�6�@B��� A@DN��hT@F�@��h@IEy��~@K�r	��@N�3�̱�@P�a5�&m@R|d�O�@T!�:�ZF@U� �C9@W�7n ��@Y�2p�5�@[s㿄ޑ@]w;x��K@_�(8���@`�˚��&@a�:ʛ;@c�2>
�@dN�+��@e�[/�&@f�-��aD@h���m@ig����@j�>�ñ{@l)�-�$�@m���Rؽ@o��~�@pF�_�2F@q
�e�rM@q�1���@r����XB@spP��V@tE#��@u:&�@u�%�ܙ:@v�G#/e@w�s��Q-@x���W�@y��=� o@z����@@{~h*4`@|w��@}s�[�}@~t�,�Y�        ?ȏS�g��?�~��@J!
u@���v��@ ��0��@(���ӷ@1�q�7��@7�e�F(@?Op7F^@C�y��@H�z�t�@@M�m��@Q�ܠ@U%{|}��@X�K�*'@\hA��T@`:3���@bc��;�@d�	�+`�@g!�}A�@i����*@llז�A�@oG��@q!���@r�ƣ;t@tR�
�H�@v��?�{@wǋ���@y�;�@{.n��V@}s�����@x(u)P#@��V� �C@��|�e�@��mo@�7T2@�=Xä=�@�n(W	�d@��lQ�0�@�����f@�,�o�@�{��H�@��VKY@�,�:��r@���M~o�@�}�遫@�5�S\i@��D��@���C���@�sz�êM@�9t N�8@����@��?Z�t@��1��@�rd>X�@�H9}]�@�!�r�b�@��8c]\e@������1@���d>��@�����w@��qMoO�@�|�M��        ?��.�57?���;��?�) t��?�W�����?�˚�u�B?���e��?�ٽ �:@?��ʊ��*@5>j��a@	�SU+�Y@���q�@��)�@�ٻ�+T@�t��aA@󊪶��@!ƣ����@$<���$�@&����@)��%��@,��"�@/��j�@1�a���@3;p�7O�@5
�ǥk�@6�@&0�@8��zQ�@:��dGq�@= #��	�@?[kܠ�@@Ֆ
�@B=P�˓@CEk+��S@D��{o�@E�2�A�@G;���@H���+&@J��O�@K��t��@M	Z�ȍ@N��%�ݡ@P �"��@P��58M@Q˔�Y@R�Ď�+�@S�&,�#�@Tr����g@U_h���@VQ?��t�@WH7��q�@XDM_�S@YE~�i@ZK��ȦX@[W&\@��@\g���f�@]}��`@^�����@_����@`m��C�*@aZ�%
@a�u߰��@b2�g�yE@b��lkek@cmQͥ>        ?�ٌ7�mf?����zd?б]�~�?�G��-�?��a�?�����@2P��Ԫ@7��c@}���m@K��.Z|@���@#l���@'�Jܶ�]@,��2CK@1"Q/_DT@4(�|T�@7w�{��&@;��.��@>�A�>�B@A��/y�@C�:2y;�@F3���b@H�|���@Kn��@�X@NFH�Qg+@P�oԳ�d@R5)iy�@S�R�ī�@U��~�-@Wa�:�;@YBO��)@[6[y?�@]= χz@_Wx����@`���@a��46$@c�ߩ_@d@T_�@e}S2-Z+@f��*�@h�X�x�@im&�,��@j��B���@l<*.X�6@m��˰o�@o0�s�-�@p\n�-�%@q%0}�Z�@q��Z}u@rĕ�C@s�3+��@tvhM~�O@uV1���@v:�碼@w#u�M�@x�k_�@y���X@y�er��@z�g��N@{�����@|��r��Y@~ V���@=x���        ?�?�>c�?��R\]�?�e�0<�?�����}?�s2o?�Z�] .@P�?B��@
���~2@����%p@aPtX
@�Q�,˞@"��<��m@'6L���@+�\@�DJ@0��m�a�@3���@6޻
ۈ@:i5�z��@>>!JҒ@A/���f<@Cfe]J`@EÍ�Y�Z@HGn��C�@J�53���@M�_��)@P^u��!@Q�~��@@S�s<�@UIL1i?�@W-<��@X�C~���@Z��i��R@\�
Ȅa�@_uS���@`��D�hK@a��?Qf@b�K@d_���@eM>Ʌ��@f�}�� 5@g�r-H�@i8߀x;)@j��61@lo���@mwJ�6�@n�1��@p<a_�X�@qoC%�q@q���0�[@r��aa�L@sr��,��@tK���G@u(V�T
@v	m4��_@v�?K��@w�A��M@x�����@y��+�? @z���Ы�@{��RX'N@|�����`@}���R0n@~��t��        ?�N�z��G?�p6?��so"G�@
�R��7@]�ȇ�@!N�}�3@(����@1XI�@6Y<i���@<s?b-f@A��`?�@E�	i��"@I���q�@NZ��@Q�x�z�@Tf��D�@WO�ν7@Zl��J�@]��:g��@`��9P*@b|���y�@ds� �*@f�boЃ�@h��Q���@j�#���8@mU�
-t@o�;Eg��@q1ײ/do@r�&���N@s�}�� �@u^�9WQn@v����@xh"B�8�@z @�F�@{��&I�g@}Ve�6@�'�u�@�o�	N�@�[�	��#@�N lĐ�@�F����j@�E؃R�@�K?�)��@�V��,�@�i=�B�@��R����@���b�G�@�ę�w9�@���H��@� �2�A�@�W�����@��G���@�l0m%1�@��"�@���bN��@�cE��W@��_pOW@������g@�uY��"@�+���.�@���U ��@��3����@�`R�d[�        ?�s��5�?�L���?�݉���$?��8>�^H?����V?�
ez��?����I�@`&v9�@�c�[@��<eT@�9^*Hu@4b��?@167�@�G�*�q@!g�Z�@#���ʙY@&G��n�@) (+�@,$�.��@/T�h�b@1X;�\�=@3��~y�@4�@W݅0@6�-�{n�@8�-�c7@:�<��@=)͒`Q@?k$f�o@@�}���@B�d�@@CT��D�g@D��[��@E�@5ڹ@GNO�b�6@H�&a%�@J%����@K��	c3@M#]�1Z<@N�U0bm_@P#I
�}�@P��bPS@Q�4�.W@R���C�@S|�J�`B@T^k.s�;@UD$�(@V.F�,�@W;pD�@X~��C�@Yכ���@Y�:���S@Z����$Y@[����_-@]CY�G�@^w�f��@_�A�[2@`EGd�@`�/~L��@a0���@a��҄��@bOg\t�@b���F�@cvY��$1        ?�����Ʊ?����Nλ?Ѯ�)?�j¶?��܃�(�?��8�We?@�����@ܙ�Pl�@ڌm&P�@��gBؤ@x�ʗ*�@#���,@()hj�@,�(�}��@11�SnЄ@41iN�H*@7x>_��@;�YH�@>޳�GA�@A���@C���鸉@F�_@H�󹟟@K6�`i��@N�����@Pzu{�\@R�#���@S��,�0@UUQ>�O�@W[s�@X�%p:�@Z١�@��@\��G$�N@^�rra1�@`��}�2}@a���[�@b��h���@c��
'�@e �%�@f_,%1S@g�n��?@h��]�h@jOɑդB@k��Ȏ��@m��jg�@n�����@p*ԫ�K@pȕ��V#@q�F�I��@rZ5�(�T@s)YҦ�@s��`�O�@t��t>@u�����@v�T~U2�@ws��!@xZ���d@yFo�U�@z6�+!@{)���a@|!,�U�D@}��SE@~�jQ�        ?�>|d���?��Q���?�(�˙-+?��k��?�(.z9�?�R�u�N@Z���@����;@k���L@jEL�v}@ 0�,��@$-��C@(�BW]m@-�ߛ��@1��-��*@4�8�6+�@8Hr6y	@;�����=@?����d�@A�E�7Ģ@D0���K@F�T���F@I(uS��@K�H�g{@N�����@P�W�.�D@Rt��?�A@T�)���@U�G5�.
@W�l����@Y�$�F��@[�h?�>@]�/S��W@_�o��a�@`��w�@b�jhV�@c>�ȱk�@dt�B7@e��G��@f���n�@hOM���@i�,趗�@kqл&Y@lal{�@m�����@oxQ��L@p�.B�:9@qJ߅�@r�J@X@r�Ň�@s��j�@t�uA�)L@u~b�c^�@vb� T��@wK<����@x8�`B+@y)0�j2@z~��u@{��H�@|�@��B@}K�P�@~W�wZ@&���NC        ?��4��G�?�b��K�@43��IO@)֐�.@-�▄@&eܙz��@0�2[v\@5�x�ܞ�@<z[l`�@B�g\*�@F\(����@K#6�Z��@P2���k@SB��3@V-���ʂ@Y��[�".@]�լ�5@`z�u�CL@b����LY@d��p�@f�j	��@iZf�ԛ�@k���@n��qeWl@p���g߀@rEZU1@s��	��@uqԅ^@v��9�
@xd�����@zD��@{�FJ܉@}��v�d@�7�9�@���*�w�@��M9 �@�ђ���@�ߵ��_@�������@�K@I�@�2�d�a�@�[QR�@���JlH�@���|�}L@����ҳB@�?r��`E@��'*Yt�@����)��@���'���@�Ci&W�7@���@Ą@��2��[a@�]w��X�@��-�@�Ҟ�{��@��r���@�S*��@�yJ�4@�ޝ��1@��z@�AX@�u�cc�@�DC@�@�$���"        ?�:����?�'��6]?�_f?�0]j_1?䎠�� -?�G�B^�?��f�PCl?��et]�@����&d@	? �ưV@+����\@�l�v߄@vL2�E�@`pk��@��;��3@!� ��j�@$�`bC@&�%(+ń@)Yծ%�7@,A��2�g@/R4thT�@1ER!�@2����:@4����M�@6���߱�@8}'g{_&@:|Y�u@<��g�^@>���o��@@v�yI�@A��"��@B�#s���@D�1�M@EFX:���@F��z'@G��ne�>@IA���d�@J�<V��m@L�����@M��厾�@O��J@PJx����@Q��ۯ@QߘT��x@R�zjB�@S������@T^�'9u@@U<êǧ@V\f�@W��r�@W���&�@X�\��@Y�f�Ҙ@Z�Ȯ�@[�Lł�Z@\��mH@�@]�u$�4 @^�O��p@_�3�(֍@`dz���k@`�뿋5@at�Re��@a�7k��J        ?����M+?�P#A�?�
��;��?���PjR?�V�Df��?��N�hX�@�13��{@b��<�@[c�V�@����X�@ ^�d$5@$������@)A	'*ހ@.����@2>)�{��@5�t�0h@9����@<�qT�:�@@�?���@B�#��@ER*�/@G�B-@J�!��@M� G�@P`F��@R���I�@S���@U�m�T�@WpͿ�~�@YkA_�x@[{_ĺ�n@]��G[@_�q5g��@a��
N@bI�@�A@c��U��@d�%�H^@f#AD�@g��5�@h��̕�@j[�a	�@kؤ
�`�@m_��vw@n�i��(@pF����O@qgk��|@q�G��@r����*@s��F �@t��^^O�@u��3H@vr_����@wgy����@xaR��1@y_�b#U'@zc4P��@{j�^�@|wZe��S@}�T�).�@~����@��=�@�k��#�@��y�|�        ?���e #?��Y��@?�M�B���?�W�[�?�D$�!Lc?�OwRG�@ ǚa�@
���@^ˢ�Jh@,ͩ�m@��$���@#`a��2�@'���j@,�XF��@1$�:D��@4/|���@7�$�J�Z@;#����@?��G��@A�1р��@C�k��@FN�^|<g@H���@K�psʠ�@Nu4���@P�����@RT���<t@S�,o�e@U��q^��@W��=vf@Yuɮ*�Z@[o��F�@]}ؒ�@_�^�^�@`�}i�_@b�����@c<�@ds��3�j@e���:vR@g �^P�@hU檋��@i��=R�E@k׮��#@l�����c@n
E#�@o�5�@�@p����C�@qZ�hN�C@r+Jp�$�@s ���@sڗ�aB�@t�8�vE$@u�yY�tZ@v�T��T@wp�Ei�4@xa�l��Y@yWH��@zQS���,@{Oۋ�,�@|R��j�6@}ZG�b�=@~f�g��@vQ���{        ?�/�g?�P�K_<?���к@	���lk�@*�!-��@!!O%�~@(�W��v6@0�G��@@6 Ǡ'�@<�@AvrI4�@E@:��@Im��vV@M�lhc��@Qy��n3l@T%�ݢ�@W���@Z</�(@]T��¹�@`c֫��D@b6��:@d �U�w@f$O�Kc�@h?���hC@js�3WF$@l�v�&O�@o"���@p��?��@r�S���@sl�U8}�@t�t��	@v7��X�@w���_c@y/:V�+@z���혆@|R�ݷ��@}����m*@�P���4@��R��i@��A��+@�shW�5-@�^���@�O*'#�C@�D�[��@�?6�"K�@�>�'$uV@�C(��3�@�Lr,7S@�Z�l�<,@�mTݪ ]@��ͯ>y�@���%�R�@������O@�模J�!@�� �9��@�!��`@��N��@�S���^@��v�2�@���^��]@�2G=�:7@����A��@�{�Z�        ?����/�'?��i��7G?�Mŕ�p�?��El
?��d�=C�?�"J��7?����i��@kn���q@���-�@�`Yb�6@�̫@9�x���@8+ķhh@��b[^�@!ɹ�	�@#�<?{�@&Q�l��@),����A@,3�f��@/f��jf@1bs�d_�@3'41���@5|L��E@6�.bf��@8�,yUf�@;X���@=?��4��@?�Ò���@@�d���@B%F���@Cfy�F��@D��C�=2@F�@���@Gg�z	l`@Hѡn�`@JE�o	�@K���Һ@ML,��u@N�]��@P=A��m�@QML\'�@Q�O$��@R�E2�M@S�+D��@T������@Uy�7��H@Vj=:bq�@W_�7�s@XY�y��1@YX��@Z\JLe@[d��@\q}� "@]� ����@^�3[�@_���\�x@`i^��%@`�$� /S@a�$��_R@b%]O�9�@b��R?�@cXw>�o@c�Wݓј        ?�\�����?���#�	x?Ҡi��?���R�?�����?�!]�ŧ@���a=@�LyZ@�U�+\�@!��`#@ ��E���@$�VԍO�@)Y�r8"d@.�o�C�@2 ��7@5H/?B�*@8��+�[�@<y���e@@CD�$KO@Bp�4��@D�a��[@GD�c{i@I�G� Q@L�g�]2@O��zX>@Qi��M�@Sof�?@T�c@V��|��@X~���8%@Zx���.�@\��03@^���c� @`sr�}�@a�F��l}@b��_U�3@dL���/@eS�Q��@f����w'@h�}���@im�+zQ�@j�a��iY@l`+�we�@m���[@o~�Q��X@p�A1Y�@qd�:*�)@r?��U:l@s  �K'b@t+����@t�Ç���@u�茉��@vٚ����@w��q���@xפ����@y�����.@z�� ���@{�N��Yc@}KGK�}@~3�hN`\@V���@@�?�$��G@���h�"3        ?�cb�=x�?�� .��?���'?��?��sJ��?�D���{1?�[�ZU�@/>H&
�@	�n����@fV�y9�@�:I�y@�̴L�@"ӧ=2@&/~�3J@*���o��@/�gp��y@2���K@5����o@8�+$�"S@<�==��@@+=�L�@B6@�{��@Dc�+�@F�r@��@I(
��J@K�ې��l@Ny��@P�\'UhO@R, wT]@S�~�$p�@Ub�խee@WA�|�r@X��|��@Z��|�@\��{b�J@^� ҹ�D@`[�mú�@amo;K8�@b�.#*	@c��mn�@dء����@f�7
�@gM�]��@h�9�ݝ2@i��a�@kB~+2��@l�c�!T@nt�*��@o����V@p���Nl@qH˶E�(@r�Wi�@r��/���@s��o�n�@t�Z�F�@ubO�Sa@vA��p�@w%��W�@x$��V�@x��^�J@y�W��ra@z�����@{�=�Q��@|�Ȋp�        ?��; ��?ꮋ�^�Q@��xY��@��2@C�?�@'N1��@@0�ƣ�9@6�s�#_�@=ϕH��@B�+�Q\@Gv�;C�N@L���?�@Qd5�`@T|�74@WY�4�Y@Z�$��-@^��S��|@a_#n#2�@c��u���@e�j�1�b@h6�*p�@j�$R�\@mg�߉@d@p���G@q�2��Ș@s��b@t���UH�@vF� �_�@w�P�)��@y�Kg�j@{���ί�@}m�-�%@\�hƱ@���i���@�����Dl@��/��Q@���#@��s��ڣ@�9���f@�Gc̑5[@�z�+�|�@���= �@���@�A���@��O�-`@��]F�e@�$�Pv�@��x? e@����WM@�IO���C@�C��@�Ⱦs��z@������8@�V2�)%0@�"!*���@���4�a@��Q"qC�@���3G�@�t0�1�l@�Q?\�s3@�1�0���@�����@����g�        ?������Q?�cn��?�B֙���?�lf?m�B?��O�?�͸+�{	?�^���?���F��5@��ᡄ@���y�\@x¥��@q�m���@���B�@δ��@�h �b@!9��6�@#��14�D@&/^�}+D@(�_�d@+ʔ���@.��
��@1.���@2��RD�@4w-�]�@6N�K=B@8:����Q@::Β���@<OXb�j7@>x!��a@@Z�Ɨ��@A� ����@B���,�R@C�a���@E8�hsT-@F��R�Yy@G��T�=z@IHAK?�@J�Ur�zC@L.,TM�A@M���W+I@O;;�Y�@Ph�*�@Q7ud(��@R����@R��z��@S��h�@T��~��@U�2���@Vy�ek�2@Wj̙��K@X`����@Y[��(�L@Z[��m@[_V,�p@\h^πǭ@]v#�K�@^����@_�����@`]Б��@`�	�:�3@a���4�9@bT���@b�\ڔ�        ?��F�@�?�����D?�2���0?�2����?�]m��?�v�hkɉ@��ޭ	g@4��MM@3W��}�@G���,@ 2��F�'@$L��q&�@(�����&@.6y�t��@2C9�w	@5D��L�8@8������@<�Qì��@@s�T�x�@B�����@E)����@G�w�t�@J����y@M�v�;;@PU9�t`@Q�"hnA@S� �5z�@U�[ZJ�@W��Ԅ3@Y�;��@[��x���@]�F��i�@`I]*�@aG�t�/@b�|�!¤@c��d�K@e'��Q��@f�sK�@g�7t��@itV��@j��	���@l��� E@n-���M@o�7Q�4�@pǹ�V��@q�_y��/@r�
��@s~�<v�@trg���@ul�t�@vk���@wqM�UD�@x|Ԅ]�@y�D͚lK@z��;g�@{�ǭ�l<@|��@���@~�<��_@=*�]l�@�8�]<Hw@�ճ/�^@�u|�}o�@��Yp�        ?��.�=?��n��Z�?���f�{?���t3�?�$�d?*�?�6	( w@�1��@���KRM@�N~KY@��(���@x�����@#��O[��@(�U��i@-4���@1M4�7@4X�
�3k@7���@�@;M��O�@?9$u_�@A���5A&@C��}��F@Fe��
Xa@H� �k��@K�b'td@N��@�@Pͅ�<�@Rfj�e@T�?!��@U���Z@W���-�?@Y�<���@[� 2j]@]�=>�ݼ@_����*@a��͔O@b-��e	�@c`p�7�@d�0A���@e� ����@g5?��@h��
���@i��3�e�@ke���x@l�T`��i@nc2�[g�@o�/
(@pĢhB^U@q������@rk��('�@sF��P��@t',�@u>E�lM@u�]/w�@v�t�"�6@wف�S�@xҀ��|@y�ma�&7@z�D8};@{� ��@|��[�@}�˛�@e@mң@�C�ҁ�        ?������?�g!���?���U�N@
h/ �@��T�@!��D�=�@)t]r��@1l �A`�@6���mf@=8���R�@B,�z� ,@F'��@J�/�p�@O_�p�
�@RP/��J�@U'��3A@X6�]�A�@[}z�kw@^�F�o4@aY�q�h@cQ
���@ed�0	!D@g�*���@i�{�;3F@lF��升@n���!
9@p�Z��@r��K#�@s|��/��@t�^�/o�@v{��v��@x��k��@y���}�6@{ai1��@}�<���@~�)�"��@�_�'�{b@�Ry��E@�K��C�@�K�K3�=@�R1�ρ@�_1�9��@�r����a@��ZǨ�@��W�O&@�����M@�	 f�@�8��C��@�s�R#	�@�����p@�����6�@��:�i�@�Pį�fp@����kHX@��jb@�c|5y@��@��@����+�@��R����@�R�_�fZ@�2D��@��\��f�@�����ǯ        ?���s�0_?����Y�?�$��>?��y���j?�c��ӈ;?�d�_�yu?��$v��q@��nxk@F���T@���ն@�4�>�@Լ
]��@'m�D�@�J�lO�@"xw��;@%3}#��@(9/k)�@+9u��@.�s�+j@0�p��@2�4*S�5@4�U�ƈo@6â��;@8��nv@;鲘q-@=V�<�Ѹ@?��B��8@Af����@BY��?��@C��7Y�@E�tϮ�@Fj�US��@G�CY\�@IV|W�.�@J�?����@LluV �S@N}�K@O��-R�@P�g��J@Q��*sOV@Rkl|W0@SQ��Px%@T=6�xp@U-m���@V"y�0�t@WRJq|t@X��V@YE���`@Z&K!�g@[2�{s]�@\D2��v�@]Y���@^tL�HV@_�`&o�@`[(>�܂@`��x���@a� �/G@b4����@b����t@cT�ˎ@c���zm�@d��ڽ�F@e6n]{        ?������?��<A���?�Ae��p?�,���n&?�]�Uu�6@g�U2@	)K�\��@��%1��@�MG`�@�g���@#��3���@(_�_ �@-�ЃaZ�@1؇�M	�@5%���ަ@8�#(w)@<�h��@@�D�/�@B�<Ĩ�@EI�����@G�y\���@J�`�O`@M�v!�ڧ@Pt���D@R h-.g�@S�%~�jm@U�0��q@W��ݏ��@Y�--��J@[��#�@]�+���@` 4}9щ@aN�-�@b����"�@c�^��@e�Q��@fv�V9j@g�
�`W�@iK�I>t@j�q^��z@lK��ߢo@m�Z��,@ou�%;	@p�,4rS@qd�慭x@rA}d&��@s#c�B�@t
j��٭@t���R@u罫k�[@v��x6�@w�D-ݸ@xٌwH�@y��f�z@z�7��@{�>.�x�@}\�e^�@~%d��Q�@CQ�<'H@�3�|@����MU*@�]%���i@���1Q�
        ?��V���?��Zmky}?Ӗ�D�o?�V��w�?�y#� �?��ҍ��@&	,�p=@Hdm%@/��.�@�NF|7@!��4lrm@&௎�@+�_��@0IJ��3(@3[�}a	�@6���g3@:mw^��@>nGOr�@A`\�˚@C��!1{�@F.���?@H�ӗ\@K�[���@N��.)܄@P����u@R���5*e@TB)��%C@V�w��@W��oך@Y�,�� @\�����@^'R�u
^@`0\j��@aWv���@b��Z�Ov@cļW�d@e
�����@f[ ����@g������@i5�4Gl@j���o-E@l�k� @m��pC@o�����@pSt⚇�@q#��V�@q�l~x�A@r�-Y�z@s����j�@t�F\��@u|3i$_@vi
�@,@wZ��0L@xP�B�۟@yK�(�]@zKJ��@{OwA�@|X=��w!@}e���e�@~w�?�ҙ@��^}b@�T{Xg�
@��8�zH�        ?�]8݂d?�k�0�@�_�`!)@�*�ȣ/@!����6R@+R�I�@3\��"X�@:NF�0�@A1��~�@E�>�"�@K e�ЃM@Pc=�&�8@S��TȲ@W	W��<@Z̞�cM�@^ڳI		�@a��q.�@c�]x�n�@fbQR�@h��9�˗@k�5rW��@n�
���@p� S��@rl�FW��@t�K�2s@u� o�PP@w���z@ywr���@{e�$�D@}dӠ�d�@u {��`@���{��{@���Bo@��	�_@�.��Б@�_ZA��@����	��@�����@�"� �:a@�s����|@����%�@�+����0@����jK�@� ���D@���iWM�@�z17ow@�<C��� @��t	1@���I���@��nR;�@�gZ9^۸@�:��|oe@�HJMA�@��8���{@��o��f@���a-��@���w�9�@�sz�a{'@�]�jq�@�J�s%��@�;)�\�@�.��
w]@���<        ?���1Ͱ?�����?Ѽ�D��?�	��/?���]��?���G�/�?����!@s����V@�{o��@j�k`@YA����@�3��_�@\�վ�@!�O�(�'@$rZh��@'\<�`C?@*u�S��@-�R�?��@0���n0@2nJ����@4X���+�@6Z�Z{�@8tJ�|@:�X���7@<�$�6@?Ic�O�@@����¼@B$V��[;@Ct���T@D�tI�dt@F6�AxV_@G�]`�nI@I$�_ƗN@J�L�EI@L<���@M�c�S@O~n>��@P�O���@QtjY���@RVu�?�@S=`�7C@T)׳m�@U�.ԅ@V�_�@W��In.@X��с�@Y	����@Z�Q\U@[8��u�@\+��z@]?���@^W���O�@_tB޾!@`J]F�)�@`ܰ�=��@aq�G @b��z�@b�<Y(@c:���@c׳�Q��@dv����8@ew0�3@e�p��03        ?�H��7��?��ҵ@3�?�[�?�Z�?�V���/?�xe�!8?���w[k�@��t�%6@HT+	��@:�/�g�@HՍ�8@ -��k��@$>]OGTy@(�d��u�@.�2�@1�O��)0@5ͩ�߾@8�E�Cw�@<Rة��.@@4���G@Bg�5�|Q@D�rh� �@GGr���"@I�. �,�@L���5�@O�t���@Qx� �@S ��N*u@Tݨ3I_@V�[&��@X���mK@Z���塜@\�MY�8@^�)Ӯ��@`~_y6'�@a��_�@bթa�E�@d�.�@eU�vϣa@f��g���@g�]���@iaʹ�h
@j�F-��@lF�9�W�@m�$ �t�@oSpfN�e@ptI{ކ@qC��+�@r<g@r�.���n@s���R@t��|��%@u�%a�!�@v�5�~�\@wu�����@xk?C?�(@ye'94@zc����@{f�4~�@|n�gY�@}y�=3t@~�J�|��@���\@�\Ø��        ?�$����}?���lpc?ӯ����Y?�e����?��/H�*?��U!@+?Ku�l@��V\��@�X��t@���@ �q�#�@$� ���@)!ӂ�%z@.5�(&5@1����@5E.ک@8_�p���@<��P;@?�7 �0@B��D��@D[i�.T@Fƚ0�@IOq�f�@L�_4�{@NهK�OK@P�]�Md@R|��=��@T ��z@U�J\���@W���@��@Y|L�n8%@[j��Vk(@]k@,�+�@_~H�7�@`��Wq}9@a�C)��@c`]o=@d@8h�А@ewٻ]�@f�����Z@g�y��J@iP��z0@j�Q���@lj	΋�@mz;Be=@n�.1@p5셥)�@p�Ʊ|��@q��$4g�@r�A��1�@sZ��a9�@t.�o)ms@u�Ð��@u�6Oz�@v��^y@w�f�ؑ@x�rD7��@y{҄D�~@zl4$d@{`�k@|X߸���@}U�2�X@~U@,�	�        ?ɨ`�p?�i��2@+?I��l@�S8�k=@�� @(Z�A�g�@1Y@]	@7�v�css@>�jU���@Cgߵ�3z@G�B���@M�]��}@QT5-|}@T`>yE��@W��[>l@[:7Ki�C@_�.��7@a��IȀ@c�V���<@e��8"��@ha0uw�@j螴F�@m�݃�)@p+Y�L�@q�n,��@s!��@t��#�a@vT �jsY@xY�~��@y�z���@{�Z�ǡe@}m��L�@X��dx@���	��R@��\���@��ԣd��@��)Y!�@��G�v37@���ZC@�$��bW�@�P�9�i@��[~
:@��rqQ_�@����v��@�A��
�+@�����G0@����<*@��:fO�@�Kqg�6�@���yMB@����B�@�j�b/��@�%��@��ͳ_�I@�����'�@�h40W��@�.��3a�@��� y2�@�� ��@���N�*@�d�D��B@�9K�x��@��[?�        ?�U��s��?�[wo>�?ɉAC�;?�w�Em&?�f"�(�?���]��`?��
gu?��0�@�(y%�@
��Z�@.Y�m�@d�iG@��nC�@���B��@B��#�@!쁵�ڗ@$`G�@3@&�H/��@)���,G�@,�ٜ�@/�b�"��@1��1��@33����@4����G6@6՛3 �@8ă:�X@:�LޡN�@<��%KBS@?`}� -@@�K9��@A�B����@B����@D;��"ͯ@E��	";@F�M���&@H,EV�i@I� FP�@J�{�)�@Lt����w@M����\�@O�"�R��@P�a�?@QX�3�F@R,L5��@SW���@S������@T��J�@U�� ߺ2@V�ټZ��@W�_�!r@XsI���E@Yj�bu�@Zf+�fì@[fN��X@\jJL��>@]r�R��@^�X,��@_�����o@`R��Ź�@`�̆'1G@an�{�l@a��7N�@b�)�G�        ?��U�/V�?�@=V�?ά7iw�?�1�Wi�U?�w��7?�te�ac@���lr@���<�J@����'@/�^H'S@[�D#�@!��}�Z@%��0��@*=}`u��@/>���t�@2a��ېu@5g)�C2n@8�屃�j@<@	^���@@
�W���@B.=*x�@DK��v�$@F�e�k�@I܀=t@K�C��QE@N���$@P�g����@R?�ᔲ�@S����@U��)}K�@WJ#��@Y+�G5(@[oͧ`e@\�ٟZ@_r�1w�@`�"k�@a�+��R@b��M׵s@d2n7�@e96D=FX@fy�w��@g�M#m��@ia���@jv'���@kݜAI��@mN��<�@nɓn*e@p'	���?@p�׃P�@q�� @r�ͦi�K@s`c����@t:��P|@u
�3#>@u����	@v��9�E�@wԨ4�e@x�$�H��@y�m��G�@z���D��@{�\�G��@|���O@}�d�U@        ?�}S�6?������4?Ϫ����?༂8�p�?�&b�x?�.���E^@yۇ@	�����@Z����@���;�Q@ N��@"*�����@&E��N~�@*���:��@/���ae]@2�eR�)�@5�(o0�@9D��y܁@<���`�@@ja���@B��<���@DĚpE�<@G)�츑�@I�^B�?#@Le*/&b@O<I3]qh@Q�Y)�/@R�@b��O@TUw��@Vj;*��@Wۃ!��@Y�fAK��@[�%�;�@]��h�a�@_�u�I�@a�@9&@b%�Wf��@cRA�LX.@d����t�@e��C�v@g��	@hg�ù�7@i�f�q�@k.Ӫcp�@l�8ڏ�@n����@o��8e@p�'�ލ@qg7�Q�@r9��ͻ@s��+'h@s���x+@t̄�c�.@u� XǷ�@v��KM}�@w��t�@x�&�L@yx�c���@zv��T�@{y5��@|�>�dJ9@}����i@~��@sC        ?�����H�?��r|4�?�}�B0.@|沗j@o�a C�@"	7���@)ܥ�k� @1�FPw�M@7�WJ�@=M#���W@B)��iy@F�Ae�@J`���^@O�_�?@R	��@T��� �F@W��kbv@Z��/���@^X���/�@`�v�v�9@bؗ�*�@dս��4@f�����@i�-�q@kid�	@m��E�ʩ@p&Q�ٸ�@qr��b�P@r˯5�c@t1�}�Xi@u�W�n)U@w#Ќb�@x���n�@zH��D�~@{�EVl`@}�E��@^�^��@���g^P%@�����9�@�rlZz�V@�je���e@�hp�Q��@�l}���@�v|��@��[����@��W��@���P9 X@�ذ��Q@���p� @�,�{��@�^s���@���]Fɾ@�i^u�P@�
�#�@������M@�UZB�*@���2B�@����w�@�Y��U��@�H)ٵ@��85�!@�v���@�/�E_`�        ?�:��.?�&�&�?���= ��?�#vW��g?�ȁh�l7?�p׋Xϋ?�ƴ8J�e?��U�'��@G!.�;�@b�C� �@PZʰ�@6�j�]�@�BRE޲@s�H&k�@������@ ��L��@#M%׃�;@%̱>;�@(s����@+A�<���@.7Hf__�@0��7l3@2L! �.@4ͦ_��@5���
�@7��ǐ��@9�,����@;�6C��@=�a���@?�K/�B@Ac�Sb_@B7n��)@CjH�"c@D��kL�=@E�^n��%@G=�W��@H����@I�/��N�@Kh��Վ@L߈Sk��@N`%���@O�W�ݍ@P�	�%�O@Q����.�@R`��eX�@S8�$��@T�N2�)@T��i��@U��Y��@V�bR'��@W�`��O*@X����ɬ@Y��H�D@Z�%�O��@[��W2�[@\�h�_G@]��e0�@^���u�@_���X�@`r$v�`{@`��Ꮟ�@a�0�@b �YE�        ?����kU?����6)�?��c�PN?��t=�?�'��HZ?�̙j?�c@�x�a#_@��'�@8d�_�@�h�}L�@!�l�U@%_iܒ@*E��$=�@/���$}@2�?��V�@6X����@:�q@>���H@A@c���@C����n�@F)Z���@H�g7�J�@K����@N��t��@Qh���@RƼ	�c!@T�|�}@V}��@X|�&���@Z�F20�C@\��sT��@_ձ���@`�����@a��\��@c4�2R��@d��j�]R@e�s���@gQ�7��/@h�m.��@jK5i���@k��8@mt�<,-J@o o<��@pf�H�CA@qE��&1�@r*����@ssgl?)@t��@t���U�@u�����@v��SL�@x�0��@y@o'�C@z#����@{<��7@|[$�r�@}n֊�@~�V����@��nH�@��� Q��@�$?A�@��K���@�gJ���        ?��k�6�?����d}2?�hVI��?�u���~?�nZ���?��"t�h@�#~O@	;�;�֩@�m� @o��%�@�>Pܸc@!��C�Ι@%���N@*_�zϕ�@/Z#��:�@2i��o`>@5f���S@8���V�M@<$�z�@?����Z�@A��q]��@D�p�L @F_��J
@H�(EI1[@KP{����@M��h���@Pdb�}�^@Q��ԛ�@Sd>�Fs�@T��*��@V���e��@Xb�+RT@Z.&�ʏ@\
q�i�a@]�R9kP@_����G�@a>	�,T@bK���@c'sS�k�@dF���+�@em�>���@f����a@g���`��@iɝBU�@jYPN��8@k����@@l�E���@nZ�W���@o�N���@p�����@qOq���@r�4ekf@r��MxT@s�H��@tZZ<�8v@u%�T�}�@u��hpV @v���R@w�l�,�@xv���@ySh��K@z3g��*@{��D��        ?�����?�_8��$?�f@�K�@Ɋh�j@�҃��@"���$<@*��ȿ�@2T\�8��@8{��%@>��]Z@C1���2@GD��Y��@K�~�@Pu-�e�@S2���k@@V(�Ι[@YW��?�q@\����8@`/[3��@b����@d$(��J@fH��b�@h�?�wR@j�V��P9@m`�>���@o�E�UI�@qS��h @r��GTh@t/����<@u�U�u2�@wC%8��.@x���Ǿ�@z����+N@|Ikc�g@~D�0@�{0��@��]�Fi@@��[���@��,��I+@����5�@���ѻ�@� �|�@�!��]@�B��Y�@�j�����@���2&�@���J��@�j�9��@�I�%;�@���O�#@�oS�}]@�2hT1@���+V@�v��Vs@�)5�@�����T@����iR�@�S�K��|@��
���@���pD-L@���6���@�a�e$��@�,nqD;n        ?�b��8?�����R�?�Ah��.?���w?��s=�S?�~濌A?��;�,�@ ���Hm@ġ�:t�@h��;@�ZdNu4@M�d��G@���j@)��rYb@ GŠ��@"�Rh�5�@%$V=�=@'Ͳ;.g@*�T��9X@-�4&j�@0Z�j�P�@1����$@3�e���@5~�i�4@7\@Im�@9L�F�i�@;Q#͝M�@=h��'�@?���>wT@@�,�Й�@BM˱��@CA���'�@D|�1mt!@E�m�R1�@Gi�QT�@Hcd}��@I�J��j�@K*���@L��+�;@N���l@O�ۅ��@P�7��(@QY�3AI!@R'��x��@R��V�	�@Sϯ�q��@T��6�?@U�>?-�@Vj����@WP���@X;%���T@Y)P2��@Z[�ˤ@[AM���@\
���~@]{:1�@^	�(Lʁ@_��a��@`��ձ@`��97�d@a�@��@a�����c@b/Qd�|        ?����ږ?�`�����?��֕}?��=@�?))��?�Yp�l��@�n��:@
�����@	e��{�@�@�m�@_����@"�:9���@&����B@+��hg2�@0n����@3L��@6m V9��@9ҠA��@=}˖�+@@��d�@B�Ͼ��@E�TLs@Gw�O�F@I����@L�W��*@O}nc�S�@Q9���3�@R��&�5�@Tf�)�q@V�2��i@Wݯ��vU@Y���W_W@[��Voq�@]�/a���@_�6��@`嵂���@a��-�@c"���|@dOCh:�@e�zu�@�@f�ὰ~@h
�mqj@i[�g�@j�m�<7@lPh�+�@m�3C�p@n�M�@p;lQ��@p��A��m@qƉ�N)@r����?1@scE�S��@t80)�.]@uo���)@u��)t�@v��S�B*@w��DF΁@x�89��@y��n#��@z�kTN�@{y@(�60@|t3�qp�@}s?�1�h        ?�L���؃?�w���?����o?��s5�Bd?��B�V�?��Fo�@Ҫ��c�@	0d��h�@G2@_%W�@���P'F@!ϔ���@%Ф9�@*L;ջ�@/E>��ߑ@2_T��@5\��=��@8�[}���@<�d�Hp@?� G5"�@A��	#�@D_���@Fi��/��@H�z�0G@KfM=d�@N!���@Pw�t�@Q�V��@S�7z�0!@U!���,�@V�b���k@X�h��@Zk
}��U@\QD��t�@^I�-~�@`)2'�g@a6���@bL¸0�@ck�uׯK@d�-���@e�gF1F@f�G$q�p@h=�X�}�@i����C@jڑ��@l5Ώ:Uw@m�� ��@o�J��@p=S�+@p��HP@q��=��@r��E�֛@sQ(r��@t �uZ��@t�BN�O@u�|��@v��`F@w�*��@xlY��:@yT��dE�@zA%�/�@{1�6O�@|&7����        ?�8r?:ح?�+4UJ��?��̍�:�@aB6� �@���{@#�;���9@,,*� w@3��oBu@8�WBD@?�#D^@C|�Y@��@G���Ф@L�~�u@P�y�{@S*���S�@V�%��@Y��h�@\On����@_�����@a�CJn�@c�	?�@e��y�y@g���l�@i��`I�q@l8����@n�`���O@p��n��@q�M�a��@s-���+@t��46@u�yj�@ww�@��@x����F�@z��°�@|+��cB�@}��Gh�@�c��C�@��\���@������@�r`f�_�@�b7�[@�WnDS�@�Q�y�@�Q�]�d�@�V�c��@�`�6�c@�o�V#�>@���L���@���2�;�@��ܳ��{@�ݔ͔-"@�B74z@��PBТ@��$ץ�g@�K����@���X�#@�����K�@�*:���@��1Nmzs@�td�M�N@���{}Z@��o3↩@�t?H�t�        ?�w����?����?� �"n�?��3��?��»�(?�7��_�?��Ot"@�����@��b�@���G�@��骡�@`��<��@b7;C�@���p�Q@!4̮��@#���E�F@&eX�Ds�@)=���a)@,A'o1�F@/n��ڡ&@1cܞsJ@3#��駩@4�⼰��@6��o�@8�5��Ue@:�H�އ@=1����@?V�!�#�@@�4��@B���0@C@����<@D����@E�u���E@G0[�Uy�@H�EW�k@J-���@Kz�k� @L�Հ�,@N�h�j@P~�*��@P�!1�HG@Q���4��@R��P�$G@Sj�ϋ@TM��"#@U4��
�@V!)�Ǥ�@WW.�@X<vPp�@Y�~�G@Z#) V�@[#���@\��]c@];�0�@^.O����@_ENP܍@`0:y��w@`�=�y5�@aR�͉�@a�(��5B@b~����@c7{�VI@c��S�:M        ?��I�ѕ�?�r�yψ?���l|�?��h#ދ6?���-u�?�x�L��	@�c��;K@
���i�@|L��k@����@�:g�|@"�bi��&@&�����@+�]�b�@0Q i7*|@3!��0@63f�`gE@9�?-�|P@=ŀP�G@@x�G[`�@B��Ì�@D�i��o�@Gx��@Ip�)�(@LҹD�@N��7N�M@P�|p�(�@R=zn�^@S��Y6x<@Ub���=@W���@X����@Z�=Lw�@\oǨ���@^[g���7@`+�m��@a1_�c@b?3 �jv@cT��p@dr��Ri�@e�u���@f��#@g���O��@i96�z �@j~��hV@k��@�@m!f撛�@n~��І�@o�霬��@p���)Hv@qc��!�@r!���Ŷ@r�)ˈ!'@s�����}@tu��~@uC�H�,�@v��gî@v�@e&(@wƍ�=>�@x���@y��[@zm+}�+�@{WE��o�        ?�mH�a��?��
<(�?�كBi�^?����S�?�ޣ����?��$�!@*\�Ή�@{e 19@a[��WD@[s�-�@ɮ���C@#9��C[@'�xb` @,mzO�0@0����w@3�)("�@7#����/@:��[_�@>~�skk�@AM�p: v@C��56�O@E�����@HXԗ��@J���.�@M����g@P]ӲmH@Q�퉈��@S��x-E@U:wP�V�@W 0k�[�@X�=��1@Zš��{�@\�\X[��@^�l��>�@`gg�@a�>{��@b·ӗd�@c��3��@e,��	@fo�ڢ�N@g�����@i�����@jr㙦�@k�K����@mO/w1�)@nˈ���@p(�����@p�@����@q���#��@r�{���@scX���@t=R��<@u+ʏld@u���*C@v���3�@w�+�g�@x�@u��h@y��9��@z��"a�@{�qB�Q�@|�l�P�<@}������@~ɧF
�        ?�^ԥUA?�v�1;L@ 2đ�@5���@@�g'2��@%?�)�'�@.q2����@4���7��@;�/y<�@A2����@EM@:?y�@I���!�@N����5@R/�5��@U)'ې�d@X^KJ%O@[�&��@_{I�+��@a�z�>�+@c��,_�@e��5��@h>I���>@j�ڞ��@m/	m�+y@o�D&˳@qJR��U
@r��T�e,@t7M�؁'@uÊ!�T�@w^>���q@ye�1l@z��[��b@|���F�@~YiI�A@�
�@���l��@�p�N��@�Q׾�^@�+MAɃ@�@Z5K�@�\o���@��}�5@����.��@�ڔ�c9D@���(V@�QV��o@��#?�*@�㞫GMA@���`�@�țH0�)@�y7��@�,�;��@��(��T@�����	2@�\�~�
@���R5�@��E��x@���a�a@�uZI<�@�C3����@�����@���q@���\3��        ?������6?�SE^�?�N?ύ��?�PP���N?�\u��?�q��fX?�K�n���@ʰܟ��@%�]���@5�p�>\@���U�@��[\a�@��.�U�@;��}�@!�7H&�@$X�k�q@&�~���@)�V��|@,į�J�@0'�K(�@1�|QE+�@35<�|�@5^35Ƒ�@7RX6��@9[�8��+@;y�����@=��}�Q@?�i�[�	@A({ǭ@Ba!���?@C�#XA�@D�x^w@FI���@G���R��@I�� t@J�HǓ |@L�h|�H@M��gG�@O,�1C��@Pe��>�@Q9�����@R�SA��@R��s3@SӁC�@T�$�ӵ6@U���d�@V��GNx�@W���Z�
@X�G\�e�@Y��ϔJ�@Z�g��.�@[��H�
@\��~�K@]��&��C@^ɫRC@_�RM~�t@`��ho�@a�G��@a��-�3@b=�,��@b�>x��@cp��x@d��T�         ?�-{�G�?��z>��?�:���k?�6-�N��?��M�:
�?�@S�]m@~����@�̾�\@e��_�@�z|��U@!�%5�)h@&''�z�H@+�^�Jf@0JV�A�@3VjZm�@6�,3��@:Vr8�J*@>M)J�Ot@AJ��Q@C�)!0�@F
�Ք�D@H�٠<_�@Kp.�t��@Na�#�@P��Q���@R`j�m@TT��@U�(W@c@W�@�$@Y��R��@[�K�.@]�@-�4@`8?/>"@a4��sC�@beG7�9�@c�>}���@d����u�@f6	?��5@g��r�S@h�E�~�)@jfI�"�E@k��
�@mf���a@n��b��.@pHu��@q}�z֚@q�/��@r�%y��@s�\��A�@t��*�40@u���I�@@vw��כ�@wn��j�@xk)v��@yl�{9Wy@zs���t�@{���1�@|�<���d@}��l�R@~é�y�Q@�n�k�@����Ug�@�G"�y�        ?�xg��?��,��?����sq?����L�?�E�M�>a?�N�p<n�@�pVd<@��ǀ@��@��@��1^W@ؿFJ�@#�C��B@(aտ�Е@-hc!��@1}Z�g:y@4���(ӻ@7��$�:@;���Sv�@?q,PP� @Aҵ��MC@D�7J$@FvX��X@I 	5U»@K����t@N�I���Y@P�ht�
A@RM��&%@S��˶�@U�0�ñ�@Wk%O�q@YD�/�~ @[0J��@].Z����@_>���a�@`��owAE@a��g@��@b�)�\^@dq)���@eO��d@f��C���@g������@i$�5�@?@j}%���m@k�t*̵�@mHq�;��@n�� �L@p$
Y�@p���c@q�!L��d@rmu��_@s;�5!�"@t��5�@t�p`��@u�T~�:�@v�It�nz@w�G�ޯ�@xiH^q�@yTB�%�V@zC1�P�@{6�^7y@|,Δw @}'p�@~%�bL�        ?��İhG[?�{�}uk@ �3��>@���%�@ I3]@&m��QD@0$$���@5��s+�@<�� u�g@B0X��K@F�O�ͨq@K\�+9��@PW���_@S>�
S@Vc��y�@Y�~r&�@]i��>�@`�H�9l@b��+��(@d�R;��@g0�{,I@i�gS���@l(ʻb�@n��I���@p��=�7@rA����@s��<���@uWS
U�l@v��:߾@x�)C]&@zj�L"��@|:J].@~Ox(��@��	v��@��64d�@��"׳@��Z92�@�,b���$@�IiC�Z�@�m�9�"�@������@��>E}o@��$�#@�J N�$*@��NƓ.�@���D~�@�;��ƢT@�M4�L�e@� .W'م@����;�@�p��oI�@�.0dl��@��*�(�f@�����@�{��Z�@�F�׍@��
$H@���.|s�@������@���F&@�s�Gd�o@�S�a�)�@�7G�\ń        ?�	͞Iݿ?��"��>:?����}�?���tp?�!��*�?��'h�k�?�@�6�y@ q�Q��@oߴ��@K���@�&���'@;y���@�O�@C�y�6@ dS�v��@"ҏ9�6\@%le%8�0@(1��g�/@+#O~��=@.@w����@0ıՑ]@2~��^@4O���[@64ը��<@80=Q��a@:A7i;�@<g�#+s@>����=�@@z����j@A��yb@B�4L�(H@D5
Ny�]@E��2Sp@F�Z��,@HOP���@I�aW@K@H���@LȐͣ�@N[a��*�@O��=ߐ@P�F���@Q�hH5�M@R���g��@Sk5�h@TS���@UA�Ye7�@V4='8��@W+�>s�@X(�a�?�@Y*I~x��@Z0�n��(@[<���@\La��K@]`ˠ�!-@^z:-�@_�LEx|�@`]{Gi�&@`�tU3�@a��V��@b�s�@b�NG��g@cU�ƒ�@c�iBs�1        ?�.�?���1] ?Р�VcC�?��:)�?��3UR�?�Ҋo�&@h���}@� H�`�@�sZe]�@�W���@�3�l�@#�@�r�@(hHz��%@-�c����@1���n�@4���*e@8(�dƢ�@;�F:J�@?��GM�A@B$Rz�@Dy9��}�@F�r�ʶ@I�6@
)@Lj���H�@Oa���ݬ@QAzA��@R�ۖ7�@T��L��@Vly�YqW@XN��x9�@ZE9����@\PM/xL@^o��@`Q�\w��@au�\Rw5@b�%%�@c�o�]�`@e����@fkj��@g�F��a�@i!]N�\@j�B��n@k����F@m|B?vk�@o>�x��@pI��3ۘ@q�}5�@q躶E؏@r�6+��@s�^���@tz+��@u^�Ӝ��@vG��*�@w5& t��@x'<�Y@yӐ@z�`�o�@{au�n�@|H�$�	@}$�y�b�@~10z�[�@B!�x�@�+�;�k        ?��b���W?�R���z�?�oO�ڻ?�ʙ�=�?�?y,��?�4_��@�~u9�@��u�	@��w�?�@�kjh)@��;��@#Ï9��@(<��Z�@-@�Df1@1h�"�|@4y��I�M@7�����@;x�&B�@?g~g��@A�A\Q��@D�9�۩@F~�Opg+@I����@K�Og,4@N�Ts@�@P���rѓ@Rg�
��B@T���@U�n�Er?@W��മ@Y{��:�@[p1oU�@]wϓڽ?@_�R+�B@`���Z)@a����E@c)߀�@d[�_S�@e�_2+�@f�3j��@h*��dT@i��@�H@j�}oB@lI]
��@m���6��@o4�z�!�@p[�n���@q!����2@q�{��@r��@U)8@s�' 'B@tb�X��@u={<��@vV3YN�@v�G�z��@w�H7J~�@x�P)�X@y�W�7&@z�W��ϼ@{�G��;g@|� :Fs@}�ٙO�@~�l'�x        ?��	'�?�M�?�tG�1B@��f�@�׊{�@">��J�@*8|�#�@1�I�U
@7sČc�@=�@�ݏ�@B|�@F}y���@J�#�X@@O�%�i�@Rt�
<|�@UEil��@XJ�	�X@[�Z�y�@^��J�Q�@aL�R~��@c9A�>p/@e@!���@ga&�p@i�-���@k�<�Y@n_�䔡�@ptĈ�4@q����Ŝ@s"�	��>@t���
�@vԪ�;@w��\�n@y����~@z�Q@_4D@|]H�h�
@~�_C��@��(x�@���a�PW@����O�@���9�o`@���|��U@���f��@����+`@��bU5�@��ٰH�@���@���_�LS@�w?K��@�C�(H��@�p=0)@��a��-�@������4@��vfʿ�@�,��<&�@��j�ͦ}@�v��j�)@���wp�@��|��J@�y��@�*`�[�9@�ݜg��@��W�Z̲@�K���'�        ?�@9��<?���1h��?�Jd?�)��?��4�?��٦+v?�)���Ŀ@
����@/`�v�y@D���@B8�S�@��@�ig@ŉ䓭"@�eD��@ �0x�k-@#G�R�~9@%��m~�@(���m�@+�d��C�@.�"F��@1nbm�@2�I+j��@4��\�:�@6�p��t@8���$��@:�L!�x@<�3��l�@>�M@݄�@@���f��@A�V�x�|@C^���@Da����@E�����@G����@Hx�➛�@I�u^y�:@KfBٞ7�@L�I b�@N|�0w3`@Py�@P�ȝա@Q�+�@�/@R����B@Ssc��@TY�	V�!@UEuJo
@V5{l��{@W*�{��@X%���i@Y$6��G@Z(7�a@[1��L�@\>��G�@]QVűW@^h�
�@_����U+@`R�ä��@`�rEw�@az�t�/@bKʁ5�@b�)��@cHF�<'@c��{g��        ?��}'��?�ס4�N?���p��?��9#O&?��D ��?�Qݫ��F@h"�'��@��gT@�;��=*@��RN��@ S�PN��@$[��n��@(馛�-�@-��	��@1Ъ��F@4��i�e_@8F��z��@;�� �(@?��81dM@B
ť�i@DK�3'�@F��Ƀb@I<@'ir�@K��?k@N�� է�@P�,Ffvt@Rl�O�^/@TU�n��@U�k�7@W�.�z@Yb�HA@[M6>d^@]Jw��V�@_YƜ1U-@`���l�@a���c@b��Q�@d$�K��@eX���@f�ҍ�pN@g�P�A�@i)ih&�	@j���c@k�/Kx�@mF��ƥT@n��@wU�@p�t�m�@p�҄�9�@q�@�'?@rdɞ	��@s1fՑ!P@t�
I@t���-L�@u����K@v�;f0֕@wl��V�@xQ�����@y: 3ğ�@z&�&}�@{�S��@|'���@}h}�\@}��'�D�        ?�����y?�Y���?��oɘ?� ��y�Y?�ėS5�?���l�g@mmEz�z@��-YB@W���%@�_|��@!�#��@&�V��@*�'�I+�@03���n@37�f;�@6�����k@:$�]췱@>3�@A$Xn)Y�@Ch�_��@EՎ*\D2@Hj��
T�@K(p�Sk�@N#W�W@P�w��SZ@R+����@S�7�Cd�@U�0���&@W}�#2�@Ym��&�@[q�Y�]�@]�L~�q�@_�z�&rt@`�C0[�O@b*5��@c`�S+�@d�T�@e�u��/;@gA�@��L@h�����@j�#m�@k�(�%��@l���%TA@n�v�(�@p.�&�W@p۱�np@q�@RSR@r��Z��@sel�m�5@tH �e�@u/�au'@v�Ǫ@wl�Z�@x�}S�@x��w%�N@y�鯰W�@{�j���@|q�??@}�M�@~/�@�@G�ڹ@�1�DX�3@�/zg        ?�����{?�
n"�c�@Io�"f�@^{��H�@�����/@&��H��b@0~9���@6�����@=���~K=@BĎ�i�X@GI�>�"@LP��o@P�ֱ���@S�I�*^@W;�W�s�@Z��hY�@^�X��@aPl\���@cx���8�@e�ב�v@h+�}X��@j��Y�[�@mb�osvV@p�c�@q�qC�)@s��&�K@t��1�@vT����D@x3"/
@y��?�H|@{���K�@}��}@�����@�Ͷ��.f@����E�@�����@�'XRF@�2w�t�@�_�_��@��F����@�ҿ�dݒ@�?�N�@�e�K��/@��B��0@������@�~+�F �@�u�S�)�@�0h�{�3@�����@��x_� �@�wٙ1��@�Bu��0@�8�m9�@��+�J��@����FM@��sD&*@�n�C���@�O��#<@�4B�M�@���M#@���L @���6��@��`nL        ?��Z3�9?����)��?��F )?�<�J��?�`nY�?�n�q�r?���=���?��ߛ��@Ή蘌�@
R�O���@?Zo�C�@�:G���@f���@w��+5@�<Qb�@"I��jJ@@$�4��@'~�"b>$@*WW�}�@-Y��O�z@0B���ߋ@1�S`�3@3��Xɾ@5�G�Co@7hl���@9d����@;unzP\:@=�
�N@?�j/�."@A@�s�@B?���@Cx�X�s�@D���S��@F~Q0�k@G^Ͻ�D@H����B@J'�,W��@K��F_�@MȢ�@N�,gz�@Pc�
��@P�B��n�@Q��`4�@R�����@S_��,@T=�$@E@U»��@V=��m2@V���m@W�)��33@Xӏ��@Y�8:O*@Z�07@[�:���Z@\ˇ�u,�@]���\�M@^������@_�P���n@`�k�2@a{9h�d@a��&_��@b.Zф�s@b��-�6�        ?�q�F*?���V��?���~MP?��y0@i�?�垜S?���++�C@�Ȗ�@æ��#?@�*Yl�@�1]�@#<�i%@'ׇ�<σ@->1���@1��{�d@5�@8�=�
^@<�F��M�@@�|��#�@C��t�@E�j�Z�@HbpZ���@KZ��"��@N��б"�@P�z�x��@R��dn�q@T�/ћ@V��$K�@X�[t�c@Z��dmnq@]�2�@_�AYѣ�@`����
@bK&�P�f@c��aQ�@e	�ҏ2�@f|��·@g��ia�@i���!�@k$�|oM@l�]$ʮ�@n���y@p ����/@q��ó6@q��/&{@r��Rv�@s�]OUN�@t�t�Ȑ�@u��&���@v��o��P@x#lMju@y)�����@zJ���"@{q�Id�@|�G
N[�@}���#)?@�r=?B@�&Z���u@��c���v@�ou�xsd@�����*@�Ġ���@�s�r�{�@�%�l�-        ?�ܭg@��?�Qv~ڲ�?�L�Xiյ?�u���nk?�_Jy?��?����h��@(��є@\h�T�K@E�_��@��N��@!�5���@&A��r�@+Gr�Le�@0s��p@3�sd?]�@7�q͞@:��!�@>ۉ΍� @A��A�@D���@F�_��۩@IA����@L"yDN��@O.�iƦ@Q3/mo��@R�ت�w@T�M-ֶ6@V���u��@X|y�"��@Z��m`@\�Nr���@^�
v,��@`��vp@a�a\TQ�@b�KD`y@d=ζ��@e��?��@f�w�-�@hJ��b�{@i���ę�@k1��1�3@l��7NT�@nBI�:�@o���g�@p��M�$�@q���je�@rn����@sNX��Q@t3�˸@uˢP�@vW���@v��	.��@w��Bj�@x�����@y��6�S@z�H5�D@|A��3
@}R.2�@~+���|@D�)�f~@�1�~B@���4��@�Um
_��        ?Ŵ����B?�X���q@�;I�1�@����ݓ@���{�@'���M@1]��4j@7i�o6�@>�N�ܬV@C�9�4�@HlR���@M�Kǔ\P@Q���g�@U����@X������@\h)ʐu@`?�X
4@bp��O@d�޸��@g?���^�@iު��s@l� �-��@o�B(���@qK�J.�@r�-(��@t����a@vL3�N�@xnS/�@y��8Ϝ�@{��Oщ�@}��q��@��WД@�7�F��@�7^O�<�@�]X���p@��!���\@�ó!?A�@��}I�@�M��m@�����9@��%1E�@�\@d�u@�ǐ��@�;�1/	@�[�%��w@�Z>; �@������@����K@�~S��@�Q"�
L>@�'�oّY@����'@��}�lJ@���`5@���J7��@��苵�s@���Ba�P@�t����@�j`њn5@�c�\�U6@�`v
$�@�`��g;�@�2~cȰ        ?�I�<�?����@�?ǿYJ�E�?��TKyǒ?�^���^?�Q��̆?�e�v[�?�gWH��@�ns2X@	^�;U{@�i�(@�f��.@\�$��G@D�Ka�g@}�GF��@!��tW�@#�Eж��@&��8N5K@)D`����@,)رCd@/7>CR�@16�FX�@2�`�q�@4��a;@6|cl�t*@8f�:�1@:clwwh@<t���ҋ@>�Ou�8�@@h����@A��P=�k@B�q#��@C�ήP��@E:�a
��@F�},�@Gݵ�w��@I=q�Jk@J��h���@L2�,2Z@M�Z�@OC~�Ņ@PTO�n�D@Q ���@Q�Q@���@R�~���@S�BC
�F@T{�m���@U]����@VD;�w@W.����@X��\�"@YYD��@Z	ԫ�@[顚�@\L����@]	���@^��A8@_�W���@`gC���@`���\�@a/� bgO@a���@bOU���y        ?�t�g	�?��ɪ־?Αv&Ƒ?�8"��Z?�;�ҸQ�?��5���@ɷ2��+@	H~�	�(@7��3}{@���7|�@
b[�!@"0�\�(@&Y���X�@+0���@0��ѧo@2�����@6����f@9�4.�@==I�M5�@@��w��a@B�����)@Ey��X�@Gt��y=�@Jbm�4@L�����@O�ɛ�x�@QP�U�N�@R���⌚@T��	i�@VH��}�@X{W��x@Y�i���e@[�\�	<p@]�SE�S�@`%ѝH�@a�a�@b<�s�:@cf�}��@d��P�g�@e�`f��5@g8�(ĝ@hj�ʒ�J@i�?f�T@k%jn/|�@l�?�I@nݕ�@o����3g@p�3	�@qN�T�TU@r<�'hX@r�T(3��@s�"^Y@t��֜_@u��A	�@veɷ��v@wOf�?�@x=���g@y0��N:
@z(D�t@{$�̿c�@|%i"��@}*��J�@~4��0�        ?���	�*�?���i�?��a%&l?��b|?�����H?����N�j@��tǷ@	,-�$�@(Fnn��@��CS@����iM@"*e�˚@&V�VT@+��>�X@0 }���@3��ms@6,�S�@9��	ɢw@=Z�C�A�@@���`H�@B��0|�@E)aq���@G����A@J<����k@M �c�o�@O�_W�@Q�)s@S��jV@T�b@V�!�EH@Xn���@Z\d�u�r@\^$w�#�@^s�U	z�@`N׶��K@am�%:X�@b��Q�=@c�F��W@e�B=�@fLh410@g���l�)@h��q�c�@jZ���g+@k��y	�@m?�\M@n���w@p$�zP%)@p��\�@q�_'AFQ@r��B�ޙ@sh��=�@tE]Y�6@u&1k���@v����,@v�1YZ�@w��[YŅ@x�Ga'@y�ޯ�@z�7K��@{��9=��@|��b0$�@}���@~�6��I        ?��GL��r?�,��ɗi?�X�����@�Gɿ�/@�`s��@ MR0��@'uor�'@0�`>�V@5��N�@:��.@@��Y��@D/ϔ(�@H$��^P@Lw>~���@P��_�2(@S����K@U�{i߳@X��Z���@[����!@_h�?=@a:֊�v�@c����@d�|���@f���T�@h��j��I@k"�`f�h@ma��E�@o���)C�@q�p��@rQ���Kq@s��K�_@t�|�rc�@vT���='@w�����@y7�as@z���<@|E.2��@}���\r@|���g,@��B�u�]@�o3�@��@�OE+O@�4k��%�@��� l@����@���%��@��&lS�@��%��K�@��ny�@��dw:�@����E@�"��}@�8]����@�So=q��@�s>C>=�@�K���d�@��w�?�@�w_��\@��g�r�@��	���l@�I ��r@�鷣J4p@����OD        ?���v��\?��$=:�?�]��G?�oȇ**�?塲b��?����,��?���3�G?��0h��@����o@	��il�_@ӥC��@(;X� @���� �@�Z���@�;����@!��s��@#����@&Qs'S7@(�z��@+�цw)�@.�b���@0Ӆ��s@2kQ ��@4�E��@5�f����@7�{�-�|@9| ecW@;l:
^.l@=m��%H�@?�jY�t@@�*`+�@A��>�'@C�ޤ�@D;8g�_�@Eo+���k@F��s�@G�>���@I=LՑ�@J���@K�?Q�3�@MV '1@N��@P��@P�:�K @Q�j^G�
@Rf�z�0;@S1����@T!%
?F@T�UG��@U�x�w�@V���m��@Wek��+�@XH/��@Y.�0�V@Z+���~@[W��fa@[�D���o@\���h�@]�Ou�K3@^�e�|g@_�,�J�@`uN��M@`�Yn�S        ?��N��?�k+�M�?�K�+ �?�"�eq�?����R�?����_�Y@Z�6�@	�L�i@���2��@�`���@R
��@�@"HZ����@&`����@*��T�G�@0��g@2͙Z���@5�XPEF@9%S2�K�@<��`L�h@@C�@���@BNg�+�
@D{!�ZS�@F��XMń@I:�!��N@K�\Òι@N�L�?�S@P��"|!O@R)C,�x�@S���{@UU� ��@Ww��X@XŚu@Z����� @\y3~t�@^l-}'��@`7��F��@aB���.@bT�HE.�@coP� �H@d�Ki���@e�zi|I@f�ԍ�2@h,O��I�@io�I�'@j�z2�K@l�5�@mj�F��G@n��c*��@p�����@p���Y@q�^�6}@rT�Ni��@sl���@s�<Etz@t�~:�+�@u~��]��@vRP��n)@w)���7y@x�a���@x�'
W�@y�4>l��@z�·�Z|@{��C��r        ?�d�˄��?�U���O?�H��դ?���C��?�/�)�?�E(��@�g�PX�@���g�@ù�(�k@��2[@s|~{�"@#���F)6@(#��o@-yW�{�@1D�ȟ@4Lp�Pc@7������@;48>bL�@?$E�@A�"�ݿ�@C܌�"0�@F=�wF6@H�1��@Kp��@NC8��"@P��P�M�@R-3<�@SϖF��n@U�G�1e@WM�yϬ
@Y)1N[@[�?b{c@]�Ihߤ@_.[$�]@`��O��@a�tv�	@b�R?�[*@d��H�@eYl·"�@f��r��u@g�9=�l@i?3�J!@j��ߟnQ@l20w�@my(��@n�e�;@p<p�Q]@qJ!f�[@qκ���@r���o~�@ssQ���@tLn1�͟@u*�F�@v.6�-�@v����m�@w�Ϛg��@x�DPR!z@y���yM@z�QayQ@{��@=��@|��Xz�7@}��t��L@~�>�h        ?�1O%鼽?���x�?��~)�@��8R7@ ��+��@"v�����@*qb�Kp@1�+�%�@7}��e��@=���@BhƗ��X@FP.���\@J�Ӛ��@OB^�<+v@R&7劺V@T�NJ/.�@W�8ыm�@ZԹ�T��@^�G�g@`ž&���@b��mf��@d~�x��@f}�,�,�@h�x��P@j�ܰ�
7@m=�+2�@o^���#@p���;@r*���@sx&����@t�+��Θ@v5�ol�@w�����@yo4]�@@z���@�@|0���I�@}ʃ��ڿ@n��,(?@���+�x�@�k����@�M{"��[@�4�:���@� �+V�@�L�;��@��Ϭy�@�}�A�x@�4��\e@�
� >:@����y�@�%h��6�@�:?�sL@�S~�1^�@�q��v@���1"�n@�^Pp���@����ʀ@��>��/@�'�j���@����S@�d{.��@�75��@������z@�P�t�q        ?�,Z�4ܐ?���b�$�?�:��{��?�I�4��?�WR��?�~�[�Q?��;���T?����m�r@�0����@
v��[N@u�?a�@i�յeY@�w-��@�0㤮@Q���@!��Sdd�@$k���H@'
Gh"^x@)ѹ@�LZ@,�{���@/�zd&�@1�~,���@3C�ϚN�@5VY@��@6�#�c��@8�T���@:�/$��T@<�J����@?+aii��@@��"��@A�֮u|@C�$��	@DUc���+@E���Nh@F��IH@HL���@I����A�@K"���[)@L�@WtJ@N��\�i@O�"���9@P�e}�@Qo�_]��@RC�珧�@S�j]^@S��@� @TۤoA�	@U����v@V��9!`@W���nE�@X�8�\8@Y�cnI@Z�@OҺ�@[���_fj@\�`��z@]�B.2g�@^�P�=�m@_���
�@`bm6�{D@`�$�A�@a}�kP�@b�Nk��@b�x�)�t        ?�E�. ?���-;�#?�����u?��
m)��?���Q,�?��qժK@J���|@G����@P9?��@C��w�@�4�^*@#Yde '@'�	4��@,�2���@1�60,h@4鎴o�@7N�T�+@:ߕ9Ep@>���md@Ap��1
 @C�i�l�t@F
C?"}�@H�Ȑ<��@K>8��@N�?.g_@P�O3��u@R�N&�@S�V
yW�@Uw�
f% @WD��@Y%Z���@[��`�@]"~���@_>�8e'@`�pκ7@a�^�g0�@c,��C"@d:�gv@ezV�}�@fè�>�J@h��x�@is��l��@j�C�q�@lJ���T�@mĐ��7D@oH/����@pj�s@��@q6u2�J@rBu"%�@r�*�1�@s��S��@t�%-z�@uv,�d*�@v]�=Du�@wJ4� �@x;*]���@y0����@z*ީW1@{)�$��*@|,ҎT��@}4��ij@~@�£"3@Q�շ�b        ?�5����??��,�`D�?�-.)��?�"�*�*�?���#�?��<�d��@�)���s@
�n�܏@	ƾX@�� �@X�q�F�@"� ++�@'Jʮ�Z�@,"m���F@0�Yt3Y@3�l���F@6��;"�@:�![Vi@>Y����@A=V<��s@Ct��B�@E�p�Л�@HU��}@K����@M�y�@Ph.��`�@Q����u@S������@UYsh�8�@W'�P�v@Y	���'U@[ �|���@]ƾ��@_+9��@`���<�@aӭ��wY@c	��#@d:�UtX�@e}tV(o@fʇ [��@h!ۓ	�@i�t^�7�@j�Sݡ}7@le|I���@m�w�@op�6�J�@p��I��@qR�GP�@r'a�˥�@s_x~�@s���P�$@t���S��@u�B�=k3@v�܊ ��@w������@x����I6@y��v�� @z���a��@{��f{@|���8��@}�M5��@~�#[^@�$)�        ?�E��C�h?���4��?���@#ﮞ�@���?@"���,}j@*�'�2�@2JGk��@8 ��m@>�q*��h@B�|ц�@G��Y9[@K��s9�@PD�4�%@R�v��@U���@X��z���@\N�7/��@_ڭ��@@a��G�@c�ʱԙ�@e�Ey I@h/63�G@jgs�%�-@l�����@oW�ba@p�-g&��@rY���f@s�'��@u=�҈��@v�]��U�@xVAq�J@y�7�Ė�@{�*߾@}\����A@#�.�K�@�{r76��@�k_2�[@�a�F�ң@�]�ߞ@�`Hٻ�@�h�yף@�wG��Q@���I��K@��)z:�@��G׮�T@��Hv�f�@�	/
�=@�I}Y\��@����5)�@��N���H@��0V��@�#�� `@��O˚u@�s��Q9@��K��f@��rw'WK@��I��~@�3� o@��^�c@��V��	@�`��
@��n&G�        ?��T��L]?�B��~��?�L�>��?�,0�s�d?��
�*??��iO�Ci?� �X<��@G��l�@��;@��ɀ@�A��u�@fX:�*@���a@:�˂.�@"a���@$� 1�4.@'���E,�@*���K)�@-ӽ��).@0��J�D\@2a��g@4?��5�@63��G�@8>y�+@:_YK�K�@<�|�q��@>����{�@@����Jt@A����o@C(��j�y@D{�.ӣ@Eِ�#��@GB�yk.�@H����Z@J5�LRv�@K���:��@MTY�?�(@N�	!L3�@POI�]�@Q)�.M��@R
#�@R�-2-@Sډ$v��@T�ݝ�x�@U�����:@V���Mü@W�V|��@X�Z�֠@Y��}h��@Z޶RQk@[�	N@j:@]���@^1�0�<@_XR9���@`B	��v@`ڍ��gJ@au���%@bn�ou@b�Ä���@cV��Y�Z@c���&�@d���XG@eN����        ?�s0Xd��?���ߊ08?����?��"��g?�hl��^?�є!&@bF6�@��U�@^��9+}@�S;�3@!�x���d@&-��p0�@+bW)��@0N��,4-@3Z����@6�տ�@:V~]G��@>H���b�@AD�=u�@C�����6@E�*gAM�@H��ؒf�@KSB:�o@N:�����@P�w��/X@RA�y��@S��?�oL@U�FR���@W��& �7@Y{����@[|O�!.�@]�&(�� @_���̜�@`�c���@b#�Z��@cU�i��k@d�(��@e��?Y��@g'�[%�B@h�V�u.@i�.��@kP�/���@l�O�!,;@nGD��f@o�ɲl�C@p����g@q�3���f@rS:Y�U2@s*��F�s@tw�\�t@t�/���@u΋�a@v�4�: @w�[}lg@x�C�V�@y��mo�f@z���mK@{��c�Q@|�Lfi��@}�]ÌHM@~�
H_�@�O�e�@�q&��        ?��D��{?���5�?�ɥ]��?����5��?���X�?����j׏@Kw�Lo@���d�@_C��2�@��(#�U@!��G�#@%3��YI�@)��#f@/:|Wͭ�@2��r��@5�r�'�@9Bm)��@=R���?@@��5��@Bā�mٜ@EI�@G�RF6cg@J>�/�_ @M	l�Y�@O���G4c@Q����@S(�V@T�!ܯ:@V�f��W�@XwǺ/��@Zc:�U@\a�@�+�@^s�/p�@`K�}p�@ag@�A@b�*��t@c�fn��@d�詁?�@f2� ��`@g|�* �^@hϣ���@j+��͚m@k��t��@l�'�B�@nvB%��8@o�<U�@p���W�@q�K�ľ@rUl�~)�@s&���{l@s���T�c@t֙��\c@u�φ(ER@v�4h��e@w}��M�@xhi�r�(@yW(�y��@zI����@{@ǟJ!@|;�}[�@}:Y�wW�@~=	 �:@C�"Dp        ?�*�ǵs?�Bz���#@ �%�,mk@�d�<3@x�T�-�@%�=Nb�@/�ͥ�4@5�yR�	q@<6m�%@A�`���@FJ?HJ�@K ^��@P;Vd~#�@S&��"�@VS7�S�1@Y�er�/@]n�޶�)@`��R��h@b�� ��V@d�5 7�>@gW�ԗ�D@i�Ц�Bh@li�mC��@o#^���@p�";�1@rz����f@t`kմ@u��L�L@wP��h��@y���O@z�F}/L�@|�g��Y�@~�K���7@�Nrf�@@�T>8�@�a���>V@�v�JTR�@����`(�@��w�L��@��󕃮�@�)K؅�@�UG��@���gڏ@��k`(@�7L19)@���k�K�@��&Ӌ@��O��@�g�Z��@�$�`P��@�����@��i�5@�qw��@�=B�#s7@��r�;@���tX�@����֋ @��51�Of@�o>�>H3@�P�d��@�5�ȋ�@��Y1�@�
���}        ?�v.A��?��|H ��?�L���?�2�%�0�?����i?��ď?�5/?�Y�@��z�@>LV�'@��"@X қM@�9'0�@��#��@N�
���@ �t��@@#�dQ�r�@&6� �(@)x�]n@,�h��@/W$3�@1]��P��@3%���q�@5�#�]T@6���c&�@9C��J#@; ��K�^@=U6�#A0@?�G�ă�@@�P�6 @B9��1�@C~|+�@D���w�G@F'�%?2�@G�k_%�S@H�cPv8�@Jt�^B�@K�� l��@M�Ȏ�X�@OG��@Pa*�a@Q7~�>L�@Rmz�H@R�W�%@S�J���@T��$�@U����@V�3���@W��X`=�@X�>��2@Y���{��@Z���'�W@[��M�R@\ʲ����@]�FD*�@^���n}t@`Id���@`���Cl�@a5I���:@a�Bc���@be�J��@c�[@c��tO+G@d>�����        ?���� _?�*wu��?�r��Y(�?�s��D�?�J��s��?�o���5@���'�@����@�++�@��.)@!��k��x@&D��1@+�9=@0O��3�O@3g��E�@6��;�h@:�+a�@>��*�-@Az.�'�E@C��3d�@FX����q@I�8@p�@K���g@N�j��f@Q)��M9@R���k�=@T��,r�@V[#�=�`@XK�@
�@ZRf�1�6@\o��|�@^����vI@`u*\PB@a�o8���@bޡ��Nb@d#���o�@es���@f�b��_`@h3��W?@i�~+�@k�`���@l�T��c@n4Q{�<d@o���ѩ�@p��Gd��@q����I@rnt�@��@sP�b�@t7�þ@u$ ��]u@vh���@w���#@xgpF/
@y�6�#@zr�OP@{�p�@|'K��@};� �n@~T�+�16@r��}\@�J�����@��Ye��@�te��T�        ?��&�Ϲ�?�ȷ�"o?Ѡ��g?��2F���?��B���?�}=K��@�]�>/l@Z�!4@�m�ω@O�p�.@ �gŽ>@%}��sH@)�;�`@/Y��@2��{)>�@6�y@@9� �<�@=��p{v�@@����@CDYKB��@E��Hr��@Hd(VZ@K5�̱@N1��:V@P��!(p@RW!���@TbR��@U��~�@W�Lۂx@Y�9��e@[���R�@^%Et>|�@`5d���@acJ�J	@b�U/�*-@c��/>�@e/�$-�O@f�?:��:@g�Ŕ�;�@i`^�.��@j�.��@lb�	4m@m�E��nh@o��|oZ�@p����@qu0Ȃ`T@rS�f~ @s7vGk��@t �8,�@u��.V@v�z���@v�N��FL@w�;��P�@x�C��@z\�{��@{}��Q@|#��@�g@}:�ɳ��@~V��W?�@w�����@�N�h��@��尟<(@�{�:�q        ?Ü$\\��?�^�����?��3V@;@��:���@og�dX@$`0���@-D6�|�[@3�O"�@:/���@@����!�@D�l�6
@I)Ō��@Nc��u@Q��Hr�@T��/��@W�	�"y@[DO���@^�a��@acg�t�@cq�a�@e��h��@g杕���@jNs'�#@l�F�?@ox�t�?@qύu`@r����@t���@u�b?0�@w4��5)�@x�ktr�x@z�
�蘽@|a[�$��@~8X4z!@���i�%@�	���@�
��N�@�Td��@�#d��IN@�:�����@�YY�UT�@�.�zf*@��4��h�@��a1toh@�����@�^�w[@��f��-@����Y",@�'���-�@�֩h)��@��3cf�&@�?#��Y@��t?nC\@��1}@�u��^R@�8^<U�@���t��@�ȵ�P��@����Ŭ.@�e�x�H@�9X�K�E@��#�o*@��tX��        ?�ozx�6?�0�\���?��Զ�?�1��<I?��Gn��W?�+?/d?��I?@P�@x��i�@�:҄�@�27�|�@����ع@HFtLg@Gf�j�@�V�M@!%��@#�]����@&VX�@)/�"�~@,2�%@/a�Ĺ5�@1]�آ=@3���b+@4�е�-@6�2��.@8�<@�W@:���X�@=&�%ȯ@?e�2�ð@@���@Bk�4z|@CO�2�5M@D��m�@E�>ۛ�@GG�<Pڦ@H��Q�@J^���@K���b^4@M�4y�@N��wJ@P"��	x�@P�l6]�@Qə��]�@R�sqL�@S�*��@Th���=�@UR��R@V@S���@W3T�q@X+攴�@Y'��&��@Z)+ߛ�@[/C~��@\:6�v�@]I�Wq|@^^i�X�@_w���@`Jʱ
h@`�O锸@aoȹ��@b�4ibV@b��?L@c8���_�@cՌ8\t        ?�b���e?�}$<U��?�W�FB�'?�=��,F�?�,U|��?����+\5@���5<�@9
)�@����@�]#��@ �>�Y�]@$��hSE@)U�>�78@.�ΊI2.@22J��0p@5g�hپ@8�k��@<�R�v|@@ly�9��@B�W�:�@E�lB�@G�~���@J?@��h�@Mz�q@P��x֐@Q��:n��@SP�+���@U���2@V�
Ԫy@X�&8p+i@Z�߶�
@\�3
��@_�* @`�J��z�@a�M��@b����H@d7 ��
@e}���@f���\Ƶ@h*L�x_�@i���h�t@j��T�O@ly�~}��@m�7<�@o��O�>�@p��dxqX@qd<u&?�@r:�[��@s���1 @s�����@tݠ`�|�@u��X��@v�!�J�@w��'�+�@x�5C�Q�@y��cv@z���J_a@{��'��@|�8u��@}�Wu"1@~����$@�	��1C(@��p�z�U        ?��q?��8!)e?�iz����?�K�
+?�%��b<n?�f:�M�@Oi��_@	� �l	@�YI_"�@?��~@�㏗�@"�E�i�y@&�@Srp@+�#���|@0o".�T@3WȚ�Q�@6��^up�@9�V�B @=�Y�D-p@@�X�m/W@C����d@EZ��Ɵ@G�DK{�@JhAڱ%q@M(A}V�g@P3�
�h@Q�g��Z?@S&Ƨ�@T�W��@V����@Xf~j�@ZL@~B;�@\E���64@^R�!w@`8�(}a�@aR�q��@bt役r�@c�!�m+0@d�ƒhB@f�d��L@g^z��t@h��p!�@j
�N��z@kn��{��@l۩��j;@nQ���g@o��u�l@p��D��@qu�K�|@rB�n�h@sW�<��@s��s�@t�tRn@u�T���
@v��*H��@wj��A:u@xU����@yD����@z8]���x@{/��q�@|+��3@}+J��g�@~/�-�         ?�՘��-`?��I��e�?�C�M@@DE	�q@Ɍw���@#Ӈ�Ye@,f�"A[3@3Rfݾ�@9HL�.ĸ@@�����@C�G$>R8@H$�%�J@L�&5$ʌ@P�/���}@Sª|���@V���̲@Y���I�@]d�x�op@`���#U@br9���w@d{'�4/�@f�T��jV@hޡ�!g@k8�/:�9@m����@p�x3[�@qt���@r�o��	@tE�e\~�@u�4L�Mb@wKv@x�,�@z�Ht���@|3���>=@}�c�m@� gl��@��eVD�?@���w�I@�����@��hJ�r�@��>��@���9�@�� ���$@���F�]&@�����q�@�q��G�@�<�Ii@�h�F �@���=+@@��Rh�\@���R'�@����AE@�O|`qׁ@��4>��@��ɂ��1@�O9Yja�@���O�O@����ݣn@�h�8|=@�!5���@�ܯ�|�4@���i��W@�[�d"�        ?�>�qq>�?��h	�?ʑ+N�>R?ڜk8&�?暼��?�F?�ҭ�?����Q2@ ��reL@u�y��@
��+R��@�P��6@�,@�p@��D`�@�ʘ�{�@Ձ-���@"2O�}�%@$�jJ��}@'1�̅��@)錒U�g@,��EhD@/�Nۋ��@1vfu��x@3�5@4ѝ�2�S@6���F4@8s4S��@:]�x�+@<Y�FB��@>fs��>�@@A�t��M@AY�B@Bxi�;�@C����b�@D��j��@F�`HI@GG�G���@H��f��@Iߘ�[�@K7x��@L�-LQ�q@M��w�P4@Om��+d�@Pr9xm�_@Q1R��M	@Q�!. �@R����@�@S���//�@TRf����@U#�0"@U�`��׾@VЕ�>	
@W�9�ȆT@X�D�9�@Ym��\�@ZS{+��@[<��X�@\)<I*@]�xK�@^܌�,	@_%�:@_��|���@`|*�_@`�Ch��        ?��τ�O?��$�,�?Ν7-,?�8��Z�?�2_��Y?��'`�@�lЮ�U@	0�i�_E@&ngS�~@�	I�C)@�2��A�@"!b~���@&KE�a�@*�(Q��@0��ț�@2�,GW@6%06�(�@9�z�w��@=VW��@@����m�@B�-��c�@E-J�N@K@G��]���@JHX�9�@M�σ�w@P�(>��@Q�7��@S1;��F@T����@V�tTw�@X���6�@Z�2�o.@\��܁,�@^���7�@`sɜ��@a���'k@b�6<�x@d&��@eF�ӵ �@f���j�@g�,�S�@iT��C@jí��I*@l=m^>i@m�Ÿ.pG@oP��5�@pu}2��@qG_Ͼ)@renM�@r���L��@sܳ~)�@tòx��@u����;@v�R�D�q@w���I@x��M��w@y����`�@z��m�-r@{���=v@|�g�;��@}��jM�@~�9t��@��wi�        ?�y��`]?�
`��?�Q>��G�?�O8} r?���?�����(�@ S��N&@!�\��@i.�Z_�@��P�@[@�Z��@ w�ÃRY@$2��t�@(_T���@-w�Xj�@1�,��@3ٛ`�`�@6�<�Y��@:)uоKN@=��;AU@@��oc@B����@D���rs@G$@���'@I��6�q@L�����@N�/m.�q@P�w� v6@R-	���@S�ʥ?@@UB�w��@V��;�:�@X������@Z\8�˂�@\/����m@^�İ߀@`	�V>O@a���V@b&RƖ@cy��l@d8�7U��@eY�ʸ�U@f��iP��@g�!�S+2@h�cD-�S@j+K�i	5@kr��ZD@l��6ς@n}m��@ov�F��@pn�n-�@q${z��`@qޚ� (�@r�`��@s]���qv@t"̠�J@t�f����@u����@,@v�GoU%�@wZ��(� @x1>b��K@ytvjv!@y���Ӫ        ?��`h
k?����yjm?�d�׉��@	�Q���@�6��ˢ@ ���uw@(*���L@0s��-�@5�q��
@;Q�X}@@��l�U@D��9��@H}�����@L�>jY�@P�M�0@SE���b�@U�&E�B�@X�%���@[詊#�;@_${�X^@aF��6?|@c����Q@d����@f�ԅ+�@h�AO��@k@�>t�@mR�ӗ�@o��Ho�I@q�8��G@r=ǎN�	@s�#���Y@t��I��@v/ɡ2-�@w��2[�6@y@I�&�@z}��|��@| �d�@}�P�L|�@%|�hO*@�c8+���@�8��c�=@����Mx@��oj@��!�k�?@��`��@��:�!��@����I��@����|fc@���4�?�@�����@����@���1o�@�����'�@�����@��,�)�F@����0�@�}����@�`@��@���`��@�5��[@��@�]�@�d�Х+]@�����9        ?���#i�?��h��t�?�>�!yM?�k�9�8)?�-��')?�[�H9$|?���E��\@ �rI0E@�ӿH]�@��Z��@z���@�`���@�6�@�@妣��@ ���@0@#;S?��@%���Lt!@(����@+���˂@.��Jn@1X�	&@2���@4�J"f?�@6��u��@8��T�{@:ʔ��S@<�����@?G�e��@@ӋĖ�@B�?K%�@CU4ԉ�F@D��c���@F����@Gk�޶�^@Hީ͒��@J\�m�@K����>@MzDB�c�@O�)�4k@Pa�5���@Q<�[�6H@Rסw�S@S��@S����
�@T�fe;@Uԃh�xO@V�0�,�@W����@X�J8�O@Y����@Z����lM@\
 Jt�@]%��aV?@^F`�7�E@_l[��	[@`K�,L�*@`����Z@a~ƚ�@b(]W��@b�TQ�}@c^�W1��@d����@d�NVE��        ?��S.���?�V���h?�W٠��?�N�/�|?����F�?�$0h��l@׽&w�@
���Rt@)4B>| @�����@�$�ua�@#���@'q�M+8@,R���e�@0ߩ�H�&@3ݟ1GR�@7$�BPH@:�����@>���cvn@A^*�0�Q@C�����@E�<{��@H�W��@K8B/1G@N?͝F�@P�E�I�+@R��!y�@S�h֬�J@U�����t@WZ&	��i@YA@�M5@[<�/a��@]MJ���@_q�N_��@`ձz#T�@a��IK<X@c.!g/�4@di��4�@e���2�@g c���V@h[/AD�Q@i�T��]@k/��w@l��?*�@n-���+@o�5!Y�S@p�s��M@q{��	�	@rR~b��n@s.'[Z��@t�#ߣ@t��Y�}�@u߀a�ך@v�Z�$t0@w�8H�[@x���dE@y��+k+m@z��͑S?@{�|6G�@|�+����@}��A��;@@D��[@���0�        ?�Öс�?�����?եC�Y?���c*�j?�N[$��@ F>�ȣ}@6^~�Q�@���LX@b����@�?ך�@#$�s�K@'��8��@-v�n�@1�iw�@4Ȣ�'�_@8aE#q~@<Nh�P,6@@H�ۤ@@B��[]��@E����a@G�	GD5@J�MM�@M������@PYS����@R�BG9�@S��Y�b3@U�C�Z�@W�l&�M@Y��+�@[�qkt0�@]�6+�ܩ@`$��g�@aW��M�@b�_e���@c�D4j�@e6��(U�@f�(�}@h3����@i}����@kF���@l�AU�p@n-�����@o�'��'�@p�zy@q�WK��[@r�v���@ssh�d��@td+$V�@uZ��k@vW>��&@wY<�8[@xa&�.�:@ynс��Z@z�:�r�@{�\�%�@|�5����@}���,~�@�����@�rµ�@��;N �@�T���>@��C��q�@���!2�        ?��޸:+?覡�SA@ �b����@�R!�6�@�ߦY6@&]�Z@0"�E.B�@66|@=�=,@B�@Y��R@G28�@L&� ��@P���m@S��v?@WI��0�j@Z�Q�W��@^�Z��{�@a{�ހ@c��O7@fy_c^@h���@k5�~*�@m�;/���@pt�܀4�@q���C\�@s�N']�@uC��kSv@wCDCW>@x���ׯ@z��Dȿt@|���k[L@~����G@�ew�H3@�{v_��@��ѷh2t@���B���@��Y�x��@�,.&���@�o�Յ@������@�q�@�nM�i{@��Jsp}�@�E�妙�@����>V@���r�;�@�f�&pc@�0��8�@�����S@���(�`@���ӹ/@���ز�q@�g����@�L��5H@�6=��͙@�$9[��(@����;�@�n�;�@��gG�E@�6:ǚ�@�(�;�4@�u�~ �@��,0zs        ?�L���!$?��b��?��j�?���:���?��)�??���P�2k?��5Z�r@��)@_����@m'���@��Π@�_k��W@�A�Ǔ�@89FO�@!w�qr@#���D�@&�����@)��޻#@,���n[>@/�M2�@1�Pu� @3B
y&��@5�CF�@6��+�@8��{m�)@:��|�`6@=�)MJ@?M⨀��@@ɐ����@A��S��@C+6��*@DjZO��@E�=����@G��8�@H^ �<�Y@I�w���@K-�Z؞�@L�4���@N!]��L@O�M�M�@P���4_@Qh)�T�@R8����]@Sns��@S�~��vZ@T���h�@U�jl�^@V�=����@WuK����@Xc��Sb�@YV��HO@ZL�9�I�@[G��v@\F�,9�@]Iډ)n@^Q4�q@_\�d�U�@`6�q�@`���$5z@aK�_���@aٍ'/�*@biL74�6@b���Kߜ        ?���̚��?�#Z�?�]��~�?��ၠ7�?�K���(s?�\Bbo�@-��IV�@	�FZ��y@emù��@�e���@E}��@""�_@&4��0e@*�1�S�@/�u�O�-@2���儯@5��51��@9&�q��@<�
�;@@2�;Ի9@B>�Ԩ�K@Dl���|@F�-�	�@I0�f<1@K�ȏ�A�@N�^�@P���xH@R-�fB�@S�k��l@Ua�-E�@W���W|@XܶN	@Z����͋@\�#�4�@^�kǗ@`S7��ÿ@ab��lH@bz���0@@c�1H�F@d�$�k��@e�#���@g5t�@hy�(��I@iǚ�xt�@k<迊�@l}è��T@m�+�,�@oWrB�+b@phɠ\\@q*E�a�
@q�*�ڈ�@r�w��ڰ@s�)�~�@t\?"Bݴ@u3�X8�@v�1�>@vﺵQR5@w�DA^Z^@x�#Hb�A@y�S�+@z���5�@{���?x�@|�����        ?��B���?�#�=?�1�	��?�����?� �4�?�@ò�+@I0���w@��JGX@W<��"x@O�s3P�@  b���@$LҜ`�@(��Ƥ$�@-�{YԊ�@1��x8~)@4� 
8D�@8	=�?K@;�:Z��M@?��u���@A�q��F@D0*����@F�'
�@I*P��T@K�'�?�g@N��M/�e@P�a���@Rv�g/6@T��.��@UۈH2�@W��rEI�@Y�Z0!e@[��Φ @]��R5�D@_�����@`�aquC@bO����@c6��*@djj����@e���T@f���Z(@h=z��|@i�D����@j�/�M#@lc.!l�@m�10�P@oT,��W@pm�yX�@q4ir�M�@r 0� "@r�W��6�@s��a��@t}���,�@uZ�]�.1@v<�)�j@w!��8q�@x]���@x�C�EO@y�K���@z�k��S@{۟JH�v@|��>z�E@}�%W��I@~�k�q+        ?����9��?蠰=���@ G-Hl@GƱI�@�-��ԅ@%M�`|�@.}��ɾ@4�!�뵸@;0�M�U@A-��ĉ@EAe�kp@IȠA1W @N³�xec@R��R$@U$��@X/Wz��@[�#kn.�@_)/vv�_@a}�n��@c�_�Va�@e�D�r9�@g܍Y^%@j2��~��@l�\��6�@o0k�0�]@p�y�c'�@rK�4XΈ@s�Iwv��@u3�i[�@v��mB@xN���X|@y�l�-�@{��K�{@}Vx��@����0@�w�i��@�g)���@�\�3�@�Xf���b@�Z��d@�a���u<@�oa.l�@���sA�@��Y%�9|@���A���@�����@��j�g@�<��ԩ�@�s,�-@��t%%&3@�xǌ�O[@���9)�@��u_|%@�m��@�qJa�@�ȟ�Ep@�z��}�@�/A��0N@���@���S�L@�]���"@���Y��@����8        ?�Ӝ&�)?���eMK?�_�Hn�4?�L�R�?�SB���?��X&_?�]]�d�K@ ~eB]C�@z��?@!B��@���D�@8L3���@5)�=�@5u��#�@ Z"��@"����@%X����4@(ĹvX�@+`�� %@.Fڀ6@0����$@2]�G}�@4&uk>�@6#�4@7���[��@9��j��8@<w_���@>Iɠ���@@GR���U@AtE�y-@B����X@C�b��l@E7h��@F����@G�P�3�@IVb���s@J�K��_�@LHII��@M�T�絻@Obh"��@P?��L�@QRKԆJ@R*V@,�@S[��N@S�W�,��@T�EE`�@U�\�b@V���sr@W�v�̊@X���yc@Y�5"�	@Z�s@[��8 Y$@\�G� 5�@]�l�|f�@^�@2�P�@_��_���@`�rC���@a��B�|@a���p��@bK�S3�@b��	Ħ�@c��J�        ?�!�i���?���'&]"?�y�Dj�?�ioJ �b?�F��g;�?�A��hz�@폍���@
�x�S@@>%�P@��|���@�Nw�?�@#5G�@'�p��@,~�S��e@0�N�@3�)D��Z@7IFk>��@:���;A@>��#
��@Ax���@C���=��@F${�4@H�swS��@KX%~j߅@N2H��n@P���m,@R.ĥ/�6@S�y�;�t@U�5B��>@We	&���@YJc:r�@[C8M��@]P�|D��@_rr�d�Z@`�F��@a��7P@c(��-�@db�U�@e�>$�a@f�#q{~@hL*`�&A@i�Mԙ6�@k�6g@l�ӏҏ�@n)���@o������@p�퉩|@qgs�:v@r;3�I@sE�l�?@s�I�@��@t�:~}��@u�j/<�@v��9j��@w�}	��%@x�1x�X@y�j@�`i@z��%�@{��͞��@|���Q�@}��K��L@~�7�kE�@׳�	S        ?�r,Q?��>��/?јT7��?�ÜO?�#s��?����&��@�~��p@I���@-�[q\@'S�"(0@ S�DF�@$�E�Y�@(����S�@-�6r3j�@1�Uǵ@4���lQ~@8M�F�v@;�{U��@?�}�*C @A���8@DE���E@F�9[
=j@ILi?��@L
[6��#@N�A�[�@P��]5�,@R��İ�@TH0���@V
���s8@W��4�@Y�.E���@[�3QD`~@]��q�@` M�{�@a�$ݎ@bC}�� @cs�	/�@d�	3-u@e�_�5@g?̏RU@h�Vj��@i��/�r:@kc���D�@l�M�q`@nV���,@oޤ�+u@p�o�y�@q��/@<u@rXo�<l@s/6f��@t���@t��%ߎ�@u�%\���@v�F�e��@w�$�+@�@x���D��@y�>&��@z��3	<@{���W@|�^�I�@}����4<@~�tE�ñ@�
m        ?£�J��?�$�235�?�K����@V*lP@�@	��Įn@#I/&u�&@+�����@2�ق�y@8�`Z�۽@?dZ�Y�E@Cu�4���@G���Py@LB��"��@P�Br�@SaeN	�J@VS�co�@Y|kUbC@\�%	�Α@`9L����@bѝ��@d!�㢳�@f>P�wL�@hv
xu2�@jȐg~/�@m5�"�g@o�j��-&@q/�=-�@r��?&US@s�%vf�@uq|Ȁ�@v��D�*�@x�V쌻�@z(�u�g(@{�M�K�{@}����w@UKȱ�@��a�)Vw@����@�{E����@�xg�/K@�{�PV9@���N~�@��~Cُ@��f�}�n@�ʻ�U@��x����@��t@pk@�ILI�^@��(��@���R��@� Iyz@�����&�@�L|G�@��Lb�ph@��%u
�@�V�$�@�	�T��@����'��@�z�/qD6@�7iC���@��-�i*@���:��@����׌        ?�FN	�~A?����U�?�s�jB?�g����?�i�e̚�?�%�n�7?�l|���@ ��r���@y�qjv@�G��@�����@&�^��@�0;J|�@WZ��+@ B-��@"��\�A�@%3}?��@'�i����@*�ʼ6�@-�'�n�z@0�>��@25�]D7!@3���֛@5�*M�i�@7��;L�@9�F�g�@;ޱ�5ls@>�+1�@@'
��`�@ARK�߲@B�Uم�@Cȉ.%�7@E",1@Fg�2�@G�'v��@I0�+,��@J�ej��@L"k���I@M��y��@O=,OV~@Pl袄��@Q@H��	�@R��"&@R��;�"@S�a{��@T����m�@U���T�u@V���-�@W���*{�@X�%'���@Y��ێI@Z�����@[���Ch=@\�TSh�@]���;�@^�жڗ�@_���E@`����g>@a3s.�@a�+/R��@bEz���@b� ^�x(@c{�V�m        ?��NEr�?��aP?�#`-��?�('f��(?�1��1�?���~H�@�$��ެ@t!��ch@X�{ �@Gp)K��@ �*^�*�@$�V&�j�@)�����@/4���@2��$�1@5���gZ<@9Y���<�@=<[��@@���x�@B��A�>@Efډ��8@G��؊g�@J�C^�D�@M����w@P]��K@Q�dB�$g@S��j�-�@Uz�G�4@WZ�~$@YN��	o8@[X^~7�|@]ww�V�@_������@`����K@b)�'|/�@cc׍'��@d�/-4�m@e��9�@gP*AV�@h��B¬�@j!����2@k��Zú�@m�-��@n�s�f@p�[���@p�Ҝ�Ҝ@q�$����@r�t��@s~�m��"@tb�lK�@uL �1��@v:6
M�@w-2��@x%�z�@y!�k<�@z#sz���@{)�-��@|5F�@�@}Ex%d3�@~Z���F5@te]X��@�I����h@��W`���        ?��뮫��?�����Q�?�V}�Y;�?�Ph)ޛv?�i���?�ns�(��@���6�@�ۤ���@�ކmB�@ڸ "��@�w�w	�@#�pj��@(F�t�@-G��>@1j��M�0@4y��\�@7Ѵ���C@;t7���@?b��@A���@D��. �@F{�#�f:@I%$��@KŜ��{�@N�q�4�@P�_���@RmΊ]�@TX
�@U�5 I@W��\	=@Y��f�ĺ@[�L�=�@]�J���@_�2�H�'@`�����6@bt�%�@cK˯]X@d����+'@eš��!�@g#�@hf)8N�@iĭ����@k,�㬧�@l�^F�@nX���@o��s=��@p�����@qa��V�@r1qm�a@s�j�-[@sޅ��A"@t� ����@u����0@v�=����@wn��=�@x]��r�@yQS��~@zH�1D�$@{D���k&@|D�F)@}I%̗�@~Q�HZ3@^�h��        ? [ץ?��>A`?�'R�@@����@�~�`b @#�F�b@,�A����@3� �HX�@9�-"��@@I�e��@D6�[�&@H��F_J@Mf��P7@QV ]f/�@T2�;�@WI�	�)@Z�Ȥ�ռ@^&[���@`�$�Cp6@b�=���0@ee3	)@gM�	�>�@i����)@lB��r@n������@p���G2@r�E�]�@s���,p@u�I>/@v����q@x0a!���@y��;���@{�u�R�2@}]�A��@2��l|@���]@���Әܴ@����Dǖ@����\@���8�|�@��ެ;��@��T�-d@�����<@��6�-,@�A�&�G@�w%e�/@���@A[�@��3�oo�@�A͒i@�H�Ahf2@��6�jy:@���⺷@�Tǎ�I�@�	��.��@����ޱ@�}��)@�<�iz�@��΄˖|@�ª�}OD@���|��@�U�H�&@�$#��@��W�b�        ?�$Tx<<k?��ω�?�/�6?�����p5?�e:"O�?��D�#ʂ?��t r�@5L�?@�i?`�@����B�@HND@Pe��@4����@�넜��@!�|xXc�@$\�VƄ@'!�u�6�@*BI;VG@-1i�|�@0>�t�@1�ץ��2@3��S��@5�mO�9@7�H��'@9Ȃl���@;�k�7@>5�}v �@@F���@A~�� �@B��}#�@D�﹁@Ed�aoC�@F�O>,�J@H4~�lf�@I�P2��@K.���l#@L��ͦ�|@NS �	5�@O�x��@PиǾQr@Q�.)�z@R���]�E@Sr_<_��@T].o2A�@UM��N'@VA����s@W;�] @X:�5ҵ@Y>�1��k@ZG�<7�)@[U�L!5�@\h��{�:@]�M@�֯@^�	���@_��d~��@`r�5���@a^�k@a��=B�%@b;(�Ϭ@b�5���^@cw����@d����G@d��M�t�        ?�S{���?�����?�xHG���?�\Y縕�?�@fXO?�����@����B[@��eC@�ˢ���@�ZV��@ fHHL�E@$s��w@)
��(@..��#h`@1�ۭ��@5�v��@8�Ƹ��@<C�+i��@@'�#=L�@BT�����@D��� .@G'(j�{@I�>w,�@L�H�i_�@O����* @Q[��;�@S �|�=^@T�;�Y
B@V��ޜ�@Xo�'�@Zhr�  @\v�V_=@^�.6�5@`iA]��|@a��h#�@b� v�V@c��x���@eB��P*@f��{��L@g�͵"O�@iSA��?@j-b�@l<|��B�@m���H�)@oO2}�|@ps�:�E�@qEv����@r�_@r���2�a@s���T�@t�TL\�|@u�75�w@v�%o�@w����Q@x�c��@y��Ч8@z�	��8�@{��j@|����+�@}����@~̆��@�8&9�i@��gN�M        ?���aID?�������?�݉��@?���^*?��A��F?�D+���t@7��(��@R���`�@�����@�2���v@"@=2'�@&�����@+�$��@0�h\�$h@3���V��@7#�m�P�@:�F�yE#@>�N��j@A���h@C�Ÿɹ�@Foߨ�_�@I@���@K�I�FsL@N�RG�9@QSZ(�V@R�E�%�o@Tw���.@VM�<��@X:��SC@Z>nl}@\WbAc�@^���3�@`f��ȣU@a�͉EJ@b�H��Q^@d2A��@ec
�c9�@f�Y�[�^@h$�	\�2@i���B�@k����@l��5�,@n0_���@o�qJ%�@p��'v�N@q��N��'@rx8�6I@s^#-��o@tI�P�c�@u;18x�@v1�x��@w.gB0�@x0s��I�@y8�'.y@zE@���.@{W�l��@|p<4P��@}����@~�Na�/r@���1@��0V�@�#��@�����n�        ?Ɛ��W�?�k�)^@j�/�9&@zI�e@���#@(F��	y%@1e� ��q@7��+}��@>�땃i�@C� �V��@HZߝ��@M���~f@Q�g'��@T��w��f@X.%k�"�@[֛��R�@_�J��?@a����6.@d1{UU�@f��[.��@i��ns@k���/|@nc���,@p��*�Ѱ@r"kW��@s��CB5@uU�:s	@w�=@x���7�@z�)jf@|��gV�/@~z7\E�@�@�so@�KR���_@�^�;xe@�zt&eȾ@��F�� @��7���<@��:����@�:A����@�~=[��@���2�@���aHD@�yAw�7~@��c�BR@�#�g�u�@�ܾ(�]@���BM��@�ZX:Jq�@���*��@�����@���U͢@��sH�y@�U��C+@�+ʢƝ@�7���@���)� @��m''�w@��r��@��mj��@�*��@�n����@�b�1        ?��y]��?��%�h�?͞R˽x}?�h�S���?��u���?�Uo���?�~Z��d@W�	��q@��~�W@(�sX�C@��|;#@z��Q�@��x��@`,��&}@"1d�cu@$���.�@'���n4�@*�,~�|&@.O9��@@0é�@��@2��U�D@4|o�
�@6|��?@8��w�Rm@:ľL��w@=���vH@?l,���@@��Z�Q@B9QM+�@C��UdO�@D��|D�G@FV��,nz@Ǵ�>w�@IP5L>�@J�WJF�B@Lxn���@NG��1�@O�ڣw�@PƐ�Nь@Q�	� `@R�V9�@S�qO|i�@T{X�9wm@Uw	TZ_8@Vx�Ã��@W����@X��a$~#@Y��a!?�@Z�����@[�'��$y@\� �XE<@^#{�^@�@_R��~�@`C����@`�	��@a�|�w��@b#`g^ @b�HD�-E@cp<��1B@d�1V@d�9(�d�@ex<��:@f*��QVf        ?��Cb��?��?��m?��r�?��s��?��G��?���C]@@Lc�j�@jA�j{�@9p?��*@����@!�WzE^�@%�Nq�<k@*�'c,��@0-�ؾ�@36j}?
@6���&l@:/���@>$��L�t@A52r[�t@C�Nd��@E�Tj��@H���ͧ@Ka=4�@NV	V��v@P�	:Yc�@R`��̒�@T2D��.@U��Q|@W��?Y[@Y�c�2�@[����x@^�n�f&@`'��%�)@aS82y��@b��8~��@c�J2�@e'i45�@fp@("9b@gӕ��!@iB(���"@j���|@lAAmt@m�J��.�@olƭ�*@p��P���@qb�R�J�@rA&�*T�@s%5�"P�@t�o�N�@t��^+dx@u�?畾@v춑3�@w�R`��9@x�bX�@y���*�@{�M��@|!����@};�'^+�@~[�~k�@��%�8@�UЍ��@���v<�@��M]m�q        ?����?�Fnog��?�N�ˤ�,?�7���?�!�+~�P?�xqJ@r��P��@�%'I�@{���*M@{�~�ާ@ 9}B
�-@$5��� @(�Lۅ-G@-���[�@1����ĺ@4���͵�@8��"y@;��K��3@?�~�1W#@A��Ž�@D/T�XcG@F�=���@I%x(�@K�b�-*@N�O,��-@P���@Ro*���@T��{1W@Uћ�H�"@W���D��@Y���Z?@[v�v9Nh@]���@_��Z�P�@`�[sO1@b�G-<�@c1Z�� @de����@e�q��b@f����@h;1�Gh�@i�
�P�@j�]�@ld]f�3�@mٴ���-@oX0)ļ@po��G��@q7�^�@rS��H�@r�7���6@s�q�)�s@t��yC�%@ua�=�@vC�/��@w*����@x��qP`@y/o���@y��2�@z��1���@{�ό7U�@|��\}S_@}����%@~��Ѡ        ?�q��S��?봔5<�w@2"�y�@ VU��@��C���@'��ц��@0�·�~�@7�8H@>1,�=@C+v@h��@G�NH�l�@L��@Q?� n�1@TS��op@W�����@[E\��J�@_#����@a���I� @c�Q��x�@f)��n�@h����b@k7];m��@m�w�ڏ�@pey�n@q�W��e�@sqʬ`�@u�����@v�0�@Pw@x��XA@zP(c`@|0����@~!4����@��@����^�@�*�݋@�B�w
P�@�cb��O�@�� <_�^@�����@��� w��@�6��TD�@�lP�@��@���@�)DR@����E@�@��q5=�@������@�m�Aex�@�-�񳉅@��ߡ�
@���Ş@�������@�U"zAu�@�(��U�@����N6o@�ڨ���@��U�_x@�����@���ױo@�k��:��@�X滏�t@�I���^@�>��}C�        ?��Z$���?��}���l?͉Z�s�?�2���?��b�<9?���i�?������@�ܟ�0@�Q%��@���-��@K&5!!@�+:�@R	��٣@�C���@!��#��@$���H@'n>�S*�@*w�/l�@-�.#��f@0�V��#|@2Z����@4>���E�@6;0ܠF�@8O�b:=_@:{��Pǁ@<�l���=@?�2
1@@���e�M@B��T@C\�K��@D�7��@F!�9cW@G�2��@I��Z
@J�y�f/0@L1w<;h�@MѠӫ��@O|�_�8*@P��4�@Qz`���%@R`�dۖ@SLL�EV;@T=m��;�@U3��ŕ@V/Љ��#@W0�'5@X7n��E@YC���@ZS����@[i�NC�1@\��{g4�@]�sDƹ@^��@c�@_� �K�@`�jC9�@a+?�6�@a�{��-b@bf��ׅ@c&]e@c�_xG��@dO�����@d��^�E@e�:)�        ?��t��uZ?�����?�{jQ܍�?�k���DV?�3��*��?�5�O��@��H�A�@���qNj@ˍ�#
@=E�?@!^�6+@%����@*��<���@/��(w��@3�d���@6^����@:�1nE@=�
����@A$.��i@Cs�n�q@E�B�3��@H���3[�@Ka�VO�@N[ƅԇ@P����R@Ri��m�@T(�Pc�	@U�L��x�@W��y@Y�`�@[��f {@^+��J�P@`6�9���@ac%�?X@b�(~�&@c�7!�n@e(�O�A@f�d $5@g���4v@iO��	2@j�v��eJ@lI�Baы@mֿ��R2@on8�4w�@p��d��@q^J��H�@r9�d��@s?JzA@s�����V@t�Ƴ�]@uڱM�e@vϭ.�@wɳ��KV@xȽ��m+@y����@z����-.@{�X&h@|���F?�@~9�4{W@*�	�2�@�&�)0@��:�X%c@�N���        ?�A��s�?��|q~�h?����Qg?��z����?��|%p�?���*��@J�E��@Z4��@��J�c@m��g
@?Sr��f@#��.��@'��u��@@,�XՎn@1B׻'qj@4Q�}u�E@7���3?W@;N��q@??�ɕ[@A�!T|�@DkEW9@Fs&���@I����5@K�ڀ@N���Ce�@P��Ϣ="@Rw�p�=@T'UF���@U��)u�@W��1�+t@Y�`�x@[���o9@]�<�da@_�&�3��@a!ƌ�@b=�Y&6@cpqՋ��@d�(���H@e���5��@gD��'�@h�2p-A�@j�D2Ek@kr)&V-@l�l�V�f@nl~}0s@o�Q,z��@p��Ǵ��@q�����@rj�#j��@sD@�{�@t!���@u�a��@u��Q�@v������@wȃ��6�@x��Q��@y�p�$X�@z���_6@{�m�~��@|��d;��@}�.#�R@~����J@�eG@�        ?�J�rX]?��b�;s�@�bL��@v�sW�@�fߥQ�@&����.@0/���I@5�f�6r@<���6�@B6�P��3@F��9��@K]��F��@PV�y\@S;��,E@V`�+n�@Y�p��'@]gAư|b@`���@b���@d�).�d�@g4�]��@i��]Ac@l2:D_@
@n�{č
@p֗�MB@rL�J��@sҀ��і@ug�̈́�~@war��)@x�]@�@z��KGn@|U���.d@~7wH���@��Odb@��v�:�@���I�@�)=���+@�?2@�\A�1S@���3��@��p'e�@��]uMǦ@�r6�U@�Z�5-�@@�����@��ߔ�@�H  �"�@�R�恏�@�nxԧ@�����b�@�rGO��s@�.,���@��W�l�7@����g�@�u]]ϭ@�>'��b@�
7�4�@��#ݘA@��E��@m@��u+�V@�X�yl�@�3�f��@�V'��        ?�i�b� ?�����}?�Kx�s�?��I+#t?��u�'?��X���?��DL�@ H��@-U5YtY@
���@uc��p@�V�uj@�M�(�@��'��@ 	�)�ݎ@"d@yԵ@$��`��@'��oS�z@*i�	.O@-h��w!@0GW�;y@1���
�E@3��.I�@5z���>@7^�S�Z�@9V>�9�@;a����@=�u��-�@?��^��@@��48�@B'���@C]U;[�@D�R���@E�$�I�@G5i`N=b@H��.}G�@I��M�@K`b�"��@L�s��U@NU���W@O�C�J�@P��9]�@Q�|��(@RW�O���@S.,/��Q@T	N�t�@T��a��@U��R���@V�S��ri@W�	*�@X�f6�!@Y�6�@dX@Z�����@[�4$�@\������@]�jo�J@^�J��@_��1�9�@`W��/�_@`�~�n�@ao3��@a��l��@b�T�$S�        ?�s����l?���H	�?б-"�?�n׮xq?������?��t!�`@A�o�p@V�_�j@���D��@y|�ٝW@W2���@#��K4#@(G����@-%��H��@1`�se��@4y|J�X5@7�=�k�`@;�m�JԂ@?�-]'=W@A�Q�@DAʎB�@F�Ӂ�.�@I[i�Z�@L&M_�Q@O��J�R@Qm$i@R���!m@Tv���5@VC=�e�;@X$�9��@Z����C@\%=�~w@^Dumv{J@`<(�@a`2%c�A@b�}gB	@c��q�?e@e	��.W�@fV6��@g���i�@i���AT@jxt�i@k�%ŗ�@mk�]4@n�9�@pCDK.��@qQA)Ϗ@q�>���@r�y���@s���+�@tz�H�@u`YU+�&@vKdp��@w;7�j6@x/�=5�
@y)'���@z'>��Oh@{*�H�@|1���'F@}=�;�@~N�|�<@d��T�8@�?l����        ?�����ں?���;��?��!3a?�}X��wB?����\{D?��Yt�P@�`/M�p@	\9��w~@6�"�^T@�D�f�@�hP7@"	
d�. @&|�g
v@*�^]dj@/��$�T@2�,\��@5�f�>�;@9���O�@<��ං�@@7sXం@BE9��\@DuG �G-@Fǝ��d@I<3�?�v@K��[
�@N��s�\@P��@R122;͇@S����C�@U_A܄=>@W�>���@X��<��B@Z�
:Oq�@\�˚a@^n���
�@`7H3��@a>֗b�@bN��8@cd�Ă��@d�rw���@e�d�u[@f��:��h@huU��@iGl�ɂ<@j���G@k�����B@m&+[E+�@n~sݲ�f@oݡڭ.@p�Ѣ��@qX3A�3@r�3e!@r��m��@s�HqS̉@tR���@u����@u��@�@v��DE�l@w��1E�o@xTMR� �@y*�|�0@z5؍o@z���r         ?�\0�V�?�Ӛ��Fx?����,0@�y�5��@�v��ZC@"Iў�V@*>�<`N@1�
>�G4@7l&
_ԛ@=����)�@Bq���a@Fhl��Y�@Jō��+@O�hCoZ@RY��&w�@U!��"�k@XZ��|@[L��@^���|9/@a!/�2��@c�v��@e�eެ�@gs�_X@iG2���@k�:�2g�@m����uH@p4���ƞ@q}:x�xQ@r���";@t2���|�@u��|w9�@w �@x����;a@z)�o��:@{ĭ�1A�@}j��$�P@)v�F�@�lo@A�@�Pl3���@�:z�@�)<�V+@�g�K@�_
Ku@�?H�"@���.)@�(p�ɳ@�8�$i�@�NKN�n�@�i=Q8z@��yK�'�@���Ѳ�V@�٦.�@��7��@��C���1@�<Sh��!@���o���@�~����@�"��w�H@���pQ�@�sj<��$@�zQ��@���-}X�@�~�s�"�        ?��O�4?��.�1Q�?Ǻ����\?���t�Z?�O{�6�}?�3|��?�L:d�L?�?z���@�н�Q@���]�@�r��7@�p�
��@-���V�@	�Ԥ)�@5AO4�@!XQ8�{�@#��$@&J��#�@(��`Y�@+�&��m�@.�R��@1�W�@2��x�h�@4k�� c�@6;�dg@8}�<�@:C����@< ,�6:@>=$78��@@6�O�KM@AW�i�B@B�Ӟ�m�@C�NӒ@D�{E���@F;L^WL@G������@H�~���@JEM�>��@K��\��@M#^Y��@N����$@PYy"�@P�;@��{@Q�t�&@Rt :� @SG�|2�@T �iس@T��kT 5@U�n�I�@V���t@W�&�{�K@X�Y�@Y�)�>B�@Z��f5@[}Hx^ѿ@\|0�c�~@]L�:�&@^�����@_��o�@`P�Sx�a@`�����@af�yFnF@a��NC��        ?��El�9?�)ν�;?�>
�<��?�B��y��?�(���?�F���@xf�lA@�3��q@rv����@P��0��@.�W�R�@#�
�@(2�ƾD@-t�,Y@1]cXTŨ@4y[c�#@7�2t���@;�K!� @?��&��@A�xU��@DO�Ϗ8�@F�w�@Is���@LDob�i@O>�d��Y@Q1���@R�^,��'@T�+���Y@VhL��@XO�w*&t@ZL��[��@\_�*b�@^��X��@`bY��@a�iSa��@b�u���>@c�2�I��@eG��r�@f��]�8@g�F�g��@ic{�_�@j�5Ul6&@lUjsX�@m��i8=@oq���@p�7���I@q[ij�C@r3�_�g@s	��t<@s�(�k� @t�T(�It@uʅ����@v�����@w��K�|@x����$�@y�����@z�ޕ�1u@{��k�&U@|�,��lG@}���U@~���o,*@�B��L�@�������        ?�ݏ���?�@�w|��?�@"T��?�#���x�?�)���f?��rX��@�)$��@	D��p��@5Q�lP�@�]�@��Š@",�sJ++@&T�~�{T@*��K�@0�:8�@2�f��K@6@����@9~��Vr@=.:���@@���vb{@B�6� ̗@D��sX@Ga�ګ��@I�`9nF@L�!�K�@O}�Lb@Q=��&/�@R�E��.�@Ts��s@V*YHa�i@W�<��@Y�r	�h@[��+���@]�	zgH�@_Я�@`��s0��@bQ�o@c:s��=�@dg��zh�@e���e�T@fܻ��gP@h$f��7;@it���@j���6�@l/a���s@m�����@oV�v�@pC��tG@qC���<@q�}3�@r�8�@sc�n��@t5;n贕@u`V-1�@u��| -@vä��2@w�����@x���9��@yu����b@zc]k�wB@{T��c�J@|JuW@}C�L�        ?�Xf;�?��ն�?��J��$@�����@��!�ē@�[sAm�@&��:@/=�h֐A@4�s� @:B�Ӑ@@.r����@C�u:#�@G�N��/@K�5[}&@P%�Tj�V@R�!
o6E@U=��xR�@XNn��$@[	�����@^3[�Z�V@`į��-�@b��3�e@d]'���@fJ\l"�@hMZ� ~@je��K�@l�!<�@n�j��L�@p���~-@q����~@s�V��@t[�|���@u����+@w�[�}@x|d�Y�@y��3�n�@{o<�ut�@|��|W�[@~����?@��X�A@���B�@��1ʈ��@���s��R@�z��c�@�a���L@�Li?^�@�;�
dD@�0|��@�)�ta�}@�(5��@�+N�rfI@�37O54@�?��Ԥ@�Qf��N@�g�g�Z@���V��@�Q"-P��@��OQ�m@�w�U].@���L�@����@��@�C@�+�u@���e