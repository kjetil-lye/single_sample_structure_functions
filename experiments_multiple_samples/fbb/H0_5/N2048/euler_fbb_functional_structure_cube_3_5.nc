CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T110049        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              ?Na=��?v�l�"YM?��p²L?�4A"LF?��0[�ȁ?��7�3�?�5b�/�?��J/��?ԥb��?ڑג��?࠱#"��?�[$�D�?�w�~��?����t
�?��/c�$?����&9?�`��+f?�d��A9�?���z�@  NģX@�`2�<%@�<)��@��u��@ŇqcA@	�%�U@=�u��@�Q�@��{g�@�0�H1�@-���yq@���O��@�g'@8J��@	j�VH�@����j�@D��_q@���\�{@�; ��@ ��V�1�@!� ��c@"��-��@#�(̤�@$����@%�:�@&�� ��@'�q���W@(�O�H�@)���@�T@+���@@,M�+-@-�7~�C|@.�C�.s@/��l	#�@0��vX�@1J�5�߇@1���u͒@2�Z*�/�@3V|}-}2@4 �.Ԣ@4�Eĳ�~@5��j��@6B��O�@7����7        ?&���ϑU?T{!��;�?q��V��?�H)��8?�w�^�&?�`T"��?�e�jE�I?�/��?��[%"?�Ѧ�X�f?�3����B?�_i\?�Y�4��A?ގ�jn ?��E" �?��qI�?�e�2?�z]���?�nl���?���s,�?�X �!��?�UtV�H @Y����@�l�!k�@O�;�@	b�*}Z@	�e��@Uĥ7��@e�!��@>��B��@6�&|'j@NZ/�(@����R:@����@\�Պ�@ }����@!��3�k@#Rm����@$�r��(@&qa�M@(����@)�b2��@+�#���@-�.�V�c@/��*��D@0ӻn:-@1�-�$3P@3l6C,�@4.�]�!�@5b�X%�5@6�`hk=@7�w�[=�@9C����@:�0߰�@<7_3w@=�4���@?L尜@@SO�SI�@A"��e�@A�EtɥO@B�55-^d@C��>�ȴ@D�Y�x�,        ?M��8F�?u�D�Hl?�e�e��p?��A��I?���'ں?����%i?ǒ��* ?��=t�M?��mz�?�f�x�'?�m�_�?�v4&w]�?��D��A?�?���w�?��|~���?�ȥ<�'.?�(�����@z�P�@���@�7�֌@
�b·�@R��h�'@p3�@>�@V�WAZ.@]V�,��@���t�@Ό�ej.@:N0�.�@� �~@ =�Y�b�@!���J3�@#&m�\T�@$����x;@&Y�l��@(tї~@)ڄH=܆@+�k�sh@-�w�%@/���ə@0����@1�Gw�UA@3!*�F�@4N�t`-l@5����=@6�ڟ��c@8V�6�@9vg�"n�@:�9P�<�@<O�||�@=��w���@?Y�vV�@@x��N�H@AJ�LI�S@B#��))@C��⑬@C�k`0�@D�xP���@E�;�^�@F��P���@G�8��5�@HǛ�`?`@I���Dd@J�k��F        ?�¹�Q�?�4�Z�?������?�ɮ�:\X?�T,����?�h	&R �@����~@LUD�J@+�;ESB@Z&wZJ�@0�pn�@!�o�6�(@%i�56@)O��W�@-�J��w�@1	�V���@3xP3BZf@6�֙�@8�Qk:��@;�s���
@>�4$T�@A�h |@B�i�_@Dy�pԝ^@FS[��1@HA9gs�@JC?�y@LYr��V�@N��t�YU@Pa9V��@Q�����X@R�.�U7@S�ؑ���@UC����@V���q�q@W��g�@YW�3��@ZǾ�)|R@\A���.@]�2��d4@_Tv���@`v]L��@aG{�ۿP@b��Ëd@b���]�T@cث/�5@d��]b3�@e��"���@f���}��@g���C�T@h����81@i����I�@j�4`v�@k�t�XJ�@l���T@@m���Cm@n�ָ0�:@o�z70�@p��.b-�@q��n@q� ^$;@rF �aM�@r��r�        ??��X�L�?k�K��?��G��?� ���6@?�P`}*?��0��b?�&+�t?�+��Q��?̀�l�?҂vb��O?�]�q!?��#oxu+?�uM���u?��t殍X?�}]� p?�}c%c�?�h�&��^?�
�5�?�>�[7H�?��J#�?��|V˂?�ʪ�[j�@ $c�@/��J�Q@�s�HT@�Z�|�@̪��Y�@	ږ�N�@ Yk��]@>-��<
@J&�I�
@�wVn�@�"����@A��L�@q��4��@�B��@QX�J3@�LY�i�@d8����@9��Iz@�l'|`�@ 1w����@!���@!�4��I$@"�S�(_�@#�_eIl#@$�k� L�@%�އj@&��L�ū@(d�-��@)"H��@*D�G�@+nl�Oܴ@,���e~�@-����	�@/�u���@018��[r@0و)�Z�@1��.�f@26=%�ޑ@2��r�Y@3�Wk�v�@4`!�v        ?6��Q�<�?e����ò?��Ã�'�?�=��d��?��63�[?�h��߬�?�×w��T?��n��?͌h�r*�?��W��!?�*�p�?����<?����?�m�n�?ﲶ�O)t?����:�?�����c?��p碶�?�A�k�@7��%S@ۮ�ڻw@��e�k@!h�_��@�H�˛�@D��@W]a&��@�ЊҬ@���Q1J@�c�S�@C�Á@ �띒s@!���p�R@#E!�X�	@%iF@&��%�.@(�O�N^@*��c�i�@,��q���@/.Z�:�%@0�7^s@1�`b,@3H�Ϻ]@4�aG] @6'T�:M@7~Zwȫ}@9�OZ�@:�&����@<>;�+t�@=�l�$V�@?���jn@@Ǉ7�D3@A��S�@B�����s@C�v%vռ@Dȳ���@E޺TX��@F���`�@H%}?��@IVc���M@J�hk@Kӝ�'��@M *L��@Nu���"�        ?-`5\�k?X;�A�E?t�=0�i?��:y�C&?��Y�U�F?���Q��[?�9��G3�?��g!i.`?�|���,7?�u5_]?� dyB�"?�%���?�=��q^c?᯽C��?�Ϛj�F�?ꈼ&n�?��B>�_�?������?�XĿV}?����?�?I�<�@g�VB��@�V��N@��!J@	���b�@��rҕ@!��L�@��߆?	@�uK�]�@�I�A@_	C&q@ɮ�@ZaBZ�@ �@��@!x��]P�@"��Hg�z@$��\�\@&Bs<ݐ�@(��]�@)�V4���@+�aedK@-ς`9��@/��8�-�@1zdi7�@21Xf�yL@3`�I�d@4��Z��@5�:��@741Y��"@8�'1b@9�յ-]R@;qll� �@<���z� @>�fhV�@@�y҉@@߸g�@A��%"@B�v�×�@C|{-�@Dg�a�@EX��]@FPc�'�@GNվ��        ?|�y��z
?������?�j�;���?�cn^�Q
?���吿�?�ڂ��?����})@��VMK@	O�� SJ@g�;K@��:�@y�)�9@�n1[J@"Y��C�@%�h��K@)��"�@,ߊ���@0{:��r�@2��^*�@5k��@7���@:,i��he@<��Oon�@?�Ī[�@A��,�@C,����@D�Q
��@F��tZ'�@H�h�*+@J��?+~@L���<+j@N��8UJ-@Pr%P��{@Q�`R&�@R�m;7]@S� �i.!@UCL���e@V�e��Е@W�^�Ɇ@YQJ��_�@Z�@m�
�@\<U���t@]¡~�@_T:|��N@`x��[$�@aL��BXP@b&��Q�@c���C@c�1�|�@d�^�U��@e�,nxVT@f���@g���H@h�XI�D�@i��Q�l�@jߣ�P`@k�����@mlEZpK@n8�����@oc9;iAo@pJEψ�@p�H!���@q��x>B        ?F_X��k?r��!4�8?��r��?��M��?���I��?����'��?�r����(?��$��"?�/���(~?�(p��[=?��ݰ�5?�N��ֹ?䏲4L�?�he���?�yz�?𒻔F�?�tx:\�?��m30	�?�r�p&�O?�m��CKJ?��CI�@ ���^=�@���۫@�\q���@�]Q�q@�[��@
�B�w-@��(��~@.¡��@��ך�@z��i�@R�g�@��ub^8@
��J��@x<��m@��I[�@w<�N%�@���
Z@����
T@N���#@ ��^��W@!a�����@"H-V�P@#4%(O�?@$&,p��4@%%�Y��@&T�@	@'  �@()�h��@)9���>@*O�����@+l ��@,�oɅ��@-�� � U@.�h�P@0+^|�@0���,F�@1K,���H@1��N�9X@2�`˞�!@3?�gt�@3�gFd@4�G�.��        ?0�D���/?_iT����?z�ǂu�?�N�m��J?�,�1}�?��P|��?���?�cS�@E�?ěD:v��?��Cb+�?�U4~��"?׋�/$�?ݦb̥Q�?�[Vu͇?�f�F�\\?��Ǘ�?��uW�?���y"h~?�-1g��?���.xF?���ْ@ �yڞ�
@?*�A�:@��ߜ��@x ��G�@ckV"�@��I�x�@�1��N@�&�L|@��g�"@��݇x�@�
�q{�@�t�Q@w	���m@�AR9��@!R�Z�8�@"��\�@$.-����@%�s��@'P��1Xg@(�c)	gb@*���㜲@,�����@.t����@06W�jJ@1<���Q@2L�&r��@3f��&^�@4��@5��yVIu@6�?�-@86+Z4F@9�gZ��@:��D�e�@<@-'O$@=�u�k��@?'����@@V%\�d@A��^m@A�.���@B�K�c�@C�-R�@Du�T/��        ?;/дC&�?f]!C?�n�B3?�5�q?���b�J?��3��J?�J�LZ�?�/�̤��?��1zǝ9?� �3���?׌f�JD�?���F~p?���|qO?�?�`��?�Ak�U�s?������?�#	><�?��I�B?��N��?��FB�G@W5{BI@�tb��@���2�$@
̐7��p@E�c@���u�@���l�@�92�o�@�+�5@@5_@��*@��G�K@<��Ĥ�@ |��"@!���96@#qux���@%	�u��/@&�Qe��@(wx_�k@*M�f~�^@,8��1&@.9�"��@0(``+j�@1>���e@2`����@3��Ԥf�@4��Go�@6	��*�J@7Y���u�@8����@:H��x@;���07�@=*w�f@>��&a�@@��d]@@�����;@AĹ���@B��[�O#@C�}M���@Du��sC@Eho�~K@Fa�3��@Gb!��jl@Hi1Y]�A        ?��ʑ��?� ��Y�n?��qܬ:�?�מ:[v?�i$F�q�?�Q1��L�?�����Y�@;�PL@fO�w8D@�w˥�I@���h@��7@!�K_��&@$�1�B�@(_/"��#@,:����b@01!��@2k	SFB@4�8���@7Q��21d@9��zG�T@<ҘEP�F@?�%�p@Aw$��}m@CCV��{@D��)�n@F��?�Y@H|�kLY@Jo95%�@Lu	��	@N��h��@P^��i�@Q~�;0ET@R�O�sm$@S��1@��@URUy��@Vd�z`j!@W�
R7zF@Y:�ӟ<@ZyD��W@[�&�AƜ@]b�f��@^�yKݾ�@`9�S��@a�N�#@a�@���@b��O�h�@c�KwZ��@de� �5�@eJ%*��s@f3���b@g!�đ�@hAZ���@i���w@j
�ȣy�@kT5O�%@l����I@m �fM0�@n2?���@oHv��@p1̔�|@p���`� @qTH�Í�        ?;F"�7H�?g��l��u?���$k�?��a�0?��@�^�?�4�a.Gq?��G��� ?�!�U@�?�V&>s7�?σ9�Y��?��E3�H�?�glɺ?�x!?��?�Τi�?�bX�u?��x���N?�f˧o�u?�7 ��-?񥚌�zK?���w+s?� ����u?�������?�(���?���\.@ _�p�=%@�;��@uD�~@�����@�_���@�&�ff�@
�#v�+�@uYx���@{���@J���=@`��#^@��� ��@�/�`��@��$M@M�[tG@_;�a>@�D�q$@�`���@i[�y@ԫc��@I���<�@�L=(�p@ �)�+�_@!p�b�8�@">f�Ž;@#�\�� @#��q@$�:�$�Q@%�����@&��&�J@'r��N9@(a4.cFx@)T��X�H@*L�E��)@+I}M��@,K�mJ�@-QgX��@.\u�@/l<��f�        ?/Nq)(�`?_!7��)�?{
t�Ϲ?�8�'�?���V/�g?�(��m ?�V�SѮ&?�}��^]�?�*Íl�@?�Y���?��
ەi]?ل?��.�?��R9H?��g:�?�b@m��?�jw�]vG?�GwF]/?��ܧ�2`?�?u��t?�&in؇�@ 8u;G�k@��Pyp�@ T�q�@��G�@
�����]@"�A/o@�&xw�_@��m�ܩ@�`�[�o@�Q2>�@�����J@`JŞ@䏔M��@ F1�>�@!�J���@#$�B�13@$�%N��S@&Nk��7@'��T�7�@)���J@@+�l,���@-�԰�9@/�?�Z�}@0�k~G�Q@1��+�@3���@4+�$.5�@5^�9t��@6��>�h@7���V�@97��n�@:�O�L�@;�!��y@=o�3lO@>�RѬe>@@:̌�]L@A]�\'A@A�c��h@B��PƼ�@C����w@Da�շ@EF�En��@F1d >�        ?-��-%	o?X�e7%��?u04:b]7?��'�oI�?��e�|��?�hb"�?����3?�:�/@�?�s�$��?�ߴ���?� -0Ծc?ׂX����?��uUv�?�ܺ/���?�N5ڝ?�f=��?�ĩ��?�Z��J3"?� d�?�gˎg�@ D�#{R�@�6q�r@lwf�N@[:���&@�q��0j@�.#���@V7\풑@R�J[�@r��!d\@�9%&ݷ@!Wv�@������@i�d�@!$��C_@"�
�Ć#@$BAg�2�@%�Q?@'��r��@)��חb�@+S;j-�@-�u�(E�@/��+�D�@0�×�@2�ݐ@3FY�2�9@4�'UD��@5�G�ka@7'�G�V@8�xvܱ@9����@;z�mT.D@=��+�-@>��/��@@!��0�@@����p@A�	 �v�@B����`�@C�Ʒ�;�@D��}�@E�A�*��@F�����@G��%��/@H���!        ?u�z�GǴ?�*�p��S?��<Px�?��Ud�?�����=�?�a�5�?����X�z?��.��m@`��@	�[fFy@�x�F@[�B�[@Y�{�o�@���>n@ @�y3S�@"ִy��@%�����5@(��>Dc@+ͭ+�S	@/3��M��@1gw��N@3P�jj@5S���@7sMA��@9�r���@<�?稱@>y#���O@@��Ƽ�T@A�J;��@C@�[�,@D����i_@F5ԑ�y�@GƍO�@Ie�K�͖@K�h���@L���'L@N�ad�$�@P9�FQ�@Q-[�mb�@R(0�$P@S*)4ό�@T3DbEܗ@UC57�@VZׯ�v�@WyK�o[�@X��5R+w@Y�|���@Z�2�n@\9���@]{����)@^Č����@`
+~�}�@`��P�<@adj�BQ7@b�e�@b̖/��@c��9��@dB��*��@e���Js@eƞ����@f��؍C�@gXkVX�,@h&M)��        ?N��u�d�?w��H�?�#�!��P?��މ'��?����^�?���/<�B?�:+��?�mYy�&?ӂ<E� �?���fͨw?�0#{��?�	|��m�?�Ե�t��?����e�?�y_��?�)��Ie!?�À8��n?���,�a?�~�h1�]?��S	2�@ w�J��@5��`��@
R,��i@��d��0@��M���@
���x@B�ým�@�����g@uH�t�@��Xf+@�y�g£@L٪�c@��tA�7@"m�N@���h�$@�Oi��@�^����@>m��@��`"�@ M�)I�Z@!.g��@"��qܱ@#H�L�@#�|Iг@$�|��@%�5���@&�4o��@'�p�6=@)��:�@*%����@+Bx>@�;@,e֏>C`@-�*Df;�@.�i3���@/�Ż��@0�D����@17���'�@1����@2�K� �m@3*z�c@3֓�^d@4�����
@57����F        ?<�q��(?iD�4T��?�C�`�?��˛�'!?����f��?�$���`"?�_�$��?���%<�?���#c$?ն���6�?܁o}?�?�H���?��m��+C?�t��� �?�Z����?��:Om�?��x����?�^{�ی�@*��s.:@��VƧ@�Z����@
4-�݇�@�W�@�C�\�+@�O��@,}���@����@,]�?W@�
��@�����c@!}# +��@##rY{�@@$�뽮"�@&��r�@(�KY��<@*�!��;�@,�&'�@/e3; M@0�[9_�@1�z�@39��`��@4�N�R�@5��&�"�@7h3z��O@8�&��i@:{�D�j@<��N@=ʁ��@?�yxh�@@�x��@A�o��3@B��n�_L@C�j��M)@D�=�%@E�h,@$�@F� Y�+@G����P@I�Ӑ�K@J@/jG@K{Q77~s@L�J4�s@N/��M@ObHhS�        ?6x3����?a�	ڕ�?}���?��x.�~?�~Nch�?�'A��J?��:J��?�G?G��?��͵��)?�$�2Y��?Ԍ�Vt?�{9���?�[ե+?����q�?�g�x���?�DB)U?�PW�g�l?��U�3�?�WP���?�mi3��@ �H���@iF�5�<@}�.�@����d=@�<A�@r�5�H@��	:Pv@r,��ʡ@y�\@�*�]5@�Q���@p1�1�@v�l��@ �d��8@@"O�w]�@#�k�?@%g7Wd�G@'�SZ׀@(ˁ���:@*�4�=;@,~���m�@.w�\(S@0A� ��@1R��}��@2m��`}@3��`xJ@4�0F��@5��`oj@7E�vr�@8�f?�\R@9�����{@;[�<��s@<���v�@>M�� -@?ױ���O@@����:@A��N��.@B^DȐ:@C:����@D�B�@Eu�ƃ�@E�Z�cV@F�gp/b        ?�̍Ҩ>�?�B���%?�8OƔ?��@t���?�:�;��?�Fd�|;@@�^Ϡ��@�u]W�@�o_���@2����t@x�;Q^�@ ,-�_�g@#h�=�g@&���@*ɤ��fu@.��.�t�@1����@4!�>8@6�!�E^�@9A����@<+ ��@?f)��m@AQ6�?�@B���ȋq@DtvN��D@F@9u�n@H�;�_@J�A��@L�ʹ�@N8�m�Ox@P5,*�@QXi	m@R�/�o�>@S��M �]@U���@VOu���@W���y"@Y�-Þ�@Zz���@[�nԈѡ@]w�;��@_-]-�A@`P�}J��@a#y5��A@a��j-�@b�r.h�@c���X��@d��_��@e� ���@f��؎U@g����^�@h�����@i�[
,�@j���9�)@k�Nf>�4@l�����@m�K<%`}@n�@���@p
�'A��@p�\�a#@q8�j��@q�ꭺ�@rr(
舳        ?P�@`��?v�ʨ�y_?�XH��+�?�胢��?�
ݗ��?�;�R�}�?������?���y�?�~��=h?����D	5?ݸ�s1�?�0����e?�޲|�?��L0�?�J����?��ދ�?�s@��?��^��i�?��썙�%?�����@ 
�y�)@Ŧ��B%@���(@�:m! U@�A�o��@	�N���@Љ�_�@wP��@?�a��@|�Y�>�@��?�@���g}@�oK'�@�$�!6@k`�@�f�U@���M�@(�B��@Ֆ{h�v@ G����?@!*uUX�@"�P���@#��s��@#��W��@$�P���@%�Y׻ �@&��7Ӎ?@((��U�@)!�n�v�@*<�����@+^J�xC@,�܏t��@-���P|L@.����+|@0��4u@0�c���p@1T�Y�ZR@1�g]���@2�@_�[@3Q�/�Q@4صk,@4����@5k
�D        ?$�w�l.�?R�-�˗�?pt� V��?�G�5��[?�rL���?� n�R�?�gKVd?�W�7�g�?�'� !Yy?�u��B��?�@;�湘?���pĎK?�vn����?�ɏ�=�?��R�`�{?�?>���d?�<�lё?�nIM�#�?�����*K?��BK�?��΢{2D@ 6��F�@iL�;=!@���H�@�8�h.@@
���h�@�g�n�@��#��w@r�[�"'@fTU4��@zQ���@���lI�@)S�}�@}��{@ �$�7C@!l�O�)�@"ޫC��@$cA� i@%��/��@'�ods�@)c��q�@+5� @-���]@/��Rã@0��\�qs@1�/,�@2�����K@3�Y�@5��0�@6Y7CY@7�Ѫ���@8��ba-b@:UN�O@;���&�@=6_dmT@>��I��@@#r~�@@���R9@A��}�?@B� )�Z@C|���(@Db}�3U@EN���H        ?B5`&�p?j������?����yz?�����?��(��?�naq��?�\�����?ĕ�OG�l?̘)OD?�/��aՐ?��9gm?���A�N?������?�@���?�����?��y�E?�C���&c?��fQ�ܮ?�����.@ �0c�^@KN�XC�@��B�~@�E=�p@�޳�@��En��@�`�3`�@���g@�~Ƴ@��,"/�@W���Ă@�Щ)�@��f3@!4�9��@"�l&���@$H���7
@%�h��{@'�x����@)�>�:4@+l��;�y@-l�3o?%@/�z�C�@0زy�ʦ@1�mA���@3*� bX@4d�b5�@5�#j�&@6��|ʖ@8`/&��W@9�d���[@;G�D��a@<��O�$@>c���@@@��5�@@�α�{b@A����5@B�J���@C�	NQ��@D࢛v�@Ez��W6�@F}"+�d�@G��)C�@H�����+@I������        ?��Q�<x?�n�oC�\?��8��?ۂn�[iw?��	�o7?��+�!.�?������@��"� @jS��g@���F��@"s�YX�@&t�D�@ Z{�*^@#g�rƫ
@&��R��C@*T����@.5����@1/@�;�z@3gnf���@5ð���@8D8ŘA�@:�;��@=���`	@@P�,e�#@Aڻ�ŕ@Cwm��%�@E'
���@F�-���@H���7u�@J���\O@L��a��@N�L�J@Pm7̔<@Q�(�ġ@R������@S��Y��z@Ur��,@V\�h�w@W�����@Y[��*�@Zc�/�\@[αg��@]Do��-�@^�@��n�@`'��O@`���@a�&qw`�@b�F�*�@cmxI&7�@dK�w�g�@e/�-x�@fx�9+@g�L���@g����Fn@h�(Q\�@i���\-�@j��M���@k���/{�@m � �R�@n����F@o'�J�@p!��35@p����i        ?Q����G?~.H	�|�?��i�TH�?���B���?�42��U?�a�W+9�?̀���?ӹÍ0 �?�:�`1=?౸�
��?����O�P?�R��\t?�O��#%?��2l
<?�ҖXw0.?���(n�?�hVA�?���>Y@u�c�$�@�4�)�@���,@�@���>F@
f�jJ9�@�#����@�D;��z@/�-�!@��f��-@$�:�@����s~@X��3ޓ@	��'�@�:���@�i߈�4@}��Ĳ@ 7�5�`�@!8N�{�@"A=�:��@#RU���@$k�s@%��e�&@&��й�@'����@)"��G@*d���|	@+�`��S@-}�Q�@.]#b��@/�o	]w+@0��ʕk@1O�ﵝ'@2D��]@2�I>��@3��m���@4a;gc+@5/�M�@6�-!��@6���7�@7� ��@8�W��Y�@9w�R>4�@:_{6��@;KJ���@<;F�W��        ?LM#j�?}���;?�n@�W�?� ����?�Oڙ;?ţ��?�ReT���?�* ذ��?�nw��Nw?�l9uT�?�Q�s���?�r�E�A�?�2��ۼ?�mA�	�?�*g�T̑@7�>M��@ �BM`S@R�7���@
МK���@�yb��S@\RK���@���h{@�>5d��@�μ�y@;DP#�@!�\��l@ ��R�w@"<�n�@#��[�]�@%�����@'�R�b]�@)��Ф�6@+�:y���@.�z���@01]��
o@1hR�6�@2����It@3�C,�@5_�>*��@6����sa@8J�#��>@9՜z��@;o(�i@=^�iv�@>�cW�e@@J,���@A4�Z8�@B&�k7�@C ��]��@D"�E@E+c$���@F<���R=@GU����@Hv�����@I�ʠ��2@J� "p)�@L
_M.��@MK���m�@N���y0@O��3�O@P�O�1��@QR���Y@R����        ?@������?j��5Z?�'-��j�?��٘��?�Y�#�?���F0)?�n�^��?�+
��?��̐XY?Խ%Hf��?���9?�L��?���bss?���@yO?�2��]?�myt�e?��M�S}?��`�"�?��@3�I�@4ۺ��u@���y+K@�W��Ō@
�zjʟS@[����0@T��c�@����M�@����@R?"��@�KG!�@;�Uޔq@�Âγ�@ �T�hZ�@"[��^��@#����@%���V}i@'N%���d@)��Ɗ@+1���@,�,�ή�@/��9H>@0��tkw@1�g;�c�@2�T�zb@4�w���@5S}E�K@6���eS@7�����@9Vؘ'�@:��⨛�@<>��� E@=�e��bK@?V/���@@z$�5@AO��@B*Q�'�5@C����@C�_�2�)@D�OP�"@EՓ�D��@F�9@G�K�RvN@H�ث��@@I��.�        ?�~>M�?��8MEg?�!sI~�v?���9.x?�}�c�^�@��Xh�	@���rJ@%���b@Q>5qڠ@ +��%�@$B#�jV@(u�m52�@-:�z�'�@14�� o�@4��[WD@7>m�B�@::/I�t@=�<�%��@@��PWX@B��x@D�{���@F�wA!�@H��kȟ%@KN���s�@M�-�q��@P)ȳ���@Q�3�
�@R�l&�U;@TW!��@U�>����@Wg騒*n@Y;a��{@Z�MV��z@\o5��v�@^:d�@6@`	�*{&@`�C$�1�@a�"����@b��u�q@dm���y@e�j^e@f4�]�Q<@gVZs�P�@hk�si@i�H�2�@j�At�N@l(
��t�@mok�>Ey@n�eLtF�@p
| �)@p���@qlt����@r##�1ڒ@rݟ@� @s��e?P@t]�AKT�@u#� �݇@u�"*>�@v��յ�-@w�6~c.@xaG!fӶ@y:)�6�J@z���        ?Q��J8�?|��;qL@?���O^p�?�,��ţ?��v�X�?�c;�2��?�"��:?����Ֆ[?���?���T`?�^Fd?�9����?�3wF*�?�}��[?�q�Y-��?��	Z�CV?�P�U�?���G��*@U�3g�n@km�X��@�k��@��f�@
i>��a$@�+n=��@���rLJ@B&��S@�Ѳ^@Et��x@��e@��#�Q�@BY����@ ~K2@妕�>\@�JPC�v@ dsJ�)7@!i:ݯp�@"u�	Wx�@#��]E�@@$�O�c��@%�����@&�iz��@(,�pRM@)i<�N�@*��Dw_@+�����@-M���@.�蛾�@0 ^�P"@0�6�g�^@1wRvI�@25t���j@2��C޺@3��ӷX�@4��Y`[@5VC�j@6(~|e��@6��iA��@7�ݮ�*�@8���� @9�΢�@:~��Sa�@;h��EE�@<V�X�ȭ        ?>Q:&U[�?k�4F�Q?���:?��O�R>?�ԌM�G?������l?��:9�O?�1�7��?�J$�
1?�c�QȓU?�ŉ�`�e?�_��9r?��`�(�h?��`T��?�=8�r�?�a��q�?����B?�½7�3�?�Z��MY@�����O@eZ��� @(&'��@
#�t�i@Yʀ�{�@e���(N@=�kS�:@4� P˓@L8͜O@��Ayr�@ލ��i�@Z���f@�[	@�@!^����@"�ʧ(�@$X,��I#@%��*��@'���z�@)\_\�n�@+/n|�'j@-n��?@/����@0���u�f@1����z�@2�"<W�B@3���9@5�,�ȕ@6S�2A[�@7��Q困@8���ͱ@:II��I7@;��"@=#��O�@>����I@@mFg�@@ߣO���@A���XPo@B�$CV�@C`���q�@DA�@ԦX@E(��>�@F�q�tb@GK0���@H ����n        ?CT�Bl�5?oA����?�'��[./?��D�>�E?�a�O�$?���I?��>�Wc?ɐ����?ѸLi��!?׹[7?2?��#+��?���z3?���H?�166�w�?�M#��o?���91�?�����{]?���
18@�k�_ G@���@���xUQ@
�����@i��c��@%�g�	@>u���@�s8(@�����@�����@F�Q^U@ &t/�@!���F+�@#U<���	@%���8�@&�����@(�ZU�ǲ@*����l@- |�N+�@/f�ę��@0���\@2$�ˌh@3s��s��@4џ/��@6>�
���@7�Sp�l@9I�軕@:�%��@<���Hn@>S�U#.�@@��@A��f@A���a@B��	�7,@DH3�%G@E!�Cˑ@FA:U+�@Gj&�|C@H��W�d�@Iُ۷@K K�;)�@Lq5Eq3P@M�j_�q@O2�\N9@PQ��O�        ?��7�u�2?��S�J�?Ӑ �D4?�ie?�o؈�?�v��p�B@(d>��4@�J�@K5�d�@LkxBK�@!	#ye�@$���v%:@(�Ȗ�C%@-����\C@1:��$
7@3��ܜ@6�h��Be@9�ޮ�@=����6@@G�����@B��ӆ@Db�I��@F�C�1@H8�k=z�@Jv��"�@L�b^[:�@O>��i9�@P�Jm x#@R8LG�D�@S�|b�B�@U�X�0@@V�z�14@XJ���U@Y�M��@[?}D�E@\��#t�@^�H@�gO@`:j���h@a%�3��@b�m�e@c�4_�@@dʁ1��@e,����@f z l@g2�ݪʐ@hK}��s�@ikT=�@j��پ�@k�̅H�G@l��X�Q@n*ߊ�$C@okDUV�@pY����@p���.�@q��O��5@rW.Z��@s�p��/@s��g�N�@tr���0�@u,�N9�v@u�q>�@v�BH�q@woW��8        ?C��+�_a?pR	�*�?��uQS��?����Ӕ?���Ӳ�C?�t�*"y?�Ձ0j?�6�#K�?ּ͞bW?��� }?�� ū�?�@��:?�B;�?�����<?�Z�s�a�?�'�R�:?��P�=?�M���i�?��
�ߢ�?�I�yJ?���}��?�y0��.?�a`.��@7�3xX@ѵ\a�@~ۅ�{@??ys�"@ �)�@	�@C��p@�!>�Z�@�P��V@&m� �@.k>C�R@S�IHl�@�/F s�@����r@ ��{�"@N���di@�ȷOp�@	J&���@v�ē:@�,�:r @n�X�{;@�V���F@ �9���@!�wA�@"m�!��@#H����@$(c�Ղ@%s���@%��I��@&�I߽�@'����@(�<�ԁ@)ո@�H�@*ژ�^N�@+��?ƒ[@,�����@.	�G�L@/$��5@0"��f��@0�����@1KcߨV        ?+]�����?Y��I�)?v,U1��?����h�m?�@�3�?���WM�L?� ���	d?�j����?�C^�pd?�g�m��$?яDE?��W��!?��ꪙ�?�
� j,j?�(����?��"���?�4�h}{?�	@�};�?�U����?���@iQ?���M�*@/���ƻ@���:�@(�і �@�o�f*�@��t-G@1 �&n�@R�p�[)@*C��T�@ Q ÚG@5uU�jx@jh/q�@�ޣg�a@6��A��@ g�>C�U@!�!&�;@#4T��]@$���r`^@&H��Zz�@'�z�3~@)�5�$l�@+t����@-T��>k>@/H����t@0����i�@1����4�@2��)�p@3�d�xj@5!�m���@6Z��g��@7��je[@8�(���@:IudK@;���˟-@=!���}@>����Z�@@��r}�@@�:)t�@A�d����@B��}��Y@Cf���9@DKT`�<�@E6D|��C        ?7s:��:?bu���%?}�Oǳ�U?�D��r?��bR��?��'I��?�������?��3�պ?�^���?�G����?��a
>%h?ٗ[�8�)?��&0 ?���D��?�`z��?�_⵺�?���ɥ�?����+?���;�?��[���%@ 才ʵ@cH�'��@�m�k6@��g2[@
���e@�{RJ@@|:���b@E�sB��@,��},@1�X�@U�T��@��BCs�@�h֮�@~JѴ3V@!�XU�m@"s 5x�@#��qaQ@%i�D�I@&��:/C@(���L$@*\]����@,%k T^9@. 2E�<@/��~�~@0��l'��@1�XO�.@3;+�@4+4����@5O��I�@6}��F�v@7�s�%B@8��Z��@:A��J�@;���D��@<�n���w@>^=W��@?Њ��@@����x�@Ai���@B2�[.�@B�Sׂ�M@CѰe�@D� S���        ?��"EL V?��H�8��?�kxQ��?��Q��5a?���>�ʊ?�2k�+?�L$�H��@W=��(�@rx5+�@x��@�)$9��@$��k�+@
�x���@!4u�7 @$��>[�@'G`��C@*�đ��@.NQ	=d>@1HL��P@3&��� @5U�2S@7��*��@:82�3!@<�4I�4@?U"ߒ��@A��2��@B����A�@Db��y5@E�S,���@Ga�	�@I $�`�@J�P;q8@L�)��b@N�����@Pe�]V@Qqk�?]@R�2���n@S��Ӛ�@T��P���@U���|�@W4?�� �@Xv��{��@Y�O��|�@[7>#�@\uik�W @]��G?X@_M�	���@`d!d�@a%�¿��@a�a���@b���8��@c���SU@d\m�}F�@e6?�.�@fjv �A@f����A�@g��R'{@h�����@i��z_@j�)��^�@k�<jZ�h@l�R��*m@m�o��A�        ?9asE �?f��W�?�3��8p?��́�5?�s§�-y?�LB�л?�5�ȓ?�?�*��C?�8D|DF?�J���M�?�2�H�-�?���qW��?��y��� ?�EwN�I�?�_���Q?��-ٿ=�?�k��&?�^8z&�?�Ϳzi�?�����?�|7���?��0��e?���/�d?����@B@ Ԙ/ǲ�@l�A�x@�O�@�}n�q0@��jM�@@	������@����S@��t�w@�L���O@1���@8�V�t@oQ���E@����o@��־�K@U�3�g[@��o��@&�L�> @���L��@$C*n��@�����@ '"G��@ ���z0�@!�V�[*)@"�EdD��@#��gM@$|�o��@%ktmG��@&_��S]�@'Y{�L�N@(X��#h@)]�A�w@*h���]	@+x��p�3@,��y�R%@-����@.��(�+�@/��nu�.@0���RD.@1(�S��        ?&��d?W
I(XP?t�#ʆ�?���w�Q>?���S�?���X8�W?�6J���x?�woۧ2?õ���$/?�60<���?�4����?׾��k	�?�O{��?��R�-��?�n�����?샫7��?�#ӆ{�?�b�I�S�?���+�?�
J���/@ >�=���@���6�@[��y�@D0��Y@kU��C+@�X�J	@?'ثh�@7"�] �@R��ڎB@���z�@��4S>@��`��@6����@!	^T%�@"�N;���@$"oC���@%���s�@'� �|w*@)iu�?�@+XD�g�@-]���@/z�E�$6@0ו��Ib@1��}���@30{A�@4n����2@5��2��@7CM��@8u����@9�u�nl@;e��i�@<�h=[a�@>��ư �@@� PK@@����QX@A�-�%@B�i�5H�@C���3��@D�C.�d/@E��=v
@F���I@G���yow@HŖ�$�5        ?,o�A?W=i
�$)?s��&��v?�˭{��?��f=:p?��$/��?�l8�!i?��"O�j?���k�A?�(���E�?�2��*?���.�?ڨ��̮"?�u
D��?䃲P�![?�����?��i��j?�1�L ?��EW��e?�L"9��?�T3�t@  ��Ҷ@eں��@�*g��@�V��@
bƿ-i@u�d�q�@`m_�E�@"@��Ak@ �ǻ{I@�=)<�Y@��X[7@Px��̋@��o'�@ >Awo4@ �3(�+@"8MD�;@#���@%"�VT[@&�\��3�@(QC��0�@*�QR�w@+��1���@-�����@/����e@0�Ή�p�@1����@2�a#Z�@3�\�Y��@5�Tl�?@6;8��@7qIǢ�`@8�?~�@9�1�F��@;O9��2@<�pH���@>�"q�2@?�̅��C@@�%�5�@AG�?b�@BP�-s�@B��}�z*@C�(���        ?s9h%؍?���	u�P?�����?�y�Ry�?�6�L�z?��ݰ��?�� �h0?��j��1@�t@�@���F@�2%���@��0$�@�s�K��@�YU�@��\���@"{E\5PH@%RtC��@(`�+�h3@+��bUI�@/)q�+�@1rE�>@3l�q��@5�ՠ�1@7��X��.@:(��M�@<��EKZ@?�!7�@@�\���@BJ�2n�@C°N���@EJ�ĸ:�@F��xڏ�@H�ab&��@JD�(dH@L�R��@M�'��@O�[�"+@P�P[1t�@Q��Le@R�4bS��@T�Tᖜ@U+Ր5|�@VQ���,�@W���ÿ@X�b~�6@Y���t�@[;W�۬(@\��K8�@]�)��@_?�Q@`SEsm�@a
��jYI@a�cX���@b���8@cI�ʮJ7@dr��t@d�:;=�@e��@@f����e�@gX�ʵ�4@h4��P�6@i�8z�L@i����h        ?A|��%��?m�utw�7?��"���?����?��x=s?�C�� �?�;mv�	�?�3Y�ߖ(?�e��R�?�[� ׻?�3�9+]?�cnU��?�"�O�'�?�_���?��(,1rB?� `�ii?��c�nl?�.�DF?��c��;�?� 3^�?�ו�6K?��xf��?��2,#K
@=�d�@1՟�@�Swl�@�G�{@��;؞@
�ctR�s@��	���@2Ǌ���@���~ �@�[��n@4ߌ��@�*�ŋ\@�PZ��@:d��`@�}�]%Q@$��E�[@�ݒ&�@?�S@�ɍU@ F�ix^@!"��F�@"\N,�6@"�mZf|@#���	ݙ@$ӕ�\��@%ϸ��@&�>n��
@'�+��vJ@(�MFӫ@* A'���@+l�a��@,?���@-ho�d@.����|Y@/�q�@�@0������@1&G9_�@1��vR��@2r���5�@3�.s\(        ?-h��q�?[�u2}�.?x=}�?��p�&�?��&�C�?��I��W?��Ň��A?����D?Ė&c�z�?�q轁,?ҝQ"Q��?���a��?�t��q-?���38�?�4�U���?�����?��K)?���,S%?�=��a�a?���h�?�*�|� 0@�R�{ұ@U�᪉�@w��@	�j�O@R�=�@8rM�j@b��j�@����%�@i[R5�@0
�z@�hq{�@�?t�2�@�Fz+Y@!!��f�5@"�ْA9P@$����J@%���7�i@'O��	4*@)��v�@*�=�Cm�@,�1��ߨ@.���REZ@0b~J@ߗ@1s�q���@2���T֫@3�8p���@4��C�ٶ@6$c�-�$@7l�y�@8��`�o@:Z{\��@;���@<�T��x,@>}9����@@�0���@@�+��i@A�cx?c�@B{��س�@CY�K
`@D>nZ�Lt@E)�0��@F�u6��        ?4���J��?`��NW��?{[�y�d|?���v��?��p�B��?�Sf�ZQ?���f�+?��ֆ�d�?ō���?�]���?�o�O%��?��3�L:?�զ�1?��pT�?�T�S���?�y�m�C�?�CB��Y?��ǏAY�?��)"�l�?���5d�@ ����T�@�s8�ɽ@��f�@�q	�sn@�i3��I@�&F@V��ҡ@G���@Z7�i�~@��m�|@�Fp�Q@a���@j�W�7@ ��aJ]i@"XQ�k�@#�;a�j@%{ƒ��R@'*�N�C�@(�'Y��Z@*ŋφ�~@,�qb%]@.�7!K�@0c�Z�@1yp�P��@2��8Q{@3��j@4�X��z'@6<�0�RB@7������@8�Y:�@:FH��b@;����'@=1O���_@>���x�,@@&Id&tI@@�ELeP@A�s��Z@B���Z�@C������@Dt�.[�@Ed�+M��@FZ����Z@GWy��~        ?|`K�O�?��Lr�n?�)6�H��?ՠ ���?���@'�Y?�-���?�e-��g@ ։�bl�@�\���@p�@�@5��tU(@X)����@�@�Bf@�N̲��@"�Z���@%�� o�@(�����@,Os��$�@/�Q?��@1���@4B`��@6<����C@8��.�G�@;<�t)@=���@@'��)�@A�NG-F@Ck���K@D�_ �3@F:J:��r@G�M�g��@I��7P��@K{
�y@M^~>�@OR�����@P�]AYQ@Q�Q�y�@R�7e�$U@S�+���@U�i�@VB&��)!@W{f�&�#@X���{��@Z	���iU@[^� �V-@\�#Y�~�@^$�#�r5@_�K���@`���"c�@aJ�?��G@b�p�tz@b�b��7@c��$���@d�I�}��@e]|�@f<�~���@g r�+E@h	=J_�@h���=�@i�|قj&@j����@k�LW;�@lއ�MA�        ?E�����?p�r��l?�Eخ�ܩ?�\��:?��q��?��Nm�i?�+���l?Ƙ"���Q?�*,���?�qf����?�a�1Q�G?��IK��O?���$D�?�W"5�"t?��8O��3?��A���r?��2���?���)
��?�8L��)?�Ń<��?�x��Vt�?�QʖԽ�@ (�����@�eP<�@a|}1�^@��@��q;�@�+�sw@
���f�@ò�lYL@���l]@�7&�@�|��@��}��@	O*bi@H��e�
@�4�U�@幻Y_@CM�G�@���>�t@�mI�.@�Xyu��@K��@ V�Z>_
@!#�; ^�@!��&>	}@"�N�XL�@#�)4�@$��&��@%n-3J�t@&X���)�@'G��s��@(<JmuP@)5�Q^}@*2����\@+5��g@,=l\���@-I���@.[|Z*��@/q�BDJ�@0F���V@0�α��u@1is�+w        ?)q�ᴏ?XN����8?uVP�?�1�D�?�^.�F�?��8.�I?�B�ѷ�?�m�-��Z?ß!Ҵ<�?��Hlu�?�$�{?�~���H�?���<�?⿴��zI?����i?� 瘲�?�߇쎰�?��
��?����R?��\�}#�?��y��@Rn��x�@�!?��@�����@
ѯŽZ:@ ����1@���0@����F@� ��V�@�"���@LZ$5r�@Þ\oL�@`���!�@ ��u�hJ@"����@@#�&d�C@%2�}m@&�7�8Ȧ@(��2���@*�Q�ڇ'@,�����@.��?�:"@0^��0_3@1}����@2���{iy@3��W�~@5$j�z>@6t���}@7҅���M@9=l��@:��L��>@<;�l��8@=�3����@?p��@@�I&e=@AoX�+G�@BU�qj��@CCa�:Z@D8��5g�@E5=�3t@F9�.�+�@GE���J@HYy@�M        ?=e+)���?e�?��H?�^��s��?���p�1�?���.��?�,t2UX�?���@%�?�m�D�i?�:=iq�?�F�"Q�7?�Guts|]?�3����?��H��j?�n��M?�����?�Ӕ��I?�U�@���?��ڻ��?�:�ۣ�-?�=�+�N�@ �1,��I@<��q	�@�C8e�T@�pDA3^@а�6@&=���8@^'�`vp@J�&aFW@Ye8���@�¢(&�@���@_>�),w@iB��k@ �s��{@"`Ch��K@#�g�+@%�XP3v�@'K�J�`@)#�Q�@+.��@,�=5�]�@/�B��@0������@1��UxO#@2�o��w@4+�^�/P@5s� ���@6Ȥ�O@8*�iI$^@9�����@;���7W@<���H�@>98Nb��@?�L
�@@ɹ$@u�@A��c�@B�BNz�@C����^�@Dy��� +@Ex�B@F}��_j@G��2�M@H��&`X        ?��@(L?�����E?�`Ǿ/�?���LtE�?溹�<w�?�M�8�BE?��(@؈J/Д@	�t눑@Z��/�@&�Q�U@�j7lr�@���@@!��75�E@$u&��xE@'��_Ze@+	ȥ��@.�v\ `@1Fppx$G@3T+U%@@5�3�}�@7�k?�`h@:1CVk*@<�S��/�@?[�����@A8gsbM@B�N�o@C��[�[@E�đ�l@G-'�B
�@H��r�-w@J��X��U@LdW���@N@=�dD=@P�T�3'@QT�%�@R���q@S%�<�:�@T:�Bw�@UW�^�*@V|mU��@W����@X݆\�O@Z��2��@[^}��m@\��V��@]����q�@_YA<�P@`^>��|�@a� ��@a�|0rL@b�$k�1@cK��~�@dן��@d�h�݈@e��N���@ft�M=�x@gH�4@H�@h �-א@h�h�u:�@i��v*�g@j��P/$@k�.�43        ?Ne�)�z?z-��O/�?���}?f�?�cKoX"�?�`�N�?�9qVs�
?�|\�۷�?Ѿal���?מ4�'?�^D��+?�����?�@��>�?��� o�?��L7ʷ?�V�wL?�Z,X�?������?��T�f@ `AP�K�@V#8��@iN��|@��n6'@������@S���2@��o`?p@@��ߗE@��F��@��d�@��h%M�@-%_�(@�,3��@e�R6?@����@�[P�@�{%�@ P��7�@!J.��+?@"K�1�@#S?��s@$b�?�>E@%yy�h��@&��|G��@'�ש���@(�kb@*9�b��@+X<���@,�n�1�@-��I���@/4J��@0E�0)9@0�O��Z�@1�53�o�@2^�zḼ@3�3���@3���B@@4���F@5[�j(`@6#�(}m�@6�2�ڐ�@7�K돫�@8�줵��@9g�/ɜ@:@��HA�        ?C�W"s?rG�梺%?�P�!�b�?�oS��)�?�fi�-	?�;%�O	�?�ʆ��|�?��$�n.-?ԙ��hG_?�lt<���?��e�%?�uԒ�?�c?�Z]?�/:�{�?�������?���C[4#?�Y�B��@0g��N�@�$�9�P@�� �@
Ya�sx�@�Y
\��@��=@�"@�r6�@]�zk	@��#�v�@q�t+�@>���l@ �V��@!�g�3@#_IO#��@%%(.��@'2�2��@(�싌T|@+��ƣ�@-=t}`uk@/�?�l�V@0�Z=�/�@25�Wo�@3�@j
�<@4�d{,�9@6MNz5�@7�:Q)>@9Rc��#%@:�7�^~@<�\�	-�@>N�o^�m@@qN�@@���I02@A�"��^@B��7+�@C���3TY@E ��%�]@F�OЙ@G8�!P@Ha'�i'[@I�'��]}@J�4;�*@LcJ���@M_˵~'�@N��]@PQi܀E@P�Viz        ?8�hq]��?c�y?@W?�W8�Ff$?�&��7/?�Z��װ?�/���M?�W�3,�v?�� �+?�����?��4E���?�T@_��G?ܮ8�H��?����w�?�Z�.1�?�E7 �?�k�0��?��z�~?��.��r?��� FO?�2o�dh�@����(%@~e>j5�@D�6_��@
D�-߄l@�ë�A@}d:T��@Y۹��3@V��ՙ}@t�k��@@�䔴V@��Ʉ@��^�@ $W,�@!�%��K7@#�p��@$������@&62�t+�@'��Ӎ@)�H��7\@+���~?�@-�� n��@/�V���X@0ּ\� =@1��b���@3�v���@4Fc"��@5�Hj/�(@6��ȕ�_@8�
@9|)U��[@:�X����@<^��w@=�f_Hя@?r���*@@���o�/@A\R[.@B7m��~@C�p[_*@D}�ބ@D｜���@E�d�̠@F��zޑ�@G㪽zE	        ?���2�e�?�*@j�0u?҅�Ѝ�&?��6�K?��x�*��?�W�`os{@f��֡@!-�Go�@�&/!0@�`�x�n@ ��T�!)@$Fh��B�@(X
M�o@,�����@0��*�F@3j���O�@67
q�Z@943ϴk@<bA��?�@?�4�a4@A�{x�&@C���{T�@E�/p$ׄ@G�ڲ�@I����H@K�q���<@NT9��@Pbr�yf�@Q���_�}@R�� ú@TR�%��@U��a���@W.8�l�w@X���ӱ@Z8�d��=@[��)��@]r�"⾌@_!TR7��@`m�9��@aP���
�@b9޴+��@c(��5/@d@�ƕ6@e���`�@f�u|	@g�m�;.@h)Y��e@i:�)��V@jQ�4D@a@knP�|@l��ɧ_�@m�wS��@n�����@pxp��@p����@qG���@q��6�@r�3.jL@s5�o��@sߤ��Q@t��`��@u<&�: @u"6�        ??(N^d?h)���T?�@)z4�O?��g�'4�?�;E~�_?���(��?��EH��/?�v�r���?�||�ó�?�z�_��?�:S5��?׷d9p�?ܶs� �`?�����?�!A	�?�i���m?����?��@@��Z?�r��\4?󢹝��?����9,?�p�P�?��8с�?��(���@ ]su��@�,me@��?�@,�q�)@�E6�@�p�e�~@
��nӄ@�b�xͷ@�Y�eڏ@k�2��@�`a���@���4>7@�+�H$@�!�g�@XLm�J�@�MN�]�@��ʈ�-@a�c4@� {'@G�H~@��v�?@ +�T\��@ ���[��@!ɣ|�@"�����@#}T\#�?@$_e��6d@%F��'lH@&4��@'&��;��@(0@�@)d��@v@*��g��@+(0��7@,6W[Qq�@-I�zX{@.c��6b@/����o�@0R�S:��        ?"��p�?PAF��(?l����?�Џif�?�"llj�5?�9FdD�?����.?�T˪�#?��(�V.�?Ľ�շ ?��$4.?Ҏ�S�j?���'5�?�R���?���J��R?�*�^V�?����l?���ɠ��?��W���?�h�ODD?�FL� �?��«�@hi�n�@�r'^��@tJ1��@
y S[��@������@��4���@������@���yn@�>�[@���>�@b���*d@��Q�??@ WYp�{�@!��/A�@#Jb��n�@$���?@&�G��r@(M|^]� @*"����@,�*��O@.Ӓ���@0=�OK�@1'$��w@2H$��@3t{��@4�Bw��@5�a�@7>�A��@8�q� @: 2@��@;r��?�@<�� RU�@>}64<�@@
ns$��@@܄s���@A����3�@B���!~@Cx�5+A�@Dd��0o�@EV�)6��@FO��2	        ?5�S����?`���5!?{q��&�7?���]�?�(c}���?���?��Q?��!6��?��0�1�e?ź���;\?͊�c�N�?ӂO�
�A?�)�Ɓ T?��6��?�Ƴ�a?�9�U�?�L�SK?���+�?��?�3�?�P��S�$?�IU�z�@ T��>a�@��)�f�@Xۤ/$�@10āF@E�J��@��1�Js@�� �@ qI�-�@�"g"�@<T=�|�@�S��S@�bX$A@�h�R@ ������@"'�	���@#�ٸɽ�@%L�4+�@&���)&�@(����=@*��@�x@,�^{���@.�Db��@0U|&�Z@1m��N=@2�l}��@3�CQ�Z�@4��"�1�@6@M���@7��<5��@8����@:X�`�@;�-���@=Nl.>��@>��j��@@:��'r-@A΃#@A�p�ڮK@B�1�K|J@C�S#�6@D����@E��B	8y@F�qt>��@G��/��        ?xr���ņ?��?���?���W�?���XT�|?�}��84?鲨]	^�?�:�1?�[�bu�@$o��tQ@��œ@�����n@8�Q�%@�S�KH@5�@�8�@�Qsm�o@!����U@$�.�B|Y@'s1��@*��FMٸ@-־����@0�6�J�@2�E9@4�@@6����@8�ۊ��@;	�W�FY@=o�h�@?�=ha�w@AHd�m�V@B���n�+@D��gt<@E���p�:@G/3Pc@H�q��@JP�q�'@L��
i�@M�@k֎@O��S<t@P�q�X-�@Q�g�@R���x5@S��	�@T�ک� �@Uݱl�0�@V�9�.��@X �L�Q@YM���@Z�j(�T7@[�è@]���@^P1�IY@_��f���@`�{�q�@a2�ɘIC@a��J�9@b���~X@ca�S�@d#�4w@d�&oy1�@e�*o*1w@f�"�x��@gSez�@h(�/�r�        ?B��k�JI?p��C��?�1k&��A?���ƴj?�X'4��?���f?�#�WI?�����?���z�?��Ut��(?��q��?����?�g�^\s?��V��?��y(�?�sg���?��?rD?����!�?�L,Ӿ7�?�+�Fa�?�6;�O@ 6���#@��
��@�wq��@�]�ӑ�@��Jxj@	�;9	��@����a;@�*�w�@!U �@U�ik3@����O@�@���@<Y�1@���+�@"l��@��:�(�@��f1`@����u@SXPǒ@ dn:�h@ ߞ���@!�CX���@"�Z> ;�@#�띩�@$�����@%������@&��DD�[@'���SV�@(��B�Ӈ@)��xG�J@*�b^�@,X+@-G)��e@.{L0� @/��Rj��@0{�Ke�p@1����@1�,�7�W@2r�S
)@3 qvS.�@3�9or�#@4�t�        ?<�nF�m�?lcO3�?���|���?�� �%?�w��*��?� S�2@?�U�By�?�/@P��?��7RZ~?�<��H�?ۃ;��l?�ooO��?岹n �`?�b�'He?�����?�4���?���>��j?��e�zhj?��ߩs��@�nܿ��@o��f @D��m~@
W�+k�@����$\@��w��@�?���@�`|�Ϟ@ҡ���@+����#@�C/F	@O4��@ �����@"���l�@#��{�_@%8�m|��@&�r��O�@(����01@*�x!�v@,�[RC@.��5s@0gR�"�@1������@2�,��/[@3�a@� |@5(�Er�@6wAS0+�@7�F�~@99�D?)@:�T��32@</���O@=��h�@?Y�y��@@�`����@A\����@B>��I�@C'��~3@DV�,��@E�%�q@F�P��@G��� _@H�o��Y@I/�~��@JI��=        ?8=[Vsn?c��X�u�?�ezC$�?�[Y����?���nbR?�ߟ�k?����I�?�;j�4t=?ɀ	#c��?�2X�O�?ֈ��_1�?��@yF�?�7���Y?�W>3s�?�/��v??�VZX�Tu?�k�����?��f�3
�?��q���?����@ì��s@J�>.�>@K�]�@
��kQ@?,%|@[5]��)@7Mhi�@4�CF6@@T_>>�@���DP@����ܘ@���Kr@ ��@!��`{�@#�Z	�/@$��̀��@&A�wG@'����o@)ΰ<��s@+��V�W@-���缟@/�P~��@0�-��@2�,�mC@3?U�`��@4u�r��@5��v�C@7N�'�@8`���D@9�T�V��@;:n�x06@<�#�qK@>F�u�z�@?��|n��@@�3>�4@A��Ҕb@B}�+�l@Cd�!7Ҿ@DRЇ�@EG��}�@FC�߿\Z@GF�eb@HP���w�        ?���Ng?��Iͨe?�/��4<?ݛ��J?�L�e��?�%�D�@ z��@�ҕ�@��v@�p �YL@��Pc�@��s��8@"}ɋ?@%�����@)��ܸv)@-�s�d1�@1$�m:@3�x�|<�@6��%F�@8��{���@;�����@>��7ר�@@�ay
@B���3��@DW��Zw@F.���*�@HT�I@J3,q��@L59��\�@NcV�u^U@PS�Q@Q�M���@R�}��x@S�@�4\�@UM���E�@V�7Υ��@X)�z��@Y��8;@[^��!�@\��H��7@^"'і0*@_Ē�$�q@`����b�@a��Q�67@bza��@cdwjx�@dS�+�M�@eI�tH^�@fF ��S@gH�����@hQz�J��@i`��D)�@jvJ�k@k��Y�@l��H�@mܚ�~օ@o���~@p m�.��@p�L�M� @q_b�:�V@r�Q��@r�=u�3@sV��&        ?M}�Ҧv?y,�i/?�ŧ,��?�p��c[?��+կ�z?��8��k?Ȇ��²�?�٧;�S?ֽN�c?�=[��?�J�U�j�?�cNt�Gr?��V���?��?��?����?��8 ��M?����ɵ?���[+".?���M��@���y��@��B�=@ťc��<@�Pz��_@
VuU@��^�sx@[�YoKZ@�����@l�lW:�@�6E2�s@i��3	�@�摨6�@�L*Eɉ@\�j�;@#�J%�L@���$ @�NDZ�@ �j+��@!�ϻ�@"���Ơi@$��s�@%1+��@&V�D&�Z@'�,�h^�@(����@)�r��g�@+Anno�#@,��w�O@-����_�@/Gp���@0W��҄l@1k�i��@1�^e�ZF@2�a4��@3Ot�ҧO@4����@4���rd�@5�v���@6�i�*�@7`�?V�@8=A�6��@9µ�}�@:M��`�@:��[�        ?=;�py?l��.���?�cD��Q?����YW�?�a��?���#ω?�h�N���?� �!�D?�R�_��k?�A����?��z�Ә�?�犉�<�?�|�\x�?�Ԑv�^?�R��"?��9���?�[���{;?�w���@ a��l�@��V��@����!�@��@�@�[��j�@?���e�@x���>	@sjz��=@�6���@����W@9�ME��@�,{-�@yl�=0@!*&,�@"��J�G�@$B*d��@%�e�@'�xU�^x@)�;���@+r=��g@-u�2��@/�rE��@0�*���@2��d�k@36�GY@4sx�.-�@5��C���@7>��@8t�J�/@9��[@;^CJ�	@<洖�}}@>|7���b@@v�϶@@�{l�h�@A�:�$v@B��x_r;@C�)����@D�zP��N@E�ƽ���@F�৬@G��>@Z}@H�3r��@I���gY@J�8�/8�        ??TW��8?iLO�v2P?���,��j?�.��V��?�),�D�|?�����*?�k =�)c?�9�c^Q?�xD� �?��<��8?�ZE��?�}7H(?<?��?��W��?�r!���?�}�Mb?�t�{T}?��E��).@ Ē��@�w5�@ahA��y@gx�3��@�+cM�/@@��y��@���F�@�9ݩ�E@�s�6s@6vBI@�^��@r>X� @ (&-O@!���2�@#H_v ��@$��_��@&�n�,��@(�,��@*��y ��@,�zp�c�@.�?jB��@0��{$>�@1�I[��@2�f�l>�@4H�'�d�@5���A@7bf0{@8z.���@9���B@;�Q�:M�@=+(��=@>ع�4��@@J�A ,@A0[����@B����@C�
��w@D�H�v@EZ	�@F �/r�@G5�%�R@HRb��@IwK �_�@J�o���@K��},��@M��Է~        ?��с��?�8]/�AU?��g�Ԯ?�=͔?��LV"�?��1��@#J�7��@wS���U@�=��c@@��c�@�� 	@#Z�m��@'FS�_�@+���$@0��b��@2��d&0�@5[�VJ��@8Cx+6�@;\WPUպ@>���F&�@A0�l�@B���?6~@D��G��@F�I��@I͞7i\@K>_<��@M���&�@P�@�+�@QF�|�@R����1@S����ρ@Uf�T�@V�����@Xk\B�o�@Z�R�.@[��쨧@][i(7�@_����K@`v+&�}�@ae/�?�@b[^�g��@cX�਀�@d]60pV!@eh�I&�~@f{z�X��@g�*R��Z@h��UIp@i�wyK;�@kc'.@lA�c.��@m}ݱ8�@n���d`@p���w�@p��䕖@qZ TN��@r	U[�@r����@sr>�'��@t+��h$�@t��*e��@u�/�9��@vl���)@w4#;�'�        ?>l�
���?jw�~A?��_��9?�����}?�����?��5	��@?��^��i?ø��d�V?�b<�??�-=(=R?զ����?ڮ|:��?�"��@�?�7$�gv?數) `?�?�-t�?�5�)�t?�<����?���?���M;�?��(��Z?�RX��4!?�=�_ʛN@ ���=��@IDKB@�H��@��A#��@�����@	���&�@�&f��1@�ytN�@ҽН@*�sz#m@]�_��@�=%�X�@�@���
@;�F��@�2T��L@
B��p@� 8/B�@���^@�vC�*6@5�� ]@ n�i�q)@!I4j@�@")sD5@#�&�}�@#�c����@$�ۼU�@%����X@&�� ��@'��/8�v@(�L=��c@*���@�@+ ㉉ak@,?*m<@-c��e�@.��4�9@/�G���@0|�(
@1B�}@1����@2cQ�"��        ?,O�S$8R?[�;�:�?w}u �z?�j�Գ�6?��u�?�dm�1�)?�k�xL�C?��)Y��?Į��?�b�U]D?��g�q?،����8?�:��]?�$,;)�?�0��X�?�%����?�z�S*@�?����}?�c�4�h?�ne9�@ p����@��Jk� @�1���@q��@�x���@��׼y@L�{ܧ�@@+��E@U޶8}@���O�@�AGC~@n�v��l@�����@ �_da@"nF[��@#��%b+@%��‎�@'ZY٨�@)(U��I�@+����<@-Je��@/�}V7@0���('@1�����@2�U�ȏ@4����@5]:�g�@6��Ă��@8:Fޒ@9i�*�@:��jb:=@<Zmy�Em@=�i{��@?}q�^�@@��)�w�@AiZ��\�@BH{jE0}@C.)>xD@Dr�M(s@Ef#ن�@F��B@G�c��A@H�y��        ?,c�0�/Q?XT��%�?t��5�?�kw�)�?�[��g3�?�C-��?��(6}�??����MY?�]����?��.$���?�볟��?�e� 0'?���ʻ T?�ڰ@M�?�%�7��/?�.wm��W?���B�?�(N�h�:?����Z�?�����a@ �j��7@w����@���"@���E��@1�Q�i@f�U��@����i�@�ݡJ@����p+@-��6�@��+��}@���B��@��S���@ �$��oh@"!7���@#�g�5D@%B��<�@&�(+��@(���?0@*� ���H@,sqk/�w@.r@�u/@0B�UuË@1W;�@2u�LrM@3�I�gND@4�zO�=@6�w �@7\��(�O@8��N�m@:�4O�@;}Z�@<�6�j{�@>v��n<�@@1��Mi@@����~�@A��d$Z@Bz�F�@CX��iS]@D=lv׳@E'�ḅ�@F@�w�@G��Ú�        ?v��HȢ?���g(�?�p.;O�?��MD��?�w���ù?�P��P?�k�mId?�&���f@A�^W�@
C0񭦽@��3c�@dm�[�i@�s���t@]�+�wJ@!A=mWM@$��d��@'~��c@*R옑��@-���L�R@0á�B�(@2�UCy88@4���_�@7��@9iPb�'�@;��N��@>z���I�@@���P4@BP���@C�7U�ƪ@E�VT�]@F���u�@HdW�u��@J&T�p(@K����l@Mށ'W��@O��ѕ(@P����@Q�v2��@SV�[B@T0-���@UX�ǩ@V�����@W�ǝ�@Y�t���@ZQ�{/c@[�/�Y�@]�����@^mz�;@_ޗ����@`�����"@an����@b5=��+8@c ��i��@c�� �@d�8�a�3@e�Ac�@f_1���@gCII @h+���D@i�؛�@j.��@kQ��O�@l+��KR        ?D<�Ҡ?p�ZW�
?��=w[N?�J^��-�?�����?��3�=�5?��vV?����7�?�f�Z�}s?�B=��?�m�Fowt?�7�iTRh?�Жl�'?�U���(�?�,�M�k?�U}0�z?�hk�l��?�Ϡ�/_?�`��m��?�*U�L5?���,�a?����W@"�-@�=Н��@�w��@rC{(p@`��� �@
c.!J@z��3@�5� #@r4;�@��ȓ�	@�Y3��_@�=�;�@T }E@�?��KD@ *-A��@d�)B��@�8�5^(@KLr���@��N�@X_�-��@ v�CeT�@!E��%@"�u��@"�цzU@#�U��bh@$�����@%��&�R�@&�Ӊ���@'v�<[`�@(l"� ?�@)f�����@*e����@+i��b�@,r�G���@-�I	�S@.�ݧH4�@/�T<V!�@0cX���@0������@1����@2��<        ?22pd[��?`a��	?{�����	?�k�p��)?�����?�xJE4�?���Z �-?�t!|}#?�����u?�Af� 1?ԛ^�b�?گ_��!?��UOf�?�ھQf�?��	XJ�1?�z�L.v?��LDv�W?�c�Pa?�Rg5��?��e$zL\@�t�v��@g��i�	@M@Z,��@
t�1Wk�@��@u9>@��1�@��e�@��Y��7@6rj��@���B@D�q�}�@
%8҈4@ �c��@"�����~@$0�.��'@%�n}s�_@'��-�m0@)�ύ'�@+���~E@-�5ˣ�@0 ��S�@1(D�l@2]��5�@3�1/�@4����{�@6L[�dp@7�c��g@90Hs��@:��kv@<M�J�@=��6�6@?�`\Ǭ@@��*�\@A�:E-I@B�uh#s�@C�dKjx@D�|��@E��rڱE@F�#P�7�@G�����D@H�#����@I���_��@K)�s]        ?8���V�?cy�+�RV?Jg>���?���a:n?�	�я�?���Ƒژ?��Ӣ�?�ǉ$+p?�d��0��?�����?ӯ�^�q}?�(8�=Q?߈�H���?�q��?�^�2�?�`���^?���r�n?��j�w\y?����\?��Z!���?��a԰TQ@{*�F�@ѝ/���@X��ZI@	Cd��0@�Hpkԕ@�0Ў@:6�n�@$mCk@�
]��@�����@ �ky}�@;�a�1@��(�х@ �:!ՙ@!RJ!Q%@"��Y�@$�t�K]@%���&@'"��J3r@(�xt��y@*o��!@,.캖��@. l�@/���/Ҭ@0�q�@1��F#�z@2����K�@47-¤V@5.��v\	@6V/�>n@7��Z�@8�9��e�@:Ɋ�g�@;Q�d��@<�CO���@>Gt&Z�@?q�+f�h@@r���m@A1�bE@A�`�oL@B���ڏZ@C�ə.��        ?��ڃ?��3[:�@?ǱqC�?�lC��?�"�J*
]?�qX4���?���E�_a@$t��@
�s��@"7g@p�ˋ�@@Y�F�6@�l�S�@"�����l@%�_�"@)L�5)y�@,��2��@0y%ؒ�f@2�Y�2m@4ӝ�4�O@74�W u@9��C_��@<[x� @?"ZR;1@A�iL|�@B��x�1%@D �sc
�@Eǐ�,@G~����o@IFN�)@K ܿ@k@MOΌ�@N� >��@P��9@Q���o7�@R��U�?@S�w��8�@T��|~x@VH�4C�@W@_FO��@X{5�y�@Y��uV�@[�-�@\ZF��c@]���|�@_��6!@`?��dU@`�hN��@a��B���@bs��e��@c7�9�f�@c�����@d�o���6@e�(j��@fn���@gFa����@h!���q�@iU{{5�@i�J�1@j��vgR@k�F�I�@l�v�L�$@m��f�G�        ?@ �#��\?j���-�?���w�i?��q7�n�?�����^?��.+��?��kЍj�?�|��/�?�.�7��?��2߇�?�h�X4�?�f8&|=�?��Y��?�
�{��?�f�M?j?�5��Ƴ?�Ӣ��?�#�w�H?�lF��?���|��?�v75�l)?�8'��r�?�#%d+\5@ ����@:��iY@���O��@�Y�J� @��#V�@	�j`���@�w�ݧ@�h�W8�@�en��H@Ʀ5�@L�!&��@�d��>@��9�@#���\g@���@���@`��*;�@�U�l@m9G��@�fE6[@ T�b��@!+�/̣@"	oZ���@"�!�l�u@#�귑t@@$�գ#�@%����L@&�5��@'��Z@(ć��!�@)ӡP�
@*�V��@,�C��/@-'!!�g�@.O�T�T@/U�
(@0Z`�n7�@0���}�a@1���n�@2>��љ�        ?9A|��8O?f�,*��?��� Z7{?��1���?���3�^?��:���?�s�6�?�#>w�0F?�>�T���?�Ԯ{	E?�-l���?�1Z҇Ӑ?�m5��Y?�W�i1XF?���Q�.R?�?@�N?�Y/qi@�?�m=�Bg�?��?��@s#x��@�t�A@ԕ��Ո@(��0��@�!,��@Z��'n@y��?�@��4�@6�Y��@�H���@��赕�@ Q��*�@!�-��}@#�v�̐�@%cj�@'G�8�:�@)F���g�@+a�U�@-���9@/�I��@1/��'y�@2w|Dd�@3��^��@55�YQ�@6�R�vI@84}�,��@9̇	G��@;uw�;��@=/�����@>�8����@@lL���@Ad�9�	@Bd�:���@Co ��>^@D�����@E����-@F�Wsm"�@G����g�@I1,�mJ�@Ju��ײ�@K��S��@Mz>��@NOrQe�@O�}=��p        ?*[���?UT' A?r�k�C5?����j�?���Rw@0?�]{s叮?�E��(^?��� O?��F�?ǳݟ5��?��|�s�?��)�$t�?���ne�}?���V���?��າ��?�4��8�?����?�w���l�?��+���?��9�#ϫ?���91`@/��5Z�@���2~@w���@	v�-�G@�|�*:�@hTx�
@���:G@Ѕ�`�@2(��(@��=�>@�,Ϸ1V@�Ƙ.�k@ /׼���@!����o@#5]�{�@$׳%�@&�S�~�	@(_a�%@*EKUs6 @,B�7�y�@.Wg���@0B1�/��@1d��N�]@2�l�(L@3ϳ(�z@5~�D@6mo8�H@7��Df�q@9?��;Ze@:���ֽr@<G_�K@=��㿎@?����3@@����d@A]����@BhTB\�@CX�)]ڋ@DP��@EP�F~@FWS`K݌@GfY�X�@H}G9��        ?z� ZƊ?��,ɳ�?�,�^��?�]o[�,#?���- I�?�m����?��I�k��@ ��&:@�����*@�l�I��@��Woގ@�*c1ie@*7UnL@'�(-@"N��7�@%G(c���@(}EH�j@+��Z�V@/�l`):�@1�p�MR@3�x�6@6#m� �@8���V@:��g��@=��_q�@@/'�kt@A���)�@C#���Ea@D�a5��f@F^YҽF�@HO�l�@I߅K��4@K�����@M��P-��@O�S���g@P�/����@Q�dڮ�@S
Х2�	@T/_��@U]{Q@V���g�@WՍ\�w�@YŬ��q@Zs�+|Bj@[��ѻ�5@]8,&�7@^�0'��@`��7n@`Ԇ�&l@a�7�	@bh���Ā@c:5^ 3@d���)@d��P�8�@e�����@f�88%@0@g��4yA@h���dhG@i���cP}@j����H*@k�� �@@l�դ9�@m�W$�#�        ?I	�lY3?t<BuniY?�&��?��W��D�?��Z�(2L?��:���?���r�k�?˦��-}v?�r��߬�?��&l	�?�Ϡ8J�D?�H��:�>?���/��?�#�΁?�}?񿑅�*�?�`��L,E?�4*MyU?�;�����?�w����@ t��@I9��@9�+�c@D��n1@m(��"�@
�翛�}@oo̕�@��y���@�X!�@si�@޸��\@X�M��y@ḗ�@yp0�w@�!�մ@�O�1�5@�x>47�@lt{b�.@ �%��bC@!��8�&�@"�X�NJc@#���Q��@$�����=@%���=�@&�ș�.�@(<x���@)<?FXz�@*pշe��@+���N@,������@.<S�F@/���7	�@0u9��@1&��o�@1��G{</@2�(G�1�@3Reb3��@4�lh@4���@5�2���k@6o�F1o�@7@�>E�	@8~�[�*        ?7��7]�?f�5E�N?��1~���?�2(�2�@?�hNwe�+?�	�`0�O?���N"8�?Ŵ��}?�S�>w�q?�qS���?����Z�?�$��t=r?�j�V��?�9�m��?�-
���?�r�G�h?� �y�?�<�> �+?��؎v�^@i�m��+@,��T�@/��Q+�@v�{�w�@���.@lk���@|T�(@�潦Z_@�d�eG@�5��n@B��1p�@ �y��@!���-��@#'�*�@$��ؐ�@&��7ri�@(x�����@*mhs��5@,z�/q�@.��L�0@0o���\ @1�A5)��@2յJ���@4m�h��@5p�8 �w@6ґ��A�@8Bo�3�@9�y���@;L�C��@<��c��L@>�ڝSzU@@%j:̀r@A	�|X�F@A�w���R@B�D��R@C�N�3@D���@E�2
�,!@G	��q�@H&υ�Zm@IL}�P��@Jz�?�FD@K�8d��@L�7�e        ?6u��HA?b+^�?�t?~J�"M?�ݠ"�?��pB��?�F_.yJ�?��?R��?���`|l�?�"��Ƨ?�( ?m�9?ֽ{2U�/?�k�h���?�,C(�q?�<��;r?�ߪAG?�H��n?��t��'�?���K��i?��a�98�@ Ф��sa@t�1J@Zm���P@	�<;D��@����G@\=��j@a��f��@�1����@�K�_,@e[��&g@�Ӛ�@���.x�@ �t�k@"�9AS{�@$A���@&Į;�@'�v!��Y@)쐵�8�@,����@.6�oV�@0BN"�@1wq�n[@2�����k@431" �@5nf�$Mc@6�ߠ�
�@8^腢�@9�˩h�Y@;��9��s@=?Ib��@? xd�U�@@iUJ�f�@A[$���@BU���K�@CYys�O@De����H@E{|���@F��QR��@G�Ul�Փ@H���b�@J1�R�v@Kw��^S�@Lǭ��B~@N!�aۓ�        ?���`S�?�r�z)7?�n�V�H?���o�;g?�ě���?�3���@Gjg��@/�~�@@+��h�@�aD��@8S���@ �^!��@#m����@'��b@+|zW��@/m�?#Vt@2�a��d@4�����@7P���@::k�r@=U��q?X@@R+FA=�@B���Z@C�_@)�<@E������@G�dP�6@J$*ej��@Lls_1�@N�z7�*�@P�9��@Q�F��@SRu֣^@T�ԱR�Y@V5o ��@W�P(�A@YQ���Z�@Z���ٱ@\�({��W@^g�O�ok@`{)�(!@a
q�N\X@b �;���@b����@d�ì@e�i�6�@f$�N�k@g@��C<@hdCNj�@i�`��OY@j�+�A��@k���@�J@m>�&Q�%@n��@o�kj��@p�yD~�@qKj���@r `�e@r�b��@svt�"n@t7��wצ@t���F�`@u�Lĭ�]@v���F�        ?6C"�v?cl[#۶�?�`�e�U?�LQ#gk?����r�?�&p���+?�50�_��?��\1ϛ?�Ee��m?�j����?м$���+?Թ�$�6?�0�%�e?�#���?���SAr?����iK?����Կ�?�{֞���?�<sTe?��&�$?��mO���?��Ѓ`?�}D�g�?��ZLk?���ql�e@ SOW��'@�?d��t@mj�{�@6�=G�@���P@�qZ� �@
�_�_I@�`���@����ڡ@i�L3�@����@����E@��vp@,+��a�@xb����@Ϸk|��@2-ّV�@��yZ�@����@�paX%�@+wD#~@ bۮ1��@!5�J���@"���N�@"뺡���@#�:�M�H@$�U�Z�y@%��蠉@&�J��c�@'�k��@(�^���I@)�3v�@*�D�(@+���d @,Ǻ���@-��J@/� �*@0E|2v�        ?.��q�v?\��� ?x�%DK�?�O���?���a>�w?�u����?�BH��o�?�������?�(�R�e�?�}���9�?�5�?-̑?׎��+?���#?❊��hf?��@x���?�J��R)?�c�]??���@|(?��MR��?�㘚�%�?��;�t@�����@Z�l�+N@���6�@
�	�i�@C�h��@\�?��@7'��b@3����+@S���@������@�k-m@�u�l�|@ T�K@!�gI�@#S�#me@$�xA�@&L.C�D4@(
�0�pT@)ި#���@+���V�@-�L~�@/ܩYX'�@15�'��@2%k���@3Rzs��@4�VO[�@5�Js�=�@7��2@8y�\�!@9�o�h�@;U�jq��@<��Y���@>bk�]�@?���s"�@@Ь�r�@A��q ��@B������@Co�ϳ�%@D\Y���@EO��%�A@FIa@�6@GI�:w{e        ?"�T #�?P�ə���?m�PuC�O?����'Aj?�N����"?�g���i?��w�_�\?��v(%?�&5��a�?Ʋ}Wt�;?����4�<?�nJ;=��?�ni@N�)?��-��?����m?�F�,X?�/ �$�)?���>�\?�1ى���?���}y�?�pT�2��@�JT��E@>�CB��@�$�X�@
A��X@@��Zw��@�-q�,	@���H��@���@���W@z�.A��@V�`%@�BCW�@ �u���@"l�zV��@$�e�@%�KEι�@'����u@)��_$@+�x�iV@-����oQ@/����@1����@2H��jZ5@3���̾�@4�{̘��@68���@7��2�_�@9� D�@:����}@<<�����@=��W���@?�݆�T}@@�l�Rf@A���@B��g��6@C�TC���@D�3�B@E����V�@F�o9��@G���+P�@Hީ-�@J
<�AlF        ?r����?��ɬ�?�&�KA@?��$��_V?���=���?���!?񿺏/�?��e���@ �G(���@�~��@ԝ���R@8��Q�@��t@�VY�P@��/RC�@!@r�l3�@#��Hb@&��'�o@)�]%I�@-U�y2@0viu,�@2`,�D�@4h�(YB@6�n�BPw@8�\)�>@;Dk�̷@=�H=��@@?K2v��@A��U2��@C"wX3i�@D�SC�B@FM�jy6T@G�/P��@I�!���@K��W@�@M�k���b@O��#9�@P��d8v�@Q�h�I@R��d��@TP��V�@UFA�`v8@V}�6�sz@W���h��@Y	:.��@Z]:�a�q@[��)KT@]!��D@^�<����@`#���@`��۰�L@a�{���@bYə��/@c)���a@c��SW�L@d��:l@e����X	@f���` @g� �@hk�"r��@i\#�X@jQ���~@kJ�κd        ?E��3��?p��~��?�e�����?�#ӱ8��?�oL��?�1;��җ?�@s5�#�?Ŵ�M��8?��j�.�?҃���?�#r�?�I76�L?��5l_��?�z8�?�s����m?�����&?��ۺ�r?�;�l�?���҂#?�$��ȁ`?����Hp?�A�����?����W@ u��v�@�
=3@���>�0@<>�mr"@�I��G?@�ԺՋ�@
��XI@�e��Y@�@��x@^�edA@u�e1��@��>�@��P+�@��Ó�@6]����@����@ӒK繋@1��C�@�ΐ���@e1I��@�SU��@ LC�}&@ ���j@!�3�I@"rL1�@#J<e�	�@$'w��G�@%	�_6�@%�$���@&ݘcK�@'�"�/f�@(���.@�@)���]yT@*�o�lzC@+�rQ��@,ӓ�v@-��;�n@.�,O˾�@0	�?��@0��\q6        ?10lx�?^'u �?x��%���?�C��)"?�C���2�?�+����?���t.?�0���Ԍ?��訢�?�?��g�F?�  �/�?�eØ��?ݯUI��,?⁚\/�G?溺N��C?��!�z�?���`כ?�¸H�?���O%��?��O�Q��?��J9�@�q�t�o@F|f}@�c����@	�\�1�8@ٔC@D^b�2�@u2\��@!�  :@&QR�[5@_��r
@�ӫ��@=�� o�@����ڦ@!W䑻@"���!�@$]��b?A@%���Y��@'�F_/��@)~i���@+]��@��@-Rp�)��@/]A�x@0��t,@1�nm�D@3d}Y�@43��X��@5r�u@6��<@8j=��@9t'����@:�uR���@<] � @=�/x��@?w����@@����@Ab�����@B?���}m@C#����@DЊ]�@D��ZwSw@E���w��@F�VQ�        ?7}[��g?b�:%P��?~0��%�L?�s$���?��Y���?�/̲kM�?�� -:c�?���s�?ƕ[1]�[?Γ��s-{?�$!�&?��_����?�O�=Y�?�:U��g\?��5S�?�؊R#0�?��^��7�?�6����?������?����z�@ �h-�u�@�ٷf@���jU�@t׭CE�@��΃^@��E��N@B��	W�@26�)z@D����@z�ॼ�@Րl�?�@VL�,@��C�Ř@ �qf%e�@"bF2�5d@#�ѳ"@%��e��@'S���@)%����@+���P�@-��8��@/!a'��@0�n����@1�%����@2��u\�@44/X"�@5{��fk�@6��a�<�@80��Ð@9�4����@;�R{B5@<��a��@>5��x�@?��m���@@��0��@A��7�>�@B�[&��@Cu�p�k@Dh���@Ec�GY<�@FeиVr*@GoJ���@H�2f��        ?�L-%��?�`��G/?�����?���L��?���}3?��|͡?���U�,�@a�'�@]�IS�@6�ur�@wH+�tZ@��D%!@{jܡ2@ �D�*��@#�e��F@&��q5@)��+2��@-F���S@0v���@2e�q��@4p��2�@6�\t���@8�Ne�G$@;9����@=���6v�@@' �Nw0@A��}�J1@B�}?��@Dc���G@E��5�N�@G�-D�@I&��®;@J��qeS�@L��}r��@Nu4&&kJ@P,�l�@Q'_U��p@R)��4߲@S4�<�F@TG�l��@Ub���dl@V�֏ڼ�@W�B���@X�ߔ���@Z ��.�@[d�]j�u@\���(��@^����@_a�����@`c &���@a�%��9@a�5Ž�@b��%�4�@cU��v�@dxɜ�@d�����@e��Z���@f�|-N��@gb4A;s@h>�{��@i-I�9�@jjy��2@j��-]]x        ?H"�<@��?t=;��d?�1�3vD�?�3��<�?��x� �Q?�"c鵂?�/a��?�? ����?���+��?�`
�f�3?ޜȓ��?���+��5?���;?����Ĭ�?��)�Q�?�K����?�I\ʣ?��19^�?���@H?�U�s���@ �J�,��@ǜnQ��@�1d�y@�M�QDP@�5ץq@>*��@�d��#@ǈ��@Z-n@m@�0�x.�@ ���`@�	��~�@��%Yd@���� @G�gZ�P@�POR@�)Q�� @|X���@ �F��XN@!�_މ�2@"�t
�@#�~�/�@$�|�p�@%�g��+ @&�<$�\@'���x�@)��34@*0!v�@+aP���@,�{Эj�@-؃���@/kl��]@05���2'@0�r�8��@1���R�@2=�mw�P@2�� To@3�{�S�@4d��˳P@5#v���c@5��ֺ@6���z�@7t�h���        ?6��]ޮs?ersU�e?�I\��0?�2+�M|?�#�ڔh?���1��?�N.���?�*��<}?ʮW)�ݙ?��3ޜ�?�i�[_]?��W!t|�?�-ya��?�
��i��?���ɕ��?����L��?����?�h�q�?�G*��2?��]9*�@��8�@�g�q�E@oʑ�f@
qG�=�K@���;Ķ@��!l@v�����@w���J@��̳@�j�(@O��T4@�"��@ Mae?Sj@!��x�@#A�`m@$��n�L@&�I\���@(M*u��p@*'�N�1@,�8T�U@.ޫ��@0�
�@1:
$?@2ae��[�@3�Bc @4�Jl��@6"<��˒@7|1zQ�@8�`kF�@:Wh�f�@;�/����@=h�m�Σ@?�?�]�@@X�є��@A58�q �@Bt��.@C�M��@C�i��X@D�vw�@E�2=+��@F���!5�@H	� ߑ@I!���#}        ?3[8�Ҷ?_�D�)?yɵ����?�*���\�?����?��`�� ?����;��?���/��?ā�M�?���40?Ґo'�?�x�g�D?ކ����?��g�h?�l��?V?�o�4��U?��p��?�D�U|K.?��j9/@�?�ٙ��2@ "K�8�K@�֧*��@;iX�@#���*�@L�����@���@6�?�@4[񪰎@W�� �,@��*��@܉�Z�@�׮�^@s���-�@!2,L@"�%.̋@$dѮ7��@& �7"KY@'��ӣ�@)�Ɏ���@+�?�e�@-�{#t�@0�l�*�@1ApWr�@2u���@�@3���m3�@5��1A�@6b���}@7�(z�% @9E,�*Y@:�2�E@<_^3��@>ս�	�@?��i�@@�G:��@A�'q�o@B����s�@C��,;r@D��WW��@E��+�@F�hk�`@G���N2@H�k�,1I@I����;�        ?��;�`?�!�҅��?��J���?�݋l?�t%r�._?�]�4֯�?��k�a$@��SQ@zw�x/�@�A#'Q@�3��9�@%�3W�@!�yk)��@$ː�bz�@(V�C�8�@,,�&��@0&�a Sq@2\��(Yy@4�~��s�@7:EΨe@9�'�X�@<�M~ҝ@?��W!Z�@A`��1�@C �0z��@D�b6���@F}Iޙ
6@HX���O�@JGЈ+j@LJ�oD�p@N`�N�x�@PE���A9@Qdu�0h�@R�F!�N�@S���t:@T���:>b@VC���`@W�\eRC�@X�?�^�@ZQ��J@[�{{�w�@]70�P��@^���nm@`"��1�@`쐋\�J@a���U�Q@b�L��T@cizN�w�@dG��vpO@e*�D@f^v-|@f�,�Kd,@g��iQ5@h�t<�@i�S��@j����(h@k馦aB@l�O+���@n��d@o�.���@p4t��@p�����@q:�>R�        ?W�G�*?�?�?!]6�?���eo��?���j�*�?�ȨKv�?ĀE�ᚰ?�hxP?��l3j�?ۍ�c���?�y{DR?�
���?��ܻW?�)�����?� ��?�UQ�*֑?�μL���?��9(cc@ Ţ�\�;@�|���@,�
hb@��'���@
�[�.�@�t��
@�gu��@F\��)�@��U6Ɲ@n���u;@�IM�@���\@�|�[�@�?��@�g�6
'@�����@ �]����@!�T��Lm@#3@3�o@$3��Z$@%d��)�@&�m�j@'�vj<@)+�*TX@*彄�@+����X�@-Ct��.@.��V<s�@0��"�@0�[_�@1�@�xI'@2c���^�@31c�� <@4��Հs@4� a\�@5������@6�#B�z@7w�?�J @8_g�_[@9J���|@::� y@;.v���@<&q��I@="}8n��@>"�χBt@?&���1E        ?4��4n�?ay���S?|�l2�X$?���b��?���Y�?�8[����?�\3w̅B?���oW?�T���?�zt2�?�?�6��s��?�/�T8F�?���iK?������?�e��~?��R�?��]�D�?�$�&�,?�/�PR�?�x���@��^?o@Xh���4@H���@
/ʙ�2@�C��@�+�aw@�.n�@%\^�:�@�5�A@��W�@�F��/�@�+��$@!]j�?D=@"���e@$�{!��@&�K
�y@(w��C��@*~���@,���R�@.��
��u@0���t	@1ҥ�_Z�@3Ux*�m@4pWlo�@5��V�~S@7Hh$ �@8�3��@:[^u�@;�����\@=��.y��@?j�c)<@@��H	��@A�0*��@B�|<"��@C��R�i@D�(�a2�@E��I�nk@F�P�5Љ@G�5��)�@H�c�	}]@J)�G��@Kb�s�7�@L�2�Q|t        ?O�zwߔ~?w���6��?�����%?��w�{
^?�@�Y�1?��	>�Z�?ɐRr瞅?�IH�B�'?����hF�?�vv�"��?����Z�?�l�:O�?�<ȷ�%�?�~~�?�q�θ\�?��%�x�@ %���2@��v��@tZh��@t+��s�@����5�@/�K�@v����@v�(/\�@�bg��\@ްA��@G}��S@�h���g@�g�d�@!.q�� J@"���.)b@$>2�eo�@%��.�Y�@'�W����@)gtj��@+G�rU�@-;����@/D�uf@0�����@1�=�f4@2�Yyb)�@4�}�@5R��@6�����?@7�?�$@9:�[��@:��ܐ�@<�|T��@=�8��f�@?	��9(@@L�S�{�@AE���@A�4��v@BƖpM@C�of��@D�!ﱴ}@Et�b��)@Fe<h��@G[�h;	�@HX1���@IZ��5��@JcA�u��@Kq�$d�        ?��ڏ�v?��'��?�cA�2�?�vk����?�8!n��@ �b���O@	cHV�@]mճ~�@:{��@�;��@"�T��[@&���o�@++�\�^�@0�'��@2ɛ/OY@5��7F�{@8��z�9@<=t]o@?�F����@A�ml�_@C�͎��@E�x�8
�@H?��|�h@J��7�>�@MfKZ�l@O�W�蜩@Q7�y$Ӹ@R���%��@T��X@U��d���@WB]	j��@X�;�f}@Z�g௮@\j�����@^A�J,T @`�grk�@a;Pv�j@bA:�:�@c�\���@d*�����@eC1���@fcm��@g�y
&��@h�RӔ#�@i�%��@k-�@@#�@lr�� �@m��	�#�@oA/Q�@p8!@��k@p��~��@q�r�,��@rX�U�U
@sѦ��V@s֡h��@t�./ˏ@ucu�QΑ@v/w]��@v�/�ŷ�@wҞ��)�@x��Iů7@y���*C�@zc$C~�        ?Hԇ)?t^m1~?�6ә2]?�)��?������?�ϺW�5�?�ϰ����?˃��p�?�=r�~v�?�Wܿ�n8?�S�iظ?᭸���?� ����.?��:f�4S?��a��?����9�?��5=��?�l���?�����?�֖ш��?�Ǌ����@ ps�b#@t���@���i]C@��j�i@o�˸k�@	b�N���@j��ylw@���I�@���Ň@ 0��%�@.��]Q@f�I�Rk@���?"@�Y���@O��!�I@��x�*�@ p�}V�@����@��F�`@��@  �;.��@ ��>��a@!�8^�>�@"������@#��㤜�@$jh^�?u@%Ucg�H@&E��ݙ@':�_�|@(51�&D@)4���W@*9�EP��@+C֮��|@,SC�xD^@-g����@.��g�4�@/�F�$��@0b�J�@0��5P�@1�--�pg@2)*8���@2Ű��ȩ        ?.��Z���?]0���q?x�kf!��?���eag?�5T�C?���,�?���N8?��o�R�z?�(�q�Jm?��Ik%z?�p@+b?�Xn�[<?�/k�ARx?�Mq��F?�r�h*y?��jG?�Z�]��?��W��(�?��c��?�@%�b@c�ĸ@�cn~Ժ@�G	�@�@	�#ᙕ@KQ`P��@u����V@h�&�LY@����f%@�y��AY@"�8@�@�?��6�@d�[���@ ��s�@"'=��@#:��@%t��z��@'=�a]�G@)S�R�U@+0��@-(���*�@/Se��@0��7K�@1�#���O@37�BɌ�@4����P)@5�񕏗@7@�6%�@8�p�fzk@:7e��@;�&s��@=i�/�Q@?[�8�@@l�-=9@ATy�)t@BD)<|�^@C;���@D<���@ED~J��@FUqx_��@Go�sG�@H�Z�)�@I��fLW�@J���}oR        ?A5�I%?i¿7�u?�yk��@�?�\T��,�?��V��HZ?�>Uɔ�?�����?��k�?˓Gj�?�Q��	��?׮BS7�?��k�L�5?␛�͍�?檙;��?�LJ��~�?�>W���?�!Vl6}?�R�>�Ų?��ĴW�?��@�g��@ �y���@2BE8�@����@HX��@��@"?K��@���mv6@e����@6����@$����@-?�Vk�@R� �I@�W��8�@�b%��@ ���a~@"R�Z�@#e�[�I�@$�y	M9@&Q(P-@'��ăD@)|�$�}@++���@,�,��k�@.��[�c&@0N��zL(@1H'$^�;@2Jkq4{@3U�-e�+@4i�ݡ�W@5��!J��@6���X"$@7��Qǳe@9Q�qp@:U��_"@;���ly?@<�A�%��@>R�OLY�@?�+���@@�o��J�@AR�f�@B�b.@B�W�1�`@C�W��X        ?�����g?���YTI(?�H�j�|c?�GU�^?���<'�J?���Ƽ�?��IlG��@O��ө�@9q�[@	R^�@k(���@?�[N�L@ CI��w8@#���p@&4ԢHն@)��3�4 @-�a��p@0hQ]\��@2g�'?@4����o@6����@9�Di�4@;��1�e�@>,�~4��@@q�R�Y�@A���N��@CWVEA�@D��<6@F{�R�	@H%Gt:{�@I��	@g\@K�yRmh@M����[@Ok���?�@P���+�@Q�#�j�@RŅq^�@S�D�3h@T�����@V�d}&:@WM0ّ��@X��#���@Y���"@[��gT�@\WFŗ��@]��?P�i@_i�{�@`9u�B�@`𲌰"@a���pAg@bk/�ޞ�@c.{��B�@c����@@d�MЌ��@e�ރ^��@fd�76%�@g<T��aa@h2D���@h����@i�9��@j��<��@k����5@l����->        ?A�;@.��?je�*��?���4��%?���of?�=L����?�<b?��?�e�HC�?�Slo;�C?�/m��?��g�E�?�S�`b�Y?�RA�'�?���`��?�B�(��?�b�{� ?�A�Ώ?��J��?�(˨��?�tW��83?��jH�?��凭�!?�N049��?�?~ss��@ �����`@QG̱�@
6���@�W����@���{�j@	�ta'.{@��_(e@�"����@7U��@F�$Y\�@~m�k�@����m@��1>@k�2&%@��_oڶ@F0j�q�@śv��@QH f"[@�G�d2�@�����@ �;�\d4@!}ކ��4@"b�/Ϯj@#M�@d��@$?Of���@%6�<6t�@&4�e���@'9$��2�@(C�@���@)TPt��J@*kAN@+�j�~�N@,��``�T@-�Z����@/�L;@0�s�|^@0���D@1\��n��@2 ܋�9�@2�=��        ?E:���?H�Yp��D?f��\�s?|��H➭?�U�i�E?��W}U�?�A�#���?�%@�]?��=9cu?��z?��;]B?�h�pe�*?֨�Q��?��m��Q?�b���f?�R��1`?�*}O�@�?�U+&|�?�m��I5�?��=�<BM?���Of�?���=A��@� {�U�@_�N*�8@&z�~#@
(�l1�#@h��G��@t6��F@TǿE�}@W�*�A@{�-	��@�	�*S�@0��0�_@�0[��*@ <߯�{�@!�O&�@#.���t�@$���B��@&q&�aΞ@(1?��p@*d��@+��у+@-�� ��C@0o)HBX@1r\��@2:�Vm�@3gK߽@4��@�D@5��>#�@70�.�q,@8�^�B��@9�|@;c{��@<�K�ΗK@>kV��@@ f
���@@�N@��@A�F�L�m@B�V� �x@Ch��v�@DQ�Ff��@EA]�9E@F7f'u        ?>�y}��?g=#g�?�ژ��	K?�VE�B?�#���?��Hˁ�?��Zj�`M?�a+�r�o?�sW�O�]?�(s;+� ?��ta9A?��&A?����l�?�ʣ�� �?�%-��Mb?��g�?���-�@?�I�v��?�{�A5@��?��@��5t@Yw;�"d@	Y�&�N�@��Ǳ�@k�G+v@�HƵ@�%A�H@�D|�@j9��q�@��K(c�@vM�W�@ �g���@!�!��d@#Z{17@$�����@&kf��@(5���@*�o1�p@,b^�ē@.�h�{@0ɺ���@1<�̄X�@2g#�e@3�my�+@4���42�@6.�C|�@7���m��@8��z�@:g����@;�����@=y%T���@?�� �-@@_���D@A;O���@B���r@C��\@C�H��l�@D�{���@E��ڗU@F��//Z@G�o(t��@I�Jp@J,��R�        ?z>RMx�F?��.��O?�W��l��?�Ѽ�t?��j ��?�7�h��?�o�1�J?�З���@a�)���@	&�
���@��0~@��cE@��Y@�x@<���@ ��s��@#SY/R�@&C�(R�q@)m转��@,�;�@09ϖ�&3@2(/�®�@45 ��)@6`��^��@8�hIs��@;��A�l@=��Nf��@@%.a�5@A��)�9I@C u��@D���l.@F<�3@G�w~���@I�d��@KJs�*��@M&��h�@O�Qm�@P���uf�@Q�E��@R�ʛ�b�@S�S��s�@T��&`�@V����@WD�:�N7@X��oM��@Y��Ճj%@[K_�@\x�Ϗ@]�����@_I6=>1@`_�rP�@a�W4�!@a�:a�/\@b�[� �@c{�4��@dMx�jg@e$qT��,@f �p�B@f�+VV�@g��b�l@h�8T^0�@i��L(�@j���<�'@k�{����        ?B6����?o�b
9�?����4KX?�������?��v��Wo?��Ҩ�i	?�=�V��-?��&׃;�?΁����?Ӻ]�'�?���/��?ފJ�?�r̨��?��-,x=?�ȩ��;�?����?�:����M?�6D�?�B_��?�
R�{� ?� �x� �?�%�����@<�%m�@��Q�.�@���^�@�n��_@�e��~�@
�*c0�_@6����@��D@�;ۭw@B�w���@�{M
!@�S	��@]��b�c@չ�� @Z�}��@�Kżh�@���d��@9OûV-@�` �@ �6��j@!�#/�;\@"���N@#�\��T�@$��t�r�@%�h�}[�@&�-L��@'�o`=~y@(�wt{@*	�V�6@+0(���{@,]���ҋ@-���6E@.̊b�T@0X��r@0�;(6�@1R���@1����
�@2��>�@3]���@4��b�@4ˉ:���        ?(��R���?We_S� ?tH�􃂚?����h�?�{�V��u?�r ���?�8�k�,3?�����F�?¨n��X?��y�?�Q:D/*�?֦D7��?������?�7��5UP?�Z�*U�?�y.B*i<?�����N?��x�?�?�'�g?�.�X%�?���D�@&����@��S�]@��M�@
�5�V3^@��hV�@ǰ� ��@���0@�0^�^�@�2�j��@?ɷy� @����$@R��$J@ �lXw��@!����{@#��V'X�@%"�z���@&�u��t�@(��]d@*sL����@,cG�}C@.i�s��@0B�+ͅ�@1[��z��@2�O�]�Z@3�tL�Q�@4�Kw��P@63�۬��@7��3���@8�tD0��@:S��z�@;���D�@=P��n��@>��m@@@�Rx��@A+dÌ�@A�U�T@B��Y�=@C�f���0@D�kx��@E�) rǷ@F��UBj@G�צ�"        ?4�4��?`����$?{��d@��?�Ev�L`?�����?��)R�?�)���$�?�7�d�W�?��f��[p?��t��?Ӫ1x��?�PU��A?��<}��X?�Ε�>?�4��oa=?�4�vq=�?�kaw3?����P?����y?��ry�[.@ ��R+@gI��z:@�;݁�@���_@
��>�.�@����@�PИ��@h��_��@X�<pD�@g�n�D@��J�q@�vs���@V�j0F@��˝�@!Nen���@"���f��@$62�^w@%ā�=��@'d�� t@)<Z��@*۴!K�@,��x\z�@.��Lh��@0L�q�m @1T��5�@2f]���5@3���!G�@4��W�#[@5�۳�U�@7��h@8Q��'^@9�C�r��@:��V�\@<X�0��@=��PP:@?;��i)@@^}�E�@A$w��:�@A�˧�2�@B��,S��@C���H,@Dr5���@ES@e:j�        ?|���T̋?���KI��?�����2@?ֆ��Y�?��WӰ�.?�����]�?�*,Ȅ�<@�Rv�q�@��
�{@n�]�(�@��� s@|���S\@W! �I_@ ��t/eS@#��܊b`@&��}_�@*X�Q���@.c�w3@0�}�f(+@3U��a@5T��栆@7��K�*x@:8�{��@<���L�@?�V�+h@AK��$|L@B�Y��g�@DqA3�/@FY�@G�4���@I��N�U@K�2里�@M�����z@O��Hu��@P߇��3�@Q��>�V@Sr��E�@TG�r�d@U}�:l�@V�,V��@XR��F@YY"��(-@Z��&�8{@\��ψ]@]�/���@_�6h��@`D��I[@a�hX@a׫S���@b��]
�}@c~b�u*�@dY9ݹ2@e9����@f�\a��@g�f�r@g�QX���@h�W�@i⬪��@j�S}��@k��w�S�@l�t�##@m�?�rz@o�Ќ�p        ?_ߘ�K��?�Pqpǆ�?�|��^��?���?�G9?���_�v�?�Yg4�`?�.\ZG1�?�^���1*?�^�2u?�%ы2�X?����Z?���A%?�B�2?��C*_P�?�r����?���Y���@�~�Q2@g��<@��l�@	�_�5�@h�Mp�@^�J�0@=qlfYF@�@	v�@�� �]c@X��QH@2���,@�pm��@,@���@0�O�]�@ +e����@!H	*�@"njG;@#��1P��@$ش��4@&��Q{@'j�V;Ux@(�[�%�@*%���t�@+��MCa�@-
�+��@.��N3�@0�_�M@0��s�N+@1�!:9T@2|�zБ�@3W�,d@46�e|t�@5ks� @6A���@6�-uk4�@7�/��O�@8�F�Ro#@9�q�e�@:�.�%@;�q��L@<�gs¸	@>
ۤx�s@?"^=�?>@@v�k�:@@�C�y��@AC��/�@A�n|��=        ?;��a�?g����r?��nP�2?��gw��?�n�*>җ?�����?�&<�'�?��d�a=?�>OY�o?ѓ)K�>�?��4_H�?�.\96�?�>�j)8?�q���z?�;�W&2�?�R�����?�[�r3�?���W�d?�}M#(hX?���E���@���*C@"Eg�@���-3�@	��~c��@�,v��@����@�l�UVo@��=�Q@�<1�3@(LU-kH@�N�#�@�{w1�@��_��@!<�q,A.@"����CO@$G E?/�@%�7�4�/@'��OZi�@)s�ӄ�A@+Y@��J@-U|hb�@/g���K@0ȡ�Q�D@1�3SP�@3�F�I@4N�z@5��@��@6�V�|@8@�	}Z@9���o��@; �V��@<��R�>@>3��˒~@?ЂcUČ@@��/�{@A�{�AL@BznA�J"@Cb���@DR.S�kg@EHfEb@FD���س@GG��7!@HR]a!        ?W2� |,?��Î�$�?��1�t(?�t3m-?��̇���?ěo�P��?β{�|^�?՘B9� ?����T?��nD�?�+���@�?��}b`t?�k8���?�6ys��?�r��a"�?�&:��@*����B@��C0U@��7�@}��ch6@%�G�f@�#^lk!@�ź��o@�1�j@]�p\�@��k��@�l��@ S7Wa^Z@!��&��O@#��:(0!@%B3C�\�@'��V_@)���u�@+��xz0@-,�g +1@/hJdX8�@0ߡWʙ�@21��Q@3`�cKB�@4��k��|@6��V�L@7�l�s�@9�z�@:�����@<Gl�Zo
@=���^��@?�[s��9@@ǵ�7�@A��T�t:@B��$iVT@C��D��@D�g(iת@EֽȐ��@F���s�@HS��@II\�=If@J�ÝzU�@K�l�4�@Mp��r@Nb�R@O���[,�@P�D�r��@QL�޴F        ?�WZ��?ķ��d??�$]���?���/�B�?��؎���@��6|@�=8_�@���%w@��q�-@#��j�@(��R?�@-��=@1�P�
j@4�
p��S@8j����@<���@@ �k:�@B#���R@D`�t��@F�#f��{@I?�ɩ@K�9�u@N��N���@P�NJ#�K@RG�(��,@S���ł@U�.�cpK@W7�H��@X�"tZ?@Z���fX@\�GX���@^�[[��@`e�9�;�@au�#��@b�IE�"�@c�(�3��@d�F]��~@f���@gM��XU8@h�݁�n�@i���U@k?���z@l���yxs@n�����@o�����@p�#6�>@qH�b�U@rq�qjT@r�_�'�@s��cĦ@t�_-�Rc@ug����@vH�af�M@w.�����@x�q��@yE��J$@y�0��@z��M���@{�4���X@|�Sƀ�@}�4��@�a<t@���F"�        ?EOh]jSi?s&�Np�e?�OG�V�?��9�$?�n�~�?��5���?�뫫yֹ?���n��O?ҭ���\�?�!�!GIK?�S/���?��}]F?�z�v(?�:�n�?�RF;σ?�)|&e^�?��-�VV�?���:�R�?�ږO?�'7p��^@ ���t�@���4��@��C��@���� 7@� `nv%@#o �-�@�����@���!�,@K��:�x@��X�@E���=@��~�L�@�?�w�@���iDf@6Ig��=@�h1K��@��� 5@l��P�@ ��&y3@!�Mb�@"����@#��Bh�(@$��h��n@%��P��@&���ۉ�@'�b��@)�:w�@*H���@+��_�@,�L��_q@.
��";:@/[]�K@0Y�>���@1
%\`@1�h��r�@2v�9�`@33 9$,@3�CAO*@4�H)��d@5�fY�@6N N�:@7cy�WL@7��eUV        ?=�ш{ۓ?m"]H�F ?�� ��	W?�`�Z�?���~M��?�F��<r�?��0~�5?���}�?����Gn�?����?�.����P?��$o̼�?�����s?�,D�X��?�9UCE;�?����=U2?�����P?�I���@i���S�@
��z�@��*��@
%M��H@a'�n�@�n�q�@r��p@��wu�K@�,�R�U@`��ۃ@�H0���@M�8�9�@ ���o;�@"�8���@#��2�@%C��X!�@&�J��u�@(�&���@*��?9�A@,���/x@.��ky'@0ycB��@1���!��@2ǝ��a�@4 ����@5F4['�%@6�iy�@7��\_N�@9a��S@:�H���@<_ȳB�@=�5�V�@?��Er�@@���ue�@A~t~>�@Bcf�ڔ@COoNo1�@DB�/��@E=�`�\@F>�d��@GG�Y;��@HX��L@Ip�ACz�@J�Uoc�@K��h��        ?.��ʔ�?Y#�8^��?uB���~?���]h>P?��6�ű�?�fKZ�?�ʁ뒻?�.LK���?Í���Y?�]>=4I?�5��1x?�ݲ�>�?ޞ�u�?�I�̦p?��v�_�?�>�=�%?�%����?������?�����4?�@WP@}�D�V@���z��@��t�@	�&��@�]�a�@^�KU��@\�_Ǘ@���h�N@�9��*i@@�x�~�@�¼.�@�����@ Όw�q@"_�?][�@$3�M$@%��x�=�@'�$�s�@)�hwJ@+�6�Mf�@-�?���'@/���c�@1+���E�@2e�����@3�a��:>@5�x�W@6jp����@7ޚ)�@9a�@�@:�@g0@<��)8@>I���p@@� ��@@���@A��G)�e@B�G�_�@Cݾ�$��@D�+�,�@E�dڪ�@G�9`�>@H@�R��*@Io���o4@J�jƄDm@K�8l)Ϗ        ?�[}
�?�}��6?�g@3$�?��!�1?��n�N�?��R>�|@ >@�M�@�O"rwr@xF����@�R��̂@���b;@`p���@"QzBª@%�n@)���<U�@-�"��@0� CP�B@3P��е@5Ү?�ُ@8}�=ս@;R�0C*C@>Q/�X��@@��A��1@Bf����@D%g|o�@E��<�Y@G�kڳA�@I��Z�h�@K��+b@N"��J/@P1���K�@Q]do�x�@R����X@S��nX�@U"��B��@V{2*0�:@W���r��@YN��I@ZȽ�	�D@\N�H%Ɵ@]���X@_~|'���@`��|C�@an��D��@bO'S���@c5�5 �@d"Z��"/@eز��@f��2��@g�p�z@hˎ�}�@i)���@j.�D4�@kF^/��@ldv$CM@m��[2c�@n���/(�@o��)f�\@p�\'��k@q-z,u�M@q����'�@ru�"!�~@s��]��        ?N��<?z�i$�?�H> �&a?���5��?�v4����?�4�k��?�[jxO�?љd7�em?�^${K�?����.8�?⺽k��;?��FS4f?�|nl�?�A/��26?��p�R 3?��1��?��"�y�?�x���@ �E�<�@���ΐ�@�����@d�)�-@VHx+�9@
��XIe�@'�/)��@������@6/j��@�0]$�@�{�D@�uڂ�x@*�eY@͇%*�@D� �)@@Jv\*�@��o�@�0��@ ���A@!�G@"����ti@$"����@%2��@&<��{@'b�j��@(�����A@)�Z�l@+u��@,L�P}_@-���/@.��R_@0'q���f@0�`[��@1�H6^�@2L-�S8�@3���@3�}�`@4�:7�.@5`�-�O@6/Q�R�h@7�P|#�@7�)"��n@8�ۺ;�@9��'�@:y��OR�        ?G�b��?u����F?��s.���?��ר>�c?�VH]��?�d�!��?Ʈf���+?�'7:H��?�	!�+��?�}j��?⮛w_�?�~��0�?��.���?�A��?�2l��E?�)� )f�?����ۻ@9!�yD@��*jx�@�����@
����x@{�D�T@�����>@����@�"!)�S@7�v#�@�9�㤀@20���@�#�D@ ����5:@"�{�@b&@$1���]B@%�=�M!�@'��S�DN@)���EEG@+�O���@-����F>@0�V�@10���@2ef�b.B@3��~� �@4�l{�J]@6Tpy#��@7� �ᆄ@97D|pA�@:�aI�¦@<Q{�@�R@=�GH�E@?�6hE{A@@��qh�3@A�B�o�'@B�L;Q�v@C{�����@Dx�"s?@E} �+�@F�����@G���^;�@H��h��@I��#H";@K�#B�@L8��l�@MsWy��@N�
�s�        ?6�����?b���b��?~PTn�=^?��W�~8�?�����:�?��c�g,?�y��_TC?�~cxS?���!~�?�C�oB?Ԋ#���R?�[ZO+~/?��??�.��X?� ��4�?�"�'�?��`3�?�Q��-?���w0�?��)�a��@ q���C@�	�!��@[t$@!c�C@�K[�@XfB���@��{7@��m�
@����@ѩŊ+@��5�@g��ޟf@婔��-@ Ch�B��@!��k�
!@#T�`�@$�G���j@&:�[L�x@'�8j@)��{T(�@+{$LŖ@-b�`'�{@/^�U�@0��*���@1�C5�P@2��'@4[r*�@5?m���@6|Z�WJN@7�B�۳@9E�^h@:u��
H�@;�R���@=T j�'8@>Ը�##�@@0|���P@@�}x ��@A�hĻO�@B�H��+�@C�'c��@Dh�֐@EQ�����@FB	���T        ?��K��?���ħ�t?�ǂ**�?��P;g�??�ԁ��p�?�D ܴ�@  �C�@��P�;@I=�+�@�%�S�3@ .�R5
�@#�;�H@'�v5��@+�+*.�@0E����@2�eb�s�@5n�����@8HI�,�;@;Oq�(M"@>�j�]@q@@�|s�@B����!@D�I�`��@F���J�b@H�%�1@J��ўe@L��.K�@OS����(@P�z�-[@R!�fq@Sn���
]@T�{[��@V.hLrE�@W���yU@YҮ	�@Z��xU7�@\A@����@]���.@_�>P���@`���
�@a��[�o@bxyY�t�@ci�9�*@d`����@e^���-@fb�rKn�@gl�GM��@h}5sۚ�@i���Oz�@j����9@k�jsW9@l�)��	|@n.N�82�@od�q�v@pP���"�@p�ŭ/;]@q��,k4@r@?��f@r��^ͼ3@s�C�]@tM��4xw@ug8+Ġ@u��K�>�        ?8��ŕ_?d�}��l�?������?�T�P,L�?����B�?��un�cy?�TT�OB?���t��J?�7"�_IT?ˉ�|��?�]��\?�gWF�
�?��X�է?��=B���?�Cw���?�a���f?�-75E0�?�tp2�?�2���M:?�Ϟ�V�?�Tj$�C?��'���?����K�?����}?�{;�O�?��e��!R@C0�P�@��`���@@K�Mo�@�����-@}_��'@	3̞���@
�2���@�0��(�@����!@U�ށ��@X~#p��@b�:�0@uGX�N@�a!}f�@�E���h@���5G@i�8��@E��(�0@���j]@Ϥ���@ b��N�@y��.�@ٌ.�	@ �z�^@!YG��9@"��؋�@"����5d@#�3�Kl5@$b�l?�@%/V2$P@%��`ہ�@&�<��@'��}��a@(�C��@)i�"z@*N�E �P@+7[���        ?"�T҃z ?Q�1[p��?o�z��_?������?�t�F��?�S+3�~;?��B�٣�?��L��&?��+B�?�O<���O?ωz��?�Ū�p^O?�������?��;�c\?�z&D�3?��#Ġ?�)�Y��?�rB� ?����?������?�.JD�@pa&4%@hMyf$@Ղ$�E@	���H�@89�,@g0���@UV�b,@g�
o~@�+1ْ�@���Ǯ�@�7���@/�Zj[@ �+����@"���I?@#��c�[@%FNܹm-@'	<E� @(�0���$@*ԛ����@,��E�J@.��0ߢ�@0��q�'�@1Ɲ�g�@2�(J|P@4@l�a~�@5����=�@6�J?@@8Y���@9�ѭ`�@;Y�"��@<�;��l@>�t��
@@! �K�@A �Tq)@A���L�@B֛��,l@C̗��m�@D��V�@E�6҆�@F��l0��@G�xF�6�@I�^ǁ        ?.�a��5#?Y2=���?u���l�?�UUG>?�LȮ(?��ʱe�v?��?h;�h?�OŃy�?��N�H�?����X?�g*%�`?ֵ�}��?�vaσ�?�1�!�?�w��ϲ�?�]��3�?�v�R��n?�8�l�?�O?�&�6?�Pg{uZ�@���^q@�uQH�C@q�=9�K@
�Efp5@Ҡ�<?�@�Z囵�@�BܔG�@�11�o@ܑ?1͝@2�[*��@��>��@QX�zr^@ ��l�9�@"�XyY�@#�yaX�@%7!��=@&�%^�ZB@(��K�Ⱥ@*���T��@,�����@.�/-�$9@0j:��d@1�EV�@2��u_�@3��֛�{@51�L��t@6�U&cG:@7�[%�2�@9I��)�@:��/R�@<C6U�c�@=��ܣ�U@?q�O�x3@@�����@Ak3��Q�@BN��>&@C8���9@D*>h�n@E"����@F"B���G@G)��&s@H76���9        ?sE�ӖXi?������?���[9Q�?�f�52r?�o�[�o�?�m����?���{7T?��n��z@  ����[@����x�@
!�jZ�@u��^@m�]a@%��_�@"���@@w��u�@"�_�o�@$��%l�%@'K�Z��>@*+ܠ�@-7�����@09F���@1����@3����|�@5��r�AL@7�W�:j@9���UW@;�e�0V^@>ߔ��@@6��C@Ao_td��@B����ؿ@D���n@E_J
��@F��'\�w@H:�� �@I��J�@KC�`D��@L�����E@N{֗U�@P����@@P�2���@Qӂ��2@R����{�@S�w)z�7@T� 2��@U���1��@V�⾉��@W���6@X�H�a@Y���ċ@Z��Ǣ��@[��lTI@]��ơ@^6r3|�b@_eA]���@`M'B_�@`�l�m��@a�ѵ���@b.6/��M@bԚ"�Ϲ@c}�2`�@d*^6�K        ?7���ܮ?d�߂a��?��EI?�����0?�qZ��-j?�^�Nw?��� D�?�1�ʎ��?�ܬ!�^�?�v��͏_?�����?�CV��-�?� ���W?� J�L?���S�K�?� �����?鄥:Q�?�,%`~8?�����?��U���?����+�?�?��/�m?�%�8�?�i+�D0i?�3�N�2@�0�@�lcO�@5��,�@�p��T@�<(�-@	uB�y@Y�qJ��@O� n��@X�vF!@��\�F+@����K|@�OR�{�@�[>4Q@H�9�
c@�yЗ��@�">��@�ύ�@d�����@��b��@'Md�@��v��@@ �d6�@ ƚ(�@!�b�WE@"S�4Ul@#!Fl�@#��wś�@$�����@%�6����@&���J|�@'d�ݯoG@(K����@)7	'�Ț@*&��y�@+W��ș@,U���@-��Y��@.	.p        ?"��	�u�?Q�ʔ-�?o}o+�jc?���r��?��TQ��?����.�?�2�|S�?�5n�m�Y?�'$=c
?Ɩ�H�kR?Η^��$?�, �?��i?�t�Ф��?�y���?����1�?�fM'?�1ba3�J?��Փ,?�M�ty"?�u�>�\�@�e ,�@�4U<g�@C� �z@	=!]r@t���u�@�#S&@ұ]!�@���@�"�]	|@6��,~@�� �T�@,Tu�G�@�4��~_@!\$�2@"�pj��@$oʿ^�@&{ջס@'�sIξ�@)��D<�	@+�1�ԝ�@-�k�p�@/��B��@0���f�@1��Nt�@3!oA\@4S�u���@5�Y?�@6�+�8��@8/���	�@9�,g��@:�3L%]�@<p�T3LY@=򷄞X�@?�[x$�@@�֋:C@A_]�A�@B7�s�m@C!��@C�j��d	@D䪗�	z@E��"ZG@F�&ӆF        ?+s��?�?V��c��?s���N��?��Ès�?��I%�?�?�C�?��|�{�i?���Lq|?�a�`UT?�q����?�C��'?�V���?ܚ���m?��۾]ܧ?�?_m�Ǌ?�%�S�,4?�\���&�?�Gk�?�	KT�}�?��F���I?�Nw��q@]"�0G@��3tɬ@�6F�	@
�1��G9@�[�ئ@�X�T�@�!J�ɘ@Ӊ췶@����@m�~��@�1�M�@����W@ �:�I��@":���x<@#�+}m@%yp� @'8���@)��&[_@*�+�HN�@,��Z6�@/v;M2�@0��j��@1�F���@2�Ú��@4:��+�J@5�I���@6� ���@8@*��@9��%��@;/��H�@<�dHJ@>S/x=�Y@?���:��@@����@A��mH�I@B��>d'@C����C?@D���6@E��B�o@F�:��l~@G��*�u(@H����        ?rBQb�4�?�p�T���?��|�71?Ϳ��b��?��uY���?��fX��?�I�5�m?�t��2!@ �~�~8�@z���n�@,Ճ$�@ˮ)bD@_�6U*@T(i�q4@�V4��@ ��4h�@#A��qe@&ym�8�@(��9b!5@,'��De�@/�1-;@1�x�T��@3w����@5z/�il�@7�=!-�b@9��6�u@<'�r�@>��<��@@�"+�K�@A�3���@CH���@D��Ӿ�@F5cЩ)�@G�����@IY�!<x@K [#<�@L��Z:@NvUzS��@P"�w<�@Q>�-�@R���@S�5��g@T���@U�� #@Vb,��@W2��uf�@XO�"|��@Ys�uH@Z�P/�@[�07�]6@]�%��@^C����@_�*�D�b@`i�.]k@a-�y�@a��\�@bl�w��@c��@c�<��s�@d����"U@eH84�G@f�q�+@f�h8�d