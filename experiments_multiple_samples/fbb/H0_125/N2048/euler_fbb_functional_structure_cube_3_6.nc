CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T113724        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?w���}?��@��W�?����V��?æ�hnWp?���9�?�ܶ8u|�?��ȗ�n?�I z)%�?��p��?�N9JkK?�$:���?��',�h5@���@r ��k@
,V�t��@5��+�@G��-L@��<(@����@���s@���7j_@�OL��x@ �o�Li�@"�v���@$Hpl�W�@&�#X5h@(�+#�@*?��+@,(E���P@.Yq{�I�@0Qt��l@1�+]�%6@2�Ij�W@4{wB�R@5Y�~�^�@6�|b�"@8's��v"@9��q��@;&�\��@<�#�� �@>XA$/?-@@$��4@@�w]��&@A�[l@B����(5@C�ݡyze@D���tG�@E�ɸ�@F�:�\k~@G�6���@H�)���@IȮ��]@J�2����@L�@۶@M;�:��D@No���(@O��Dx��@PvA/e1@Q�1�@Q�w䛏�@Rl'o1@S���@S��Jw4t        ?S����9?�^�&��?����c� ?���Me��?�!���:8?Φ6�F�?�&��ta�?�\Zb�m?�\��[v�?���9�j?�4����@	Y�D�v@]�bsu@��(o-p@� J���@�e���@�L��8-@ �3g�.@#��m�D�@&��;@*�M�?��@.Ǭ���@1�?(�<@4
���fk@6��O�@9w�dVOA@<z2՗_�@?���iS@A�H�L�@C^�u7J�@EJ����@GR�]��@Iv(���l@K�Gct�@NFf�@PF���(m@Q�ȳAn�@R�ܮ�2@TX;ѫ�@U���$a@W[�Ëqf@X�T��EP@Z�����@\YIQ�L�@^$Oc@_��p%_�@`�D���@a�N��bO@b� ���+@d��(�-@e'��1f�@fJ�"|@gv����@h�^Ka�@i�Ɨ0M@k4ڭ��@l�H����@m�3�56@oKu���@p^.�%�@qȣ�+@q�T�S�l@r������        ?Q�DZ�)?�m�ا?�')�ȗ<?��z
V�?¥|���?����.B?ܜ�P�
?�b(����?�,p\��?��}���@ IBͤ�p@�:�%'�@r��ik�@1Fɞ*�@�2�"Z@Ab���@!9�g�@$�)��@(���P&�@-��q%�@1�����@3�W艕f@6�����@9�E����@=i���&�@@��1D@B������@Dӻ7Uu�@G*�bEe@I�l�)�@LP�uA/�@O!FgM�z@Q�!�e@R��z�h"@TID6N2@V�!�?b@W�n0 @Y��8w�@[�+Ot+�@]��;K�@`��;,@a1��\��@bcB���h@c���D�@d�Z�Qsc@fBL��t@g�	��_�@i�t�V@j�s|��@le���@m���\.�@o]j���@p�]��k�@qh޲��@rPFK��K@s>�Z�@t3��,@u0im�c@v3��4@w>����@xPl:c-)@yi}��@z�ӭ��        ?���BhӬ?��H��(�?�@�8�t@�U���@-O��|@%i���N@.;�^^�@4��A��3@;+�o�2@AT�͏@E����ۚ@JW�=.@O�5B��@R����@U��9V@Yi��9��@]/Y�s(@`���d�@b���ޡ@e%e:���@g��3i��@jJ��g��@m���kR@p
"Î�@q�����@sC-����@t��/��@vҤ ��@x�`u�@z���E^;@|�)��@~������@���֩͹@��a(aà@�
�ޮ�Z@�Q�JM��@����$ϖ@�����t@�p���8@��>�M@�n��K�0@�A��P�@��\�_�'@�&0�+�@���ղ�@��&{D1@��3H�ǯ@��?�Q`�@������@���%<U9@���@19�@���U
�@�с��@�軹��4@�t��~Q@�*��Wq�@�UE(�r~@��IJ�p/@���x�V�@�}�\i)@��&�Si@�įA��@�l���X        ?Z����E�?��*�z��?��"�XC"?�����ES?���߳��?���/��?��X��?ۇrME�?�a!�E5?翵/��?��M��#?�na1L�?�T9����?��K����?�pԇg��@W%Y�Q@2�5��@L$���]@��j>��@@PX��@���cN@��zp�@�Qs��@)����@�L�[��@C$�B�@ @���*@!w����E@"����!?@$��<���@&EԔAf�@(sRἎ@)ڭ�ES@+´i=�6@-����@/��3���@0��J��{@2&�gʥ@3<�H@�@4m�&�(@5�?:��@6��FA�@8>���,@9�ϥ��Q@:�$�q�@<k����@=�%wp��@?f��ZY�@@yޙE��@AEY��K�@B�:i/$@B�r��p@C����@D��~J�@E�O�IcY@Fs��L;@Gb�����@HVU(�<@INwؗ�@JK� �,@KM��S�W@LT����P@M`?���}        ?P�WGA{�?~X�����?�K����?�k	��?�4�oB�E?д�s�7�?�����?��hJJ��?�AI:�R?�%���Ѐ?�ڷ1���@M4J��@�׽�	�@��5�oM@RCK�S�@� �*/�@ �����@$:�q�W@(�K-�@,]bV��\@0��F��@3,�ȇ:@6	��p�c@9(B_I��@<���m+@@W:Mk^@B9Dj@D)���{@Fi�d�@H�a��@K[l�1�q@N�_/s"@Pt���@Q�����]@S�+�k"@U8t��C�@V���;�@X�Ew�6@Z����R@\���$q�@^�ZE�@`�1Z�,@a�+5P#@bӻk�J�@d�7JL@eTK,�@f�(m	��@hCET��@in�(��U@j��`��@lg���p�@m�Vѝ��@o�C�{�@@p��x��@qx�[L@rY�=�g@sA2�z�@t/@1��@u#��]�@v���@w �y|�@x)u��Á@y8��LG        ?P��SȈK?~�.�p�?�%�L�ױ?�/��n�?��%����?�h�cK:?ۂB�;�?同}�?�����?��SN��?���w��@)U��Z�@��.!�@�ZZ}tX@Fa�S�@�R��@ Љ��`�@$B��%<)@($�N�R@,z*Ig_B@0�!��E@3L��֬�@65�����@9clc�q�@<�/ѫ|/@@I�ˋk�@BM�4@Dv�hХ�@F�V�q��@I@0�B�@K�	ڰU�@N��35�@P�1FN�@Rc ��Y@T
{t�@Uǽ sP@W�=�l@Y��3�v@[�G����@]�y���@_���#A@a�F��b@bE31ʟ�@c�
*'�*@dυ���)@f'�uN@g����@h���?@j~<��C�@l
��W��@m�Z�Ho@oKo*�x@p����@qa�Bs�@rH�{��@s7����[@t-Qs&T@u)�8tEd@v,�_�l@w7'^�v6@xHeH�x@y`��N�@z��R#>        ?��>��5�?ӛU��3�?�L�v�{@ �O�z��@�\�.��@짇3�@!�Wd��<@(����(�@0y��j\�@5Q<<�A�@:�5p{��@@�v��ɧ@D#���k@H_:%AA@Lsz,"8$@P�G�,�@S=v�2�~@V��Ju�@Y*?�(Ea@\|ef�$@`[��5@a��xWq@c�P���@f#3>�լ@hp^��@jߎ��s@mq��,�@p�[KD�@q����Ͱ@r�o�~v�@t�v)7)�@v3�m螧@w��WA�@y��*N�@{���]@}|�^��`@~'��@�Ƀ?Y1�@�ݞ�ԝ{@��q���@�#����@�T_J�@���}Z�Z@��kY��$@�#�^NP@�{����I@�ݞm�@�I]���X@����Y�+@��	��@���
�X<@���B�~�@�y�Q��@�K$m�Q@�!��"�@��ֵ��@��m:a�g@��t<Pr�@���i_�@���S��@���;+�@@�|#ނ��@�u�m��        ?b w_u�?��E�c�?��m�6h�?�J �̋?��
	�`v?��h<L�?׈b�9�?�h��~~?���>kxW?�b�L&S�?��|=P5?���`��?��j$���@ 7y�@�%'�	@g�n
Y@	�26|o�@E�$C�@��M�)�@�#ծ�@)T�ʽ@@����o/@JU�\U@�e�"m@ $s�@!�˺H�=@#;*l@$�F�>�@&�C�I�c@(�I�� @*���c")@,� P���@.�JwA�@0��q�s�@1��w\m�@2�^�m�@4�'�)�@5cD1F@6�[�ܬ@8�Q��@9��LG@:��ϑG�@<x>��?�@>�,�@?�X�@x�@@��NؗJ@Ax-0[�@BU��v�@C8��@D!-�}�@Eu5�Al@FP�2�@F��}�k@G��Ia�v@H����@J	��n+@K��c�@L-y��_�@MGf�hd�@Nf��F@O�&}�@PZrNyƴ@P���G�        ?R�����?�9��#�u?�@}(?�V��i�8?��Si�?�˝v���?�9�f�@?�Gi����?����k?�@ �:v?��!f6�@@�o:`@	�[g1@��PD�I@p�-�3@�ߒ���@-����@"(����@%��kx�$@)}O���@-�Ղ�[�@1B���5@3�J���@6�vѩ�8@9�YR���@=�����@@Z8.�g@BH
�a�@DX��B�@F��4�@H��<�@KcF���@N�)a�r@Ph��q��@Q�S��*�@Sn�!�@UW��@V�̵��@X�l�1^$@ZoL�_ea@\d���M@^o�)��@`H��W3@ad���/	@b������@c��8���@d���h�>@fF����K@g�����@h����.@jl�9Y��@k��e6�N@mmQ����@o E�rY@pO�Zp~�@q%���K@rZW�:�@r�-�XpN@s�t$��@t�7�5*Y@u��� W�@v�]�,�@w�Ҧ>Lm        ?[���H�?��ͽg��?�-i]U��?��DX�?Ȟ]�y��?��'���?����a?��i�?�-�A�?�����%@����V@�\��D8@���Ϗ@F��(V@F�A�߉@����@"��~5@&��t�@*�E?�@/`"����@2B��%@5�7��O@8,H<��@;�`Z���@?(�zn[�@A����@C�s�!@E���@HE��>ԟ@Jн�]�U@M��T�~�@P.>g�@Q��2I�@SD-m�C�@T���1�@V�p�S�@X0�%�@Zgw����@\e���@^x� d@`P\���L@ao�,^ڝ@b��S��r@c��E@e6@fZ�.�@g�4M��@i��U�@j�'ܜf{@k��x��@m|w��J@o�6��@pSD�0��@q&l��)i@q�_�lCh@r�#2�!�@s¼��.@t�0��Q@u��>ǋ�@v��kkp�@w�ӌ�@o@x����{@y��u~A        ?���dd	?��{���?���{�+@��R�@��5C�@!M����@)������@1�i{��#@7�]/�@?�$�i@C�Y��I�@H1&��@M`f��6�@Q�����@T�'��X�@X@m.~�{@\�i�@`��O�@bS��)@d�*�p��@gLb���@j,�h��@l���k2@pO�)?@q��oS�@sf��9R@u9BL�+�@w#��ǵ@y$t���%@{=�2>D@}n�"��@�U/hd@�����@�J�pXQ@��T9�@��G�,�@�K�3�>�@��;�P�@�5��?�I@��_�?�8@�Q��jT�@�������@���*��3@���o0��@��*�!�@�{��@�k$>��@�a����@�^�#��@�`߱H�*@�i�kϓ�@�x�O�R!@���)�6�@��#�"��@��`-��;@��X'(�@��"�Kk@�R<q9y�@�E�d��D@��a�z�F@���rT�@�-��K�@���&        ?`E>n&*�?�A~���?�+���?���ޅL;?�e'u�d'?�:��Jx�?�t,>�9,?���_\^?��A'U�?�`�!(?� ����$?�	�J?��j#�ܡ?�QL�~��@ �:��:�@c�Qj�@\.
�|�@	���Anr@�p��@b���v�@a1��@���<�n@����Q@+�1s �@�� #�G@f ���$@ ����̓@"ep
@#��7�0�@%P_�h�@'��6�@(�'v*E�@*��6���@,��oBQ�@.��0�z@0i�[cI@1�&�Ĥ{@2�E�c�@3��}/%@5SR<��@6Sj�z�f@7�R�-�)@8���~@:`߽f1|@;ХP���@=K{tBNp@>�l
��@@1?�`��@@�^ў��@A��"o1@B�fH��@C�Qǈ~~@Do�*� @EY��W]u@FI��C��@G?�L��@H:����@I:��:�@J@�`�V[@KL-�}^�@L]U-�@MtK�^@N�H���        ?VU����?�n"η�;?�r?Τ�Y?���*$�?�%u���/?� �ü��?ݓ�w2@�?��8�Ẓ?��_nnN?���01@ >`�"�
@��1K�@4�.�8�@��$�@��@���@!�&�T�@$�}��^ @(�p�m�@,�ؾo�@0����X�@3�؈�o�@6���F�u@9�-�B0�@=�*���@@����@B�z�
@Eߜh?G@G�)�{�0@J!}d5�@L����`T@O�x�g�@Q�Jm6�	@S.g\�Q@T�'�`�@V�	E`e@Xņ�,��@Z���ߪ@]/��@_G?�xlR@`�[��%�@b 2���@c_�V�K@d��N�(@f$`�bs�@g��ھ(i@i#�%?��@j�����q@l_#Z�E�@n� ��@o���̯@p���ǩ@qǦ�	�@r�e�;Y�@s�,�m��@t�
�SZ/@u�JR�@v�PF*F@x����@yF�8���@zzb*�@{�Ú��3@|�P���        ?EƯ���U?t�g4�*?���=��?�Z�eҏ�?���H�K?�߭���S?�/����?���*9��?��($8�?�.�g�?��؜ri<?������7@���e7@
�,��@�{�&~@�HW�[@�#j�	@#^Ci|�@"����`L@&No�@)ʄ\���@-�y_ +�@1J��D6X@3�z�v�D@6���m�6@9��.�@<�I<�@@�Wyf@A�M+	U8@C'�/@F�����@HJ�,� ^@J�-��4@M3Eg��v@O��Ҿ\@QV���tt@R�L�9�i@T_��m�@V Ldc�@W�A����@Y~;?��@[[� �R@]MR����@_S�5vQ@`�מ6H�@a�]�N�V@b�!]�^@d!�$���@e[#�yO@f����D@g�*f�@iJ*��|@j��SH�@l"�ܨ��@m�\�ļ@o)�\��@p_����@q0'��rc@r��V*@r�h���@s�!�y@*@t���2MO@u����Ί        ?�!ܔɰ?�5*A��?��(ё@ �h�p�@��Ϸ�@�B!�4�@!h4'4c�@(5a����@0$-i��M@4�D�
u@:: *��<@@*,���@C���/�@Gd��x@K����}@P>��'@R�[��O-@UZT50@XN�&�ʚ@[}�X�u@^���@o@aG��[@c:qR�H@eK�n ?*@g~�m�N@iЯ>�^@lD{bK�@n��ڏ�@pȱ�Ts@r5����@s��g�@uDc�@v���@x�����@z^p�CC2@|5�S�̙@~�~<�@�J�L�@�!)���@�$"-@�=;V���@�_��#��@��.�h@���}�~h@���o:jN@�EPi��@����j<@���\���@�S��_�@���_�?�@���߈�@��,4ե@��Lh�?�@�g�c'@�4X��@�:�]}@�ܩ���<@���7��@��ei�@�{֑V@�c�t�&�@�PmRx�U@�A�ʡ_�        ?e�yyv?��H)h
?�y6q5�?����9�?ƽ�mՌ?�� ��.?�
G�x�?��V��.?���6�Do?�sE�_�?�H��?�N�����?��p�}@ ��TF�@��1ǋr@�e����@
0w�@�x�g�7@�KM�O�@�mۄA@<L�,U@��_�*@2���?}@翼0�	@â�&�F@!cp�l��@"�ߡ�(@$�7j�@&_���(�@(0����s@*�?�{�@,�m]��@. ��@0!y��@1<�(X�@2c,��@3���4*@4�6�8S@6��	2@7e���9�@8��
B��@:&P�)W�@;���	�z@=�x��@>�ø�i�@@8Ȭ@@��%@A�(/�@B��1�9@Ck�X��q@DO�ʷQ'@E8�|c�@F'r@���@G�"�5@H�C
�l@IJ^�`@J1�`Z�@K%v�L@L5�Ng@ML3"�Yr@Nh�M7W@O������@PYY���        ?Yѹ�M�?����?1?�����[?��-S��?ǭ���vh?��]���?�ŉt?��>��?��<���?�M�:v�@�y�И�@�7_��@��1�-@~�l��@P8u1�@�-�_�@"!|��<$@%�2�`�@)�����@.\����@1�g�#�@4}sdN{#@7�P=�p@:�,��@>�=�Bu@A;9^.�@C[dvA8@E��
L�@H�;g�@J�2��@M�$��!�@P? V��=@Q�\�~F�@S�c	Q�@UD����>@W"`;�_@Y�iB�\@[+9.�+�@]W=9�@_�Q�BY.@a zZCu@b?ЭH�@c�gx�	�@d�xܰ�@fT9i�B�@g��`�t@iV���v@j�D1�@l�(2���@nMP�@�P@p
'�w�@p��w�@q�<a|��@r��d�'u@s���4@t�\gv�@v
"ưyt@w'kҳ�r@xMM��U@y{��v. @z�-��@{�Us���@}<h��        ?Ocɴ��Z?~>�Z�!�?�1o���?�3��u?���lto�?�*p����?�����T�?�ӛZuш?�&��s?��z0�\X?�����!@�a�BS'@	��ӏ(Z@b����s@�>�O�(@F�5��@���A�@"t��r1W@%�5���q@)����i�@.��(T@@1e�#�M�@3�/��A�@6��m�@9�Y �U@=4�`�&@@P��ߩ�@B4�K�@D7��%�@F\��H�@H��\P@KN�'�@M�+��$L@P!�P �@Q�o����@S�_��@T��XjQ@V/F��v!@W�ٽmn@Y��1��@[x93n@]`>����@_Z�p"�@`�6�J�@a�_Q��@b��$-�@d
�vx�@e-�U�"�@fc��� 5@g�3%ԢK@h�D�W��@j>ۆfY@k���,��@m �^�E@noŪ�O�@o�y:J@p�[�q�t@q{APc��@rE� �5@sf�択@s��V�@@tº5���@u��(1��        ?�=2jM?�"�뢄`?�z����@	6��E�u@vx�p@!Ў���H@* ���]@2�3�v�@8����@?�E�B�@C�8C���@H���DX@M
�qU��@QP ��Ú@Tcte_0@W�f��<@[k�Ǧy�@_da��,�@a�I1� @d"����@f�n�pO@i7����@l ��z� @n�ߕaT�@qղ� @r��Q��@tf�(tC@v5���:@x��9�@z��V@|#�$b�@~G�l�|e@�@ȶ��@�hp����@����߼�@���Ǆ,)@��P��@�q���v�@���#@�6��xt%@���!d�@�%�K��@���ZdX�@�?�e�@�nv�1�4@�Ba+ٯ@��&ދ@��y�f.�@�޶mqZ@��q��-@���aO�@�����>I@���6��0@��y��@���}4�3@��QiM�@�ɬ���@�����@��1$�@�!~Y ��@�%r�?-1@��8Mb�Z@�X����        ?`��%Ǎ3?��brx�K?�w�bܜ�?��q��7�?��!����?�H�oD�L?��nʡZ�?���s�r&?�WS��?����e\?�p�����?�_��`�?�vj�cO�?� ,��&�@ �ǫ�@;�+��@5��;@	n@Oc�I@��M=��@PwS���@N���.q@n�a�H@���G�@�:a�c@��ْ�d@P9r��@ �$��Q@"�����@#�i�<W@%B�w� h@&��^<W@(Ŋq�y�@*�G���n@,��V#N�@.���^�L@0`x�]v>@1z=	��@2�ǂ,�
@3�6�3��@5���4\@6N9ۧ*@7�-q��@8�)9�4@:b�Ykhf@;���]@=T�=@>�x�@@;F,�q@@A��rï@A�A�k1�@B��z|�@C��o���@D���ɭ@E�u<�T@Fw/*�@Gt8��cx@Hw�T%�5@I�Jal��@J�^>��@K��JD��@L�����8@M�%����@O�?��        ?K�CW?xe+�C_?�μ���?��8���r?�%��\��?���Ԣ�!?֗ƛ�u�?��
�f,�?�Hv:�?���)�?�G7-�@��`o�@0�Ҍ.�@��Ic@ѻ`m�@b�)��@�~�m@!W�]3u�@$�tb�W�@(���Vq	@,���vd@0�уj@3o�Iz\$@6PE�I�@9tw�Z]k@<�����@@I ����@BG��"-m@Dm���>�@F���#�~@I0��O�@K�� 
a@N�D�4@P���3��@RX���@T ��C�;@U��Q��@W��M�b
@Y�6�@[�����8@]�!��cs@_↨��z@a0C�^�@bP�!�@c��K)Y}@d�-G]@f@��3-@g�+�r.@i%OZ��s@j�t���@lA�Nq�@m�}�
@o��� �q@p�[Z=M@q�L�2X@r����@szꫯ�.@ty�WWt@@u�t�j@v�h@w��+齑@x�\._�l@y�@�%�        ?U�8���=?�z�pQ?�t+��?�/��Ɇe?�R��ѱ?�3��b�?����x?匧A�d?�y%��p?�"�o�?����@�>��s @	��*�2�@uJ)�g�@�zRU��@c��ӟ@���|V@"��߄G@&%�zEw@*!�m�@.�}�E,@1��:�-J@4w*�	J�@7roO���@:��_Jh�@>@b�T@Aj��e@C XJ}��@E]Y� @G��ʊ�2@JW��F�@M��y@PJ���@Q�D�E��@S9�\<@T��`��@Vӛ���P@X�nhx@Z��\�0�@\�v��@_D�6��@`�ܹv�@b<�P�@c_��U0@d���t�X@f(P���@g�f��gv@i.�6��@jȖ
�'@ls&|Wr@n. 3�^�@o�]HMkt@p껢��@q�C�&_@r�b�2�J@s�5����@t���X�@ve���w@w4���/�@x`�r�.�@y���?�p@z����@|�v��S        ?�ʳn�\�?�����?�~N%I@�p�@M{�Q�Q@"�1X)�@#\�\c��@+cx# 2@25)�nRa@7�c�.�@=� ��@B��p�m
@F�Di��@K0pM4\@P�\��>@R�?h��@U�ʘ�6�@YDNů.�@\�\�@�@`a����)@bzDl�݊@d�LНw�@g�b2*�@i����U@lf���A�@oIh��9@q*��i��@r�!&��@tyi0���@vB$bs�7@x!�iID�@zMT�4@|&e�g�@~LG�@�E%����@�pezT;C@��q���@��P\`�@�=Ur�Ŀ@��LV(O@�_Y2UA@�~�R�?�@�y��p@���f�ga@�8���<@��Q;;@��&�'&�@�����B@���+��&@��r���E@��k� @����y�@����C@��o7A2@����9�@�����@�
�9�)@�8L�j��@�m�o�7�@��N�@���k�&@��AB���@�G
��_�        ?[���P�?��D�dmP?�Q��o�?��F��6.?��X���?ʯu�beI?Ӡ{;2��?�G�vU��?�,@I]	`?�n'�h?�p�'(��?���}о?�㧼��>?�H5J+?���Ъ@ف���!@�����@��#�^U@
�xU[�T@���E�@��3�;�@Ίgrs@�	:j�@
�ǰ�-@W�e��@����@R{"a�L@ �^U�:@!�(�w�@#`��P�@$�N�M@&�-y��O@(1|r���@)�k�P@+�'��m@-������@/�ȗ���@0͆��-#@1���o�@2�_-��@4	��@57�7��@6jt���@7������@8�ۙd��@:<�B �h@;����P@<��I�A@>h����@?���Q�@@���T�@Aw֪��P@BCPW���@Cm�@C��� @D�Q�M�@E���)��@F�ه��@Gw�,�4�@Hh��Y@I^��.Hy@JZ�I&1@K\U���        ?S�e��q?��.�Z�?�:��ݶ�?�;ne���?�|�D���?�j4�"�?܄��U�?���KP?���O<�?�p�����?�}�~kwf@)��F�>@
BLM��@���HN@�$��-@<�*2p@�f�KS@"F�r��X@%���l��@)^pۣF�@-}1�N��@1B`b3n@3x����@6&�$uO�@9(�O�3@<*���a=@?�w�U�@A��ڨ��@Ctk��@E{!WkwR@G�c�($�@I�Tz���@LMb:+;@N���o?�@P����M@R"6#!�@S�K")�@Uyd��@V��{!�M@X]tb�:@Z���a@[�Z&���@]���L�@_�yO7�H@`����@a�Jao@b�>�-9@d��-�7@e8�� �@fg߆�c@g����g|@h�\���@j/+��?@k�c.X�@l�p���@nNRJ��@o������@p��s��>@qc�o8�@r-	� ;@r�h���@s�=��@t���*        ?R)^)m5?��mZ�p?���0n?��ihC(]?êooCG?�3��?�&�d��(?�}nMp#?�Ou%�}?��{��@$!�&��@�fOjw@�ֵ���@$����e@�����@�O�S�@""@/_2@%פwu�@*i��X@.�2�l�@1�\h�@4��xՔ<@7���w@;X\E	�@?��[�@A�,��C@C���B�@FN~�@HdC�0@K$�@��@M��r"3S@Px'�C;0@R'+�H@S���e@Ux�n
�@WP�lҖ@Y@��=�q@[H��TY"@]h���L@_��x���@`��h=F@b/x���@cqA��k@d�p����@f���h@g�QF�W�@h�Q\nP�@j���e\@l.���@m�V���@ob��`�=@p�k����@qt�U�5@raPcX�@sU3'7Y�@tP{��@uS=�c�;@v]�-�Q@woz��@x�["�@y�~z4�k@zӹ	�Y�@|�<�k%        ?��L�[Io?�^�ix�b?��+_i�@$ʩ�[@s��1�@|<�i�@#��;{�o@+��^S�!@2��1p��@8".���@>qH9q-�@B�sg�@F�)	�3l@KtLln�@P;��eս@R���)8@U��g��E@Y=��u#@\��q�!@`FD��nF@bNDHeL@dym��w@f� ��@i=[�@k�Z���@n��y�F�@p�\n��@rD�񪉰@s�;�F�k@u����|�@wP^ݞ�!@y'� &
�@{�إ�R@}G��4W@, l6�K@��-�Ol�@��L+	�@��~Wm�@�0��;v�@�s�e$@��ť_�F@���\C�@���l�ux@���5��@�o;M��@��]h̲�@���i��j@����Cs�@�nqT�/@�K�����@�.�#f=@���f�@�ľ�J�@��Y���@��x._Sv@� /g��@�
��a�@����)@�3g��|C@�Q��A�@�wj,_�H@���j�-4@���g��        ?d��b��?�EkV*P�?����S?��01�?�Cq�p��?���}Fv?�Fd����?��2��$�?�Z��g?���^9b�?��|O�z?��;��?]@���Ɲh@�W���]@
����Y@�b�2S@֐`�D@�/e_G@��bc9@������@�h��]@ �e�&6 @"�<Ÿګ@$�����@&�Y��.@(ѱ�<�@+�gr�@-��I	"n@0QfhV�@1Std��@2�����@4
?T$@5�Y���x@7���@@8���(\	@:GZ�CCo@;�]>H&m@=�1��+-@?x�E6@@�����@A���L��@B�����@C���G,u@D��0'9h@E���8@F�<��@G�� @I�a@JD\=x��@K} =��@L��y��@Nƥ�Z�@OW�]� @PX\F�l@Q��W'v@Q�����o@Rv+��>@S2��J�@S��� �@T�~�e@U�|�)��@VN�o�g+@W ��        ?e�C�<ق?���iEw?��Nfx�?��.���?�D���}?ݗ� ��?�e wa`?�r�y6��?��]Rx�@'��j@�ܳ��$@@��@;媼oX@5{�tx@�[7�Q@"UM0Ye1@&"뉈i�@*o��f0�@/B�(zO�@2P��)�o@5I��	,@8�C��@<"���K�@@���!@B (�W�@Dg G�Y�@F�i��=@Ix7Lb�2@LD$g���@O=ٴ��@Q2��_(@R�r�*�@T��D:H�@V|����*@Xo����?@Z{
��5@\����@^��Ai1@`����@a�yo�4�@c�� ��@d`�\ธ@e�����@g%�P>@h����<@j�r��5@k�f0 ��@mB`�ӿ@n�ˡ�G/@pM�>���@q-|��T@ra�W��@r���.�o@s��.��@t�Qb�@u�B�K�@v��l�/�@w�m�S�@yaϗ&@z$��F��@{C\r�2)@|hb�vF@}���^zW        ?[��G0?���2��?��4�[��?���T��U?�N��4�?��wYhh�?����?���9?���F�(C@ U�NJ�@�8�: @e0�f?@'����Q@t�����@�:�Z�@"�&�{S@'55��Y@+�T��j�@0y�x4�@3d]u�@6�v�{�@:'��%�@>�T�x@A[���@C_�_��@E��z�ֻ@Hl��@�@K6�x�Q�@N.�1	��@P���ᎈ@RU���@T[��@U��pu�
@W�Y�S�@Y�QF�C@\�B`3@^I{�$��@`Nc�l?U@a�m�L@b��&�@d�ڿo@eq�����@f�'���z@hOe,(,�@iх�/�@k`�hg�@l��W��@n���3@p.'hʪa@q��E@q�[��d�@r�o֢7@s�5tG�@tٳ(���@u����`@v���k~@w���r@yuီv@z-��jɻ@{SVz�ټ@|��6�A@}�����@~�V��        ?�Ic�/�?�RK^��@(��aO�@�j��@!����t@,�§�v�@5�b�'�@=3!�n�@Cp���@I��|� @O�_�/�@Sf�,7,,@W|��X0@\0n���@`�o�.��@c@��n�@f<�^��@iv�A�|W@l�h�ds�@pV}˴�c@rU0��@tt�(��@v��&��Q@y^~5:M@{��� �@~Cg��o�@��f���@��d�տ;@���WLj�@�q����@��#�N��@�{�{��@�GIA�@�#�5��6@���u06@�¼t�"@��2�"�@�$��k@�?�kģ�@�d�E-Ϗ@��9�i}�@�˂=6�@��%Aؔ@�Ye
���@��!����@��un @�x�����@��|�c{@�5Mqo/�@���t:ɩ@���/(8�@��{s�m@�eI'J@�>PzF��@���T@� �7�@������@�ֹ0�:@���ab�`@�6w�(@��vd� @��ե<�8@�̮ kK�        ?eI�V��?�6M�5�?�k���]Y?����h)�?��s?��)��?؈��T�?��O?�Q甌��?���/v?��yЃ��?��*�g]�?�8��GDP?���n�@2�-r�m@p� !@3���Ƕ@��5(�@#���-e@{���@���2ƕ@�B[jO�@n*�@R��,@֣t���@y�8ß�@!{]/A�@"�+�t@$�(ٰ>@%�{�¯@'E��
<^@(�����@*�g�@,�ug�?�@.r^-ѷ_@03iN�*t@15�#��@2@����O@3S�v��e@4o��q�@5��JW@6�*H,��@7�0p6�@92�C�I�@:x���@;�u��V@=� �� @>~u
�}@?��Z��@@�h_
M@Ah�!Xe@B*@��B�@B��C*pz@C��c��@D����O@E[����@F3���G@GɌ�F�@G��p}&a@HӅ&�@I�~�`�@J��=�~�@K��P�T�        ?L{c�>�?y}�iHgQ?��`��?��uw(?�n�fQ�x?�� ³�e?�m芀=�?�Z<2��?�HL���Z?�rpV���?���y�@�{Qb5_@m�Yp5@�jM�@��@�5�@Mկ~r�@m ���T@!K�	�@$f̴*�@(ys�r@,����@0MT$g�B@2�i��H@5o�)�s�@8XTl�G�@;|�D�>�@>��z�I@A@���P@C0�=DI7@EA�\@GtHz< @I�\>M��@L>����S@N�m�ck@PɣԸ��@R9E���F@S�ɡK�@UNY�/@V���w�@X�27��@Zv��{7�@\S�֗�@^C����@`#~�2�@a-ʇŊ@bA�7�6�@c_��> �@d��ӊ,
@e��e=l7@f�#��"�@h68��Sk@i�����@j�m)
�9@l<��� @m����"�@o*".Y7@pMK�PPp@qf����@q�f���@r�N�/�@s{5�m@tR�7��@u/���d�        ?I��l��?y� נS�?��k�m�W?�Z�C���?���α��?�CƣQ��?ړk��?���Ɩ?����?���K��"?����� ;@=҂�Y{@�	*#
�@���B@�U�@#�hΘ@!9����@$�D�m�@(��V�@-n�5x@1?*ZQ�Q@4!U�D@7�vM,@:y�+G<@> ��ۛ@A
�<��N@C,�Zf-/@Ewu�<@G��%�k�@J����S@MT��8;�@P%l�d\�@Q���QH�@S_S8��@UV(qd@V�	!�%@X�|�<t@Z�7pW@]�	]B?@_@�1�p�@`Ȑ8i�o@a��Ts�@c?6n�_@d�ף<@e��@0^@gRcF�Ԕ@hȑWc:�@jL1n��@k�d��G@m|LDj�]@o)	D�!@pqނ��.@qVD�.�@rA�{��@s4x���@t.h��K�@u/�1٧�@v8N�k�@wHf&Dz�@x`@b�\@y9�>@z����i@{Ա����        ?��|��J�?��9���?����{�@�:Va�'@��o��[@���K�@$2���@+���v@2�{���@7�	j�@=�y���I@Bh+}@F@V�k��@J�����@O8J��g@R.��a@T�:�q�@X��-�w@[I�,_q�@^̀���@aF�Fy��@cG`��@eh����@g�J��ȑ@j�-@l��V�K@o3�2��@p�`5�ܫ@rqʹO�@s�YR;h�@u�,%o@w6d��o�@x�$ے1T@z�����@|��hd�V@~���&�@�D��� @�N}���@�a�����@�}����@����+7#@���I���@��O�T+@�M�a8k�@��rL�5
@����c��@�M��hc`@��.i��@�(\�>��@�RTyȷ@���k[@�ܡ���#@��:BZV�@�z��LxG@�Q$7S0@�,uz}�@���d+@���k�n@����R�@�ʝ�àM@��`�G)%@��<w@���BK�        ?R���M��?~�5jj�?���4�??����)?���Ί>?�"<��O�?�$���?�@��e?ܨ��+2�?⫻OY��?�F��?�_�~�x�?��)U*q?�{w��Y�?�u�	� ?���cN�@S#��E@�Hw9�@�T2�@	�nʁ��@,�Q��@\Ɯ��@B���H@H���@n �J�o@���啟@��឴@�V�YY@ (�z���@!��%��@#dF�b@$�M���@&-��|B[@'�VN�xa@)��l
��@+lO�s@-P��Qy@/FN'��@0�y,Y�@1���� @2�����@3�7�*D@5� h�F@6H�6�<@7�#ԕ\@8���(�,@:��h�:@;r7kx�@<ә�ݗ@>>i:�X�@?�{�9�2@@��T�@A[1���Y@B#Ҫ2@B�Wjv�@C��K�#�@D���Zh@Eq,�Aٚ@FPU>c�@G4+��@H�<��:@I	�_��@I�Ђ�s        ?M8G��:?y�^!�{�?�Mhޱ��?�)۞>�?��ǻtn�?ͱ��T�?�"�1��?��-�O�?���#��?�V53�?��~eE�@�Y��,�@
!�ƳӐ@̆qw�@4<hV�@VY�Z@ �iK�m@#~�<j�@'N-/�i@+��W?@0*�\�4@2̥���@5�����@8�F�}� @<N��~�@@�]@B
�G��{@D6W� t@F�8u��@IR�Ƥ@K��Yf��@NL�s��@P����@RR�vrR@S��l��@U�cl��j@W�5�V��@Y�aɔ�@[�&ǫ2N@]����4W@_�k��@a�����@bO�ۣ\@c�F9!��@d��l��@f6U�)x@g�E8�@id��8�@j�TK�vE@l�k�%�@m�P�Ƴ @oVz����@p�?x��@qc��̨&@rI�s*�@s6�@t)YM�@u"���t@v"��7o@w)}�	�@x6��ʘ:@yJ���I�@ze86k        ?PI=��5?}�+B��~?��"f5�Z?���֌qY?�m-�%��?Ϯg��z?�N����?�peNj��?�-�����?�dǔt��?�X���t@��X.�@	��ǀq	@N{�P4@y ٩�C@Od藻�@ݨ-�0�@"��U��@&'b��@*#Bպ��@.����e�@1��W��@4f���0@7S���@:����	@=��~�R,@@�����@B��Q�_�@D�㭉j@G/J4��,@I�#B2{�@L$4_d�@N�TV�V@P�'�@��@RX8�Z�w@S��o�*@U��Z�@WO�BT<9@Y�F� @[��V�@\�vSOi@_&�È�@`��W���@a�"��!@b܆��@d�O���@eK��kp@f�7��)@g璍�N@iF"�6�@j�����@l%3�|�@m�ڞ\��@o2�L^q@pd�Ȭ�@q6����@r!},w}@r�n@s��&On�@t�W�n!�@u����aC@v�'تS@w��m��        ?��)?VF?�*�����?�L�47W?�g��'?@�A���@��r3j@щg@#� ��^@*�jj�ĝ@1`��ڶP@6@5�@;t����@@�Z���@D&F�=2@G�r�u@LjaM@PO��<�@R̖�X�M@U�	�	��@Xkƶ�$@[�����@^�?��F@aF�׺P�@c3"�?*�@e>�����@ginhoJr@i�P!��@l�,�s�@n�N� *�@p�=��@rܘ�B@s�<!<@u��
@v���S�@xS�iJ>�@zia��@{�Ik6�@}�]d�"�@��n��W@�Ҹ�GL@��M]�@�죖=��@��ƕ_h@�)����@�U|	Ϣ@��i� @�ǟ��5�@��?&�@�]K\�@��~[ХG@����͠@���"�^e@�y�̒t�@�7�@	�@��k6�Ne@��x�*@���� p@�]9��,@�1�q'@�@�C��@��&%gUQ@�ˣ�MY�@���d��E        ?c��j��?���k?��D?���?�c)����?��kad0�?Ї���^?�0d�qc?�47��?�#��*,?�a���?񹛉��?����g[R?��[9?��l�ם@�\)�@�vو�@6v"l@TG���m@�=��FW@T���_6@X `N��@{O�?�4@�����@"6�n:�@���F�)@L����@!	yﮘ.@"}�!�w�@$z���@%���E�@'CiVf�@(�AcZL�@*�P��a>@,���8@4@.�� U��@0P��<a�@1\C3�ʀ@2qGd!�x@3���E��@4��bK�@5��?�@7#�}�
)@8hJCp��@9�5)�"K@;�nZ��@<n�@�15@=�O��Tr@?M��p@@e�����@A)�磰g@A�M߄L�@B��k�t�@C�U�{�Q@Di�NH�(@EE�	�;�@F&͓̃�@G����@G�y�Qe@H�<�ͅ@I�=S��@J�cu�QI@K�M[���@Lп��ż        ?[O
�ݏ?���-[�F?�>�H+?��o	�I�?ŷ7PL�?�Gݍu*?߁�k�h�?�2|q��?�C�p(?��Ï��m@ ���'��@�h���@A��b�@���|I@?%���@�R���@!^sUl=@$պ�Ւy@(��}��@-����@0�-�5@3��H@H@6kh���@9��+��\@<�o0�Ս@@H�D�~6@B>Y|�Y}@DW)�"��@F���2R@H�� �&@K}<��@N*����@Po�� @Q�0�a� @S�࿅�<@U4·�s@V�|7�b@X����@Z����}@\����@^�l�z2�@`f��+y�@a�y�-�@b�>LL @c��@e�挦@fe/ٽMJ@g��!P}�@i��U�@j��H�.@k��~��@m~ft��9@o�ޅ��@pSf�R�@q&hB�|�@q�h�Z��@r�tp��@s×c�/�@t��9��}@u�U�ʠP@v�
����@w�
���L@x�b�bG�        ?_u�}
?���A�h�?�,r[�p�?�����L:?Ǎ��UN?ԅ�?���?�r�9�Q?�ʎ����?����ޛ?���2g�=@ �ȥ��@���O@�N��.�@�#L�r@@��\�@��X#�0@�7�]\@#6.s`@&�UdV��@*Q����@.��H��<@1�/��6�@4�s"d@6խ�=D@9�̡%@<�!����@@59|l�@B
�I��b@C����C@F����R@HJG��Te@J�/�Bm@MԲ�B�@O��<)	�@Q9v{#�@R�]��@T+aWί2@U�R��G@Web띸S@Y��\��@Z蚟��@\�f0�8@^�z�s @`\�tƛ@ah>�_�c@b}C�_`@c�qrB�@d����@e���0B8@g4W�@h{K�e�@i�x�@��@k'��C�9@l���g��@m��9n%P@ox�Cbe�@p~�-�Z�@qF�<Ū�@r�����@r悀g<@s�`���@t����F�@u~Emj��        ?�+m:U��?�3��9�?�K��Fm�@��Kh��@1�u��b@!�3�l�@)����%�@1���D@7[�C��@=�Zb	@B�ݷ�C@F���f�"@K�+�pR@PN��N�@S�V@D`@V'�S��@Yu5Ѩ�@]�'��@`k��-ׇ@bwvA9@d�C��t@f��d�m�@ik����@l6_yk�@n�֬{��@pҒߓH�@rV7���@s���'�@u��J���@wQ�Î�1@y �<��@{�Ц�v@|�eVJ@JZO� @���6#��@����cF#@��t��?�@����P�7@�)W>���@�h�bD�@������@���Z!�@�aʂ�Po@���sD��@�:"�8@���U�5@��9��#@��ς�F@���d�@��P�0�R@�]	5��J@�:��ӏ@�Gw8-�@���߫@��j
�@���ʰ@���<�~@��i�BA�@���F��@����,`�@����|@���Wٰ@�`)�~        ?V(�l���?�Zۭ�lc?�IpC��?��� ks�?��Ŧ��P?���1�G?�u�0~�?�յ�1�?�jXlpP3?�)ܼ��?�O��קP?�,�2_"�?�c��x{v?�U�r�?�%�=�}?��Bf	bb@�{��@k��J�@Lk��!@
f���@��S�*
@�2h���@�Nև�@��&;�@�&�-��@-���O@is�1R�@�9�@ P5_��@!�P$���@#2�^�4@$�:-X�@&_����v@(�سd@)��J֒�@+��2�7�@-����@/���g y@0�rŭ�@1��E��@3����	@4E�/�I�@5}s"��g@6���C@8be�25@9i�����@:��D�@<A���lw@=��O@?I����@@o��q]�@A@ϔ�@B���D@B�V5퓋@C��5�3�@D��@E��w�L	@F��A�m~@G�x�7@H�tʴe!@I��0���@J����M�@K�_(��        ?K�7���?x�d��Z�?�ZO��X�?�����AL?��7���?̦?��?�D6�ɧ�?�)Մ���?����N?�sWK+?�^��+O'@|�d�@�?�@V@����@[Y-"@�՗t�e@B�P6L�@"8��X�@%��*�s@)�7��Q�@-�Lb#84@1O�3k@3�X�yo@6�I�Z�>@9̧���P@=圂
@@W!��@B@Ϗw��@DLV����@Fzl�i��@H���I �@KA�MV@M��3�4@PL���b}@Q�V��%@SD���v@T�6�ދ@V�>#@XL'�M�@Z!X֙ލ@\J��@^
e8@`	U|�@a#��{�9@bC1?���@cm�`��@d����@e�ʹ6S�@g/�2n�\@h�(ɬ�3@i�$+�@kX��N,@l���5�Q@nX��U�8@o���b�@p�l�2�I@q�|ªz@rt�:��@sU�&��@t=�7k��@u+Z4�$�@vx��A�@w��x        ?Sg�aj
?��+'�?���Y�
?�(8pE�?��3d���?�%�k?��S��?�;h���?�Ͱ�J�?��JL:�@���o�@��?��\@LE�r�@�k��h@K��4�G@ H��4�@#�����4@'�!l�A@,�)��@0�=rCv�@3�/�I@6�R���@:[����@>"vر�@A���V@CT�/�]6@E�8c��@HEq�Q�%@K ^ ��5@M��Fb@Pd,�T�@R!�6U9@S�d�⤾@U����y�@W�߆h��@Y��u���@[�8nq@]�#�@`��Oc@aG�HK�@b��V�y@cΊjyc@e$�ę2@f��A��@g��xtZ@ir��,@j�M�$M�@l�I��5@n1ل+�@o���(B@p�T���I@q��\v�@r����ZR@s������@t�"�P�@u}�T�M^@v�43�#s@w���}@�@x��#n/@y����@z��\�7@{�{Ϫ@}A�7�        ?���_s��?��ί��?�y3�f�?���
~p@7�V'�@��2`�y@5��7�k@$���Ӧ@+ޚ�3@2:����@79�����@<��8�@A���)i@E\���K]@Ij���{@M免2��@Qh�J��@TM�ӻ�@W�%0v�@Z0�S�e@]��ju�:@`�4_[��@b�N�~��@d�y1.�|@f�]F�d@iN��~��@k��4U�@ny�G�L@p�u�"*@r:�-�@s�:�<~�@uKL�~ze@w �*հ@x�����@z���?�@|��3�@~��և�\@�c��}�@�~z7>�N@��� \�2@��I�!nz@�~��0�@�\j���@��.���@����@�~�I�Zf@�������@�|ʹi�@�7D�@�U��[�Z@�*��d�E@��D�@��Lk��t@�άs��@��)*�u�@���'�v�@��p�d\�@��;���@��"�z�@��&���@��IZ�+�@�� >@��t'        ?f�ŷ�:�?�ۯI��?���->b?�{x,�%?ǌ��[��?ұ����?�x��1�?�1���g?�uC��?�n>�d�S?��{4�?�w
_��?�խ��o@e��3w�@�zt�@	GۏS��@1�)e��@�+B�M�@�'Fȫ�@qX���@0�{"�@�#�ǫ�@ɬ�m�@ t��-�@"��fw@#�5�و"@%�d48�
@'�pKE�/@)���mU�@+��_�R@-�����@0ϓ6�}@1B��-,@2~��eYn@3Ɛ�K�@5ƻ�V�@6{3��e�@7�����@9`�l��@:�L~��@<xA�k@>�=��;@?�b�A�@@�eJ&	�@A��&_�@B�K�(��@Cyd��@DoC�<��@El�ěK@Fo_�)9@GyE;]*c@H���n�@I��:q��@J��Y̧�@K㉄T�v@M"}ϐ�@NA��C�@O{c��)~@P^"���@Q9�cF@Q�5X\�@RU��a�@S���T        ?VĕJ�;?�F�C�?�����?����i��?š��s?ӫG?�`?�]ڭ�<?�|�f��?��^�,��?��`w�$g@d$៌{@���,�@>�i�@rx��@�35h�2@��� 8@#K�mb�@'6%vYN@+���@0B}m*�@2�d۠�S@5�.>d�"@97�BP@<�C<cV@@K=�W�}@BZ���S@D�-cc��@F���rv@In�4M�@L�k�=@N����U@P�\�.�@R���i¶@T)?��T@U�|0���@W�uE`��@Y�O�J�@[�.����@]�2�$4�@_�{�+8�@`���.�	@b#�'
�R@cU�<��@d�Q��b@e���*�@g,��I�@h�S]�@i�R�@kgCq�@l�ILf� @np�f�~F@pj	G��@p�,.cK�@q��{�q�@r�2Y>�@si��T�"@tQ����,@u@[�HqG@v4�N5�@w/�f)�p@x0�φ�B@y7�@d�@zE\Hk��        ?S�FH3e?��$e�v�?��жpT?�਋>�?�~�B"?Ҟ�	KK?����8�n?�`~�l�?���!`�(?�K�+y��@]�~9H@/�K16@:�m�@N"��@8]W���@�vI�œ@"6�2��s@%�^�ؚ@*�G��M@.�`z{�@1��_��@4��c>�)@7Ɓ��V�@;�i��@>��
�)@AK��7@C^���"�@E���TM@G�g��@JqQ�B��@M�Z�,@O�HϮ��@Qf�C@R�4�@T��Z�@V;����@W��,�Fp@Y�	�{|@[�6E��;@]�!��b6@_��.���@`��-��@b�o��@c+i��ƛ@dWk��]@e��/�a@f˻�PM@hY>I>@ie�1Q��@j��7s|@l%̗m�@m����FU@o�Mz�@pFoF1 '@q�.'��@q��l�g�@r�Ȥ�&@sxq���L@tP���@u.�i@v'���@v��$A@w�\'��        ?�$��qP�?ܰ!-�`�?��X(@53j���@�?T*$@ ��{��3@(�P�g@10>�&��@73Ls��@=��7[�@B���B�@GG�")��@LGqU5��@P���8A�@Tf��s�@Wd$�~�)@[b� �@_]�QZ�@a�=��@d�I���@f�Irߖ�@iJ�~8��@l)bo ��@o6�s�@q8�ѱ@r��8�=@t��X6*@v��ꁡ�@x�����$@z�-Ѫ�@|�V���D@'c�9@���~� �@� �8 S[@�J
����@��m�|&@�Ć�{�@�t+%��@��=� @�|�ZR��@�O�`�@�����T@�n�~�#w@��X���@��M�Y~n@�oZ�:k@�e����@�b�h�@�g}*+�Q@�sS8}D@��wYo�@�����)@���_*
�@��`�*�@�qa���@�V32{ߊ@������@��%j���@���&Q��@�C���@��>�/�@���Cr@�a+{F=9        ?V��|mn�?��0e�	?�U�@?�$���7?�_�P�t%?ǹ�1�C?Ѯ	V�Q�?���d%s?��cW9?���^SP�?�� tu,?�0�f�%?���E�?�#�複�?��U���@i�[��H@*ҩ��@%�����@
Z��<e�@˷r�qk@��F�9c@�q�7�@�퓙�g@�v�@P �lG�@�Q���@[r,��P@ �x|��7@!�"@�@#s�G@%Y��W@&�˦=+�@(V/>�7@*d`��(@+��OcJ@-ا��CB@/���.�@0���@1�����@3E|���@48�k��M@5c��:��@6��?�@7��[i��@9�o,@:k�����@;�?9�@=(B�Ǜ@>�θ��2@@v�^�@@�Uf���@A����)@BS�d!&r@C!��e;@C�1k�2C@D�FP�ݿ@E�1���Y@F��1�8@Gr��͓@H]�c��W@IN-+�1�@JC6�Q��@K=�-t]        ?I���Jf?w�+�!E?��TA��?�*;,^�?�)+��O?�Pc��(?���﴿P?��h�e?�aG��?�c�a��@?�FU���M@��#��@���K�@k��si@:�>b9@�̒,@����n�@"�ʹ�n@&;�̧@*{8JNN@.���Ɲ@1��tH7�@4g��Hɥ@7U�o�Y@:�YET�@=��2�+@@Ԟ��@B�hV�i�@D�O@G5�y�z@I�x�k@L-�^�+�@N��)߬�@P�XK<��@Ra���@S����55@U�+�k@W`,6��@Y48�k
V@[�ڧP�@]�$ʚ@_1�,�@`��t��@a�q� ��@b�͢��@d3��#@ew`�k.�@f�ߓq_@h"Z����@i���@j�̙*�@l~�F�@n
�u1��@o����A@p�[4@q~�Rao@r^�J���@sEC�5�@t23`�z�@u&��k@v �)��@w!�j�@x*
�u��        ?K��EA/�?y��?�Z�x??�q��ք�?��:ڛ��?̋���'?��qa;?��Y�@�?�@�9��l?�5�e5;?��:5��@�i d^�@��9H�@s�>�N@�N��G�@�:���v@閳�Z@"��@%{{��z�@)WSlf�@-����&@1*�#�@3����+@6�Ė��@9���f{@<��Okw@@:��_1�@B!�o�j�@D*���@FT�;�)@H�w�В�@K�[[��@M��(4!@P1}���@Q�"Aa��@S#���@T�`GJ��@Vb| ��@X?fNQ�@Y��aN�G@[԰$_5q@]��߈�@_ې+�Z�@`�!*t?@bٕs�@cAG\�:w@drt-�i�@e�|u�p@f�|F�_@hG�FB��@i��{�@kZ3~%�@l�E�^��@n �hw[@o���B�@p�$5�@qbU� ��@r9q�JX9@s�<�69@s��| e�@t⨹��@u��!���@v��%g
        ?���VL�?���%��=?��ZHo?�H�q:�@�W^@f�,"�@M�{��'@#!%S�n@)���V��@0��x�@�@5 ��b�@:.����@?�[�N��@C S��@F����8=@J��)�}S@N��$��@Q�.��(@T4�~끥@V�+ӒQ�@Y��z�@\�
��L@`@����@a��o	/�@c�#��J@e�xN].]@g��P-Mv@jsb-5E@lQ�˦Q@n��R��@p�|�1`"@q��Nd@sX�%��7@t��M�M@vJ%�#��@w���^@yx,���@{&N!D@|��J�
@~�eQ�@�GJS��@�=�"�RE@�<dR��s@�C��J@�Q��� @�h��s�k@����i�@��j�
�W@��L��{�@�� VDR@�Xi�q4�@�������@�󪪩w�@�N3��C@�X�ED�<@��x"2@����"�H@��e�8��@�JJ�#k�@���LFX@��ٗ@���d��@��R��        ?n��I�E�?��^���?���e���?��yz��"?�|��E{z?ӿ���q?�s<�ݴ�?�q� �8>?���t?�H_�t<?�@�b��i?��
���?��s��t�@�O0k@x��Ð�@��U|��@$����@��Q��@md�S�@���h�B@�F��-N@5-����@��0�@f�Rh(@ ����@!������@#�E��@$�)��+@&d�Yf��@(#�>���@)� �\- @+ؑ�ɉ@-�8k�VB@/�+���@0�@ZIÍ@2�#�f@3.LO��@4W<��VO@5�{���n@6�m��@8	���-x@9XA/�X@:��ZLm�@<�G�B"@={J&�Y@>����2@@6�aY@@�/�F��@A�����@B�y�A�@C^���zN@D4`��@E���"�@E��+��@F�̀�]�@G�Vf���@H���
�@I�����a@J�$���@K�yI�(�@L������@M�F�>q�@N����        ?O-����?{��wS?�r'���?��J�5�6?��6��D?����*�?�@;?��l:��?���P�?���N���?�=�x@9󳸍�@����O@�W���U@/'�V�@��{���@ %s�b@!�s��.�@$ᐟ ]�@(�d+�8�@,ߵ:��@0�U��{@3P�~,h�@6;ю<�@9$3��X@<m~��@?�ˁ�K�@A��l��@C�֌���@F����@HlJ4<�u@J���9R@M}v��@P����@Q��S�@S��^I@T��9���@Vc��P�@X&�^ɤ^@Y���-�F@[�J,�N@]�f_%�@`J��%�@a��@b:r#�@cfy+���@d��"��@e����@g/�m���@h��/ܠ>@i�C��sj@k`؇c�@l�d�Y �@nh�+�u@o��w��4@p�~l	!@q�Z���@r���u@sh��@tSO�tv�@uD*IE�@v;�`Uϫ@w9�T�m�        ?\��<�«?������?�ͅ��?�m����?�wk��DP?֗ȮC?�k+�p?�4���d?��$ ��?��_ �@���@	��2.q�@�^5���@Q�Gy�@����@ W*hK�@#��E2��@'��ɹp@,*�Vl��@0����B�@3C�&�l@6B75O��@9�\�rZ�@=6��/A@@y�I�;�@B���l@D�8����@G,S�/��@I���v�U@Lk�L�=�@OIb����@Q(32�	&@R�� 7�@TnD/�;@V1 �F�@X	a"�[@Y�%��2�@[��[��z@^��H/@`!B� <.@aC�;y�e@bp󋫣C@c�?�km�@d���@f:�MTZ�@g�2>��@h���y��@jhj���@k��`�@mhKF7��@n��P��@pJ�B�9�@q����@q�J�<�@r��,�y@s�X@t��-$�-@u�>N��@v��_s��@w����߈@x�Cf}��@y��W�0r@z���f�        ?��~g��?⼭C��?�����3@KӪ;./@���Bܺ@#��B��@,���ȥ@3�\�U$a@:L~/�-�@@�yW@EQ���@JD�lȚX@Oӹ���@S�bi�&@Vm#5ڌ~@Z-�ˎ��@^F�?���@a\����@c�� �;@fY�Pe��@i�֌��@l�h^@o<�)Z�2@qJ�Sb@s�(;7@@t���i�@v���l�m@x����K@{%eb�>�@}lN�-�W@��c|>0@�%^(�p�@�qh�`��@��DAG�@�3��$�@���R�j@�-�θZ@������@�`��rE@��Y1�@��WH���@�M�_��X@�;�L�@�1>��@�.�A�t@�2�ơG�@�>��bտ@�Ro��P@�m�.�+8@��+<�&T@��9�2��@��&O�@�)�u��6@�l��l�@�����H�@�IG�ix@���T��@�dh���@�<}��@���C�'�@������@�T'KUry@����$        ?j�?���W?�w��G�>?���'��?��!��A?�bDj�?�s���?��=�I�?�#�w@�?�O/.[�J?�7S#�?�Ck��W�?�����q�?��w�U@@��k���@�&\MC�@��'�7@�:c~�@�M���W@� ̈́A@$��ш�@�PS>�@A�^�@�|sf�@��:@ �����@"^�U.��@$�%�@%á �-�@'�k���@)|c^*&T@+x��8;�@-�w��@/��g>e@0�R��7!@2 �L��@3T�@׻�@4����ߏ@5ݼ5�@72�A�;`@8����K@9��� �@;t:��@<��}dX�@>�v>h��@@@�*b@@��{�7@A�[MN�x@B�0�i@Cvf b�B@D_����@EM���@FA�6��@G<-4���@H<N�C�@IB]�{�<@JNa��Q@K`_dK&%@LxZ�C�@M�U��-;@N�RX!P�@O�Q�V�@P�+H�{@Q%2�Zc        ?WE�d�,?�l7��^?�����?��LT��?�����A?�3.}��?�vՎ��?�Z���5�?��%���?�WJ�ɺ�@T��Q#�@&�ݤ@�FV~�j@7,�Ы@��.@q(�l@!�W�(@%2�w*@)��a��@.O��i@1��Lh@4E��x�|@7G��0C�@:����!?@>�ӌ�7@@�Z6���@C	l ��*@E?J�m\@G��k��@J0
�@L�ssM@O������@QM*xJ�5@R���y"a@T��B�C@VD7��4k@X��Ӫ@Y�R��p@[�=HF#@^�����@`�d+#@a9��栜@bc�5�@c�Zbu��@d���x�+@f%�m���@g}1@hߪ���(@jM���s�@k�]Ѫ�!@mL��d�@n�y �zS@p=5���@qBRm�@q�gH�:I@r˃~��@s��m��@t�öA�@u��96��@v�I<��:@w����P/@x�`O5ϊ@y�<V�B�        ?_�0iE?�h���a?�S���q'?�S�� q?�[�!�N0?�(/W�E?�]u�S*?�
-��~?�����b�?�z(�^z�@Mw�u�@�:��u@VW|��@�g�gA�@w=�ӛz@!p�i�@%ۓDd�@)2��D�@-ˎ^g�@1rǵA`�@4B�Fo!�@7W�IU�@:�4�~ �@>U��q�*@A!�D���@C>]��>@E��!1]6@G��H��O@J~*�0��@M8�[l��@P{MU4@Q�f�8��@S1�Ͱuo@T�WERxg@V���؏@X��m�@Z}��/��@\��6n�@^��;J&@`s�JS@@a�${���@b�iV�<7@d��)(E@ea����@f��mZ�@h#.�c`@i�n�
G�@kφ}@l�[}ɥ6@nC1p�� @o�n9v�@pіJŦ�@q�{{$@r��'�uT@s����d@t��<JO�@u�K<&�@v��Q[)@w��7��@x��-��q@y��Ti@z߶���B@|�*���        ?�ݤ�{�?⾓Z�5?��(I��@���<&@Im�o��@$�ş��@.�O4�U�@5L��[�@<gt#z@BW`��@G��(dD@Lz�Tװj@QCt���d@T��X��@XX�bgl@\m��rmr@`q'8oG�@b�C{~�@ez�(@hJ�VP$�@kO�|��a@n���M0�@p��b�c�@rЂQ�P@t����@v����y	@x��:ƿ�@{:�=�,
@}���5��@�7l�1@�`d)ːn@���Cq]�@�/�hӏ@���F�Ʊ@�<c���@���G�E2@��xv�*@�HA8��@�^�Ѡ�@���s��F@��N4H@����4�9@��Ԧ]S@�*���@�(�P@�J����@�u�-�UZ@��i�Z�W@�����n�@�+"ÿ�:@�y#+r�W@���F5�;@�/� 1ۖ@�L
��W@������@��ߏ?6�@��w�)�@�I��T\+@�
ɉ�_@���;�N@�����<@��}~�d�@�j�7@�@        ?[$��j?��D�iW�?�xv8�?�������?�l�j���?ƶcR�?�ǋ���?�o=�P?�^�g{�?�Qo�B?�R��Ƚ?ﮍ�Ա{?�;uh�Y?�-d��?�.��$�?�����t@c�9S@�[ƫ@����@;5*�;@��ԅ��@#���_�@�Ę�8@%R���@Ua���@�$�-V@�:��@�ȭb�@ ���IǶ@"M����@#�%7o��@%&����B@&ƒ���@(x~�`d�@*<mO�hn@,�dv��@-���G�@/����@1y/��@2p���L@3*é�@4My��5�@5y��a��@6�'�)_|@7�&ߣ)s@96��C��@:�t�8xY@;�dK30@=Hg�_**@>�o���Y@@��:1@@�;��C�@A�3���@Be���@C3��&�@D���8@D��G�f@E��E�X@F�T�K�@G9�y�@Hh�0���@IVa��zZ@JH���+�        ?U�A|M$?�.J/OK�?�Ƒ���?�v�%p?���~+�D?�z=��z�?��"�C��?�앍l�?�=���̴?��э��?�-,�U3@����?�@T�r��@�Qnk@e��9B{@���&�@����@!���� @$�?$���@(�4(O��@,���j�@0���\f@3"�\�D�@5�3m~@8�Cyn8@<!C�ߛ@?�'�Ls�@A�d�y�y@C����@E�h�͏@H>p���@J�d�9 @MXDdX�}@P�����@Q�����@S�N��@T�uPS�@Vts?mj�@XCV�w��@Z(h����@\#��w��@^6$%D�@`/��m�@aO�^���@b{��_�@c�T�6~@d��~ �'@fF}��� @g�2o-�@i
A�@j~X=Ӻ�@k��ged�@m���;�@o%��ǝ�@pf"
��7@q?�c�{@r���/�@sC���@s�J�+��@t���W��@u�c�J1@v���Ʀ@w����        ?Mf�����?z�;?��?�X�V�P??�n��U�J?���غGN?���a�?�2�K]�?�ɰ3��?�,?�=�S��?��Qݚ�@�f�T�'@" �da�@h}e�B�@�x�A@+�����@ ��%$�x@$y�@'�t�"��@,0eEJ�@0}����@3!H&k�)@6N7Iv�@91sC�b@<��A��p@@-��,\@B/y����@DW�4�.�@F��/��@I��Y@K��M=�y@N��9���@P�҂-��@RTѻ�@S�q/孒@U�"~��@W�Rr�E@Y�l傄�@[��ѥ&�@]��.��s@_�1�x�@an���@bQ��w�@c��g���@d�>+�R@fCs["~@g���v��@i(P��g@j�"-���@lD)��(@m�.�d�2@o�u__�@p�!��|@q����$@r�H�Ͽz@sv׵)�f@ts�M�7_@ux�;��@v����H�@w�΂�ߍ@x�a��@y�pk��@z���K�	        ?�]Ȑ�D�?��Y�ͣ1?�=.(.h?��9/�@Iq.q@g�H"=@�E��#@$��ڪ�@*�))�@1wI楧Z@6�S�z%@;]
z�)e@@���%�@C������@G�҆��f@K�]���@P$���@Rz:l���@UNQ�T@W�)��3@Z����"@^7���F�@`�5M�@b����cr@d�gƫ@fº���5@h�<�T.i@kM5cp��@m�2�@q�@p+��qn�@q�/r��r@r�F����@tp^,@;�@u����(@w�V4��F@yO����@{poc>K@|�!�uq�@~ͺ��@�c)��B.@�h~��@�v���V@��c;��@������@����~,@���O��@�Gɷ�~�@��Xd��@�ۛ-[��@�3Q.��@��6�3�e@��Gђ�z@�8�g?ю@������@���"-��@���[D@�L�l�C�@��)�S@����~@���X�E�@�����Lm@������	@�q!972        ?[N?����?���$V?�7[�^��?����J?�2߅T�?���F?�kr�5�?�;���
?�G�G^�.?繹�y�h?�����I)?��TW�?��sǵ��?��u˄�?��!��T@�IK6+A@{g�Ê�@�e檯�@��盦@����� @�&�cAm@�zR�ڂ@$P 7*�@�3����@�|/�Y@����@ :CY��@!���-\4@#>.�ߺ�@$�U��@&�m��L�@(W���@*3�g��@,$��M�y@.*���@0"����B@1;L$�B@2]�4��\@3���n��@4�#�;�@6y�QV4@7U�G�X@8��[�B@:��W�u@;����J@<�1����@>��-�@@�L�.�@@��$��@A����}5@B�md'.@C]R���^@D@e���L@E(�MÎ�@F��7;E@G
�3��@H����@I k��F@J����@K����@L>�J?�@M+��^�@NC���?        ?\5�>�N�?�5�Tb�7?��!A�PY?�#2�_��?�چ$���?�w��?��P���?�n�E�^'?�y+^�?�h��$�T@=C`-@	;�4�R@�����@R��E��@5�?�6�@Ҳh�G@"�>af��@&2�C�Q@*6�L �@.�DϯQ@1ɝ�D^@4y\d�y�@7f\�}��@:�
��]@=��Q�Q�@@ե虜�@Bͨ���@D眜t>-@G$Q'Ԟ@I������@L��D0@N���7�_@P��Sy�F@R5#��y@S�F��t&@U^p����@W��@��@XԲDh|�@Z�:ۣ/@\��F��@^�+�	P"@`W~~�P�@al&)�8S@b�%N��f@c������@d��?iv@f'�]�v@gp\MD��@h�h7�}@j#P挝F@k�*�;ϙ@m
�\@n��Z��@p��3�f@p��fj��@q��}4�@ry1x��p@sU�m�^Z@t7�����@u�4�@^@vk�}��@w5s�9@w��^�in        ?K�t,xsr?z#�C�T�?��ā5��?��>J=	?��=u!,?ʹ�O;�?����?㤌���E?�G� �Nx?��)9�Ғ?��u�I��@[�0�jZ@	StN�~�@8��6=�@fM-�,1@>���1�@�:��(=@"����~9@&���y�@*�߭w�@.m��`@1��a��B@4C�"�@7#�vd�@:A��D�@=�xb��@@�M�h�@B�Q��t�@D���z�l@Fٴ�O��@I3��i�@K��c��s@NT�R�@P��Ô�G@R-f�K@S��:�}@U/]�`�@V����@X���,�2@Z����K�@\q�ED s@^uZ,�@`F�vc��@a]�I?~X@b0z��@c�J�cN@d�,�O�x@f#��
��@gp�f9G@h�Y
¹>@j+0x�;�@k�8�A� @m� �n@n�'����@p��X3�@p�X�}��@q��V��@r�&_��@sm?:���@tR*d��!@u<�0�@v-��,VC@w#�hE,        ?���i}�?�uq3�G?�C�%�o@��˿�@�����@�$FL@�@'I���@0i�;�A@5��k�!@<`�Y{��@A�V��
@FgԷ|�@J��vw�@O�h�y�@R���S]�@U��Fk��@Y!�Uc
@\��ni�@`P�
��@be�T���@d����B @f��v�?�@i~I8W��@l&5��@n����(@p�@8�)�@r�[/Z2g@t$�y���@uۉ���@w�g�k@y��n��@{���"�@}����fO@���1��@��j�a@���q�y@�R8���@��� Qj�@����{$@�3��Lq�@��f! �}@���Yo@�>�@�Ǽ��@��
���@�i���)@��<3��@�����@����T�}@��DΥ�J@�}�N�z@�p6Cp�@�h�}Yb@�f��~3W@�jӖ�v\@�t�y�@���t!��@��(��W@���rdM@��ˤ���@����k$�@�Er��@����HW�        ?S? Ԭ�?�����.�?�ê��<�?�8���?���^��?��"���?�1�?��?�Op�:�?�k��V�?�l�\TX�?�1��8�?��\��??��^���D?���\*�?�CE�@#���{@�l{l`@ݜ�>b@
ʠ��(@��3dg@��0��p@�����p@ư�'q@
D���l@q 6�}@��q��a@�=T�	�@ ��<�)@"=
���@@#�g���@%qB�ng8@'(��-ײ@(�"zz@*�j����@,��w���@.��>)I�@0w��6�z@1�R�iq�@2�k�k2a@3�<y��~@5�q<��@6b`�|� @7�ܩ�O@9c�˗�@:r	`��l@;���xr�@=^� ��5@>�t��@@<��'�i@A��o��@A��Nэ�@B��7>@C�eΣ�@D�x���@Eo�1��@Fb%^�@GZ���A3@HYd`�z@I^3+kA�@Ji./@��@Kz_���,@L��]��@M�����        ?R�b����?�q&���?�����w?�q.�sl�?�'�&�?� ���#[?�
�8Q�F?�N{=�ҍ?�/����?�V�����@ ��*�+@6olL,5@��{�s@mT'/A�@��~�@v8�S%/@!N�^5�r@$�����@(���C�@-s�M�@0���@3������@6s6��,a@9�f(gf@<���(�@@O� 7��@BENz��[@D]�%)8@F�6�))�@H����H�@K};���@N&4)u�@Pzw�}@Q���̎@S�mfR��@U#u[�[@V�"�� ^@X�����@Z}:}6%�@\n
�A��@^sK+�j@`F���+@a]���(�@b��U@c�NY(�@dㄯ�
�@f%�N�@gr���:�@hʓMX@j-�m%��@k�?N�)�@my���@n��7�S�@pCF�L4@p�;�X#@q����-�@r�U���L@ss�@tZVт@uG"��d�@v:;����@w3�@�՟@x3�U$JO        ?F��% 94?v�lY�*�?�>��(?��$l�?��A���s?��)�]n�?׺����?��c�&��?�;E�J^_?�J��c�0?�(����V@�",JP@�e+r6@�L�B@<�2q��@"�AX^�@�����@"��ç�'@&6s)/��@*C��ɝ�@.ï�!�J@1ݟ��nl@4� 5��z@7�<#��@:ʷ�BZ�@>H=�qB�@A1 �ڸ@C	Sa��s@E1=�Q�8@G}�~G@I�'e~@L�u
��I@OD(�;ya@Qm���@R��)�kw@T4�E��@U�I��Y�@W�e�4U@Y~SG���@[kM�wO-@]m�CY��@_�?�+��@`�M*���@a�㚑�@c'wL@�@d_�A?@e�����<@f���W[@hH�W��	@i�t�d#|@k>M,"�@l�d�ȕ$@n��@o���F�9@p�0�.@q{��xz�@rU�%?%�@s5쐛{d@t�D��@uW[�"@u������@v�n�xi@w�K�K        ?����C�?Џ����?�����?�.Bt���@�t�SX�@�a�|o�@!-�S�D�@(N�Y�hE@0q�����@5*g�~@;Y`�Sp@A*v��@D�Y�M@�@I
:��$@M��u�t:@QyHM��@TR�o���@Wn��c@Z�gLr�@^rԏF`0@a/B���p@cIXr��f@e�x!y�@g�o�=R@jy�&�h@m,˞�@p���[9@q���-D�@s����X@tȶN�wk@v�>�g|�@xa���@zN�dr8�@|R��i�"@~l��ۓ@�O�)@�s6j+L@����׉@�޲���@�&E�볍@�y�x#�@�ٗ?�S�@�E�,��t@����#6�@�B>�2�{@��6��@�p��m�@��Z�S�@�h�j���@�JkZ���@�2�;j��@�!,�<P@�SaӶ�@��٘J@���)�@���;!}@�-�p��-@�D����@�b�;�6i@����`@���@@��-�W�@���=��        ?q:^VPG?���F��5?��D��?�o,�y�?���k�?��|�Z�?�2�4�n?�~WA�?��?JP�h?����?��r�i"@��V:ԕ@!�$~��@	�vt��@S[{AL&@��^ �w@|ӎ��9@.�EN@���>�@"c%b
�@fn�t�z@!n��M@#A����@%.��oW@'51f�@)T�A�r@+��g*=�@-�S��@0&41�2�@1i47]�@2���ʂV@4e�	��@5~����@6��B��@8yFT��@:
��ү@;� �>,@=S\�X��@?��q��@@i �T�@AR��\A@BChW��Y@C:ղ�@D9��vZ@E>B38@FJHմ� @G]4���@Hw�a�@I���|��@J�s��&w@K�0�@M#��2G�@N`/� �@O���dW@Pw+6�
@Q����8@Q��dQ�#@R{��t@S.�����@S�(ƌ�w@T�6�-0@U\�q���@V����        ?[��l��?���i?�wa��_?��H��?��0�:T�?�:�2-E�?�\E�<�`?��t�?��_��q?�px�'fs@�qQ��}@���j�`@�A�?�@{RC;4�@���
H@���d��@#+����~@'�*f@+Y�8E8@@0�BZmA@2���@5�,%� @8�^��@<m�	:��@@
�#x9@B)��� F@D]|S��@F�M�Nl�@I=Ǥu��@K��ּ@N����@P�vƂ��@Rx�|�v@T$��,�@U����@W�Yy- x@Y���5p@[������@]�iN=@_��sn�@a�4�n�@bL���S@c�@?{�D@d���HɄ@f�|�@gvfh�_�@h�'�L=2@jOO���@k���5X�@mU�$0�Y@n�uw-�U@pE=����@q���@q����@r�ݴe�j@s��愤@t���_�g@u�m�i�@v��2��y@w���[[�@x������@y�����@z��o        ?[~�#,zH?�]���?��إߔ?���F�>�?Ɓ�+u�?��h��?�E
�D�5?��#��?�7o�i�?��9� @q����@$\�| @�e]�@��F�D@������@j����3@!�c:U�@%{w�iT@)�Ӻ�k�@.5�?�@1�(�b��@4J�n��t@7Q6.�"�@:�3x��@>0M�q@AwbZ�@CR~�Z�@ET��N�q@G��u��&@J?op�J@L��n�#@O��bg�@Qh;���@R��E�$�@T����@Vow���@XH$��@Z7���@\<[hYZ7@^X\ڰ�@`E�  �i@aj���k�@b�B�gO�@cנY��.@e��,X�@fs�ƕ k@g�Ђ��]@i?�_�@j��?�K�@l;�9��@m�i��@ohY�0}@p�qbC�@qb�Ē�@rC\��>I@s*\T#�@t�-@u
�!��@vd���@w #�;@x�D�F�@y�>^@z'���x~        ?��|1�RX?�n���?�z5�nM@4I��U@�y>x�I@&��W�u@0����@6�k"�@>en"� %@C��/|@Hl����@M���9��@RܙSz@Ui����@YߜRy@]!�����@`��;��5@c�C���@e�yR���@hI���~@k%��24@n-�te��@p��@�@rb�>Y��@t+��̃@v	�_@�@w���㩃@z�5k�@|0�>Jr@~k��bwU@�_��
@���X��@��$adL�@�  ��@�w�O�@���)eg@�I�R�k�@��ja�;@�J����3@�܊S��M@�z+.�� @��#  @��VY��@��ˀ^@��'1=��@��lVil�@����c�c@�����@��ӂ�g`@���I�%�@�����2�@����j@��K%��S@�ؙtQH@����@�#�]���@�RG�CZI@�C��l�@��E�j�@����(@�%m�tj�@��I%,�@�vKx��T        ?e/l6�=?��|�	�b?�:�(?�	%��3?��i�R%?���[�<9?۲�l��O?�'��6�?�k�@��?�VK�zi�?�x�A@�%?�!��؋�?�S�y2'@	�f`��@2s,Onu@�"v2	�@fڢ�@;�t�`@k Р�@��4K4�@F�O�9o@���3@ˢ�t��@�`��7�@!�\1��@#.0E�$@$�q�D7h@&��%��@(Ñԝ,c@*��RTD@,��B�~@/.�S� �@0��k��@1�-�O�x@3;V���@4�
{���@5�M�k@7P ��a�@8ŊJ��@:G���H@;�DԸ��@=q��n��@?ā�<@@g�$�*@AH�ŉ�%@B0�0}o@Ct�+@D�D��@E|�w�@F�z��@Gvv@H+�v2'2@IB�a@J_m��@K��KY_@L��`�.�@M��,�=@O_�F(@P)����(@P�<�mO�@QrW'��@R��@Rǐ�F-        ?aiaU�Yx?���M0�?�e�P�?�	�^i?� 0��^�?�G=���?�Y��M?�\�����?�ث�<L
?�����@q|�މX@�^?^t(@GYU�@pv�7�@݅��.�@��<I��@ �A7~�@$.�G[�@'�=���@+� !�;@0Fr��@2����Y�@5�@���@8��gX��@;���}��@?J*�s�@A�|؎@C�n�G��@E���.��@H]���@J�g��@M�I�%�@O�W��@Qf�G�4�@R���F�@T�y��i@V@��ÿO@X6p�B�@Y��żS@[��T@]��E]�@_���^T�@a;l��$@b=Wu�l/@cm�$La@d��d ��@e���k�v@gC��9A@h�K+-a�@j�>J�`@k�Ӭ���@m�}�}�@n��w�o@p�.�w@p���U�@q�;'F }@r���ݍ�@s�|���@ttz�n�~@uf��^@v_mx��>@w^zV��@xc��>	        ?Tq���Ï?���t?��d��?��Gr�wV?�~ZؖX?�m� �?�6{n^-?�h�P�B?�����?��X#%*�?��Q]�!@zg�@
��ߊB�@��0�fV@D�Y�@�@>j(ŵ@��`�@#6�>�~@&�"d#�x@*�rKH^@/x���$@2<N�k�'@4���"��@7�Z>�B@;:��3��@>�_]"�@AGP���%@CRV{4�@E���+]�@G�M��2@JW#Y],@L�Ǵ7��@O�S��h�@Qa�4;x�@R��l�@T��#9Ұ@VV��`�@X)�O`�@Z2��@\��}�)@^+<�pr�@`-4ѽ�@aP�bl�@b�;��a@c����q@e�	� �@fX|Ju�@g��m��t@i'N���
@j�� �@l)_K2@m��1�߲@o_�D O�@p�4��@qeH*Ϫ�@rJ
��[@s5���Z@t'��<>�@u �r�@v hz��4@w&�)>K�@x4;yL��@yHY8�        ?�md�*1�?�ca�4�?��W���.@
���Q��@�^'��@"��ױ��@+Q)�i�4@2�XUg`@9\�
O�@@#�\4�@D=�h\@H�fnh��@N
+_ �o@Q◘I��@U	�Z�>�@X}ǘ2�@\>B���@`'�CG��@bY�Q�@d�+�T�k@g9��Ga@i�L���g@lơ�ˬ@o�<�Gp�@q�R��A@s3��̞$@t��0@d�@v�vZ�@x�c�nk@z��́��@}y
 Jp@F��ڴ@��e���l@��2�$@�IǷo �@��� ��@��=Y���@�^�#%oQ@���C���@�U;�<-z@���ql{�@�|��S�@�#u�o@�k>����@�K�_��@�15��/ @���+}�@�|��Rs@�	���
Y@�	�u
�@����W@��J��@�,��;�6@�Ef���@�d��&(@��=���@��<�Mv-@�����@��n�0@���Hd*a@�O����-@����¿@���f���        ?o��l��?��'��x?��(?&?������?���~��\?�O�nw�?�� ;�?�Zl�l�?�PRS��?����h\ ?���,hї@ �V����@vM�Q��@Y�!$zw@�v/K�@�V��r�@)��߂P@�%2��@�̶)@� ��@Hx�o��@!i��O&@#I�O0��@%D�v��@'[g�f�q@)��Ϥ?�@+���d�*@.F��*K@0f����@1��J�%�@3s�(@4�w�Wvg@6�ٯ�@7�����@9-�� ��@:؂e�{e@<���W�>@>\M��@�@@!�β@A���>@BLQ�8@C�H�"&@D �d��@E7p1xU>@FV�=GZ@G~�0J @H�b�s��@I�(��@K,� �9@Lx�'��@M�P�錠@O,p�ԉ@PJ Ӈ�@Ql��]@Q��.h��@R��	:M@SK�����@TnH��#@T�R6��b@U�DMנ@V�G�9K�@W~a7p�@Xd�S��        ?`mӲ�a?�lg�v�?��544��?�X�O��?�S�:$?�U���j ?�}C.!�?�"�?ܿD?�Bڎ�\�?����(n@M)���/@
�=�I}@g�@���@�ئpv@���+<�@ � hx�(@$���m+q@(��u�ʙ@-GY�XM@14�ً��@4�$z$�@7.�g��@:�-��Z@>Y�17r7@A4p��b<@CfWzW=�@Eö���@HM�N��@Kr�xb�@M��^��@P�"���o@R$�� @S��8;c@U���6��@W�J��И@Y�
�O��@[�}`��@^�o�@`7���L�@as2�+�@b����?H@dg��@e{�dd@f��F��+@hu���@j	Y�}@k�	H�7�@m[/?Q��@o�p��z@pu�D��C@qe�.��@r\KW��@s[9���_@ta�ר�l@upa4d�e@v��%۷(@w��v*Ȱ@xʥb�@y�i����@{.vP�W@|k��9��@}�[�k@~�gi���        ?b&��T]�?����i2?���h�D?��<�(�?ͭ��M?�7�� ��?�L'��?�Ci1p�v?��F�T>�@ �l�.�*@���C_�@ӣ���7@KZ���Q@{w_�'H@��#��@"�Q�'�@&���d�^@+D��'�h@0)��u�@2�Fi J8@6\�W�@9|C�V�P@=3�'u�@@�rN�HL@B�=f�@E$� ���@G�|�B��@JW黜i@M3�r;@P�t��@Q���N�@Sl��w��@U6�K���@W�0���@Y�d�
@[%�ͅ� @]Q���"@_�p'v0e@`����@b59Y5ٹ@c}�k��(@d�~�|6@f6]ݼ�E@g�����@i$#�'@j�9sI(@lG�0{��@m�1���@o�0�aaw@p��Iz!�@q���VS�@r�Y-,�>@s}��ZX9@tzQ��@u}����@v��@*�M@w���@x�-#�	@y�6en$�@z�1�z0@|#"��'@}W	�f��@~���ϛ        ?óz����?�G6��@��`/	@��;FN{@$Cؓ�@/��4�o@7h��"�u@@;�b�/@E�8��@K��Ơa�@Qv�ß�@U{ܕ*�y@Y�'�@^�����@b<���ks@e?�z!�@h�^ƃ}4@l0�k9�@o�5�̭@r�&�@t6�z��]@v���S0@y'-�]@{�d��dL@~yr���8@��n�A@�B)W��@��4�b��@��͒f�~@�cbx��@�B?�Ĭ	@�6Jv�G@�?V��@�]��'�m@�Ȃ�h�,@��ܥ��@����5@�Wd�b@����z��@��AɃ�@�K�N�@��q�J�@�'�PJ�@����q��@�3n�'�@��o#@���b��S@��'TB�@�n��@�S�5��@�?�*u�@�0����@�)B��;@�(O�SR@�.e]�<@�:���"@�N�m�@�hd3>C3@���*�v�@���%@��ta>�@���@������        ?W�"_�n?���O}	?��[ =e�?�l��%.�?����zm?�)�E8�?��l��B�?����WR?���`G9?���״�a?�h�c6�?��Fqħ�?�u�qAq?�hGG%?�����l_@ ���ZO.@P���@z�k��@	��'j@H���K=@��b�\�@�-��Ɲ@��[$R�@�~���@��#iU}@�<��@k��a@�	Ҡ��@ ��-��@"i���@#��^D@%@�@&�x8܎@(�d�\_@)�9۴W@+yY=	z�@-<C-nk@/���G@0v��L�@1nvuy�@2l����y@3rf���@4zK��@5��w�o�@6�a;�@7�3��v�@8�J���@:-��qj�@;fk���}@<���3��@=����@?<�u�O�@@I�,ւ�@@�^૒�@A��\��@B`�d�@CO��@C�`�*_@D���´�@E[��h��@F#l.��@F�L�^@G���j�        ?P�Gk�?{ǝC7p�?����Gx?�惌$:?��*��?��(�3�?�#G@� �?�V�v�k?�8'~f�?�d�#+�@ I���+�@��R@i���@�@iv�@���I�M@�t�mn@"6uB�Z@&�#;'@*���W@/z,�E�@2�bĊ:<@5���!"@@8�i��@<�7�2@@f8r���@B�h�&�}@E���]@G�_�]+�@Jb���B@M^�V�$@PG�d9W�@Q���g��@S�6pѭ@U��(G3@W�v�׵(@Y�R���@\#"�_�@^�|�Ճ@`�{�>Vg@aҕ"!�@c2����@d��ire�@f$��7��@g�]���S@i[���@kb�A.@l׈uf)R@n��o�w�@pN<��Q@qMh  '@rV
�ĚG@shF���g@t�>i���@u��T�@v����@x��o�@yX���@z���t(U@{�����%@}cP�ͮ[@~ѵ>t��@�%x�V�@���]�$        ?Y�y�W?�V�e�7:?��B����?�[���O�?�1����?ѽxa��?ܧ�:Bx�?���}�n?)�G>?� /���4?�ƣ�KP�@�v�dD@	W��桗@Ѐ�/�@����b@�*�rf�@����@!��[@%o��r�@(��]��@,�@X�u�@0�#��5@3Z*��@5��k}@8��4�@;��̷y@>ڿ��|@A.�+B�@C$$=WO@E	{|%@G"�G9�@IZ��>--@K��@ϧ�@N$����@P[�B�/@Q���C@S�uR	�@T�����@V���٥@W����E�@YV�d���@[��c�-@\��)7@^��
�@`C�W��@a=&wN�@b>S��LV@cG>i'R�@dW揧O�@epMڐՏ@f�vl�7@g�b�Q�e@h�@���@j��.�@k^��.�@l��2��@m��A�@oK�4��@pU j�}@qY��?y@q�� /�5@rz��&=@s9��W��        ?��`���?�UҢW�D?��',��@ �vn��@�)��@˥d� @!��<p��@(�dɫ�@0�Y��@5t��N�@:��Lz�@@���b�@D�4��@G�^�@L+q�uG@Pd�j��@R��bg;x@U� ��@X���J�@[�Q�Y��@^�Ou���@aAO�t@c!-�ȴ@e��i�:@g3uĞzs@ie�'��@k�7;k�s@nP� ��@pR-�T�@q�1�*��@s9��j@toE�dhH@u�OE�YL@wsMn~�2@y
2�S1�@z����Ti@|axS��@~!���}�@�@v@�埆�>�@��6�A�@�՗���@����w��@��a*��@��tTW1�@����z�@�$X���@�H�� @�sr0`=@��,�F��@�ݨ4�@��C��@�b�OA�@�W�i�E�@�*u�d@�����x@�^?��
@�Tu��@��πy�@��t�#�/@�><����@��do�<@����        ?pW����?�v1(�6?�=s�Vc�?� ����+?�)��HS?Ӝ8��S?�e��R�S?����?�3�M5�?�u��7�n?�+���?�"��5�/?�>9ys�@��|��@-�l\@g?ފ3@Z��bx@t.��o@!Թ0ˡ@i�w�Y�@�/�0f@t����@8+�:�2@'���!�@!!����@"��a�@$�h��@&T2Os�U@(>��k�p@*A(���@,[ͭB�S@.���2��@0m&����@1�3�';y@2ݗ#��l@4(UM��~@5n���/@6�߬i�@8R���@9λ��\C@;W$��oJ@<���~��@>���U	�@@5S$~x@@�%�
T@A�QcN@B�ö���@C���? o@D��(8�q@E�%=5K�@F��9�_@G�o�h �@H�E('*_@Iە���@J�c�c��@L��@MEv,��@Nu���F@O�{&c@Pt��~@Q�l�@�@Q���1�@Rd���Y        ?_��:B�?��`��ج?��Ηʧ�?�o#���?���4�b?ԍ���q?�gGzJ0�?讔�?�?�c���?���!��W@ �jؘ�@�~�=�@�Wt�S@�N����@��ĭQ@�ضЗ�@ ����}@#*��_i�@&��Ch�+@*v��a�@.�����@1��̢��@4,.�o^@6�z{Bu_@9����&�@=�#��@@2:�y�@B ח	_$@C����@E�F��3J@H���w@Jg=�>��@Lͣ��j@OS[��!@P�Q��/.@R^�'�	�@S�QaVx@US���@V�n����@X�.�Y�@Z<"�s��@[�Xr��@]��
O4�@_�� y�@`Ոy8@a��OE��@b⚿�#�@c����@e�-���@f4��Nҿ@g`����y@h�P�5-(@i�b�*�@k�<�v@lf&����@m��!�%L@oN.�Y@pB,����@p��,@q�<,%K@rxJ��{@s=�i�v�@t~�ţ�        ?_
A5ʩ�?��{)@ 9?����?����F�?��\��Yp?֬� &��?�Y!�>�(?���'�
?�=~;�-�?�C���@ �[��@	:��7�r@F}�y �@�Z�y�@�%`�1.@z�6Ҳ�@#�����@&��+��@+4٫G?@/űe��@2~����	@5^�@pT@8�qe��@@;��5
�@?�-��g�@A�c�f��@Dk�%�@FX@�� @H���.�@K~~	��@NR��H�"@P�%�9u@RA�zF��@S�Ǆ�ۿ@U���y�@W���@5�@Y���20�@[��m�n@]�.m{{�@`J� f@a6�E+{�@bsQTe��@c�����1@ez�o�@f{W�.�i@g�Qû�@iq���@k]%@l��F\ x@nP��H@p�,���@p��cq�@q�ć�S@r�[��� @sͺ/ݮ�@t��9U�@u�L�z@v�����@x�S�M@y6�Y�w@zc�����@{�#h�@|�3�
T        ?�>	�R^4?����@ ��@��v�F@C�i��@&���i@0��9�@6�{��>@>d�O3�@C|��X��@H`���@M��_��@R�)K�,@Uf��
H�@Y!K�A�@]4'Q-@`���膟@c6I�+̡@e˒�yT�@h��21�@k�Î�{@n�-%��u@q?(��@r� S��=@t�|!pGq@v�K���@x��ӕZ@{"�]�.@}}뤱>�@��3̽@�HS��g�@��!6N�@��Y�)@��ρ�ni@���qm�@��x?o@�\,��@�<�{�@��rn�w@���&��c@�ԟ�T�@@��x��"@��v���@��؝j�@���1	@�ӭ�@�B�ju"(@�r�O��@���D�s�@��eUT�@�4�Z`̦@��z�6�@��
�Y^@�"�%w%@��l�cQ@��]z���@�S��>l�@��zT��@��RX��+@��b�~��@��Hr@�U0z�Y@�/�F�        ?[�t#:�?�� a�?���4��J?���ۼ�?��5��;?ˏ	g2��?�x�h���?ܨ����?�2�(�?���4t.?�Z3���?�X���v�?�t ����?�RZ�@ �%1@CM�JH�@@C� �@	|;#,�@�a���@Z�剶@Z�v�!�@|��V��@�2�R�@(�*�@�{���'@`����@ �pb�Ӂ@"Д9�8@#����^@%CS�@&�7E���@(�d�"�@*�� A�i@,����I@.�����d@0K����@1_~��h�@2}��ٱ@3��G���@4����e�@6	B@7Z}�8I�@8�$��W@:�tlF@;j�����@<�fJU]9@>RQ;�@?�@D�@@��MT@A|}C��@BL�8��/@C"s��*@C�<�[�@D�F�J��@E�3қ>�@F�~l��@G��T�(z@H�lh�V@I�w���@J|�w���@K~NA�)Z@L�9	0�@M���&�        ?K}9aY?xw�)�\0?�V[')�?�� �1�?��m���?̾�z�;�?�X�י�?�9ܲ(:?�B[+f?��Q��?�{/��|@����.@	謣@
R]���@./>�b�@� }T@|-~��@"]��G�@%��ٜT@)��gz@.)�L|�@1z��n��@4�4�Ɣ@6��~�|�@:UbU/3@=sXcZ��@@�PE�@@Bz�2��@D��<eI�@F��G�W%@I$��G_@K�3�� �@NP��w@P�>J�@R-o�t@S���S@UBiE���@V�j��j9@X�F 6�@Z�j�˻�@\�Gpƌ@^�G*0@`zi�a9	@a����@b���P�@d���!'@eM'QY�@f�.���v@h7:�@ip��!�@j�H	cS@ls�e���@n	��� w@o��Gǋ@p�����@q����5@rv��L�@sd����@tZ����@uV͐
3�@vZ�j/x�@wf�2�F�@xy�Ua�        ?Y9�}��?��K�O�a?�����A?�zU{�ϡ?Ō�4g)&?��ֆp�?���{�?糤v*D?�;ɠD��?������@ W���@�u�ִ@ۧCʯ3@�Iӝ��@��C]�@�0$��o@ N:7�I@#��
�@'��ߠ@+Tv�)�@/x�F�$0@2%sk�@4Ʋry��@7����a@:�C�D�4@>	G�b&�@@�h�ٱ�@B��d'��@D���?	@F�K�[��@I+
\yc@K�q%��@N"G͠�@Ph�%�N)@Q��
��@SM;�!��@Tڞ�f��@Vzp��f�@X,�(��@Y�tE��Q@[�0��+�@]�p;\�@@_�x0.4�@`��R6#@a���?E@ct���@dA[��]�@etϘ�%@f���v�8@g���,�C@iO�I[�@j������@lޖ^F@m�S���)@o9 ��@pM���a@q����@q��6;�|@rú�==�@s��+�3�@t����i@uo����|@v_���        ?�W8N�q?���<�Q?�Tz,L2@$�c�	e@��jc/@̉���@#�T�]@+���a�@2���r�@89�'�[@>��d�$@Bڐ��n@F���7�j@KJ~��I�@P�hf@R�%�1͇@U��rÔ�@X�~f�a-@\*ǡ�_�@_�W��}@aӀǋ�@c�G2y��@fa�W.K@ha0�KCG@j��|��@md_y�y@p9b�\�@qwQ\���@r�V�~@t�Pqc��@v �� �T@w�l(�̻@y�2��*>@{i0sGB@}PD�1U@I~�e@�����n@���7;��@�҇���@��v���C@�º�l�@�TlO�?�@��q��I.@���)�M�@�*{��g�@��r���@��K.�@�T�,q@�ɢh��@��&��.@�h����@�0`��LQ@��:�։$@�Ό�Lc�@��T�R-_@�~���3@�]=�+��@�@`��$@�'���@�B�P@����c�@�����@��f�e��        ?X���e ?�@��ӽq?���֡Gy?�RٷQ8u?��Ə�8�?��ָ��%?Ѱ����:?ؿ�u�?-?��ݸd�?�zx��9�?���5?�(X�~?�M͋cv�?�DΓ���?��5\UM@ �2p��@S\�4�C@'��_P@	6yN;@�Q��}@s7,�~@����M�@��ՍZ@
�ZB~@MMǡBB@���OO�@8��>u]@�Q)��@!V�$��l@"΅<'DS@$W��}@@%�|t�*@'�)ؘ�-@)a8�	 @+3�q?@-MCz@/�Vk�@0��*r�@1����Κ@2�"Q��%@3����m@5	t�L�S@6AL��;=@7�Ug��@8ϕ�d5�@:&�RA�@;�ʻ�:o@<���T4@>f�܀/_@?�0>�-j@@���~	@A��^V@BP0�,r<@C#�ӳ�A@C�f�mq@D��	�T�@E�.E$�@F�U٦��@G�L�<E�@H�
Ў��@Iu��o��@Jo�$�@Kn�0�        ?F�ap�s�?t}�#��?����S�?���;���?�9��V?�f���{�?�̻�Iݤ?�I谌�?�pGV�G[?�ԧc��?�X�|��?�vPe�#�@�XQR��@
��ʁ�W@����M@�J�GH�@��=�@Z�~]@"�����@&��;��@)�@)j@./Ӣʺ�@1r���@4�>��@6�Ig�'�@9�?�f@=2�o@@a�Xﾑ@BK|�'!@DX=a
@F�Gҁ�	@H���n��@KV_���@M��7��@P^ (���@Q���N�y@S_�G�#+@T��l��u@V���4t@X|O��@Z[)F m�@\O��K�@^Z���
�@`>L?�@aZ�ڇ[@b���S��@c�F��-H@d������@fA֥��k@g���]q�@h����@jo��8��@k�����@mx��,@o�&�Lq@p[7	��@q4[���@rOZ�!@r����T�@s�y8;��@t�w��@uڒ(5�	@v��1BH        ?U�{�{?�k�f?�����L�?��ys��?��;���j?ϰ7˚�:?���p|w�?��r�S7?�L�u�Ծ?���q�r?�/op�
@��
@O�uZ�@�:&@}{@\���"@�ə�b�@b���@!m;_�b@$��F�4�@(^�YWz�@,mw(�Z7@0rX���@2��W?9@5�E��v@8p(oY��@;�{G+��@>����P�@A>���&@C)iWL�o@E3����D@G^��d5�@I���q@L��(/@N�q/���@P�c�6�@R�GhN@S��*��@U#&�-�@V��)�m�@Xw.K��@Z=-{��@\����@^7&`�@` ؐ;�@a
`�q|A@b��QkQ@c;;�W�h@db���8@e�t���?@f�n��z@h���я@ig���W@j�ڬ��O@l(���t;@m�\--�@o��wy+@pMsw_w�@q�G��@q��K@r����I�@s���a�@to\�BqT@uS��F��        ?��9�'B?�WH֯4�?�<R��?��_�B:@
(�w�@�U���@��|ݤ}@%���K� @,�D_�@2��=Oh@7��6߅@=/ �p�@A�Ɛ��O@Exǲu�@H�9���@L����bS@P�B@S0���5�@U�'��@X�	��N�@[�`_Lz@^�J��@a9��GO�@c��@e�:o�@g�x��2@iFUʓS�@k����l@m�����@pB��,{@q�_��@r�����@tlɾl.�@u��#��'@w�4�Z?d@y&��.��@z�o����@|��R��m@~w�ҥۗ@�/��))h@�-���@@�3��1@�B޷e#@�Z6E���@�{s�tk@����Z*�@��:�	��@��z��@�[G��T@����w�@�Iy6@�a��"��@���v[@��t� �@�[��K-�@���'�@��O�!�@��8�@�|�̋��@�O��$@�'��I�@��,�w�@��l�@e%        ?V֊�eO?�I��01�?��[�>UD?�&���A�?���rT?�,�{��?����x�?�k��ՙb?���@��?�9���,?�J�,0�?�b�[��4?����G+?�E��`B|?��l���@qj�g@/�dA�@*����K@
dDi��@ݯa &j@�ro���@��Y��@�s5��@2��"��@����x@)dR3�b@�_�&�@ ڹ�׿@"Z�0��@#�D��[@%�Ϣ;��@'Q��[�@)!�ef��@+-�Jc�@,�vr,��@/�gV�@0�K�!�@1�R�[PM@2�����@4'�ǒD@5H^��H@6������@7�+���@9<xac@:��yӶ!@<Ӈ�Th@=���	�o@?<�mC�@@WN�z+5@A&�y�T�@A�����@B����h@C�ix˘@D�s���(@E�C�n��@Fy� ��@GqJSz>'@Hn�_ �[@Iq�
��o@Jz���Q�@K�t��jO@L�A=�k�@M��wK        ?OTu��l�?{�CuCp?��r��?�������?��N�c�8?� ���@�?�*��?�V��?�Ru�?��S��$?�R�w �@[�=U�@
�PQ�_}@\SD��@��t@�}6S+[@ `��[r�@#Ɋ�h��@'�&k/�1@+���X�[@0c��Lq@3*~,@5��Z��@91���9r@<�����@@>0imU2@BK��+(@D�Yps��@F��x�@Ig�	QE@LM��b�@N��ZzC�@Qab���@R�M�=DA@TX�-��@V%��z;�@X��|@Z�#��@\����!@^O_s�u�@`LO&&̚@a}�0<�@b�F̩I@d�q��l@e`�t�b@f���͇@h:����@i���Ë�@kJ��EH[@l�0?K@n�/��@p%f���@q�*Y��@q�0��@r��rM��@s݌Cڸ+@tݑ1�p�@u����C]@v�a��@x	��L?=@y'i�l�@zL��@{x�*��A        ?V3���?��dI�5�?�O�_V2�?��`9�y?�j�v,5/?�G���v
?��X�ې�?����B?�����c?���o�R'@ =�j��@�''��@��Q�gO@����@J��ß@y� a��@ �
z{*@$�EeJb@'�D�!@,��/?@0e�z���@2�%
��I@5Ѭ��@8�u�\�@<B9���@?��wVI@A�f�QcP@C�"�W�?@F2��@H��9�}y@K!�@�:@M�#�\Y�@PE��_:�@Q�P^N�H@SM�S�@T�Zv:@V��Qc��@Xi��<N@ZD��%f�@\3qKT}@^4��`X@`%D��	�@a9��� @bXjr�;@@c��i�Hc@d�4��p@e���@g5��ŰE@h�2?jA.@i��o�9�@kE�\}T@l��]�R�@n,-kΚ @o��e{@p���^�&@qi����@r:;�}�3@s+���@s���Q	@t�&j��@u�ph�9V@v��:�@w���L<        ?�L���(�?�R�5���?���*��@@ .Nꅪ|@����@?����@"!<ݎ�~@)�w���r@10_4��v@6^.P�C�@<U;V8}�@A��_V��@E`���m@I�%{-��@N^NCr@QɈ�5�K@T��75��@W� ��u@[ �����@^�c��G@a[9��A�@cw�u!y@e�wA�S<@h#��%W�@j����,@mn]��u@p(}��tS@q�ϰ[�;@sJ�-�)E@t� 1 ��@vÇ���E@x�g���v@z�����k@|�1��+�@~Î( @�~���KO@��u]�E@��w*
��@��o~�@�g��A�@��O��O@�$�;q�@��piz�{@�X�o��@���C�s�@�1�6e)@���+a�\@����^�@���"�@���x2�w@�kf��$Y@�[�)v�j@�R�;~@�OQ�9�@�Ri���-@�\Y��g�@�l��2@��!�@��� U@��RT��2@��^:�@�#�ӷ��@�.)�A�f        ?d�"�%?���2�@?������?��-���?��v	���?���A-�?ڋ	Lw�?�g�\]?�y(oyk?���?��rދe?�F�P�	?�Qc.p��@s8�@��o��!@��JR�@���;1�@{\ןn�@���l�@+)9$��@�qᅱV@@��E��@�U=��@i��7�@!��~�@"�i�-� @$�c��p�@&XϹ�Y�@(H�: ��@*Q#	+U�@,q���@.���˱�@0~\o�!@1���j@2��	M@4E�+�t@5�ߓ��>@7	�v��.@8k%��@:fJ�ʕ@;��dP��@=0xGW�@>�ܝ��@@J����@A.�O��@B��yS@C
Vb�d�@D3���@EQN��@F
��W$"@G��<-�@H/�UE
?@IMr���@Jr��@K�p��@L������@NV�N�@OQ^��@PM�h�yk@P�L*+@Q����p@RR�	��:@Sf|c@�        ?V��+��?�A��f5?�P|$��?�IW�t�U?Ŝ�d��%?�g�6R?��բJFD?���&�=N?�<��>a?��%�G$�@�?X,S>@���o�@�c#�_@�F�7@�J����@���8wN@"��8M�]@&����O@+�^��@0 ��S�@2��%
@5����e�@9�2���@<�O���@@[��|�@B��o!A�@DѠ �@GN�{+JM@I�Qy�@L�����@O�X���@Q�<*͎@S;�㗠W@U/���@V�-ǃ��@X�4%��B@[���@]3L@T@_}�e�U@`���4�@b0dPp��@c|լ���@d֌~�y�@f=��ȍ@g�8)�Y@i4e ���@j�HK��@la�5 @n�M���@o�g���@pǬ��|@q��(�Y�@r�2p�@s����&�@t��aʙ@u�o�m
�@v�s� -�@w�;�@x�R��@zRO'�h@{E!�@|{Ӓ��W@}�yA�܄        ?P�}2N�$? U�R9�?��j�S�?��)/n?��.p�?�\G<7'<?�V+F�O?����wz?��Zm��?��N8��?��<~�2@��=Bi@	y��z4@0�aE �@8��	�s@�� �!@/��̚�@"��S@%v���O@)6C�P.�@-ZᎻ�@0�vƃ�@3p�h�9@6$�5�5�@9��8�@<9Kv�kC@?�0�a@�@A��[�'@C������@E��gy�.@G��O�h2@J/0�g�@L�y�^=r@O����@P��y�@RO裀�@S��
	ѯ@UXߤ:g@V�:�G@X������@Zl.x�`�@\B�M �6@^+���WE@`�X�@a���@b-��� @cI�[�@dp�#�J@e��OcP�@f۫H]�@h!u��V @ir$O<��@j����@l4�[ ��@m�Wsd�@o%hA��@pW��;/H@q"��H�@q���M @r��cݹ@s�h]&� @t�X�f^�@uv�mF�        ?��gP�a?�p��1?����H@4�8"�@QbK�D�@#_*:�@,���l�@3���2@:cU`O5@A�s7�#@Ee��i�@JW�7m�p@O�H(Ox@S�
a^�@Vku�l��@Z&�6`@^8C>2�&@aRz� P�@c��>u4�@fL���	@ie
X��@l��\�X@o:5�2�@qN-YIK@s����@uT��((@wE�΃v@y#Z���@{^��o<@}���f(�@��7���@�`ɿv^�@������@�"4����@�����h@�!�޴K@����`@�`�x
Ƣ@�i���@��q  Q@���j�I@���L�Zg@��\&:�'@�՘���@��b�at@���ʴ��@�����@�G�/��c@�z�3O�g@��_�}�#@��S�U�T@�L�1�@���q���@�aFW�E@�:U\�@��U���)@��6u(G�@�y�gݟ�@�C�8}��@�U_���@���ɣ�@����x|D@��6����        ?i�c=-?������?��ܬCV?��\.�[?� �a�NO?�j��-1?ݭ��VK?�i�ȅ��?�����=5?�8]/��s?�vRa�?�3 ݑ?�q%L6�@��dܕ�@�]����@	 �u�Q@ɐ�-m@[l�+r@t�;@�a@���-"m@�W�ǫ@���o��@9����O@��	@ �m���@"�:h��@$#���@%�-�}�@'���0O@)p�ԣ��@+]�e�@-]T���@/q���:@0�X�Gp}@1� ��� @3�e�@4H<{�E�@5����@6�zj�}@8 ��o@9}�T,�@:�6`�G�@<W6�>�*@=ӵW���@?Z�Ft�@@v!��2@AD1��ޏ@B����u@B�=m��@C�A��g_@D����*@E�X����@F�rn��@G{�"i�@Ht�YL	�@IsGgl@Jv���@K����@L�z~�@M�v���@N���qt@O��L(IU@P��n�        ?]�#�E?�_��T~*?�:_c��?��C/q[x?�6"�d8�?��F3��?�OJN̷?��T�}�?��75eD?�j��E@e�p/��@�(�l@��[7i@^���m�@� ���@7{����@!�:���@$�����L@(��P.1�@,�#dj-�@0��D*c@3B�+L@6��J j@8�4��2r@<9�֟.�@?�bi�x@A�#I0n�@C��L�}2@E�m?�{%@H�D��@J�$muYr@M
�;�`t@O����4@QF�SJ'@R� �?M@TTW�Xԧ@U�G�X?M@W����@Y|/Ub��@[\�W�Af@]RQ�@_\�E���@`�_pτ@aؽ`t��@b�FDQ��@d.Ջ$��@ej��L�@f��J�>&@h����#@ia�6S/@j�Q�eH@l@��I�D@m���`�@oN�C�N`@pt#�@qF�CX��@r���\@r���~5@s�kkI�@t�-���@u�QOg_�@v��mA��@w����w]        ?Rƍ�2/�?c���r?���p�J�?�.����?�_�ms�?�[�Қ��?�-P/?.�?⯏
[�?�}x[��K?�n����?��_]���@�8��@�f��`@V�ڞ�g@_?;mb�@�8�XJ]@�9+��x@ �[Xc�C@#�^���j@'/xE4uE@+�e%U�@/SE��@2 [C�u�@4�d4t�@7R���B�@:Qv˾U�@=��G��@@��Ż^�@B\غ�U�@DXΰ�A@Ft�^�@H����p2@K`%�)�@M��4̒E@P��d�U@Q��QS�@R�]����@T�Q��Ê@V '
{�G@W�!�cq�@Y��m�@J@[j�����@]U�4�YB@_T��nn�@`�
��P@a�m���@b� *+�@dq��b
@eB���Qz@f�>ZDw�@g�L7id�@i?F�=@j}/D�Q}@k�3�R=@m\e!Ag@n��R���@p4W�2$@p���_R/@q�l\�W^@r����&@s���PM(@th����@uR&kE�        ?��J��?���#���?��c��%@kG����@'��nv�@#�~�u��@,��{Ng@3��k�b2@:XR��	.@@� D%� @E�^Dq@Iʉ?.@OgY�\@Re�%��@U�O*R@X�-1)@\��bA4@`Wl4-c2@b|WO� �@d�WG7�@g97G�@i�A�J�@l�y��	5@o}h�
x	@qH]�0�@r�N��@t�/��o@vej�i@xE�x�~@z;]��j(@|Hk���@~llvU@�S��b��@�}7i%z@��:���Q@��I>T`l@�@gS�
e@����dt@��E,٬�@�q3���9@���v��@�ze=bJ@��AP�f@��� Mf@��%~�r�@���k��@�v����@�b1i�_%@�T���@�LK��x�@�K	U$�
@�PA�D6G@�[��Q�@�n-�JCg@�����޷@�� �=�}@���O��5@��)��+@�*��s�~@�2.�4T�@��'���@�ui�tT@��S�7C        ?i�k?|ޱ?���LOj!?��b�s�?�����|?̂�)�S�?֠����?���??����G?�Mɏ5?�h�Q�?��[�]?��:�@#�5��@�4��?@	=�E�H�@E�.�&�@���"�t@)a!	�B@�<&9�@]�)�@9�@���@CHw��@ �n^ڙ@"pjQ �@$:Ԗ�@&�p���@(�0�5�@*(X��o@,Q���@.��7	Uw@0v�K��@1�U
�D�@2�.
4T@4H�"*.@5��Y�l�@7�=@8�Hx\v@:�m��@;�_�=Tu@=H��꙼@>��T6<@@Z&���~@A?��rt@B+����@CU��w�@D����@EWC�sX@F#�J�bW@G3qFQ,@HI�p�¤@Igpl|��@J�մV��@K� f"@L�I��W@N"L��@@Ob%o��@PTi�\@P�(�EW�@Q�QA���@RR����@S��0@S�7M�li@To��`ɟ        ?YN�R�*?���_�i�?���Z���?�����?�AP�絞?�� 'Fw?�,m���?�R=�??�rK�wR=?�mO�@����@�L���@!���p@�9Җb@��={EV@����f�@#'"���@&�6+<)�@+B/�T�@0��w��@2�pa t@5��|dR@8�9�ʡ@<&��!,0@?�_v�'�@A�/�BO@D �d@Fik?͊@H�ˇW4c@K�f�@NG��u��@P����n@R+u��#@SϏ)�K@U��3��@WYɸ7�G@Y@��s�l@[>���n@]R�U��@_~�[ڥ@`�vS���@b��*�@cIǹH��@d�v�%؏@e㺴.&s@gC����-@h��08?�@j*���+@k��zC/@mF���M�@n�)��M@pL���G @q+��}��@r�>�7g@r���l @s�=;�@t�i�de�@u�K,��@v�y�� �@x��b�@y)���@zK�����@{u�u
Fq        ?f��o-?���F��Q?�P.\���?�f0ä9t?Ϯ�j��?�H�3��?岊d�8?�F�b�Y�?�V�{ձ)@ #p�<�@����
�@^޻z�@/ 
�0@�<�{@V���3@!L�leu^@$ۢ?�)�@(ݞ�p�4@-X[=�^�@1(�tѻ�@3�v]L~{@6�C�/ȁ@:08�r�\@=�y�9��@@͆���:@B��h��c@Ed!8g@G}��=��@Jڧ��@L�z��5�@O�^�$@QS&&|�@R��X �@T���u]@Ve�d�a@XC�G��Q@Z8�4�$�@\D�@Φu@^g��O��@`QT� @az��ӞW@b���x��@c�9��ܲ@e>���+@f�BVV6@g���_v@ipu��@j�sy�=�@ly;:0@@n�2�@o�g�Ӣ�@p��TSK@q��Q�s@rs����@s^�(�d@tOg>�T�@uF�tɅ�@vDw2��@wG�C�@xR%62�&@yb�-<��@zy�M�@{��
Od�        ?�)Zuz?�:�$?*?��-�$��@�-j�?@Cf�39@'�� g7G@1���4@82j�C/@@R�jR�@D��d'��@I��JcL@O���ܷ@S�>C�@V�g�X%@Z|-�`6\@^�u���<@a��x���@dd�0�@f�v�6�@i�h�@��@l�ap���@oй��:�@q�&��k@sf���
(@uK�,��z@wIÜ�Ɠ@ya��Ŭ�@{��Kd=@}�m�%�@�!�`�?)@�a���+0@���!�b@����M�@�pل�_@��fR��T@�i�u�@��{��@�����Y@�H[pB�^@��<��Y@�h	��KZ@�U@�<1�@�J!a�p9@�F�>�a3@�K$Ġ��@�W^��::@�krե�<@��d&�G�@��4ۙ��@���gL@�
�.05@�Fk��p@��p1��@���h_W�@��Ψu@������@�s`�)�@�)�N��@����7@��~�"�@�bO�r��@�(6ӄ@��5]���        ?g�X�W�?�q����2?����|?���;��?����_�h?��M�g?���'��?���G�)�?����ք?�&���S�?�ض���p?��%E?�џ~N�@ ��J(@d�{�@���o�C@	��yر�@��hK@��Ҩ�#@� ��@+{"U@���`1@&w�'@�@� m<�@�,~��@!b�T�@"�����@$�N���q@&ew��@(:$����@*#s2�_�@,!}�V��@.4\��@0.���@1Ll�ꃛ@2uC��Y{@3����^@4�]���@6.�	��<@7�F��*@8�W����@:Eõ[��@;��p[@=3+ujs@>���o�Z@@%��
@@�`�5í@Aļ�UzY@B�$C��>@Cx�&�1�@DZ �@E@u�ʍ@F+ޮ9<�@G:hX�K@H�L$�W@I��O.�@J
����6@K�5 ��@L���{d@M%Tp=@N8�f*_@OO�.e��@P6B+�g        ?R��,��r?�0XA?�&��b?�7�UT?��ϟ�?Ѷj�h�?��L�V�B?���4P?�&��I_?�w�	�K@�A!�'4@��b��@$(�`@�`��6�@5��`B�@Dع�@#�׊��@',�*h�@+�iO�T�@0A+�"@3_��Й@6�l��@9kF4u��@=ӲyU@@���f��@B�W@@D�x#23@Gr��j>@J���N�@L���rD@O���^\@Q��T��@S@��e�@U	�+��@V�S��[@X���*��@Z�$"�~�@](6d0��@_p���*@`��s��j@b(�Ԧ�@cu�a��Z@d�a/�"@f9/M��@g�D����@i5�?]�@j��w���@ll�mVvr@n�Ӂ#�@oߧ�(��@p��O4Gd@qǢ��O�@r�]p��@s�a��
@tł����@uԍ�x{�@v�kw*�@x
�?�@y1�J���@z`�W�m@{�r�v��@|�#�
� @~ ����        ?Z���k�?���j�?�1pX�'?�p�\Iڬ?�H���Y�?��&�l�Q?�.ȉ�;2?�]���1I?�Y�z�o?�Sd�qv?�b挡� @תk��@�}Lu@8�ed��@���:Q�@�h����@ "�:!@#_���3@'p��@+�Q�SU@/�)��@2:�=�{@4�:�ڕ@7����M@:�Ze��y@>a-R��o@A<�߰�@B���O@E���[@G6���	�@I�1�[^@K���ϕj@N��)�@P�1�4�@R�����@S��Pܮ�@U��~r�@V����^@Xn�kEj@Z2Vjv�C@\ތ�  @]g�s@_�n|��[@`���1�@b
e�/@c#JrϨ�@dE�h�dW@eq��~�@f�3.�J@g�5�@i/�+��@j��]cWJ@kߤt��d@mF�Z��@n��X�1>@pq�O��@p�!ԲV@q��}.�@rp�79@@sBc�@t(�Cb�@t��Y��@u���s        ?�����,�?�m��[��?�ҩ����@Âw]�@0��{~@��s��7@$�<��@,���ܮ}@2��@�S@8D�c�l@>b1��{�@B�|V�y@F~[�'|�@J��1v�=@Ot��#4^@RK6ͮ \@UT�'y%@X��.��@[ZL��N@^�y���@aIGI�%�@cFDA��@ec%�Q1@g�Tju@i�+u�@l|�x�!@o^�F@p�^���d@ra�'�@s������@uw�d�c1@w�%9@x�J�@z�����'@|sׅ\a�@~^h_�!�@�-90ǖ�@�3�>�5u@�C�G���@�[���AH@�|�}��>@���.+l�@��~�ÙY@����@�Y}Ե/�@��ѡI��@���o�@�\7�V/@��N1��)@��<K97@�ס^9��@�� 'f�@�^�#�5?@�)@�K�
@����@��@'���@�������@��aX&@�_Ί2�@�E82��@�.�a��l@�����@��kTk"        ?P�2����?{C1 G'?���+��?�q�!���?���_c�A?¢�P�"�?�(d!D��?�
�5��?�JZ??��%��?��p���?��s�lw�?�"�|�?�n�AR�?��&�o��?�:�V�B@�N�pM�@u�mH�@�
���e@
Ќ��@c73=�"@���dl@.�Z�~@b��JSq@�)#m@@=ԓ;R@��j@�\��[@!V����@"�� �K@$�� �+@&I|"t�@(<��er@*�9�N�@+�uA^�@.Z^��@0 T{}�[@1BfJ�[@2p�(��o@3� ����@4�7I��@6FJ�V@7��3��-@9���@:�z[\;Z@<�w�
�@=�:��%@?T��|��@@����~@Ac�^H@BJ�2��@C9����@D.Ku1�m@E*�oK�@F-��ii{@G8bغ��@HI�E��@Ib�'�@J�1��E�@K���M�@L֧���~@Ne}���@OGv�Z        ?N+�8B�?{j\�g��?�/�Y��,?�r2�'n?���ȉr?�`����?�ӽ�ΐ ?�	R�?��H�q�?���[�@ rkGJ@!9�d@
y�V{@��`���@�kY�!@*w�l�@!�-����@%����P@)���6�@.X�:�@1�d���a@4���0@7�"M���@;,��<@>偮���@Av�_ݒ@C���_�&@E���g�@HyK5�A@K%�R�|=@M��\��n@P��څ��@R��lQ6@SЮ�kx5@U�����@W�*"���@Y}�[W�}@[�C=��@]�lG�@`	�Q��@a=���@b��8��@cψ��1@e-����@f�B���@h�\9�L@i���ү@k8��В@l�%8��@n���|��@p0,�$Ŕ@qŻ�.@r[���@sTa�@t����@u�\i��@v/[��b
@wL9�@xq��	�@y������@z�JMd�@|����,@}^���K        ?G���#/�?x�y�ү?����χ?�8yo��?��Y�L��?��|kp#?����	�?� Q��?�w�<Fer?�A�K�@���z��@��)@��@U-�h�@.����@�ͣހ�@��>_��@#i��� @'w�%5��@,
��7 @0��'��@3m�m�{@6��T���@:e��q@=�خ�	j@@��<U�@C%Lp�p@E�4�5@H$�S��@J��2��@M�'7.w�@Plu,��O@R�T*v@S��x��@U��u��@W��w�@Y�n>�7@[���~@^���=w@`,ނw�@af[�T�X@b�e?�'@d��@ed�
��~@f�#�$�H@hS��X@i�f�S{@k{eCfB@m$��0��@nܖFw�@pQyϸ��@q;�����@r-�9��8@s&���M@t'�Ǉ��@u/��{G@v?h���@wU�'@xtI�kz5@y�(�3�V@zǊ��~l@{�s���@}8��k�/@~|�T��H        ?�cL3��?��+�"�?����p�?��(�Ԃ@�A����@��8�bQ@kd&_OS@ ��b�o�@&��l �@.B�_ @3qO��*�@8n�-@g@>"uП@BJx��3K@E��Gi@I�Wʱ��@N^�?�@Q�ƴ�0\@TI���*�@W.�({�@ZP+"��E@]��;��V@`�wF`�@b�yc	->@d�����V@fۅ�f�|@i0�Ańo@k�Vm��@nE����@p���'@q����@s{L�C�)@u�d���@v�-�=V@x�5np�@zTp XJ@|=;�$��@~:�:�Y@�'G0�@�;d6K�h@�Z�K~rh@���"5�f@������@��j���@�J���@��o�_�@�	�f
@�{���@��q��]�@������@� �9@��d��6@����}�g@�����U�@�w��8�@�a�Z�W~@�Q�ہ�Z@�H_<�:7@�D����@�G����@�PP��xD@�_*
�zQ@�tλ�