CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T110708        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @               ?x��q�#?�������?���U��?�/T�yޅ?٘w�$??�:�6�?�
R��Ѐ?����o��?�>j�'@ ��8�@�DsR�@	c>,E@k���p�@���x|N@�����b@76��T@���Z@u#�v�{@!�ʐm�@#�t�T�@&�h�\@(�7>m��@+	�
@-�b�d�n@0>�Xr�@1� �4<U@3<˶���@4ռ�W��@6�#�}L�@8<9��IJ@:
:U�n@;�T���@=ܧ�u�@?�=��2�@@�6LG�@B���@C.c}��@DUa�kiu@E��H�O@F�H5���@HJ��N�@IN��'H@J����Q@L�s�-@Mm	>@Nߝ��?)@P-ഥX�@P��u�k@Q�aƜ|w@R���ځ5@SU���iq@T+���@U�����@U����@V�6��v�@W�U8A�@X���&��@Y����5@Z��}�!�@[�d@*�[@\��_��!@]��^�!1@^�.�D�        ?ekXɾ�?����ޘC?�^Ǐ�I ?�{w��?�&z��]?�rOVȼ?���QL�~?�KY.���?��>��@��)e�@vn�@n��o)@h��_@���Ʉ�@#���x�<@(~��(�@-ҵ6�@1R.ҝ7@4s[A�@7�3K�@;��r{�@?���@B9�tw�@D���W��@GY��X�u@J5�/��M@MF����@PF�۽'�@R���y@S���@U�w.�r�@W�wq#�@Z U��@�@\q��y��@^���i�g@`����>A@b �I�@cyq�)��@d�1_�@f|��$�@h�y��@iĺ�B@k�ko��@mT>�(tF@o7��@p��-�%&@q�8��e�@r�T摯�@s�3���@t��S�K�@v�B�'@@wD����o@x��J1n
@y�TҔp@{$Y8Y�@|��T���@}�Bkh @cXK�E�@�q����@�7yw��@�pj6&@�қ	�V�@���E�4�        ?iU?�l0�?�� ���?��O�w�!?���WY?��Q��2?�+ D?�{�~��?�ۈj�<v@ �9Ա�^@/�@3����@��4�a�@\q�F3+@ ��U`si@$�P)@}�@)#HH��@.J�ʭ�@2
sad�@5D �:��@8�V�a2@<�~�4jd@@�bjJ1@B�!��@E\���@H�^�1@J�o��� @N�dt�@P��C�@Rvݩ߮J@TT���@VMzW�u@Xa��	q`@Z�[�xi�@\��aoϚ@_G�q�@@`��u4�@b8OO�l@c�fJ��@eJ��@f�0�l@h֛A�@i��7��@kY�TE�Q@m{I�`�@n� �z�m@p\�ps��@qQ�����@rN�ɂ�j@sS��Z�|@taD�3�@uvȩ��@v��e4�@w����NX@x�+1ٸ�@z ����@{_} �ʖ@|�i0�3�@}����}@Q �À@�YaK��@��4���@��7	ߍ@��8$�>�        ?��qa���?�q���t@	�AifI�@G�yK@'��$�z�@2�Sȴ�0@:�&s��@Bz�โ@HV<��U<@O\ҷ��@SXJ���z@W�%��@\V]|��~@`�xm< E@c��B��@f�6ª�:@jJ?X#q@m��r�J3@p��oL5�@r�8�\4@t�PI�ME@w2&���U@y��8���@|*�a�@~��oPx�@��Dfk�@�L�R���@��/Bag�@�pA�C�@��A��@��X�~�@��xkp@��4���@�u��&3�@�;�v��a@�E�%��@�X>c$�@�s����w@���Z
�@�ĊM7�@��-�&�P@�8���_�@��Y�#@�����@�(�����@����隚@��E�c��@�4�>B�y@����&y@�����@�}h����@�I��?�a@�N�%�@��9ȝ@��ɶ��@���b�@�����̌@�tg6��@�`��wJ�@�R�fI�@�H�(��@�C�jn�s@�Ctŵ�\        ?i�Q�;�?�@�G��?�>Yi�0?�,B5��*?�%�w3�?���1�?�Ha�?�ҕ�L[�?�>�5���?�Ek����?��Z��@=�s�B�@�.:�G@��*j��@B��^@	�M�>�@��*��G@}�ŗ�@�[_�(�@�R��A,@ +!=|Ǡ@"	R�F	�@$��(5W@&e�w%e@(U�qYFD@*�U�z��@-C�(6@/��6��@11btq@2�E �	@4�w��@5�,�w�@7-.�.�@8҇����@:�17��Y@<K%�*0&@>d�9s�@@ y8#7�@@�jD=dr@A�	�f��@C[�S7�@Dc����@E*&3�1�@FI��3�i@Gp��x%@H���>��@I����@K����u@L\2F�T�@M�����@O�BV]@P/��mg@P��h���@Q�E�@{@RUe����@S�5�g @S�JV���@T�邏�@Uk�q���@V;��u��@W���YH@W��ͮ�'@X�V_�~�        ?`悅�r$?�����?��s���?�%��?�D�q���?ޱe���$?����-&?�Fe��?���`�CJ@I���
@
�?��@%����@��g"@������@!=�H��@%n<F]�@)c�b:�@.>�>:n�@1���lv:@4��4��@8���I@;�cr�@?��BϏ�@A��v���@D0��P�@F��c0�@I>�6�;�@L{�hБ@N�G0q��@Q3$y@R�㳂G@T}{l�@VW/����@XIW�^�@ZTE���w@\xJov��@^����s�@`�d���9@a��ᙌj@c�@v5�@dWz"ˉ@e����d@g%��EQ�@h�Z=�@j*@E͚�@k�_X
e�@mf�j�s@o�q�z@pm�I^F�@qU�H(�@rD��d�@s;���D�@t9����@u?��@vL$�
S$@w`ģ�5�@x}�֘�@y�
���@z��U�u^@| Vzd�R@};����@~~�0�@�%.�R        ?dHy��Dj?�ܻއ$?� G���?�EOC3�?ә�g�l�?����Kw?�ՖM���?�.��k@ ;B�u�@����C�@=����@�����[@�Y� �?@ �˓���@%)"�E0@*մvX�@/��d�E@2�K��l@6|���#@:o<p-;@>�m�L��@A�#��X�@DqN���@GO�QE�@Jk�0�@M�ߨ,i,@P������@R�޵�D�@T�?1�@V�]��@Y<R�4��@[��<$2_@^U�`u@`�'˓ @b ��@c��Ŭ%@e g��@f�,���@h�=I�jN@j`���@lG�V0�@nB�V�q�@p(�Թ�@q:wʺi@rV%�A��@s|CcP@t�?E�|@u��@��@w+���K�@x{_)�5�@y�|f���@{:?N�I@|��9���@~#��9�X@�	���@�����/@�i�9Pp�@�<�Q��a@�N��Q�@��B�Kd@�ֿ�[��@��ǇG''@��[�Y��        ?�&#�N\v?�\���9?�Aѯ�cd@�f�"-;@{���@(��W�@2-T��
@9dxU~��@@���g��@E�4�0�@K�'��@Q��E��@T�����@X�y���@]rsp�q@`���O�@c�|�w��@fvV�x:�@i����Gc@l�o��� @p<4>�<�@r$���T@t+囟�@vRy�mb @x�kP�(@z�؁�կ@}�����@������@�u��l=@��񗕅@�i����q@������@��7�p��@�N��s�@�ت��@��˧,� @��w��B@�X��n��@�X��.@�`�W���@�p�,_�s@���x3@��x�g�@�εNN��@��˕ �I@�4�Ӹ�]@�s�Y��x@��5y��@��Y2��@�_(�o�@��x���@���x�Uo@�H�g0i@�a}~�@���Q#�@��9��:@�M]�*��@�����@����k@���:�2@���˨M@�m?u��6@�LaD�n"        ?sP�`��?�&g- �?�p,�6�?œ1{�G?�
KT�?�%2Y�?��a�l8?�P�E�?��jS�?��zZU�@ ,�j~�@��4��@�,��@l�-y�A@��TLV�@]t���@E�/Iv�@g��Х�@ú��|�@ -Q��m+@"�g�Z�@$�y{�u@&C{4!|�@(���n�@*��VѰ@-l�d'S@0�Z��@1g**��@2�&46�@4V�]9��@5�����@7�5D�h@95԰�j�@:��׶�@<�[$��@>�Wv�C@@J�v���@AJ��J��@BS<��h@Cc��T�@D|5l<G@E���"�@F��Ҏ�@G��
w�@I018�v�@Jq�]��&@K��\ɩI@M�ί�@Nh:�F�8@O��/"@P��$�@QT��l4M@R��a�d@Rԡ�R �@S��R˨@Td�%i�y@U2�Y!��@VѮn@V��x�k@W���Ͼ�@X�\Jˊ@Ys�ES�@ZY0��Y�        ?a�$�),�?�X��[��?��` ?��A���?���D#?�a����?��4��?�3}7�0?�O	Zf@�$�2l@
絃]��@�'���u@}��G@?ڔ�Ǳ@"<V�H\�@&e�_>�A@+%�Q��@0B?�=�/@3EX���I@6�)8�1�@:V����=@>l h`�,@Ar���@C��GM��@F�>��+/@I]\W�1@Lm��4�h@O�:r��@Q�0|�R@Sz��v�	@Uv��	tZ@W�C���/@Y�x���@\"�,.U@^��\H�@`�n�Ps@a��~��@cb;�.�@d�/�+[�@fl��cL�@h��^�@i�G��F@k|!o�@mNL~yK@o1�;`�	@p���$7@q��d��@r�P��F@s���f��@t�����@u�$
�f$@w.�
b�@xg�����@y���w�@z�Zw͊@|KX��c,@}���/o@'*��@�@���@���^� ;@����.�1@��	m.3�@�Q��yU        ?]��Eu4r?��x��k?�����2y?��+��� ?έ��2)?���Gu?�#m��?�͐�,yj?�)�V�@sԹ,�D@	,<��,@�)hop�@��A"@}s�:�@!'���p@%c�-+�@)�n9�#�@.��.��@2(�d���@5P�TT��@8��r$�@<�W̸�T@@hk��i7@B��#_@E"�9��k@G�)1��@J��1�@M�Z��~n@Pq~k��@R)\N@S���V�@U�0�z@W��뒚�@Z��=@\M!:�u�@^�֦<�@`�#�a.�@a�T��H@c+�� t�@d� �1�@f�ce@g��ۺ�@i=t9�s@j�?'��9@l]���@n&�w�/@o�1�|�@p���ׇ@q��#�n@r�6lW�@s��Bz@t�U��@u�+oo��@w�1��1@x&z�I�@yN�1��@zO��z@{��m�IE@|��ؔ�p@~<�I�@����v@�p��\@�^ގ�>        ?�{���z?��ԪE@s�(�2@����'�@ �����X@*�Rx�@3~�<(��@;�ThJ@B��j�h@GV���%@M]+@�ډ@R�s�*@U��}}@Z�I��@^��@q!@a�B� @d�]K�Q�@g��̄w@j�P��o�@nT��r@q���@r�ü�4�@u�\��7@wAsT��@y��1�(@|	��r�@~��L��@��!sW�@�dL��@���&IM�@��'$��@������@�_t�%@���� D@�����@�ÄhJz&@���2��@��4#S��@��c$�?@����)@��̠4�@�&����@�N�/���@��ₐ(@����~v�@���8�:@�F� bH@�����@���D$-@�Z"����@�c��R
�@�:��\@��0`T@��_C�w�@�g�����@�3O�	��@� ��d�@���mU+n@���_�l�@�����1@�jo�(��@�NIϞ�g@�6���        ?iU����?�l.�j��?�hր9�:?�)�N�x�?��6���?�ɣc�$]?�ImDi�C?�ve��&\?���Q�w�?�����P�?�����i@ ��<�6@y�����@d��dɖ@�i�+?@����@?ZJ�Q@ ���n�@��q���@#���H@�a1TGb@!��(\p�@#|i�@%�d���@'�).���@)�-��HA@,Pފ�0c@.Ҡ� �@0���-�@2b��.�@3��9GP�@5�፞�@6�n[9@8=�o	;y@9�(�4��@;�wZ��@=�[��"@?f���)@@��x&t@A�j�h�t@B�y����@C���O~�@D�e1��O@FM(ۧ�@G3����@Hg9�+$f@I�aڈ�@J�Ѧ�@L5��y�@M�����@N�M�ͪ@P)A��@P���S@Q��o�`�@R`,��ir@S&Q�K�P@S�:~N@T��H��@U�Χ�::@Vm�-�W�@WK���_n@X. 05�@Y�\�̑        ?_L��0m\?��K�ͯ?�N@Y\p�?�Ca����?Ϫ
��-�?�==�?�~Ds?�!vBK&?��6���@L�
�@n��EW@!�v��k@�#�^D?@Z����@ d�G���@$斘�@(N�¢#@-]Xi�@1.7]�O=@4 �	��@7`g&��@:�[4�a@>���P]@A������@C��X!f�@F?Y�倂@H����@K����.�@N���<�@P�6�tw;@R�B9dZ/@Tc�6�ʙ@VDEH7@X=�{���@ZP�<Z��@\|�IUf1@^��1X@`��N;r5@a΍�HS�@c�j*�@do�m�ԡ@e�tb��@gF9��Q@h�M�a9�@jQ�f�o�@k�#:�@m���s�@oGy����@p��D�[s@ql�7p��@r[4��*�@sP��p̭@tL�i���@uOx�<�@vYW��@wit�+]@x��ŵ@y�{�N�a@z�"�s�@{�-ֿ�@} �J���@~Y�e��@�;DrFd        ?`)��<\?���t}]?�\wgS߭?��q��>�?�T��?ݚ�Z`�?茫�QIL?��ŕM�?�!��aVV@�+x�f!@T�U6@9BOU��@�%��*@N�o�@#���\@'zs�@,���E
@18��}I�@4�&017e@8/��P�\@<E��ģ@@d��m>�@B�U���,@E��=�F�@H�"��T@K�5�!�^@O)�`��@QnקP^~@Sj����@U�Mp��@W�W�:*@Z1����i@\����G@_l��!�@a!�/�}@b�Dk1Й@d2eP�'�@e�`�I@g�y���j@i`�ő�@kD "Tq�@m;����6@oH��9�w@p�~��F@q�K?��<@r���n�}@t)`��̘@ue��X��@v�K�	e@w��DNj{@y]��)�K@zƌP�R
@|:�0��@}�F�̼D@E$�-L�@�m�
u�u@�>�����@��+a�@��j�[	�@��}}#�@��W���6@��� t��@��t�II�        ?�n��v?�a�~��?�&sy&%L@���V	@3^��:@%�#���e@0*����@6��f��@>#	Gv�@Cx'��Y�@H�4\�q�@N.�]��@RD&U2�@U�"�S6@Y����E@]��7��K@a?�fX��@c��|A�1@fmp7�S
@iOi>��@ld�f��@o�a�h�@q�m+�L�@sr�S��<@ui���_+@w|����|@y�����E@{�>!2 H@~b�;�@�t����N@�Ɩ��V@�')�4�z@��hN	@�P��b@���gVRp@�<}��@����o��@��f��ɗ@�e�b$3�@��Z�6�@�չo� @�	\�6��@�
8y�*}@�knc9@�!�=�ր@�8�]�"@�W,J|�@�|�,�y@���[��@��{,CA@�y��@�]��y�1@��t�N�@���ɀ�&@���K@�\0RWӷ@�=�Gc4@��G]L�@@��X4��@�Hz7�@���n��@��T�@������\        ?~��K~�"?�+9,�1�?����+�?�W�d�?�[v��G?����?���`-�?��OO�B?�{�A�K@�࿨@��k�x@bf�=�@b��ܤ�@U���@�nEO�@ ,��@��@T�@ ����q@"�f��F@%AO�d6a@'�Y�k�\@*5�sO@,�=f�xG@/�S?�BN@1]��딥@2��38KJ@4�h��z7@6N�]��@8a��W�@9���(@;�A 6:@=��\C��@@�t�@A)�T�@BMo_N�0@C|7<[��@D�p|r$:@E�&6��@GGf�g�@H�C$�sj@JΦ�^@Kr ˭XB@L�U��c@No�'���@O�����@P̽أH�@Q���4t�@RxZF���@SV�p�(�@T:�_�(@U$�A&��@V���ZM@W	���s@X+xd^R@Y��7�@Z�â8�@[�zd�@\*�m�@]A�c.7@^^�!��b@_��b�@`TY��_@`��䮒�        ?p�k!�)Z?����g>?����It?ʄ�i�޲?���et�?�S�%yB?��c�v�?���Ԟz@�S�^@
i��[�!@���P�@+P�|�@�'x=#@"�L!N#�@'�?r�@,/��2�@0�4�"b�@4AP+��@7����i@;�s�'@@;��Z�I@B�#�ܪ@Ee���!z@HU��'�@K�e4��@N�LKb�@QS���@SO_�}��@Uns\���@W��zY�@Z�i,@\��%9�@_\_��]*@a&�@�@b�.(�@d4�ͥ�@@e��2C��@g���}�C@iv�4`�@kb�e*(@mel�=�c@o~�=t�@pפ_���@q���Lb@s+���Z(@tg��
��@u�m�H/�@w�?���@xgS�u�@y�:s@{Q،(p(@|��$]/`@~qa��2@�
���� @��ܟ�5@��x�	ĳ@��T���@��E��@��Z��7l@�������@��/n�_f@����E@��I�C��        ?uHDL{�?��Nu~֝?�Z���?�˩KQ�S?��l"kx?�Ŷ�h�?�$�d�?�_��% |@ W��t�@C��/@iA�bi@�^�+b�@�Q4C@6��v�O@!����E@%�F=��@)��'D��@.BJ�@1�
j��@4R��p�@7�*�$�@:����@>���V@AAv�r@C_.�`�+@E�Njg@H����@J��J�p@Me��P��@P'�?T+@Q��9��6@SQo)�M�@U3">�@V�1�ʚ@X��"��@Z��ۍn@\���Ro�@^��mO�@`�:=��@a�(n嘇@b��A�@d6zʣS|@e�K��@f߉t�ux@hF ?3�@i�֛H�K@k7���[@l����/@nZ`�<5@o�C�n�@p�R��5@q��W���@r��!���@s��W��@tws��@uo��it?@vn;8Mn@wszb4i�@x]���@y��ao�t@z�F��@{�h��r@|�e�i(b        ?�-���?���h]P�@�an_@�@!���z��@.�n���@8����@A`� z
�@G���Ǧ@OC����O@S�d��m'@XƗ��@^2�I��>@b�g%S�@ee�>=,�@h��WLDw@l��Uv#@p�̋K@r�+u�@u8���62@w̢�&@z��]�K%@}s'T���@�C��ч@��,��@���#1��@�fb���@�I�mKR@�D(e�\�@�U��Z�y@�~h�8��@���� �@�T��@�B��y�@����Y@��Tp�/�@�0z�i@����&��@�
���@������@�F�+I�@��鷋��@�P��!��@�����[@�_!�~)5@�C��Ԩ@�/����@� ����@���ɋ@���?��@�� '�@�'a�=0�@�9i��S@�RI	ii@�qA'�@����7@��~����@��u=
�@��6I�s@�����c�@�[�%w@�LH�5@�����Tl@�W!~
�        ?t�%4�?�(�����?�-��_��?ȫ#׆��?����=�?�1�V�ſ?�G�:)?�K�,�4t?��흝Z?�Z��'@X����V@xd���r@��+Z�@qV�W�@�n���%@���o@1���@õ��1@ Ni�M�@"^P�ѭ5@$��F��@&�E@)pFӗ%@,M�w�7@.�y�o�g@0�?'͛%@2�� ��{@4*�<l?h@5�R�6o@7�6 ��@9�S����@;�E�~�@=�@ONBp@?�}_��d@A]t��@B7R�͎�@Cm��J/�@D�=|��@E��C�M�@GV��A�t@H�-��@J+>�Y�\@K�֩�@M-�wh��@N��|�|�@P/��{�@Q�3�L>@Q�}w@R�k]:x@S�lv#�@T����+@U�
{�k@V�� �x�@W���t�C@X��ľ �@Y��v�>�@Z��(%q@[�'S�@\�R�&��@^	�:��F@_6����@`5!1��O@`��ҋ�q        ?s�~��?����\ZT?�gF�a?�X����O?�$�@�R�?�\��JA�?���Rv�?�Y��w@eב|$@"��EI@Gq���0@����@��G���@#���4@(h���@-$�&�]@1k�i�x@4�n�V@8&�M�S�@<��0@@,4:�7@B�H���@@E5i�R@G�x/��0@J�~%��@M��E�W@P����S@R�[���/@Tp$G�@V~��֭@X�c'���@Z�0?&,@]h� ��@_�a(@aU�|\j@b��@d:�P��@e��W�N@gg=�P8@i-�a]@j�^G��9@l�Nd
�-@n�;u:+u@pM��P[�@qV�.n<@rh4�~��@s�et7VY@t��\�3@u�O�ik�@wQqd�@x[�.�N@y�'����@{B�@�@|mPd�x@}�i��M@Z��v�\@�q� @@�:h:�p�@�	l嶣�@�� ���@���gJ�@���q��@�~��g�        ?_t���#?��8E&m?�M��ͥ?�,~'"j�?���u��?�����?ꭺk`�?���}�E?�X�{�_@g-*7��@2S�95@^;ض��@��KpY@Ꮺg�0@#従Tc�@(v�B;/@-��2
��@1�_�e@5�	��@8ŉ�d�@<ٙ5���@@�uڴb�@C �j���@E��=��@H����8=@K����uR@O@�L�Q�@QrS���7@Sem��5�@Uzz�R��@W�Wm�]@Z�
��@\��|��@_3!U��@`�:�@bxM�pT�@d)y���@e�,��@g[��u��@i&(~�&�@k╙�X@l�E��O@o���o�@p�G8�J@q��u�u @r؋�c�r@tH^�w@uL���@v���+@w�?7�b�@yU!@��@z��d:� @|EY?�@}�����@i�jU@��-9�n@�b&f�x@�B�����@�*���7�@�}Nc�@�M�qW�@�=���2@�]W��        ?ÿ[�N|?�V�&,�@�vE	�@�h�9i@(��(h@3n�@d@;�ߗ��W@CI3i�n@I�48c��@Pj�?>%�@T�W8zǮ@Y1��PD@^_ T}@�@bB%�@e0ϴ�R�@h��D�@lX*(Ԅ@p/ *�&�@rY*b��@t�p��H�@w&���O@y��c�Q�@|�{,���@�� ��.@�^�'49@��2K]�@���`@��m�
��@���;>Բ@�����M�@��)j@��[f�@�����K@��Ļ��(@�dP��h@�Y��54�@���wO��@���9l@���5��@�0߅��@����fU@�4�$�,�@���`v�D@�IT�T��@�+
�Q3}@���&*@�63��@��ؔ�P/@�������@���~v�@�	��z|@��I�_@�8H"5�@�[4`�Z�@������@���δl@��؀|�d@�3l.��@�>V�^�0@���V^�@��� џ@�C3�p+�@������        ?z�iG�f??��vEʉ?���<��G?�.�,آ?ڄ��3?��YJ{�?�3#�{\�?��!�Bky?�dg�@��z�@�+�O@
�9��y�@ ^	`@����B�@&E(��@�&{�|J@cK�u�v@ ��ހT@"�Z^�"@%0�9� @'�u�U6%@*F��l�@-�,�@0r��e@1�P���1@3>sY���@4� ��D@6�2�*�q@8�KEi�/@:��}���@<�LO	GF@?���f@@���� s@Aݴ�e�@C��A�@DdC��>d@E����݉@G�f��@H�8'��@JF��˦@K�D"a[@M��l��@N��r�r@P-H����@QR�L@Q熧N.$@R��M��@S�j-���@T���q@U���ɾm@V���ęY@W�y���@X�F��@Y��g���@Zۛk�?@[�6݌@]l\.3�@^B����T@_p�LKp@`R/o�@`���N��@a���X��@b1[��        ?v���O�\?�wN�a�?�&��0�?�>6{iQQ?㧉c���?����)�|?������@�y��@-����g@J��S@���E-@ ��b�i�@%0q��T@*J4��@0�G��E@3���V@7Mq6��@;�.�6Q@@�3�S@B�Ź�(@E~���͘@H�Χ!�@K�1���@Ok��s�@Q��z�7@S�/h�ل@U�v�}�@X) ��@Z���켽@]6�3x��@_�D���@akw����@b��^t@d�����D@f0�bfY0@g�rpAX@i�����@k���T�[@m��S�@o��(��@p�; ��V@r�� �@s+ޙ�8�@t]���K@u��e@v�Et("`@x6��{Ұ@y�7�~��@z�'"Y�4@|t<j�@}�P����@���逤@���I ~�@�^����@�6n.%@�o�P�.@����X��@�ߔ�vt@��^I�G2@���o	�@��dw��@�����"u@�ö{^�        ?u����<�?����,?�؉��?τKx��?�ƣY�?�QȰ2W?�[���R@ �����@���Y>@���Թ@�ε�?�@(|�&�@"E���@&��=��$@+�XJ�6
@1�	T4@4xȯ�oG@8Q�:���@<�w���@@���!�@C;�\$P@F
y[�C	@I+OGa@L_N,�M�@O�� ��@Q��m9�@S��B�v@U�$L�?�@XD�����@Z���"�d@]4o��@_߰Z$��@aV�!���@bϑ���@dZ&�&j'@e�� �[@g�"���@ig���FH@k<���fe@m%�|��@o!ig�@p�|T���@q����@r�AB��@s�s���@u x�0@v]���
�@w��Gf��@x��L��Q@zY!ibq�@{ċ<��
@}<���@~�T��A@�(>�Bwf@��߃�2�@���7�I@���M��@��3�@�s3ndQ@�c/�5�~@�Z)T�@�X32Lk@�]
��        ?�˱<<3?�,�ϑ@�Y�ٿ@$�V�@1��a�	@<�%�:b@DvO��Z�@LDU�k�@R��hH�@XZVX� @^P6~@bq��r�4@f9ڙ��I@jf!�9��@n�\M�H@q�$`U-n@t�ЗDs@w�1A+�@z���7�;@~x.O�9@���g��$@���P�/�@����4��@����n�J@�s͛��@�v���O@���A�փ@�LxW>Y�@��U���@��
�@��m�o�N@�2��Kz{@��I����@��wp���@�O�Vupk@�%_x^�@��n4Q~@�������@��Sc�@��'qC�@����׽�@������@��N����@�ΆxU�@�CC��@@�~�����@��&��jy@��YފO@�`��L$@��!Z�a@���C�@��0@ً�@�~��$�\@�<׶�
@��p�C�@�»ӻ�@�����$@�Y��j�@�*,����@��%{Q@��V��@������'@��^���P        ?l�}��;?��|�?���,r�?�0;0=%?�P�vo��?ۺ*�~�?�y,2��?�Wފ;?�
��v��?����rGd?��M�`\@'ba�h@�"\�@nr#���@$����
@���h�@�nc���@Ɩ�tC8@d�5@�;�zs�@!��>�@#���%9�@%�3�V;&@((���@*��ӚS�@-���I@/�築�d@1,Od�C@2���$��@4���K�@5��P�G@72g�pI@8��.��@:�{�p�@<R�H�W�@>%z��qz@@y����@@��|�C+@A����@C_�o�&@D-W��b@E$6��w@F@ݴ@GdG��@H���@I�Z�.�@J�+�V�r@L<{�}V@M�Oh@Nժ�N��@P�5"�@Pƈ8�@Qzq���@R1�2V9n@R��N��K@S�@qa�@To����U@U7t�nG@V����@V�o�W4@W�\��r@X~z��`>@YZ�6�:H        ?`G�ڊ`?��U�?��k�^��?��/�b�?�m��u�?ݻ����?��+*�I?��#p�E?�i�;
@�8	ˑy@	���b-@���;��@S8r�e�@��9�@"��U>�-@&�h|=&@+�1v	2@0����!�@3�ZD��F@79uVi͢@;]��f�@?D<��]X@A����gu@Do&�݇H@G#�i�@J&�
��@M/,�f��@PC��vF�@R�Z�_�@S��Ͷ@U���f�@X�$���@ZP�݋�@\�$��i�@_%�.��@`޵��I�@b9���j�@c�����b@e��z�H@f�����W@hBMp��l@i먤wu�@k��k/@mn
ܐl @oG4���@p�7D��$@q�� (@r���۠@s�q!9�[@t�Y��U�@u�X"�$�@v�k&���@x*�j�]�@y_�U���@z���?�@{�0��%@}/a ��.@~���%�+@�k��@��A����@�Y�e�@����z�@��;G��<        ?aG�+�1R?��Y��[?��j�c��?��h	j��?��<_B�n?�h�����?��lu��?�gLrċf?��V�v@%O�U�@���2�E@M@7��4@Ţp@C�?�h�@"�6���@'R|�~P@,X\?*.�@1�f�@46�?��@7�ʡ�]�@;���]i@@ʾߣ9@Bg�:��8@D�	k[�@Gɬ��@Jι|+@NWp��h@P�G���@R��1�
�@T�D�Wpc@V���v�@X���)�@[9^�D��@]��m���@`"<Ķ@a|��ڶf@b��Ѩ @@dc�m�m@e����@@g�1*B��@i9����@j���}�@lƤ��@n�����@pK�����@qL�0���@rV6n�2�@shM�e&G@t��3�.�@u�D����@v�)���n@x�e�)~@yC���g@z��h5�@{��-�h@}.��2?@~�f��[w@���^��@�����@�p\58	�@�1\��vM@���@���@��R&�?t        ?�}��eΑ?�o���>@	��N�@��:&@!q�E�&@+���Ӳz@4W�?9�
@<9-Ш��@B�/�A@H/'>�b@N^{�_�@R�Hw?�@V�,�k!�@Z�V��T�@_����@b~"�!��@eY"�|�@ho�=z8r@k�"	��@oS/��l�@q�:���@s��CL�@u��b�n@w�,�v�@z_�m@|�4���g@�K�:|�@�!���*9@���,ε�@�6�'��@����'#@�C����#@���x��@���=<��@�����@�ir��@�-Ɉ1��@�.��HSQ@�8H1} �@�I�!�D@�c1���@����~�@��by�'@��"rU�@���Zr�@�\�7��@��uSd��@��-߀�@�TI��@�@������@������L@�L9M(M@�
�Fח\@�ͻ�ʣw@��
�:@�`���@�0���+@�F���@��D���}@����Eh@���\�"D@��u��~�@�o�����        ?|(�W?��"��S?���ՕJ�?΀�\�w�?�g�j�3�?� ���?퐥6�Y?�8gq�MJ?������@ �(�t@C���H@	����o@�+����@M�"�S@l M���@�װ?	�@~
n�Tv@ :���I3@"[��
�@$�����h@'�<|�Q@)����F@,b��Z8@/G����z@1*g�I�N@2�n��2)@4u	�ݬ@69�{bw@8���!@:b�D[@<	�,�@>g�1�@@&3Ŀ�@AH)�q�@Bt�{��@C���M��@D����i�@F<f�^�@G�ū��.@H�&C�7�@Jf���P�@K�
�yg5@Md���@N�2lܱ`@PGm�,\{@QF�˥@Q�m*m@R�{"�bB@S��JT�@T��
l�@U����4@V~��cK@Wx�@��@Xvދ�C�@Y{"o�]�@Z����@[�����@\��}c��@]©��%@^����	@`eR5͢@`�r�.J@a0,����        ?n{�.�?�4��(��?��0����?�
�kȄ?�b�b?�R<�N�z?���7c?�X�]h@ �=�@�GY^�z@�Ӫ�W@@ 畃h�@Ԛ{P�]@ G2���@$2w ��j@(�@p�Q@-�z�+��@1�c4o��@5%8��Q�@8Ϲ*��@<ീHu*@@�h粱~@C$A�v��@E�	A�%�@H��+��@K�O��6@OS����@Q)��@Sv�JG��@U�oS�I�@W���{+�@Z/gA��@\��j\@_b��<4�@a�BN��@b���M@d)SD�!�@e��r!C�@g�FB���@iX�-a!@k=WMp�_@m7�8��N@oH�B�@p�IH���@q�����@r���D4Q@t50]��@uvG���\@v�%�t�y@x诔2�@y���D@z��%@|n�'��@}�E�4k�@�>��J'@��c�2Ia@�o�0�3S@�M�Z7��@�2WD��@�/]�@����P�@�a'�7�@���{        ?hD��;
�?�
�g��J?�,��E?��S���?�k�P`5?�:M�?�1��?�hP���?�J�ON�@�b�_`�@
Yx��ݣ@X���}@Y�v:>�@B���@!�K��E'@%�<@*�����@/5Uu�Y@2z����@5�>��1@9;cYX�x@="�n�&@@���0=�@C�3(�
@E��: j@HJ��n��@K;�]0P@Nc/g��R@P���{�@R�Hm��D@T�e��;@V�{�Ů{@X���p�@[�UP@]r!��r�@_��(�Ea@aN��d��@b���
@d'�Z��@e�����7@gC�(���@h��ɇk@j�Z���@lr�c"�@nQS��B@p!6��9@q#��Z�@r.y��U�@sCf��T@ta����3@u�`�p�@v����@w�߸
�@y?2
v};@z���KF@{�vY=��@}O����=@~�'A��=@�����@���S�@���kط�@�s� ���@�F��r
        ?̴(��4 ?�pz�q(�@�B_�ؘ@���l@+��Ô@5����;�@?(T�ɷL@EU9�+ֲ@L���V�@Q�T�u�|@VX_�%#@[O~���@`kM�v5@cy�x�S�@f�{��8@j~<�3�@ny^�`@qc�➲�@s����
Z@v3d_��g@x�,h~�w@{���.@~�� ��+@��6���@���G�{�@�|�+��@�cg�j�@�c��>�l@�~�v��@����@��|^@��a���@��e �G�@�N���8@�����<@��l�;C@��uķ�@�'��9/@�©}6o�@�l��ֱ@�%G�c�@���!1x@���e�W�@��Ѱ��"@��IS'��@��PV�K@����c#�@����G�@���k�I@�%!� @�L����@�|gP��@��T
LԾ@���l�o@�7��5�@���5�)�@�l��?��@�ᓓ$�@�̗
0�@���L��@�:�Yũ@��u�W\@���B��        ?p�;��?�U��h�?��]SI�f?�8-�T�?��,���?�{�=!ҫ?��f���?��AY�U?�P-��?��
�<��?��JZut�@�b��k@��k���@�`y_A@�.,XS�@d�0�z�@'~�JOt@!q:�@S���<@�~���@!2���ߝ@##0�$7@%1���@'^^����@)��!�@,�h�v�@.�L�6f�@0��D:@2
d�`��@3����@5&Sor�@6��Ψ;�@8CB2�@9�_�L�@;��{��@=� n:w@?���Z�\@@�B"�@A�5	�S�@B��e��u@C�&aw,V@E"�7Q�@F-�6%q@G^���|�@H�,��	;@I��#�)�@K&h��`�@L{#TC�z@M�����@O@�̶@PX *��5@Qצw$�@Q�*W�
�@R�s`��@Sf�lL��@T5�Z�8�@U	k�U}@Uᮖ� @V�~���3@W�ד�[�@X��̥?*@Yp60��@Z^�E.        ?g�a=:�?���G�?���O]$�?Ŏ'L3�C?ղ�oP?�P����?���{?�9�^�v�@� �(��@��7ާ@�>J#!�@u�@.6@g�7��@"}e����@'�=Zt@,k����@1AKo��@4��CD_�@8��2�s@<�n]�P�@@ڡ����@C mܷ~@Fd*m�P@I�[��OA@L�����S@PW$;�@RVΡ�=@Tzg�>��@V�7KWg�@Y7L{�d@[�w-���@^�}7�1�@`���4Ȍ@bLc�@c���y@@e��)Ad�@gp�y+	j@iS��r@kN	/ĢA@m_ �i�*@o����K@p���@r�-���@sG��9³@t��@@u��er@w8ȑ�@x��R�@z�^�@{����#@})���@~�>0<?�@�7��MYR@��a.,@���',�@��ޡ@��2eY@�������@��%�&@�@��H�X�@��0"�.p@���.�~>@��gڔ�        ?e� �S?����ZN�?�ΖdX?�;2�V��?�Q�F{o�?�J�� �?ꝭ|±?�iH��G�?���%Q��@����JA@v���X@Չ���@[:�W��@�tX���@#<�Uh @'��KE�@,�u	}��@1���`P@48q�żq@7�Y��i.@;�GD�T.@?�jj�a@B&�P��@D�p&n�O@GN��[	3@J/Z�E�@MD-<�U[@PF��y$@R����@S�ds+@U�v^#Z@W��'/#@ZcV��@\_���Zi@^�����@`�)�E�@a��W;@cN�:B�@d�90<t�@f3��m��@g�� s�@iQ�uhv7@j�u�@V@l���P(@nk5m��$@p�@2M�@q#���5@r�"�4@s��˳@t���o1@u�����@v)D�Y@wEV�x��@xh��H�/@y�2����@z�����@|��fr�@}C����@~����`@�#O�@��7p�w@�L���|5@� �:        ?�P|�[��?�0��a`V@�U>��@#j(h��@!!��@+=�g{µ@3��\qד@;�Vr@Bv�V�8@G����A5@M߃}c�@R^��*-�@V3�Y+]�@Zq�����@_� td�@b�*�Ts@d�IUAf�@g� �\�@k/:�@n���a��@q ���$@s�jo��@u%#-��j@wZQ��U�@y�yC]��@|$�ձl@~�-]�a.@��1�.R@�%p�+0�@��r��ܹ@�0Sjfj�@��-�]r�@�!ie�@�@D�O6-@����n@���Bvh�@��~�oFP@���s��@��R'�@��*8�@�;���=�@�c��@�@��F�U*�@���W��@�8�Y�v@�a�`y�@����E�E@�8���E@��0��"0@���8�@����,�@�}A��@�Ek���@�i�P��@��>h�O�@���i�~n@��v|���@�vނ	y?@�\%e�@�FJ�C|�@�5M��X�@�)*yl�@�!ݎQ:a        ?j��ˈQ?��S���T?�h0��<�?������?�ʫ&2�5?�E��eA?⊰gF|a?��x,�\?��T��5?���t�_?�t�V4�@ ��3�@H��ƸK@�Q�[�@A�e^��@f	Ϛ��@����@��0�$)@_�Hr&@o�x���@��VX@!�}L��@"����@$��O��@'� ��/@)=Iq|�@+���X��@.3���<@0L_!��@1�X�.��@3�c�	@4��Pq�d@6mC+;@7�	u��@9a��Ij@; r/�z�@<�x���@>�Զ�v"@@bF�{�s@AdOqr��@Bn�Pe�)@C�G�{@D�&ʐ�v@E��@F�.@H% Y�@z@Ib��#ϟ@J�q�Rw�@K�_�q@MO�D�L@N�vr�s)@P��S|�@P���P�r@Q��I�@R@M���@S��>�'@S���	wU@T������@Ui
4_��@V=�c�E@W��&�@W�2��@X�6��        ?[�9CK�?��IՕH'?�$)�t�?��Xc�wl?�V�`C�?ځ�8s�/?�e[�c�?�35F��?�n����@	JE��I@�����@y����@n��yt@P����z@!�G?J@%'�]	8@)��Y�VE@.�Z,��U@2C�Rq��@5{}ٶ#�@9��_��@<�S4�@@�#?'��@B�����G@E�4��7�@H>�@�I�@K23����@N\���q�@P��%��@R�j�ـ@T���4�@V���-@X����@[�.�N(@]{4ڀ�@`uBR�&@aU�2��@b��2A��@d0nk�6@e�\�`�@gO���K~@h�u��@j�r�*�@l���^�@nbëN�@p)���@q,"܃r,@r7�jdD�@sLj�+�@tj��_�b@u��3��@v����'@w�0��@yC�ٻD�@z�l޿�@{���N�@}MB02�g@~��[;l@���N�@��1�<8@��w���5@�g���_�@�7G����        ?l%�)��O?��W���}?�@Ӥ2�?Ƃ�l!?��fx��8?��?�ZD?����(�?�u�i��@ غ劖@.W��3?@��g@f4̶*C@�)�*v`@ ����@#9Bҏ��@'h�q�O@,'dd��@0�nn`U�@3������@6�5gsј@:�QQP��@>�����@Aq�{�@C���K�@FL��Y�@IĨv�@K�é_�@On����@Q*�DC�@R�ߔm6�@TȰX1ۑ@V�W3\@X�P܈�k@[�!�@]S�ae"9@_��%��r@a#��rh"@bwy�¢@c�X��I@eL���>%@f���#i�@h`�̂�@j��<7@k��^�<@mw]X�@oJa��q@p�9(3�@q�=aY��@r���"�b@s�6d�x@t��y���@u�[�N��@v���t@x"h�m��@yYȽf�@z���h�@{��4fE@}2t{6�@~���+@�
\��U@��'Ɗ@�hʀ��t@�'��w        ?������?��8G�@C%X��U@���|��@ �wҲ5o@*���"1�@3�H�M�@;.�� !�@B�D�U@G>�D��@M&�S�j�@Q��q-�@U��e��@Y����wS@^:NEw�@a�����e@dAp��@g'}W<�@jG��_'�@m��UA>@p�}��F@r��s#�\@t�����m@vÚ�rL�@y�S���@{�g}�f@~i�%Ε@�d#,���@��K鰃1@�Ns��4�@��ѡa�N@����q�$@�6�T�@����m��@�٧恌�@��j!l��@��@y���@��!�f�@���z@�����@�E��B�@�v ���h@����Ah@��V��ʜ@�@,2�q�@��a��@��S��+@�_�k>0�@�ҎAP��@�'z̯T�@��n�f=�@�����}@�~x�SP%@�Oy+#�@�%4�Y%@��65PJ@�������@���4Y@����l@���p�I @����@�y�1 p&@�s&��&�        ?kl='�A�?������?��%7:j	?�%l���?�K���|?���UX<?�+�#*i?�|'PN�?��K���?��8j���?�a
�!�@e1��@�f�6˃@�3|
~�@*�%�v�@�7���@rǦ'#�@-Qӥ�G@�k�b@@��N�@��nOY�@!�C���@#{g�[6q@%}!�S�@'�̲+N@)����-@,1X�&�S@.��J0�@0�H��p{@1�Y3��T@3b�<�Ғ@4�~��@6c����@7�{N�9�@9��	�5c@;Y��S#@= +[G�@>�Rk�A/@@n->kf�@Ai,�:��@Bl:��"A@Cwl�h�@D���)@E���8��@Fʉb�h�@G��1"*�@I+��CG�@Ji1�^@K���D@L��xӶN@NT��{��@O�"�<T@P�m�]_@QF\�@R�����@R�i7��@S��^�@TP�C�|�@U���S�@U�`���@VÄ_V�@W�a�JGg@Xy8r(�        ?al��!��?�;5�p�?���P�-?�2�A�?џߐWS?߿�>;��?�%Zb�(?�&��bG�?���� W@��=;|�@>�>Zه@��k��A@-43й�@��-OO@#���2@'l>���@,[]���@0�FJM�@4���%@7�dA~1@;\��O7"@?��Byӛ@B
 S�@D���ӟ�@GA��!D�@J*]�d@MJL��#@PQ�:���@R;��i@T��Z��@V�TA��@X-�->�@Zr���#�@\؁d��-@__%j���@a����:@biv�-�@c��܎�@ehc�n11@g���}@h��Χ�~@jn�I;R�@l@����@n%�P���@p��nj@qy�~A�@r#�t;P�@s=l�̝@t`���4�@u�vX��#@v�F��YU@xk���@yT�N� @z��S3�@|�Kb��@}z"~�@~�EŪ��@�9���9�@� 1�B�@���Q]j@��^;�P@�tN����@�P�p�$        ?c�y�N�?���,!�`?����p�?�`ċR?�ez��,?����`�?�?ԧ �?���bl?���cQٺ@U9���@
!{���@0����@s�� V@�:n�Q�@!F�U)x@%T7�\�@)jǴ:��@.C��?�@1���:@4͢s;@8KF&.m@;������@?}MGH�4@A�yd��x@D���p�@Fy��~(�@I
W"M��@KŁ��x@N�ȗ��@P��<#=@R~@Ba�g@T4-�ӡ@V��<�@W�I7�Jr@Y�'�
��@[�nT�%@^!/�o3�@`2���p@aa޿�/�@b�_nw�@c姚cj�@e:�+у�@f��*U@h�ݹ@i�U��@k�6_ܳ@l�>v�N@nP��Bm@p�i&�C@p�e�i�@q��s�@r�_ ��L@s��^��@t�~F
@u�%�{"l@v��[diP@wʨm,�@x�}~3�@zYEly�@{*5��@|X	%$#�@}��e,�@~�u-�V        ?��,×b?�r���?���fqS@C3���@�\{8.@(�L����@2B��9�@9c�H�t�@@�X��:@E�LR���@K_��?�@P�w?��@@TV��@X9�b��o@\�0�e��@`��U�@c$t3�K<@e��$��@h��{%H�@l�Vf;@o����[�@q�|�6@s�Ī�$�@u���;@w���@z1`#��@|���Z�~@?jS�t�@��k2�@�j2��@��>�K��@�y�/��N@��0m�$@���P^J�@�����#)@�m�Ꝧ	@�XX�1�o@�*��m7I@�2d�A�:@�C���P�@�^i�5%@���*�-�@�����@����.@�*�C ��@�v�:7;K@��A>|&@�+�/C�@���G�e@@�	$i��@�C]_H�@� ��r�@���S�q�@��y�!h@�o�Y�U�@�G^M��]@�#�X(��@�l�G�@��.~e��@�ԑ�N@�ã�g%@��\"���@����ĸ�        ?x5l�O�j?��k@�kx?��x����?ΰ��%��?�:,<x�H?�yjC��E?�L�J8�H?�����l?��
��@;�@���X4@����(�@����}%@��n!z�@���Z@�p���@����@!d'!�?@#��bh4@@%��r(�@(�4�o/�@+-���@-�AIm�8@0x9�z�@2V��[@3�����a@5Y�y'�{@7![�^��@8�]�@:�^C@<𑋴Ơ@?�X��@@�k�8
K@A���ReO@B�q3��@D{G,C�@EX�~* @F��*I`@G�P��a�@IPc�gO@J���p1@L'�u�R�@M���g�@O'�^蟗@P[��P�@Q(,�؎�@Q��C@RЎ�z!U@S�L�|�n@T���@UrР$&�@V]�[F�@WM>�v�H@XA��k܊@Y;fU ��@Z9��Z�I@[=���5@\EI]r��@]RMٍs3@^d).��@@_z�Ĳ
�@`K&'`Dt@`�B�h�        ?r�-�1�a?����74?���5�u?�)�	��\?��:W�?�%��V�?�׍����?��i��.@���'�@�HxL@�H�x?@�1&KK@ Q�&H��@$U�#K��@(��j�30@.+]��p@2��>@5K��o(�@8ꈙ�*@@<�Je��@@�y����@B�����@E������@H=����@K)�蝭5@NG|��f�@P�i.n7w@R�G��V@Te��hTb@VYJ�@Xe����@Z��T��S@\�@��S1@_$��>�@`��Z���@b��y8�@cftн�@d�x�*6@f5Ϧg�@g��V���@i:���@j� 2�K9@lv�<�f@n)��}D@o��#��@p�(e��?@q���zF@r�W�{x@s���/��@t�C+t�@uѶQ��@v��d���@x�@�*�@y%sk�@zP֋��@{�7�Ћ@|� ��@~�7�k@Mz(ª@�O����@��q&r @���)��M@�dr�\"#        ?j��N�v?�~��Ͼ�?����.:E?�ps�w��?�*O,m�?�N��WT\?�a�*ו?��}t��@������@	�"?��@�I�5R�@>��AT�@�p���@"	@�`�@&]n=S
@+Qk�w�F@0wI�u�@3��B��@7 0�h�[@;1>�@?C�v��f@A�](>�R@D|nQ�IR@G8S� "@J*I/�F�@MS��#2l@PZ�s8�@R('���@Tx�@V�G7�@XB��x�@Z�?ծ�@\�a�K@_ql���@a
�,_I�@bmU��p�@c�3h3�@ec�g4<?@f� ���@h��ec�@jT]�	�@l����@m��9���@o�S��y@p��ȡ@q�-��j�@s		$\�@t$)jI�h@uHH��b�@vu� *J@w�[�6��@x�^���@z9�'V��@{����~�@|�K���@~X�
��@�Jy-�)@����Ux�@�jf�.�@�4�K~��@�zp�@���Q9S�@���,�4        ?�0�wFgz?�H)̓��@�Ӆ�O�@ ��1o=�@-C�KZ�@7	�w�^�@@����L_@GIs��@Nh���p@Sn �Tk@X6�\��@]�l�v@a�ٔ݁v@d���s43@h���)'@l`d��zI@pB��Hj@r{|A$�\@t�]��v�@wbf��!@z�:���@|�$�c�1@����@��Q���q@�.eB���@��N���@��]]�w@���Q^2@���$��@���{D��@�ݶ��@��G��o�@���T"�d@��@S�@�.Ә�@�zy���@��4�\�r@�3A�P�@���Uq�6@���?O�@��
���|@�):C~>z@��z�8-@��b�A�*@���g�@�h,0�T\@�Jɟ�+	@�2ܥiM6@� _@�!=@�K�8�N@��ͥud@�	M�:Қ@�Y��@@��{m4@�"s�t�%@�5~$*D�@�M�l�ʇ@�k�HL?6@��|�4�q@�[_�T�@��#p��8@����@�'��V�        ?pވ��?��A0�v?��{��?Ņ���?��H��?�9,.�w?�p����?t�q�?�D`�=��?�(?Hi@ JA򩊢@��S�]�@c��@��]#E�@²��e�@sXK)@\�ԥ @�e��C�@�v>S�A@ ;�L��@"&]�6{@$.�7~�)@&V�EK�@(���>�@+0>s`@-�=�n�@0�{Ow�@1x��Q@2���܎@4qƧ`g�@6��i�|@7�f_Nf@9h�r�_�@;3`�il@=,Vj�@>����h_@@���0@A�k}�5@B�+M�i�@C�(���@D�k�;�i@F�]ގ�@GC��B@H���i.@I�P;XA@K"�m}��@L�V:�@M����@OUd@1�@Pf�+��M@Q'�$cIe@Q�LEY�G@R�Pyv�z@S���@�@TYq��"@U0�A��w@V��Co�@V��h�!T@W��y���@X��B�Q@Y�B���@Z�D_��@[����x        ?_��!�J�?�[����?��E�?��b�g^?ЋE��qF?�S�-���?�[#틪?��W���?�P���N�@�q�*w@�f�h@�A��V�@����@g�2&X@#��aO�@(#�lI��@-H����@1�xǉ�G@4��/��b@8b�ٛM@<[z;#X�@@ZO�@B�f�8F@EMq�h�@HIq0,;@K��p:@NG��}�@P�J�$I@R�'j��@T��O��@V��3���@XԌ 0�@[O�)�b@]����09@`C�Ї@aW���@b�>k?z"@d,�Pt�@e�e0X@gB ��EZ@h�s!&@j����@l^՞�A@n5,�rA@pn�7�@qx�c�@r��Uf�@s���EX@t6o#�r@uW��0�@v��Ԗ��@w���J`�@x�,���@z5� ��@{� �7t`@|���v�@~@��EK@���B�@����b�@�PUIԪ�@�Ȣ��8@����@��N���        ?l[���,;?��~Gcʛ?�R�����?��q-1b?��T�V�?�8Cߨw?�����?�	�@��B@eq��@@nK���@d%��@�T�e�@��F��@!���pS@%�6��5c@*�4�?�@032J}D@3]�G�0�@6�9d�@:�e ��E@?42��@A�H �',@D�g��Ȑ@Gm9%�@J|���>@M�B�8��@P���$1�@R������@T�n��<@V�����@X��Wf��@[`.����@]��v�0@`I�z��@a�C��@c(����@d���!C@fN��|��@g������@i�OY�j @k�oň0@mvQ0)�%@oo"l�.@p��N��@q� %q��@r�n���@t	�{gT=@u6uA=4@vmN�KKg@w�" �m�@x���/��@zM�_�.�@{��檇@}ba`53@~��8@� @��ů�,@������@��`�8@�_�L^d�@�3�����@�і�K@��/f�qH@���׸��        ?��ϋ�с?�(�FA�)@���BN�@��w�iL@"b���@,�����=@5'���6�@=9�q�8`@C`�}��@H��VQE@O/�8�w@S#Co:)@W ��@[u��t�@`!_¿@b�/����@e�u�0@h�\�no@k�!�NKs@o~�mB��@q��� �r@s��+]k@u��Y�@_@x�_��@zj��{��@|�FE=S.@���>�@�+:��
@����tkt@�$$C1�@����e�^@�b���lo@�M��iI@��D��@�ȋ1088@���X�Ҷ@�^ⵆٸ@�jE���	@�'�斡@����)@����8��@�����
@�3F��b@�x�~�r�@��)���C@�!}��Z�@���z�x�@���G[�@�ik�_=R@�ua�i�@�;���"@���>��@��Y����@���zY�@��{�J��@�a��{.@�Ecg�>�@�-�
pҭ@�U���@�g��+�@���N�o@� �!�h@��[�P        ?���X�?��`��?�d�z%?׷l�)=?���j�?����>��?�,�PS?�e�/�"�@i�)��u@2șʴ\@���3E@>��ɐ@��V�r�@e/;T�@䘤�8&@ R���@"9�c�5I@$���u�@'b��[n@)�s�q�@,�@�˜@/}W����@1J�AI��@2�Y;�0@4����}@6`�;@89.�A��@:$̿���@<#�K��@>5yKԊ�@@-(ن��@AH��Y�@Bn0���$@C�����@D�mV��7@Fh2MT@G_�����@H��oQ�C@J�ōQ�@KuQM���@L�L/��O@N\�񧁞@O���HM@P�^��@Q~_��a�@RM��}@S B�r��@S� �1��@TԜ2���@U��=ߜ�@V�l>}pY@W����}�@Xt����@Yh@��۫@Z`n1Jr@[]@:Ȅ�@\^�TC~@]d�xUZg@^o�%�@_D� �@`I���@`�� �C	@ado3��        ?�ƙ����?�㱙Q�?��(�~�?�"����?�W�w�Pe?�?�Xi�?�DqB�\S@ �WO�8@�]�=
@0o��	c@g2`	�@�g�Ǵ�@!�����@%�"5�(S@*ӯ;j@0A E��f@3wl%��C@7_Z��5@;9!�b�@?���uw�@B.�}��+@D�Q����@G�S��@J� :�@N0]���@P�#��֣@R�:?��@Tٽ�\@W�$S��@YM��qS�@[���G.�@^B l�@`vư~@a�D��rU@cPr����@dաtۯ@fj�\P�@h�J3�?@i��vJ��@k���֤H@m^=�[��@oB�uGq@p���쁹@q���&�U@r�����J@s���ǆ�@t����@u�R�hn@w �:F�g@xSW3nP4@y�&�5�@z�6�U��@|���Z@}pN�_җ@~�z)�@@���E�m@��@�Xv@��Ht�X@�I�Y�S�@�����5@��"���@��7f��.@�t�ۮwu        ?sYt�:��?��|�|g?�	�МE�?Υ��ɺ!?���}�2b?�+GQZ�?�Q[D��?�>���a@{�����@j���P@�#��@W���@ 7 �@$��C�@(���/EK@-�S�7�s@1��x0��@5!.Dp[@8� R��v@<ȿ�U�@@��<��@B���3�@E��3�@�@Hk�N�@Ks����x@N�����@Q��F2�@R��V��@T�q��B~@W �!��@Y6	���@[��2�@]��4<�@`G�~2I�@a�����@c	�jS�{@d�m�!2@fH�@g�8Q��h@iMGg��@k~*�j@l���E�I@n��߉�`@pI�T��j@qFȫj�}@rL=n(@sYw/4�@toM��@u����3�@v�#��^@w�m� @yR���s@zWj5�@�@{��S.�@|���@~F����@����,@��Q��@�A�O?@�����@��/�> @���.��@�N,���e        ?�rpi!@b�K1�n@�j)��@/z8L�@:e+z@C�<�0@L���:R@R��OL��@X�6~���@_ �`�5@c�&�.�@g&�ɬ�@k�=��@p9�Lِ�@rݽ}2&\@u����@x�(��:@|���T�@���hI@���_x�U@��$��@����� @��`�+��@�Ij���@@�����V+@�H�@���@�b@�^��=U@��sdJ	H@�U5��p@��a<��@��G)�{X@�6�z�,J@���m�@���FA�@�����}�@��,'�*
@������@�ı�L&@�����v)@�⛟@�@����<"@���Ֆ@�F�*LF�@�v���-@��̍�!Z@��U��?�@�2$��@�<>0�\@�Ӡ����@�����fY@�I/�ؠ@��`bQ@��@�?��@�s�8�_@�4�\�@���]@�����ާ@���x�@�Zp�Ƣ@�,Ê�+(@�L@�@��8�n�        ?yI>�آ?����}�?�YU�B?��T��9�?ٝ8�V�?�0�3�̙?�v���?�V�ﴖc?��?f��@J��D�@���Kͽ@
����s@�J`@������@H0�eb@ݩ3t}@�+y���@ �� ���@#5f�2p�@%���%@()���7@*�B^)�@-����o�@0c��~~�@1�sK%�V@3������@5kp�@7B���_@9-�Hi V@;.;���T@=D(��Q�@?o��p��@@�E1k�@B��>�@C9��?�y@D{���@E�w0f�@G�\S�@Ht��~*@I���r@Kb�+I�7@L�$.��@Np%h�$M@PP��ũ@P����@Q�r��@R�P�k��@Sd^��@TI����@U4Dt�@V#��y��@Wz̈́��@X��9� @Y��b�@ZL��Q@[�T���@\.�X�i@]B�����@^[�o/��@_y�\�F@`N8�_9�@`��J�.@ax5aR3        ?s��wj�?��x(��,?�w9�nj)?�3\{^�d?��'⌬�?�F��%B?�<��4@ |���l@`sz��@�ϳ��@H#���!@�:��?@!���ytL@&õ`��@+ ��q� @0}�jZa�@3Ї�؋�@7�]�4O@;��Dԗ�@@/Z0��@B��7��@E��b��@H���J��@K�����@O�\>3v@Q��{W�t@S�4ib�@U���(@XY��H�@Z����ӏ@]�0�9�	@`.2�E�)@a�rǚ5@c>�`]�1@d�<T��]@f����@hu�%�&@j^�ы0@l\ƻd?�@nq�����@pN�U�\O@qptY�@r���O��@s�~0XhB@uE+�@vl�_˧@w��v�D@y1��@z�Lȫ��@|)	�=�W@}�@1���@R�'d�@�|��P@�V�Ec��@�7.�;��@�j0�@�J8i��@��dBw@��4�K�7@���T�s�@�c0�h@��L��E@�"ꙍc�        ?�Dg�o�o?��N��Ҙ?��2і��?�}�SȆ?�Z�HH�?�Z^ �E?�S�
�@7�mp@X�Ņ@� ^�@S�[��@@ص=1�@"�uVP�@'Iv�Qw@,�Dն��@1~{���U@5o�a@9J����@=qX{�@A,�rGV@C���<�^@F�>��\,@J�;H�@M����7�@P�1~���@R�z�Bg9@T����@W)��@Y��p&p@\B)&�@_
O$Lm@`��-�Y@b�-�d}W@d-�$݁r@e����@g�,4b�2@i����M�@k���r6C@m��ـ��@o��j�Q@q���|@r-�?F��@sdsY�I@t��F<f�@u���y�@wPW��!�@x�s�hp@z+ ���@{�P��\@}7�J�
@~�V����@�;ֻsz@�y۳�c@����1#&@��RN2@�ɚ���@���¦A+@��^m��@��L��@��8Õ�@���Yo��@��.vL"@�<�NZ        ?�r��G/?����TM�@��Jf0|@"��.���@0�\���-@:[��T�i@C>}ױ�A@J�؄
��@Q�g��ҩ@V������@\x=O<`�@a~�T�r�@e$9�1}�@i/B|!�<@m���Sw�@q@�8+@s�D�#�@vĳ�(@y��#��@}-,��@�\� }A@�A#B�P@�C���wf@�e�T���@��\���%@����U�@��M��@��@��)@�r�2�@��N�ś@�bŷ�D@��]���@��%��e@�B�`Y��@�$����@���L'�@��%�O%)@�S<���Z@�S�%+�+@�\ʨ�8v@�m�ɭ��@��y�b�@��Hj�wH@����Y�@� �Χ��@�9	�Q�@�y:ΦE_@��%���@������@�g��'�@�����}@����.�m@�M���@�^mMt@���k��@������@�N��+N�@�z�ח@��p�n@��F���@��s�`�@�bu��@�="L�I        ?pb��Tk?��Qm�P�?�&�+�D?ŉn�"?������?�A�OϢ�?�&����??���?�c�7��?�?�G��i@ y/���y@A�o/Q@{�O�x@+g��@(�
@�]);�f@���@V5sj�O@�pD�]@ � Ӹ8V@"��^��V@%
!��@'X�w���@)�c!;,@,V&�8��@/WY^�@0vk@2j�?���@3�@��j@5��H��$@7I/���z@9�\o�?@:�[O�V@<��4�`�@>��=jK@@i��V�@Az�qWS@B��
�#�@C�;�/�@D�&%�)@F�nu�i@GZ�a3;�@H���"�@I��	Qϕ@KV��v�@L�U;��t@N0J�:s�@O��	�V@P���A܎@Qb	D/��@R/·*�@S�b�UN@S�V�wG5@T�2oWg�@U����H�@V�S��h@Ws��T�0@Xg��^�@Ya.&b�<@Z`i�x�@[e[�<9"@\p+��@]���#��        ?aO���c�?�=2����?��[��;?�[�V��?���]F?�[T��?�6+�V8�?�*���^?�?�Hv=@!�S�@J��Zx@'���_@-���O�@ �`LK��@$�9���f@)�G�9Dl@/�/��@2��s~@6'U�@:	/ϳ^�@>UH���@A��^�Gv@D� �cS@F�<h;@I�B ��@MJL%Kŵ@Pk��)�C@RS��9q�@T]�U�8>@V�Epp�V@X�H�Å�@[Nvf�w@]�|'y	@`R�ʒ��@a�On&7$@cJ�����@d�E�h��@f�}����@hR�Ҏ/@j(��w D@lo�،@nl�@pk�%@q)`=րi@rI���@st�ł�<@t��P�T@u�;��R@w:�yY�
@x����F�@y�����@{if���2@|�9��@~n�a��@����@�Ҡү�@���hBw�@��Ѧd��@�jlΆ��@�TqW�-�@�D��@�;�\�R@�9nZ�+�        ?c:J���?�R4�W�?��G�t?_�:?�����?�����?�I>�G�?��d��@ ��"K�@�-��@�5��3 @�����~@��z�4@ �`A��@% )�@)�E��"c@/*�.qf"@2��Ω��@6["�Y@9��\F��@=��^E��@AApp��@C�W��H�@Fm���t�@IVp�M�!@Lx$.�&@O����@Q����@@S��V���@U���$@W�/��vl@ZnP�'@\�����@_&2'�@`ګG�d�@b@j����@c��fVm@e>m?��@f��@h����<O@j;��c@l\�0�@m��%�I@o՜�x+c@p�|9�\�@q����@s�^-<D@t#FՌ�@uG�}�K@vu�n�'�@w��O��w@x�z��3@z5���x@{�����U@|�]��@~H�&�@��l*@��� 2@�V�d�@�}]@�C@���9� %@�����Mk@���B�        ?�/�N?�Y�����@ ��۵��@�*[��@�X(ͽ@)%���|�@2l���v@9��oG[@A�gٺ@E��y� @K���n�@P�e!�d@T�ǀ���@X�NP@\����W@`������@c}cOM+@fR3��w@i_7-'&A@l�2ā�@pi�{@q�\iY�p@s�k���@v�IC��@x7��F�4@z��kZ�*@|��.P�q@���.ۥ@�+�v'`@��s��H�@��R�b@��禨`�@�S�M�@����Ǉ@�wP�� 5@�>7j��@���)~�@�����@��4�m?s@� �y]@�i��6@�#^����@�A���i�@�ic�[��@����|@����#��@�'�&@�`|�Vr@��&��Ğ@�+ z�@�z��!#�@�uк�H�@�3 4�E@��I�Q�z@��W�V�@��T�jT�@�YH��N�@�/<�Wy�@�
8�e4�@��B�D�@��b���@������@�����        ?hE���?������>?��{S��?�6�%?��?�n?�,�ȁ.�?����Y�?��	�?�fM�J�?�22���?�PQ��7?�����@����/@Ay~~1�@
e��T@OyS�u�@lF�B%�@ܴ��U:@yfD|�@B���@8��E�n@\��|�]@!V��@#���%g@$��`�@&ܭ��$ @(�zG��@+��b^P@-:6-܄u@/�Ƌ���@0�B��82@2;�(���@3�N�O
�@4��P��y@6NU�@�$@7�,pEMw@9Gc��@:�eI)@<vU�?�L@>"@o���@?��V�n�@@Ѵ.Q�z@A�f�%��@B�j�@C��\y{�@D��4�l&@E�W�δk@F�89�~@G�-9�ֱ@H�7���@JX�")�@K9�N@&8@Lj�]@M�S�z��@N���\�@P�i�@@P����Go@Qfb.	��@R�l�@RƁ��(�@S|a'�0@T5V#u�V@T�L�oD�        ?lQ�C_�?�~���[?�A��?Ƶ��O?�?X:u^W?�\�k9(�?���>�?�o*@��@ ���A�@l�/%r�@�b���@���\}X@�8C�&@ �[�[�@$��aJ��@);��L�@@.dbV%�@2����@5P���#n@8�a}\�J@<�\���U@@��iĝk@Bڿ�K@E\�5�G@H:��-�@J��Uč�@N���O�@P����@Rl��e)(@TG��@V=�4��@XN��:@Z|���M@\�@I��@_*�6�"T@`���G�@b&���o@c�z�]�@d�0T�X@fp@͙@g�5M��@i���� �@kCz�ay@l�"� ˑ@n����@pRS�ٳ@qG��0�@rEgl�-�@sKdS���@tY��(@upJGz1�@v�P�؎:@w��=g_@x��0:��@zP�4*@{`s*4�@|�:QM��@}����F@W�\��@�]�_�A{@�U�(��@��+Ѷ
&@��w2�*        ?V���9�?��[�)�?��G��?�;B@X�?�p�@�}V?�l�#���?��f��?�ͥ܄�a?��5o�>�@ Gs06SO@_Ѩo+�@�95�`�@r�9!u�@��j4?[@�2eC@#�қ@'3-�TS�@+�V�P�@0z�ʂ�|@3UZ�~�@6yI���>@9��n�^@=��\���@@��:Z�j@CG�?��@E[�ra��@Gۋb��f@J��kkW@M[.D�`@P.7�2�r@Q�.H�E3@Sr��@U7�`�@�@W.����@Y� �I@[w���@];+��b�@_z&�^ը@`�kY�+@b"�?LiB@ci�d^,o@d��[�+@f��GJ@g��0�@i����@j��Xσ/@l4��3�@m����>@o����P)@p����@q��Q� m@r��`�j�@s�:����@t��s�@u�#��@v����@w�w0C�@x��t͖l@z *G�~@{W4ME�@|�2'i��@}�Ba�U@2�^�nM        ?���	�^D?�J�%��Y@ &^�î@h�V�q�@=�	@@(�hb�`N@20n�:@8�8��o@@���$�@ED����@J��TmQ@PUsUu�@S���(K5@We4i?�@[sxB��@_��e�j�@bQD�Ui4@d�z�8P@g��^(u@j��4��@m�Q�	Z3@p�4@rA;��?,@t��Z�@v~
��@x#�Բ@z:<H@|x'�nQH@~�KR9��@���'[�V@��m���@�=�!�t@����xr@�~4@��ۡm[{@���'Q@������@�bi���x@��o�@��ۓA�@�ݵ�ȩ�@���h�,�@��ʢ/'X@��G�y@��sܛp�@��X:��@���eo7@�%w��@�Nʱ�b@��^�@��; ��)@��n���@�C��@����^�@�w5��?0@�(��>@������@������@�S!c���@�����@��b�*o@����R�_@�rdD5u        ?z�M�[?�f�A΍?���{���?ͮ"��p/?ٛO���?��L�I�?�-$�V?�Y��:Y?���]���@ V�/���@QO��@Īu���@����^�@��0h�@�����s@�=��H*@0H�I�@��0�@!sxpu�t@#�!�}r�@%�Ki��D@(=Lr ��@*�r~յn@-s��1 @0!����@1��*O�1@3'��\�m@4ŕ�U�I@6u��V!�@87��,��@:����@;��Kv}�@=�[���@?�j��"@Ah]��N@B��{`�@C?���E@Di���=@E�X9�vD@F֑��""@H��M�@Ih���@J�k���@L۠�I�@M�g>�@N���2@P9b�@oq@P�D��9@Q��)��@R�y;�x8@S[�!�@T/sE�:
@U��ʶn@U�ܮR�@V�B�@W�_�(�@X�&���R@Y�^����@Zu>><q@[l4?�1@\g��b�m@]h  =$@^l��;��        ?e:��H�E?�<���)?�x���? R��ܷ?��\|)�?���zy�?�!Z�İ?��ds��@ ��R��@�;���@<ԇ��T@�<��@$��)J:@!To��@%�M�	��@*�#O���@0]#$��@3��f�\@7v�����@;�a�;��@@-��!}@B�̾���@E�ڵG%�@H�ɛyX�@L�W�@O��>v�@Q�M��~@S�,��q@VC�2J��@X��l�T=@[N��i�@^���!+@`��y#�c@b׸���@c�F�}:�@eo��ȏ@gA�l��@i+Ź\�@k-w�ȯ�@mGFQ//@oyw�?�@p�&K��@r� A�@sR`)�{�@t�a-:��@u�k�@wY�"8�,@x�씃�@zI-�\@{�d�#��@}l�]�n�@�>�W@�b(�bŧ@�A����>@�(LԄ}@�G��.@����=#@�'�<�@��5��@����0@��:@>@�.�ʳ>@�J�' �D        ?c�Yg�?�kc7i�?��#���?�%E��U?�,Ug�?�}���;?�b�cQō?� �Z�i�?����X�0@���PV�@�l>�B�@���<J@bqf%�m@�+ʥ	@  7E\��@#���M�@(xu�@,�#P��(@1���h�@4�3���@7N�5�P@:�A�Q��@>�7�3�@A���@C�����@Fc�1Գ@I�����@K���p�.@O�Ьn@Q!��H�@R۵�
D�@T�2�[�@V�}0E7r@X�ݜ��@ZŒ����@]��hh�@_X�}�*�@`�\jg#[@b+�<Q��@c�}Y�@d៑F��@fQ�&Ur@g�<���<@iY=Y;u�@j���y@l��"-�@nM��W1@p0�yZ@p��:�@q�)k�@r֘�k�@s�?�f�N@t�	�:�@u���ڜ�@v�&����@x�=%��@y4B Ω�@z]KbNf<@{���3�H@|ŔK1w�@~�-�Vn@K��d�@�M#��        ?�bp���Y?��0N�@	qTWG@1T���@&��-X��@1���1��@9<H�Y��@A>q�@��@F�3���@L��<��@Q��/�1�@U��cB=@ZBL	�~�@_}c���@b'V���@e+���@h����@kgMi���@n����LG@qa6>pz@sf����@u���V�@w�D�&��@z8ZX>@|��ʘ@f|��G-@�k9K��@���R��@�>W�yY@���"��@�M0�=��@�	�Wm�@�ˇM�,�@���D��K@�����5@�C(	({@�Hc���@�V &���@�k��F�@��:�/h@����A�@��z�!6@�[��@�UU��~@��_��@��l����@�BsIwx�@��i2b@�"C�f@��~01�@�v��l�@�5�-���@��	��[@��Ng7�@���:b�s@�Y��{q@�,K/Gƀ@��9��@��Ax��J@���G@1@���,�h@����,X�@�m�Tk        ?t�󽻨�?���&�?�ҜN h?�L���W?�^Ӌ <?�*����?�5Z0?�`e5_?�t|zك"?�
�ՎK@�����@� ح�M@�J	���@Z7B��O@'8D��@3���@@���kn@����]@ qk�٣�@"}^���@$�|�w@&�q8��@)v��%5@,W�C�<@.Մ��@0����@2flGJ�M@4i�5�.@5�����@7r�o��@9I(>|@;3��!�e@=2~�;��@?E��a9=@@�����@AԚ�7�@B��-s�_@D/<4�L�@EkЍ�w�@F���s\@HZV�`c@I^HwХ5@J�S\�9@L2c��@M����~@O/iI��0@P^��1Ç@Q*�"}�@Q�"~�\@R��Z��>@S��l`Jp@T��1i�@Uvcn�m@Vb<�$i�@WSi�~��@XI��_�@YE�����@ZF�9�'@[MG �ta@\X�;_ұ@]i�}1|@^�G��@_�SF��V        ?m؛�^��?�A�NT?��I�=�Z?����|?�v��}�?��8l?�����G?�]�����@�Ј��"@	���f�@]\�C@�K�L�'@��ڗy@"�h.��@&L�)�:@+��e�@0G^_�@3U�m���@6�ď8l�@:�[VG��@>���ЧS@A��P/��@D�%Z`2@F�T*���@I��Y�::@L�?�JF@P#�%��@Q뿒�C�@S�[ȳ�@U��K�@XA� @Zr��ڞ�@\�?�}�/@_���$o@a$��&�U@b�n��@dyݝ��@e�5�Fc�@gih/��@i,?@�@kK���<@l�G!g�@n�Tb )Z@p���1ȱ@q�%yE@r���:)@s� �px@u)
���@vn�o�W�@w�Z	_�1@y����@z�ߺx?�@{�iH�@}���B��@�>�@�U��ŷ�@�)�"�@�kj�$u@��g�v�@���ǻ��@���Q��)@��'=	,@��Z<�q        ?j�L�� �?�Tҍ��?���d� ?�n`����?�H�ܻ~n?���|$?�r�!u�?� ��]�@[/b�G@(��'�@K��t8�@jXZ��@��1r�@!Y�]W��@%�U���@*IS?q~@/����@2�v��@6M�,�g@:P���@>:�xY��@Ac�f�@Cޓ�
�!@F��Λ�A@Iv�z-#@L�����@O�h�N�@Q�R\�@S��5a�@U��@I��@W��g N@Z'���n@\�oA:��@_����@`�ٗ�5@b:�X��P@c����@e3��f�"@f� B�v@hq&z!�;@j)��y�d@k�rH��]@m��D�s@o��T6[@pݗXױf@q�&��$@r�˺o��@t�,;U2@u6�੒@vc�Zk<@w�|���@x�~2Q�@z#�T{k�@{v��P@|�v8]�@~9��Q�@�}1!@���dN�@�S=���@���� �@��j�g}�@������@��x�u;        ?�U�O[A?�grFߌ�@	�l�4F@q"�-n@(I��=�@3+'0���@<�ל�)@C],�s��@I��-�u@P�$�� �@T���`��@Y|K}�-�@^ΰt@��@b\�U�0@e�x�K�@i2�-�MN@mX'+�G@p�����@r�7�7��@up#�e�!@x�V�@z�;�ͻ@}�>��(Y@��}F�@�PbuR�@�!GW�։@��#ߛ?@���R'@�42Q-@�q6<�q@��)&�E�@���N�(�@�� Lm@�?� �6@������@���8@���{�@�.�ܫ��@��x�p@�~�G@�=9gA�@�.����@��/�iƠ@��Bv̷@�����@�����+@���!l%@�	lԡ�@�$��-vD@�G.$�=<@�qr�x�@��Pt�F@��Ź �@��;���@�f��� �@��ݥ�=�@��q��KS@�7O�1\@���J�@���LSo�@�^'�D�@���(��@�����        ?ug��TC�?�����)?���
�
�?�8
?�s1<U�?�(��lln?�y���+R?�CB4��?�-ɫ�5;?����@d'�M�@��+@�*l�@���
˛@�2���@ p�J�@��pe`@R14���@!)�OEgH@#ME��,�@%�ߖ�v�@( ֑���@*��g��O@-G�i�t@0��[h@1�n�<�@3&Qu�@4�x^�S�@6��n@8V���@:7�r!@<,�M��1@>4���e@@(g8
�{@A@�kG@Baq[@C����'@D�q�%%>@F RȢ@GHu���$@H���s�H@I�`	�q@K[ע�]O@L����@a@NC�Q�m�@O���Ά�@P����@QsB���@RBwN1�@SKp��@S��e@T˨��t@U�q�@V�{�yF@W}r.q#�@XlD��@Y_~�k��@ZW��F�@[S���@\S^���@]W��fX�@^`�:^S'@_m��[D        ?q�@��k?�-6>�82?��o�oRY?��'���?�:/�^�?�"?HF�?�,&~�^?��|Y�@��u��;@TW� ��@�Ρ^a@@��7��@��w�@#�
L��@(��!�d�@-�V�W[�@1�����@5_lj߸U@9'u,�@=U����@@����0@Cxq9�[3@F1�'y�@I$"\�)@LPa���@O�����]@Q��O��@S��}a?@U�i�n�>@W�`�ޞ@Z+U°��@\��9C`�@_*��Вb@`�<�vT�@bW�8>I@c�~��
s@e^gM���@f�Ā��@h��o+�@jk��]��@l>v��@n#x��(@pf�b�@qN�5(�@r ��u;@s8$�c�y@tY9��g@u�׊���@v�Ԑ6�@w���{�j@y=�S�H2@z�,R�ދ@{ꖕ��@}O��iz@~�nv]��@�p�}S@��^�6n@��Y��6\@�qx����@�B����@�6��A�@���z@	@���,��        ?g�.��?�����D�?��gv�`?���bCK?�  �$?���5�Q�?�2ni�S?���Y�S@=��Z��@	����/�@}�`�zc@1N�`��@�I�Q�@#�ܾ@'�M���@-F�6k@1�'%)�@5D<��	@94k����@=�3��c�@A5aMql@C�~����@F��E��U@I�����*@MM}(-C�@P{��1�@Rr�����@T�}���@V��1F�@Y+��G{@[��(�@^]��o�@`��V�G@b�ᬠe@c�f���s@eF�)��1@f��q���@h�:�@j�ȷ�.�@l���tE�@n��v�f@paԒ��:@q{<I��+@r�;�4�6@s��DFڗ@uNK].�@vK�D�U�@w��ZuL�@x������@zY�Ġ)%@{���z�3@}EDZ֫Z@~��r���@�.����@��yu���@���/�%P@�����7;@���=V�^@�q�v~��@�]5�/�@�N�RS�@�FE�5��@�C�RqD�        ?����T��?��V�0@�Y�%n@�oMG k@&��뿝J@2L��Y�@:�����@B[�Vh�@HdX,c�@Od�,J��@S�0��9@X9V�Lg@]G�4��@aq�?���@d���0�@g��K�@k�<�X�@o�q�QM
@q� �,!�@t4/�i>=@v����gN@yE7�0@|��4@~�t�b�@��'�@�����%$@�jK��@�9զ�W@�h��!@����@�,�N� �@�T�Μ�@�Ife�XJ@�sws�@���X�(�@��r�^@�3�[���@��lŵd@��Nl�ʧ@�W|�a��@�Ν]wty@�P�F���@�݈�4�@�u9츈@��՚�t�@�bgH\�@�>Jpl%�@�x��;o@���x�@���@��M��@�سm7�u@���?"@�ԓ�g�@��D&^u@�� �B@���C�.@�
!����@�$J��w@�C����@�3��d@�ȖOҾ�@�_��|�        ?l��t>��?��P��?��R����?�N�M"�r?�d%�i�?���TFK�?�t�w0��?�p'��?����9A�?�f�-sw�?��P�t�@�(�8 �@�S���l@���s�@�jD�@yf�Rb@E�|�4@K�2�H@�Ԫ�D@@D�� @!_<�It�@#Y����Z@%sT-d'�@'��T�S@*�c�>p@,�2�@/�B?@0�P��@2]!B�ݱ@3�*��0�@5p����@7�M�<.@8�\�q�+@:�x^W@<k�\�~@>W���3k@@+E��M@A3��mK@BE��-B@Ca@����@D�)-U��@E��H�
�@F�
��@H.l͵�@Iy���:@J�!�wNB@L.?T���@M�GۑA�@O
G�X��@PC�y�w&@Q.c��@Q�Ì��@R�l�b�@Sp/����@TH1ʒ�@U%"�D�a@V^0��0@V�ʕ�ƙ@W�j��*|@X�A�7�T@Y�Tx8(l@Z��Y�ˬ@[�LP��         ?b�O�r�6?�^��X�?��g�??�3�_I?�_SS��?����j�?�S��t2?�k)�r�?�V+�@�~WSdA@
�z����@�l�D�@	�hPI@,����@"(R� �@&C�!@*������@0�O^�@3ҁc��@6U�w;2@9���H�@=�E��b@A�rHp@Cy���@F��@H�r�"Y@K�=#�@N؏���H@Q�@�6@R�^�@T�(gp�@V��l�@X��H?��@[!	�\9@]y��/2@_� /ڐ�@aC�b1y@b�����@dr����@e��	��@g��[h�@h���,�c@jT�7��@l�z�#@m����@o�� ���@p�fi�z@q��Ag �@r�]0@s�U��a�@uXK���@v;���.�@wk��@�G@x�뜡�@y������@{4����@|��y^R�@}�2f|@V��ځY@�e�*7�@�%��s�f@����f_@������        ?_p1�Z`�?�=���
�?�����3?��Ιh�(?�;e�?������C?��5 )��?��G�?��[Dc�@*i�:�@�]����@^�*1��@1FH�@媼�K@ ǜ"��@@$��u1�@)�`m�@-�ǝF�@1�/(��@4���Ζ@8Uj�^Q@<��/�@@#���@Bf8�yb@D�k[�9V@G��"T@J\�sm�@Mm�B���@PZ��iY8@R�e 8@S����2N@U������@X
(��0@ZA�&~u@\��$Q@_���(�@`ђ���@b-"�X��@c�l"@e�F>5@f�/<;��@hE'9���@i��Kw��@k�u�y3�@m�D��@ox|�� <@p��S�@q���k��@r��@�r�@s���@u���q@v<S�!?$@wsٻ��@x�bk���@z�ȭ�@{V�CĹD@|��T�E@~!G�2�@��*�@����2��@�O����@��1	Ǭ@��`M`�        ?��l�?����!?��ӻ�:|@{o�� z@�ugw�@)2�]n@2�L��@9���>�y@A7�N�-4@F6����@K�5_+ϫ@Q0so֢K@T��3�C@X�p�d��@]4����@a�n!�@c���'�@f{��Z�@i��pZ`@l�ږE��@p0Ewx�@r�^8w�@t����@v4�[� @xv'�� �@z�=/1��@}[�ˁ��@� �H`zM@�ds?�
�@���#\�@�`٦��@���H{��@��� ���@�bt�"|@�2��d�@�p��*Q@�I�ʁ@�� KV:@��;A-N@������@�чE�@���ܺV�@�1�ptL@�p�l�@���y�h�@����N@�j'򃼜@��w'�@�B�83j@���;C��@��s٭�@�j�;��@�8"�q��@�
��h��@��	�$�@���X��@��t����@��K��Z@�wy`�@�j�>-�@�a�}���@�_D:C#�@�b	��        ?g�+~p�|?�-> �?��r$*�N?���Ecn$?��e��x?�Mɚ�!�?�}�녬�?���zl�X?�ˌ/W?��	9c�9?��IC�?����Z�@q�b���@�)��-@	�|�>�@���m��@:`��#@��V�}�@F��c�@��^~�@*�P�z@9�����@!K �m	$@#���Ϩ@$�$�07@&�u,)@(���8\@+%1<���@-h��R@/ś�c&@1��m�@2e���@3�� |P@5�,���@6�}��)�@8�8��\@9����V�@;�0@<���?@>i�����@@G�2{@@�^� B@A��WM @B�$p.4@C�~�E�Z@D��`=�@E���7��@FƖ���(@GԞ�t�}@H����R@J%��<{@K#�>��R@LJD�YzJ@Mwa�X�@N�	:X�y@O�5q���@P�M��%@Q4Է��@Q��>��@R�)� �@S/2�^�Z@S�\��X?@T����cZ        ?\F �f}?��+���?��?"ҧN?�����?�]05f��?��j�D�?�;�'?��A�#.?���^7[�@�~��u@
g����@u����@���ʜ@-��0��@"Tŕwxo@&�Їv'S@+����k�@0�>�<5@3��{&@7j��.��@;bs.�8�@?�q�3�@BJ��;�>@D�y����@G���%Y@J�B~�@N?�S1�@P�����@R��=�,@T�T�FS�@W&bR��@Y����@\ ���A@^�Ԝ�8@`���s�B@b4�\��@c�i�o�@eg��9x@g�$�h@h�]�C�R@j��4e�@l�|b�`�@n��ݷ�@p��<��@q���Z!@rϦe�%�@t�NR��@uK��@v���n�@w�7𺍛@yd|=�!�@zۿ���C@|`-*|&.@}��oC)�@�0O�У@��P�@�|g���@�`�x�LQ@�LbqW�@�>� ��L@�8M�&$@�9=I.xg@�A~�}�        ?Y�L���d?��O�?�F�%�?�tF0G?�JJD\�|?���8OS?�a]h��?���e[?�{�v0rx?��ԥ+@�pYLy@��TS�1@��/��@�ٱ��&@���oY@"&1xV6@%�nY�@*S���e~@/,���`�@2F٢̾�@5=į��c@8}&V�8 @<�E��@?ܡĔ��@A���۬?@D9�k@F�]��S@I$I���@K�h�̞�@N�5�*�@Pݑ1E|@RvJ�:�@T$w�{�o@U�CH��@W�����K@Y�Q,A��@[��.�4@]Ґ7�f�@`I%^��@a&DGR�@bU�K�8�@c���|@d����9;@f(��{j@g���� {@h�q�oÉ@jbИ1��@k��T��@mn���I@o�b��"@pU-�,L@q-�90@rk�@r�*��*�@s�n���$@t���S�@u���{�@v����(e@w���ȟ@x���Gn@y�%A~]Z@z�⢇��@|)je
�        ?�!��7U?�kH]WKJ?��Q�  >@�G=��I@H��{~�@!�_<?��@*i ll�@2lu̵7�@8��j�#�@?�]S@h@D
�{Y��@H�Nd��@M�E��Z@Q�o8�}�@U��@X��
<�@\\mu�OJ@`>�R�@bw��j�@dۑp3y�@gj�;`�@j%�<��@ml`VN�@p�fR5�@q���&��@si����@u8�6�@w����@y�:Lg@{0�mi�l@}\�]��@��ê�\@��!� �@�7�7�,�@�}�����@�Ϥ��.-@�-�~<>Y@���k@�v��V@��U�n�S@� ��?
@��f�p�@�d���g@��ԣݦ/@�m�q�wz@�T����@�B<�_(�@�6 ,�l@�0Z�{��@�1��Q@�8�R�r@�E�L��$@�Yu���@�s͂��@�����d@���A=41@��5�S�@�̪�?�@�,E�� �@�����.@�p�ܬ;�@��	S��@��]*�{�        ?����J�?�5>�4��?�hd��N?��߀b�a?ڒܹ��7?���]?�Z\w�?�"��5q�?�i	����@ ���@و��;,@	_�,�^�@ar1�v�@���+i@�V��E@4#lo,@�j�+��@�F푈�@!��}[�U@#�"D�@&D�U��F@(����P@+M�Sax�@.� ��@0t4-��@1���s�@3��/�0�@53��7�S@6�$��C@8��(���@:����T�@<��"�>@>�s���@@]�0�5�@Av��.�n@B�rO���@C�c0�� @D�f�<?\@F>p�k��@G�x
`��@H�x
��@J=k���@K�H�S�@M3g��@N���)�t@P����b@P���r�}@Q��H6@Rt;����@SJ��v�u@T%�B�nz@U��jQ�@U�+�/1@V�'�@W���rd@X��0O+�@Y��H$�@Z��Q�[k@[��'��;@\���3@]�r:	�y@^�0S���@_�!q��        ?v�@*�*?��;OJ�?��G�Z_?ɏ��]�h?�.	1���?����%�?�>]��S�?�Dl����@[�M8/}@�{��@��"��@��E@�S�@!
?B��@%!��|�@)׎��@/5ۥZY�@2�C���@6�z _i@9�YE{�@=�����@AJ&�b�@C��Bf2&@F��W�@Iy�]�i@L�YP���@P��a�@Q�ܣv�S@S� �z�_@U�A���@X�T�p@Zk�3�@\���Z��@_x#���@aʛ]�0@b���#��@d��L@e���Sy@g9q���0@h��GбJ@j����@l�j���@nv����@p9�/R�@qAu.�Q@rREQ�@slX\���@t��[�@u�i)�@v�s�O��@x1��Z@yz�o)��@z�Ѣ�o@|(`��y@}�QP��?@~�����@�9����@��&p�I�@��P�f�?@��!i��@�W��!��@�*��_�^@�g�/�        ?y V��u?�E#��?�_�Q�8=?�\��t?ޒ`&a�?�ት��9?�@�9U|`?��d{b0@*���	}@�p���!@/v��@ݳx��q@�*N�x'@#���b�@(:����@-b�`��h@1��7���@4���L�@8��E�\�@<��8��@@z�^v$&@B���#2@E�U�2#-@HZ�3��@KiX����@N�l˯D@Q���S*@R����'@T��/�^�@W�]̝�@YJ���@[���j�,@^�Ҫ@`[
��v*@a���R@c%*7�O@d��c��@f1Y���@gЌ�t� @i��~��<@kA��@m��Y@n�]��Ϣ@pv3�1�@qy$�;�!@r� �ـv@s��b7�@t�B5)%�@u��O�8C@wCM7�)@xEɮ���@y�_�?�;@z���@|%ջ�q@}��/f�@~��w�#@�,�A_)@��=J��@����L�@�n{�o^�@�8��\�@�7μ�@�ڇ�6        ?�3,�/?��4t�o@�y៎	@#؄K��@0b�D���@9aWh��W@BG%���@H���'��@Pm�w�@T�Ja,�@Z��@_֋��@c/�0|A@f���o��@j��j�{@n�0r���@q�Ӟ�J�@tqju��@v�$��I@y����q@|��V@ق����@��"m@D�@�n~�Օ�@�U���@�U9����@�o1����@��Ty5��@���u��U@�-�.vV�@�p3��@����Y@����@���m��@���$Y�@���(�+f@�"N�Z?P@���ײ5�@�y�_!�@�:����@���F�r�@�s�V�v4@�iSYV�g@�f�Td�@�i�{�~@�t�eŎ@��k�̂@��,���@�����s�@��C��@�y�e{@�H7	WO@���E��@��gS���@������@�����;@�[O��5�@�
�Y�@��¡�R@�q]ǐ��@�)�.�QW@�����r@���ᖪ        ?f�<=;?���e�a?�D3��n ?�Fʥ!�x?ͻé1�G?��f�E.?��A�Δ�?��"h[�7?��B�G?�t^�s��?��$��@ ��b�.d@l7BG@�\ >֟@��@q@OCs&�@��nC @oa���@I�$�Y-@V���>@�&�+Z@!ݔ�<�@"ڕ)^@$�
`rz@&Ԃ}ࠦ@(�8���@+;a;}^@-�2LL�@0o+�W@1RɃ��^@2�:\��7@4����@5�����@7	b���n@8�`���@:9|�a�.@;��m>i@=��2@?k����@@��):"@A���_�@B��*�6r@C���Pg�@D�)�c]�@E��+!��@F��P�R@G�;*�@I!vU�@J0���I@Ke�,^�@L��	�@M����@O3`7��@PC��^G@P�CY�p@Q�f��\@RY�N@Sx�м�@SϺ)�=@T��1~V�@UU��j�@VL�Mh�@V�Ƞ�m*        ?`Hò�Й?�Om�P�?��6��g?���`y?�U�
t?�c��p�?�1��l��?��({�f?�V�1AD�@=�=��)@
4z����@[`�y��@u}���@z�QRK@!����@%��R��@*V�eeq@/}a�C�@2�����)@5�aK@9O^��/�@=$��'��@@�wi�l@B�i+�@EY�tpJ�@G���а�@J�]:�!&@M�Q��(�@Pt%c�վ@R!����@S�qRq�@U�ᨣ��@W��$*�9@Y��A0&b@[����@^Ei��k@`SY�9�@a��2�W�@b�![L)@d5f~�@e��۬�'@g#$��\@h��h�� @j#CP,@k�!���L@mo^;�@o+эU�@pz�!M�@qg;M�T@r[,��q�@sV�7�C�@tY�1O_l@ud5�s�@vv9�$�@w�xZ��@x���ڷQ@y�d�v�@{H�h �@|EjS�)@}��Y���@~ϘXk)(@�_����@��94�g        ?b`y:�O?����;?���Mz�G?�b��E�?М�ܨO?ݳQ�\ta?�T�+��?�a�1�5?�Kr��8j@)��˭�@
�|��Y@9��@D2��V@6�L�OY@!�MC�e�@%�>S.��@*�[��@/.�O�[u@2r�0�G@5�����5@9�%�@<�e����@@��]�iv@B�봹�k@EAp���@G�|#Dh@J�VI�@M�ʎ�2�@Ps���@R'�4�1@S�KA0�$@U���X�@W�A��9�@Y��a�X@\5EZ��k@^��p��g@`~}�]d@a�+ٽ@c�+;��@d�����@e���+��@gz�B�6j@ig�ߛ	@j�$�J+�@lfjH[�@n*t�8�@o���g�d@p��!N�@q�X̪Ʈ@r�;gy@s��,�u&@u��K��@v4�kV�@w\�`nȊ@x�� B�@yȟo[؍@{�9��9@|Y�O�&@}�ӽ:�@].�@�=Ο���@�����Z@��̟��        ?�^��w�?�Y��?�\;��@#��@2�Ww��@'y��0@1^�-G$@8:�Z�b@@-��&�{@D�LZ�Z-@JH�z@P.�-n��@S�]o�O@WUs���@[u��`U�@_��y�!@bmmO@eC"6z�@g��ȉ}:@j�i&@n/�
~�@p��ז;@r�&A5cu@t�7rM�?@v��4nz�@xī��6�@{��a�@}d����M@�鐮�.@�:�!|�$@��x�?�V@��r���@�rͲ�@���a��@���/3�%@�,�&]@��^���@��1��y@�j��@��l�a`@��N���?@����Zԩ@���J��@������@������@��i�gע@��i�F�s@�,�2���@�bc�1@����u�@��5]�^�@�6l�P�Y@��3ݚ�@�wE_h�@�+�#h�@��p�5Ϋ@��lf+�@�b��P�@�(%\4�@��ᗦ�c@�����H@��% ��L@�h��K        ?uGf�:�?�����`=?����)�?� �|?�q�b7d�?���^1?�s��;�?�)�Y�(�?�`��>�?�b�e��@i��%@���Z[@	$��	��@�؋��@o-��@0d� ��@)��oG@\��à@ɏt���@ ���|Ͳ@"�'�.�@$����{c@&�<��@)3Q�i��@+��D�@.'�'o�@0h&�@1���y�@3?tZX�{@4��<���@6V+m�I @7�{ғ�@9���z	s@;pp�٨Z@=DB��@?(k��>F@@�~u�v�@A�F�@B�ʍ��K@C��U��"@D�;��,�@E��fB@G7?a8@HNc��@I�f[E�q@J��8P&@L��SI�@Mt�K��@@N��"T2�@P���l�@P������@Q�0�C{@RR�۞�@S'X�N@Sᣠ%s�@T��Pu��@U�!)$�#@VY'�bC@W4��zu@X���M$@X��OwfM@Y�>���@Z�Lq��h        ?`�鿱e?��1ڂ�e?��A���?�2Vn^ܣ?��!����?��O�o?�A(��?�Õ����?��I\'|@v/�j��@��i_�(@�
RHYl@�|We@9ڙ�X@ d
B�4@$,L��R�@(}�n�
@-`��tN@1m2Kb�@4y֨���@7�+L�C@;�:�p�@?��-B`@Bi�K g@De����@F�LWuZ�@I�g;D@L��5�k@O�e�F��@Q���~�@Sh��sc	@UM���ط@WM����@Yi�j�	j@[�F���@]��a��4@`3��=��@a{�돭@b��:�Q�@d5g����@e����>@g+s�:2@h�'����@j^$Rf'{@l�U�@m�g8C1@o��4��@p�����u@q�5�@r��_���@s��TcB@t�n��#�@u��K�]�@w��;�@x+u�Oo@y[y����@z���rZ�@{�C�6��@}�V�@~nR>=+@@��'�5�@����r��@�J6����        ?u�$p*ݥ?�O}o/Ej?� a:��0?�{e�1?��S��ء?��{�?�Z����?���^[��@\���@�4T£�@��μr�@�3	$`@�e�1�+@# �(t�@'����@,�)3ʂ@1�͊�@4Lom+��@7֗eT�&@;���� �@@�W�@B^�߬n!@D��J	�@G��𳐐@J��d�<@M�y��p@P���U@RwG!^w�@Th�Ґ�@Vx���}�@X��iX�n@Z�?mE�Y@]d�^�b@_���1�@aR
���@b���#�@d4�����@e�YX-O1@g[��6�@i	E˿9w@jȾ��Z�@l�#��@n}��٩�@p9�iذ|@q=�ľDB@rK-�un#@sa�7	�@t�$� @u�ڟj�@v�#�W@xݭh�@yb���j�@z�;%M�@|"��H�@}q��E@~����I@�+e`i�;@��N��@��A+/(@�}D�e@�M_�<I@�"�."c@��t�n�        ?��A�^?�;1��C�@�w�@+X�Gb�@#�hk<ڢ@.��u&�@6�A��c@>��d⟿@Dz�n�G�@J5�5��@PZP1�@S��@;�&@X���I�@\p���W@`�����@cA +r-=@f���@ib���:@l_���o@o׃Ra��@q�8)@s�<��0@u�W��@w�`�@zFH�r@|�r�ل@7���kB@����n�@�P]���@��T�0�o@�A�{l@��
Y@�o�>'�@�E�X.�@��"�	�@����)S�@������[@����+�,@�����!@��Ӿ�a�@������8@��]$@��T�!��@�$��>Eo@�R�@�-O@��+Ke5�@�Ŵd�y@�<(l��@�X�i"�@��d�Ϙ@�
�;,@��򃤆�@�o�|�b"@�+�y>W@��5�X@���^"s�@�u��T@�@�Tj[�@���p�@��=���@��Ɉ�p@��+*S��@�y�9 +        ?t
��W!d?�Đu�yU?��ɣ�3j?�	�A��?�]t�t��?�]�&�q?�
:�y�5?�F�+�k-?���KV?�|�W/[a?������@]���P@<�?ډ�@}y����@&�b�e@���H>=@O�}��@> ���F@b3(�@���7bE@!'&j7��@#W�@%?��0�@'+%d�+I@)e�럶�@+��<s
2@.3	0f�@0b�۠6�@1����@3!T O�	@4��2���@6��9U@7�ҕ�Y?@9O�ZJ�@; A��d�@<��_.�@>�?�e��@@5����@A,���@B)����@C.�w���@D;��*��@EP"��(�@Fl1\��@G���p@@H��P*�@I�ڽ%�@K*��@Lm�_�@M���P�@O
��4�@P2�>?�@P�˯	�@Q��eε@RQ�8�b�@S��?�@Sϔ֢�@T�9�+"@U\��]N�@V)
wrT�@V�-,��@W���@X��J�         ?`��sM?��r��9?�@���?�܍;�9*?͌@��y?ڬ�r�$&?��K�?����3?�В��,@��ǐ�!@.g��$@�;�w�@ԁIQ@z#���t@ ���@$U�Z�G@(�U>t4�@-��u1�@1�����&@4�Bn	��@7�h@CV@;�/(�k@?�/�<IU@B�a9o�@Dtd�z/@G6�q�@I�q���%@L�>�3%@O�[Mi@Q���}F@Ss��|��@UZ7}��}@W\�mR(@Y|��35@[�k ��@^xo�K�@`Ec���@a���gtp@b�<23�@dW��zs@e�=3fx@g_1�5�o@h�2�Ȝ�@j�\M�@li��:m�@n;J�`�1@pO^�e2@q
����@r0"���@s�<F��@t2�\�m�@uSg��n_@v}�x�?I@w�`���B@x����@z9���J�@{����u�@|�[�UL�@~R�$覔@Ŕ�$B�@����O%@�f<�x�@�0SW�hi        ?q}2��3?�T ªE�?���١�?�P!��h?�+*Vw6�?����4�'?���'?�����t?�E䜬We@�WWyp2@
����@.���$,@�&�*�@7e4B1@ �YQ�t�@$A�ͭ1n@(?�X�"@,���f��@0֤�X?�@3���kW@6�`E�@9�N7��G@=ctQ�O4@@�H�6Y@B�&z�I'@D�H�@G>�)*mj@I�(���W@Lo��@OD�j��O@Q!��pn}@R��𙝂@T_]�h��@VKeWj@W����$@YݕC\��@[�k3o@]���/�@`ɖ��@a4'���@bb	����@c����1�@d໦r�@f1�� e�@g��	nu@h�q�A�"@jlUW���@k�X��d0@mz�0ִ�@o	�5X�@p\��p�E@q6���A@r]<���@r��D}J@s��-��@t�hl�@uя�O�@v�suڑ@wպ��@x�jM�O�@y���bV@{��c@|+)�G]        ?�n����?�#=��@\Z��H@�>k�_�@%��O�@0Ц���@8^v��`�@@��W?E�@F	�P�_�@L&M���@Q�v�� G@Ui���@Y��?@^q�eF�@a�L��t�@d��V�@g�XךB�@j��O� �@nh,�"�@q��}2@s��|[B@u*�F���@wf3��j@y�R*�ۦ@|<q��,D@~���@�ɾu'E�@�7٥���@��@�0��@�D�w�!@@���*�@���U�)�@�S�X;�{@�#��H�@��˫�7@�������@��ߛ?K@���5@�W.�@�/�<�@�Qѕ�O�@�{����@�����Z�@��i�9��@�,�r���@�x� �,@����Ao�@�)����!@����J�h@�~���*>@�:jV@�@��>��@��m���@���3n~�@�S�	>�@�%�()@���ߤ��@��c�M�@���S���@����ml�@�{��e@�f�~��@�U�~ј        ?�_�`�?�"=�pL?��2҈�?���Z��?�V5ޖ�X?��r��z0?�l(��P?��[�"�g?��3�hO@�Q=�@�68��@�+W@P���g{@wh���@����[@�b��@��B�<�@!�M�9@$HG>�@&�a_aE�@)V�g��@,�����@.��˨�@@1I��k@2���M��@4Q��h@6vA�	 @7�z`���@9�8�t��@;��O�97@=��u�@@�<�"�@A0d���@B\� �@C���@D�5$dc8@F ��Cc@GxUs@H�у��@JI�j�	@K�hd�@MG]�Z�@N׹�¢�@P9�0�Y@Q��.̝@Q� �Ɖ@R�x�^*@S����/=@T���)@U�_�ӊ @V}�)q@WzGԗJ@X|i�@^�@Y�Vj��@Z��c#@[���K�=@\��W�@]���˝@_#�µ@`>��@@`�c����@aJ�U��V@a��Sz,�        ?s��?"�?�,�'��?���e�2�?��,�N�?�'i(}.E?歉j��
?���;J?��}�i$�@ͪ�?n@q��w�@��ޚ�[@<{c��@wh��~�@������@#7���b�@'"�G6��@+�33�@07A��'@2�6�n>@5���|�@9'ܛ�E@<��e�]@@B�X�
@BS0ക�@D�d��j@F�H��oX@Ip�YV��@L! 8�q@N�4�^O�@P��mUT@R��Y��"@TE�����@V	o5�r@W�ʆ�(�@Y��4�G�@[�|D�@]��x��@`��	g@aAX�/�@bt�g"B�@c�֌�Z[@e�
C"@fY�I�b@g�i��v�@i1����@j�`��@l=d8<�@m�꼼�@o~iH�Y@p�B��@qzXL�O�@rbSJ}�X@sQE�	�@tGB>l�@@uDZ[�M�@vH�$U�@wT%^9m�@xf����@y�4����@z��.0�@{�Y�8�@|��z�X�@~5Q`v        ?{�����?����z�?�H�D+��?Ӯ��?��A��?�3j�SCC?�1dr�"@��q��R@��"�@�o�}H�@,��V�@��i\m@"K�
Lf@&b�Ƹ��@+c�ָ8�@0��G�@3�9s�!X@7W�d�M@;U��õ�@?�.`�L@BJɒ��@D����]�@G�|>J��@J�T�2&�@NKI�Y�@P�6)TV@R��N�l�@T���Nv@W,P��3#@Y�M;�@\͕p�@^���<�I@`�0gv@G@b.��=�@c�w)�Ѥ@eZ�S@gM��E@h��^-@j�ӿ�@H@l�?�4"�@n��mlB@phx�8�@q�t�t��@r��^��@s��U@u���s(@vca�_�-@w�,ͩ�	@y6|k%@z��BQB�@|�����@}�iz,��@!
���@�a[p��@�8�>�\�@��cЊ�@���J��F@��w��bi@��n��_@�ӝ���@��3xю`@��޲45@��6��        ?���-�?�
�`up@�Q���@%�PXǥ@3'�˰{$@=���Y*@E��qsN[@M�����@S���!�@X޷k7�@^�?�@b�0�.P�@f�z�`.+@j��.%n�@o
|�^}�@q�C��<�@t��D @wI*���@z?��	\�@}f�ן1'@�_\��r@�#؍0�V@�	0��@��Fi@�#N!�@�.,�AC�@�ozL�@���b��@����@������@�9��(r@��@����@�ͨC�@��X� �@�	�,$��@���w�4@�@u�j[�@���@�� pW�@���<�x_@���O=��@��
x�s�@��A�QH@��A�u�u@��
j�@�����@���_GI@��t��@��M��@� ��﾿@�Pnh(��@���Q���@���#
,@���@���f��@�RxSn@���>��@����5� @�a܊{�@�����@�ҹY�I.@��W�@�Qi���w        ?{4��	?�.�*#�?�,F4�x?���~�*�?�z�L!�?��CJ�<?�U����?�� �,#?����<�@��l|+]@���d5�@
�PJ�
�@W�U�m@��p�@M
��~t@К��v�@��Ԅ@ �_G��@#	�Q��@%`�D��@'�K"A`�@*�<w$#@-O�i���@0")�-Q@1���2�#@3S�B	<$@5
�|~��@6��{��@8���=»@:���%X�@<����S@>�:2��(@@���s�+@A�����M@B�G�~��@D����@Ec� GU@F����1b@H�RD�s@I�'���t@J�`<�c`@L|����@N��@O�����@P��)�g�@Q���_3@Ra�n�_s@SG�P��@T3�9r�Y@U&2L���@V���J:@W`g.;�@X"8,{R@Y-8k,�@Z>[��2w@[U�xܨw@\r���܄@]�Mۜ�@^���]_@_���ݨ@`�3:�^@a/ԁƺ�@a�g���        ?q"�E�v?��颙(B?��a�?�b��E?��!%���?���?�,N�b��?�ϕ��r�@����@	�FTO�0@,��fv@x�J�@���Y@"E�@&d&���@+R_�@0u�m1��@3��b~�k@7$�L��@;�%�S�@?b��^��@B�]�Cm@D�m�*�@Gy�y�M:@J������@M�-|��2@P�9�%��@R�X1�e@T�� ��@V�{��@Y	m��@[vw鱌b@^L�K�w@`^N�@aˎ�&k�@cK�Q;��@d�6��?}@f�P�b��@hAc�r2�@j�ێ@k���v@m�צ��@@o�0&y�u@q�͏3@r-�ia�@sU<�rR�@t���9@uǧ�E`�@w<0���@xh�1�W@y��$P�@{9K���@|��;���@~:�z��@�`J�R@��?�u��@���EjzD@�j���,c@�NR�x�@�88�}@�(���)@��г�$@�y�k(        ?��=�+'�?�s���?���
�g�?��3�c�|?�M�����?�����?��#���@ yy�v�8@����d@]�G��@�9+�Q@%���4@m|�]9�@#T�xU@'r���t�@,p����@0��x`*�@3����m=@6�o\
�@:G6��@> o���@A'���o@Ckum�@Eܸ�o�@H|gFc��@KKuG�@NJ�(Y]@P���I@Rn֖�I@T9o�o�@V��@XV�f7T@Z5g��@\ia�[�@^��
��@`��?#X@a�DE�=@c&�n��@d��X7�@e����(�@gs�/&@h�`I7|
@j��]@lE��6A@m��@R��@o�yZ�AY@pч �[@q�K�Yf�@r� o/�2@s�!��@t�I�6A@u��"nx�@w���@x.�6p�@y]��'to@z����@{�����@}��3��@~n�0l��@��u�x'@��ϸ�̃@�K�����@�ڎ�n.        ?�]�em8s?���3� @�e�U֋@"�k�nUq@0�5��E�@9�e�H�5@B�{S=@I�+�Q��@P�8��@U�"���@Z�ugco@`]l�),�@c�{�Y^�@g*;'N�@k�ԙ@o?4��@q��Q>�@tS���w@v�57Ql@y�/3��K@|�P����@�2S�o@��0rr�@�P,(�t@�'�E�:@�,���@��7�ì@�>9<�Y�@�vF(�B@����J(@�4�xa�@�Yp�m�T@��D3�_y@��Qg�@�iSt��@��a�,D?@�^���V�@���eߺ@���n���@�1���޻@��Q$�@���)U�@�����w@���Hz@��r�y^@���<$I�@��V�{4@��}jMñ@��K�X�@�ּ
� @��ɤ\*�@�n]#�@�D�^R>7@�v[j �@����á(@��&^��@����˶@�>���D@��[>W�@��!���@�A�R�@����@����=��        ?n�c���?��*��?��8r��?�-���?�/?�\lɊ?����b�?�i[h?�V�t�6?�����?��W�"�O@A���K�@`AG�f@
K���z�@���;�@ �G8
�@�-r.�]@�N�@���]4Y@Y��ɩ@! ����@"���M)@%��@eO@'1J��|x@)~��l�@+�����@.vR,�l@0��ՠ��@1�,Y�X@3k�.��l@4���u�0@6�`���@8+�>�j@9�#8D�@;�h���K@={�M���@?`���	E@@��Й�@A��>���@B�+1¥�@C�M����@D�\�:�@FW�ǀ,@G/=�18@Ham�Z@I��Xƈ�@J�Q�:�<@L%ɶ�@Mw&���M@N�h��H�@P��%�F@P�D�+�@Q��+��@RA�����@S!z��@S�Q��x@T��s4@�@UY�gl��@V)���@V�Dj1��@W�L�2
@X�Uy�@Y����s�        ?g]���?�:�6��?�+0��,?����*�P?Ի�͝��?�Qe.��'?��T�=�?���&u�@ xc�@_#I@+�"�>�@�-�|@~[ ���@ �a��@$�O�=�@)~�/ʉ@.��(ykW@2f���@5��>��A@9vf��1@=�ϳ�3�@A��=��@Cu��ܮn@F5f �@H����@L	���F@OT�tӌ@Qlg���X@SK�J��@UH�紘�@Wc�φD�@Y��)��+@[�3��:�@^nDvlh�@`��b�@a�͵�S@cK^Z�T @d���� @fU���q@g��C[M@i�uE�v@kc���h@m5v��"�@o�^��@p�!!-��@q������@r�q[
�z@s�GMH�@t�U5֢�@u�����@w&a�}s@xa~%��9@y�l�;�@z�)����@|K�\�L�@}�����@��|�?@�F.�3�@�?槺�@��'���@���H���@�_|zNU�@�1�8zg�        ?i��1b?�z��^R�?��HE^�?�S����V?�/��w!�?�š�X�|?�� �� 6?�����X1?��y>�AL@2ʼ� @
����,@�h��%�@�̶�I2@ #1�5�e@$1�Uk@(��s��@-��g��2@1�%�s@4���@@8�>1�Z�@<�O����@@xh`F�k@Bڏ
���@Eq�i^�W@H?[�2�@KD��D�%@N�ܒ�j@P��`��@R�Z�إW@T҅P��@V��#<@Y"�)�4@[zT{L�N@]�Z��@`E�U~�?@a�F�d�W@cp"V�@d����+~@f �
��@g¬X@'�@iuͬ��@k:}����@mՖzm�@n�� 9ռ@pyhqN[@qKa�@r�%:�}�@s���p��@t���q�@u����@w#�<</�@x_�!=u�@y����g@z��	#7@|J �|�@}�T�>�@�{G�@�C+g���@�2,q@��qF��@��pٲ�;@�V5ZI@�&/���        ?�y53�
?��܊a΍@?��@�@�W����@ ���@*��D@K�@3�"ix�@;U�K��@B��u�@GJM��PR@MER�Ť�@RI�h��@UɻGq@Y����O@^��+ͳ@a�KGJ@d�ޖO@gz8�;@j��߉�@n��S�@p����@r�1-}�@t�0�R�@v�K��]:@yC�6��D@{�����@~0�O��@�j�9: 8@���8���@�>�Z���@��z���x@�R�{@���<i�@��-F�vp@�f���F�@�8LO��@@��Ԓ��@���t��I@���I\/t@���3ŵ�@��w���@��j�(�@��b=��z@�\!B?8@�4U��xS@�mL>	�@��=����@��(0��L@�H��	�@���V���@� ȗ�|@��se0�@�mC��!*@�)U���@��?�T9@���4x@�t��ԧ�@�?��HC@��"G~@����`@���1�@��A���@�p��p        ?jwYF-�?�:��z?�=�,>D?��y�SKR?��o�z��?�(�|nI?��a�Un?��n�5�2?�����?��8@���?�'�p@�)�(V�@u���;�@
��=��@���Z*@]��2@�@0���� @?�];X@���p@-Z��@!n��^%@#sU����@%�z�\4w@'��j��`@*G3�F%|@,��|�-@/)A��L@1'�aa;�@2��m;�$@4-���oX@5˅�7�@7{��d��@9>k��}�@;��֪=@<��=�$$@>�UG�@@�����~@A�s��5k@B����՝@C�9U!0�@E I�:?@F8#�98@Gy��v�)@H�k3��@J%6@Kx�T���@L��eW�+@NRp�%��@O͍=��:@P�	�Sa>@Qo��&EX@R;��N�@S�(��@S�z;�@T��%�l@U�y���@Vy�>��@W`0I/S@XK8�^@Y:C����@Z-��M}�@[%sP�a�@\!h�x�        ?ga���)�?��/�0�?����]j�?ś�ғ�?ը8�q�?�7> ���?�Vc�6 �?�ڭKA�@��w=3@��=� �@��.@4>H̏�@ţ���@"HIL��@&�� ^z@,�(,ɶ@1�ϽE�@4�����@8\|�N�&@<�"w�*@@��m��d@CYd !@�@F;����@Ia >S;@L���#�}@P>�g�}@R<�7��@T_���E,@V��l��W@Y=�3�G@[��]�@^wޑcIH@`�j!F(@b>U�e@c�dG�@e�u���@gf�Q,�Y@iL~:�HQ@kI����@m^�IY_g@o����@p�RDZ@r�6K@sTo{׃@t��F�@u�Ti|�@wU����@x�&m���@zD���@{ϟ�\��@}h�Y\U@OK�|@�b��z#�@�D�~Y��@�-�A�E@��6�@����@��GU @��"�M@�'6�>u@�<�ҋ@�XY��0}@�|"�Y�        ?Y#NT�?��;��>�?������W?��� ��?��^���?�}�@��?�Wq�ʏ?��4�*S?�HLmރ�@ v21�@�O/��9@��Qo��@d���(S@���@��@�o?�K&@"�M8��s@&�	�u�@+u�{��,@0D:FL�c@3�ć0@61i���@9�of�
�@=R��G@@�k���@B�,��:@E6��Gyq@G��U	�@Jm"�QJ�@MK��	�@P,@��y"@Q��r�޾@Sgͼ�@UL��3m@W2��䨒@Y1�0~%�@[I����@]z��MNO@_��"4�@a�|��2@bUQ/E՞@c�x9��@d�"k�	�@feu�g4@gۘB�[�@i_���\�@j�ڍ��@l�@��$�@nAi�v�@o�@�k9�@p���@q�Z<��@r����e@s�L�#p@t�@�f�@u�xm�"|@v�=�X{@x b�0��@y#
!X��@zM���@{�?�+�@|���G��@}�#����@G�q$�        ?��fs�a�?����U@
��2�@�f�7�P@ Ŷ;���@*�o�*)@3�'#lڣ@;i[R��@BF�0*�@G�r&�W|@M�6���@RC�i@V�n�a5@Z_����@_,�eR@bF?�/�@d��G��@g�~��K@k6<2�^@n�R>�3K@q@&b���@sC[��Ǐ@ug�l�}@w�[9�NA@z=B}Y�@|��Ѿ@R)LBM�@�����@�� ͕�?@��O;L�@���Ɨ�p@�n�����@�45�X�J@���n��@���y	5�@�����@��T,�?@���J�vR@���� X@�� RB_@�u��3�@�I�B:�`@��z��Mv@��5,ee@�9)�΃@��)k˘@�d���@����ܵ@�)�y��@��zľ�\@���}��8@�e����@�:HO[��@�O�#)�@��H��6@�֤Xy)q@����ص�@���x��@���%�@��̊���@���8�@���a�=�@����I        ?f%��|�8?�Vy[P?��L�l(�?�U�o%?��lR�(�?ի�v8?�#qA��?���P�?�vc'Nw?��1�A�?��|��?��s&@�Ⴈ]@���T�F@
�B���u@.��=��@294MM@��	�o^@��FE�@�r�Q�@1o��@ ��N��@"�����@$�w�Ӵ@&Ϲ�OR&@)�WJ@+n�<ۥ@-�6h��9@0F����@1�9G�Z@3�bCܲ@4�1��@6.���@7��.=,_@9���(P@;R��@=,��"}2@?�JtM�@@�YD�@A�x�4��@B��K���@C�l�g7@D�r�"}@F�`mk�@GG�,0)@H�w�� @I�{�6�J@K%����	@L��9{0�@M�A�2�@OY|���@Pi�@�@Q*U�n�@Q�EE*�@R���&�@S�+��r@T^$�:+@U6�)��@V&�Nm�@V�1��C�@W��g}�@X�`�<@Y��u���        ?Z'��F	?�~�>�:?�P3R.�?��*�_K9?��M(o?�ե�J�?��ۅ0?�
���S?�[�@��@�`��#.@	�f�!F<@<�O��@u�0���@��6,@!�.���@&] N@�@*޿|�-�@0��
9@@3#*�~@6|���)8@:0��a+�@>@��[@AX��Ri�@C����Y@F^9!�́@I.Q��߳@L3�u��!@Oov���@Qp��T�@SF���p@U8Է�[�@WH|,W�@Yt�s�#�@[�mu#-�@^()K.��@`W�Vb�j@a�����@c0��o@dU�Њ@f6���@g��)�W@i4���>@j�?�|l�@l���#D@ny��dp@p.=٬@q'`%�)!@r(�޾l�@s2��Bf�@tD��cƲ@u_+�%i@v�  ?R@w�Cy�@x��z�aQ@z;o��@{b�.y�@|�\����@~R��A�@c�lBY�@�e�qS:@���%�}@���I�Ks@���q҈        ?]H���?�����h�?�cY��?��'W\)�?�(ϼ�S?ݦh��?���г?�a����?��+�@�@i%䳎@����@�M����@]�J�~�@$��>@#{*e{zf@($���@-<ou�@1��z�	@4��܁�M@8�;X�٭@<�imt@@��n'a@C�9�@E����|�@H���$|@K�+�k�@O��]��@QZ����@SG9q.��@UT�����@W��Yx�x@Y��Bb�3@\B�<Ni@^�9��+Q@`�	C�1�@b2v�Ê�@c��`�P�@e@�7��@f␢�n�@h��7�F�@j]Bc�m�@l68�'߼@n!�x@�@p�!��@q{�&�M@r*g�{�'@sEɲ��@tj����(@u�+���@v���:L@xo�DL�@y]{,wKl@z�5���@|Y�+j@}x4̏=p@~��$�@�2hBاQ@��ʺ��b@�� x�Pq@��	�&�@�X�Ա�@�.�dk�?@�	X��?        ?�cҹ�P?���@F?�"���z�@��P��@���(�@!��Ǧ�@*@����@2��U��@8�ŏWx&@@F5�iZ@D�_�߫Q@I���HP@OD���G�@R�:���~@V@�9�i@Zq|���@^C���j@ahUN;e[@cީ8�p}@f����@i^�
�O@lj&[Pk�@o�;E*�@q�g��}K@sb�G���@uR�B��@w^2s[|&@y��`I@{ʤ�.�@~,�R��@�U�����@�����a@�wW�8@�op���@��v�t@@�wL�B�@�Q� �@��Ҷ1�+@�v����@�@�Q��u@����}@�w�7D@����3t+@�2jn�@�i�P;@�"����@�>v�,#6@�bBG��@���Ĩ�@��S&a��@���&~�_@�?���f@�����@��U�1>@����#@��"�N1@��9��۱@�;6�M@��^�·@���G�4�@�}r�8P�@�E�WZ��@�=�g)�