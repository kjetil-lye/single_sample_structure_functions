CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T103733        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?a����(?�9̇?����l��?�Ru���?�F<b%?ۗ�Zg B?�p<eU�m?�m�@)��?��,ޫS�?�:�5�?�?6NP%@x���@)_���p@
14���@���@�oK�@*�'�Ʒ@�B���/@���Ҝ@�6�K@ <z&	�@!���p�/@#|mv3"@%[a<�}�@'P�%�@@)[�م/�@+}'��@-�o�K�@0 �S.@12�a~@2o�Bf��@3��Pv�@5kم?�@6jp���@7��x\@9KyV�A)@:ͮ�%�@<[�V3��@=�ðA�@?���'� @@����3@A���a�]@Bj�(��@CV�f
�@DGC�8��@E>��(�@F<���B@G?�Ќ
@HI�W�-�@IY��ɔ@Jo�Lcg@K�xP�Q@L�`RK�@Mآ<�j�@OE����@P)��h>@P�j59��@Q^�o�d@R���O�@R��?R�@SW=�:#�@TW��@T�A��'        ?9P�cqgV?m����l�?���o�GQ?���Ǥ�?���V��2?��q��*?����T�_?�K/�ب?���_ߢ?�^��??�W����Q?��;�(�?�#�k�?�'$��CA?�j�ٞ?���$k:�?�k�y��@ ҈�9&@��H(G@��T��@
�-���!@����1�@u�@��@��uŖ@fG�CB�@.ԧ���@/�|���@j�Mb��@!p��:>V@#J�����@%D�g�7�@'^�3I-@)��.>�@+�~0�M@.u/X�z�@0�B?�@1�w�>@3ahWRe/@4�C��k�@65�l5�@8)l>��N@9��.E�@;�iz�L�@=��DV�@?�����@@�ө}�2@A�,Ԃi@B�I��X@D��͔V@E@��(�@Fx'��V�@G���q{�@I���`@J`�OH<{@K��NEP@M4�$t7i@N��9�Ju@P\p���@P惽���@Q��Wb�@R�����@Sk�@TO
.D��        ?b�1� �B?�CĲ�.?��隸?�g���I?�D�;��?�v�؟�?�mT�?�LL{���?�!�M��?�G�8�5?����@@�0�) @@���P@	�?^p@,�t��@t�d-��@!�]g��@���@3���O@�c �G�@ ������@"����_�@$�z;�\U@'
�`U�C@)zE�y��@,ƹ&:W@.է.�p@0����@2o��T�0@4��4@5���ǅ@7�p��z�@9��V���@;�k�ħ0@=����b�@?�� �@A���0@BU�T&@C�BDr�@D���7�@FJ���@G��2I� @I5���
@J����j�@LY1�@!�@Na���@O��j�|@P�b���@Q�,nX+�@R���4�0@S���}@T�|W���@U���*/2@V��!�@W�a2}�@X����%|@Z H��@[T�v�vs@\�fP��@]�5�5@_%7���@`>rbF�@`�� �]        ?�ftj�?�B�#ґ�@6rO��@��B_��@%٥߂#@1��B($@:Z��ǹ@B��w��@G�Ĵ@N��@�I@R���ߔ&@W)���@[�?��r@`>g� �+@b�f_D�@e���2�r@h��~�۞@k�օG2�@ofvE��@q��^Md�@sip%�B@ui�\.��@w�ܚ��@y���;�:@{�����@~a`.�f�@�n
ñɧ@��m�ox!@��Q���@�nC9�@�۽�LU@�UPi�v1@��tI�(@�m��-@�]t��@���s��@�mX�@�@����2��@����1�g@�o�1�@�c�3��Z@�^���2@�_�Ȟg�@�g"���@�t�&���@�����@�����S'@��,�Ǝ@���1f�@�����l@�I�hm�k@���N��'@�a/���i@�BmC@��n@�S-妽�@��sP7�Y@���xU�@�a}�Q0�@�MI���@��Uk�}�@��� �o@�L#p��        ?;�]-߈�?p�Zۙ?��]�b��?�C,aRK�?�����p?�A����?�9� k?�4��\s�?��h}�Q?�.�;�?��_V?�>2��?�r}��f?�F�J	�?�ǶA��?���1��?�Ŀ��n5?� �S�9?���-]�@@N�����@`9I�@�wHD�@��~�r�@
f�5%@�U��@Ȱ/��@X��@�ƴ}X@utf�@�H��@����@��~:ʮ@��~�y@v=MD1�@yJp�F@ Ǆ�\e@!��{�t�@"�����@$!�uU*S@%S�̲	@&�U��E�@'ӑ~&�@)"�V��U@*|	tJ�@+�kc��@-M5�c�@.��d��7@0#�e Ğ@0��BL3@1���Z�+@2�Mu!@�@3\R3�9�@47�qQ�L@5�^�@5��Nv�}@6��Y>�@7��4��@8�V�?�	@9����@:ȦЇ�i@;͆Ž+@<׉<�O@=�"	��        ?.j��,!�?c��J1?��=Qo7?�����?�VM����?����x?��p�^q?���cb�?̷3{���?�!�e�R?��fO��?ߛC�ǞQ?���x�0?�b�Muc?���8�{?��f����?�d0AS�?�T�ͣU�?�Ð�_U�@\�䋯f@ 3�2�D@/��Y�^@
� @d��@D�I7`w@)jގ>`@^����@����_@]���R@*�_´�@.ڬt_�@ ��ˊ2@"qUh$E@$Jc��a�@&BE�Ĝ�@(Y=8d�@*���A�Z@,�7x��]@/]�18�@0�\��W@2V͐��@3���A4@5BZ��;�@6��#Z[�@8ṛ:��@:%N&S@;�=�k@=��!!u@?��f�BR@@��o�@A�9ϻ@B�E�$Ĺ@C��Ft�@E �G��@FJ��H��@G~^|0��@H�@�E@JKx��@KP��oT�@L���\�@N
�����@Outv-L_@Pt�GEg�@Q3��Q�}        ?��� ��?M�i�[]�?k�F)���?������q?��Lg]E�?�j=�K��?�dރfL�?�F��Vϴ?��Et��?Êk����?ʏT���?Ѡ��O�?���q?�M�+�p�?�q4I2s?��ձ%�?�>w�@?��/���?�sQt<K"?�T�[S<�?��LK�b�@ �q�Z@�.��e@�A�3@	����@��u���@�*ǂ�!@�_2�@f�2�"@�saZ�@�णe�@�j�v�@ �/�2�@">�$��^@$�?*�@&i�5G"@(,�4�~	@*hǃ�k�@,�O�3V�@/IU��o@0���B@2]�)c.�@3�إ �@5c����@7<���q@8��W��-@:�ϻU�E@<c���H�@>YS*\@@2�͙��@AD<� �@Bab�l�@C�fswݜ@D�~0�@F ߶��F@GN�����@H�V��n�@J��ֺ�@K�v���@Ml��އ@N��?�@PFz�_@P�:z?        ?�9^K_L�?�?�y�)?��KJ`�v?���w�@��m��@OK���n@z8t�#@!+���=5@&�xR���@-��L�;F@2�ID��@6���^�@;9s&��6@@����@B�M�]V@E�����@H�(&@L_�U���@P��1�@Q��1懟@T�N�@7@V8\��h@X��Tg�@Z���.i�@]�k�=��@`#dplW@a����wp@c��P@d�B�XN@f-I���@g�z>,5@i���%�@kU����@m,��1�@o��oK�@p���^`@q�E݉6@r�7AU��@s�����@t���1�@u�&�`@w< jEv@xQ����@y��/Du@z�"����@|-Z+���@}��xq�"@~�
���~@�-I�%0�@�蜔��j@��x�u��@�l��;�%@�5����r@�!�a�@�ԿX(¢@�����@��eY��@�d=b�[@�Gb/���@�.��F4�@�go#2j@�
77ކ�@��5k�1�        ?\c�Y,?��!�c��?��jc�S?��;w8?��uɆ�?��?[M!�?�~2 �?�[\{�}?���	Ɋ?�L=�?��@K
?��%��E@b�QY@��#dv@����Q:@�_���R@��.fE@ f�7��@H��#�@�7<��@FC�� �@��GO��@�a(��W@ �ڰ[�;@"}�|ͧ@$!����b@%��.7@'����@@)~ܺ�q_@+m�`��(@-n�� �@/��	^�a@0ԥ����@1�$c�[@3�8��@4F ���@5~f����@6�#���e@8>�l�@9_��|"�@:����A-@<$�Ͱ0R@=���ʧ
@?�x�wF@@I�	��@Ao��#@A�Ҝw��@B���pu@C�����i@DZ��U�@E9jǃ�@F�!�ng@G%DI@G�3"a@H�� �5�@I�H�z]�@JՈ9Xg@KՆye�@L�C���@M���X��@N������@P|�{��@P�Xe��        ?G��CGi?{3�K0b?�, Uʰ?�9�9��?�J����Y?�a�;��?��h���?�N��u�?����}9�?�k�)*�A?��|���?�f��3�?�'�,?�o\�
�M?��pn�	_?������%@i�&0J�@\5���@�����@,�A0(�@
2�r�@+P��N@|�\��@��䑡�@��f�+@���ȯ@���3�@!���=e�@#d�ģ��@%Sۦuځ@'cuZ^1]@)��ؾ�@+�[LE�@.`��@0}�d0�@1ޕX@3R6�Ң�@4�H���@6t(U�X@8#3�*�@9��zrZ�@;�.����@=��9o�@?������@@䈨&@A�3���@C.�Թ�@DM��I��@E��s��c@F� ��d�@H Gۮ|�@I~�]S@J�{��@Lb	.5._@M��C��@OyԱ��@P�:�U�Z@Qb��r^@R@	���g@S$I0W�7@T���!@U�0�69@U�@RJ�<        ?Yi�n�O?�{��]�?�
�+(.�?�$�#@-5?�sKȝJ�?�^pO�Kc?ټ��"?��ңމ?��1�;`?��,�[�?�L���?��b���?����j��@]\Q��@�FmYz@n@�,m\@wjOc@���@����'@�>KNb�@�+M�M @8�E��@!��K9@@\���@!KWr���@#[(i�Y@$�@[��@&�O��@)"�'2�:@+h}ܞj]@-�.�F�@0-q��@1�͝�K�@2��s
�@4k��lE@5��� ��@7�[$�@9Y3�"*I@;&�'1�4@=
H�a�@?����@@�X��@A���}��@B�pF��@C�ک��b@EQg(�@F^'����@G��z��@I
�PW@Js�8�[�@K����@MoQYp�@O�Э�W@PQL`�cl@Q(�Ȭg�@R�$�@R�ᓥ(@Sۥ�Xg@T�w$
'@U�D�!��@V�cf���@W����M�@X���U;        ?��
�e{?���B�r@Y�|��@�2AK=@"#`~���@-.]���@5t�����@=�-���O@C�z�@H��M���@N��R�@R֨��@V�N{y�Y@Z]�}@^�<_o��@a�����@d8�6�w@f���ڈ@i��W�6@l�f�X�@o֦/V�/@q�DƔ}4@sR�_%v�@u&/r��@@w([`��@yn�u�|@{ ��q�@}I����@�{a�@��+<bn@�!�0�*@�_u�Y��@��D�PX@��}A�G@�Y<2�N@������@�3s�:�E@��+��?^@�7>/
_O@�ȧ�|�@�22��u@�8U��K@��bP�W@���>��"@��y���@������@�qi�焝@�cH>~�@�ZJ͕��@�Vn=$��@�W��y�G@�^�9��@�ig�W?@�y����_@��<��RX@���Y3�@�����@�v�«��@�,����@��2[��5@�;���H�@�׊�%��@�u؂=�        ?9�Ռ"<r?l�@��?���r��~?�N9���?�۝�?�����u[?�ބZƢ�?ʦRI�mW?���bu?�;�F�N?�E�hR�A?��Tb�?���]�?��J7g?�|���.?�Gw2��?�d%:�ԑ?�E��b?�]�����?����o[@ ��FDk�@w>�yJ�@r$�.ʓ@��Wgx@��~��k@e�:�@|1T�J�@�6�@W���֯@�(=�'@+}����@�����\@:����@؎�
F@����h�@A��dd@S(bQ@�>�O@ ����@!圝}�)@"��t� �@#�|����@%�n�߾@&#�Oj�@'E��'�@(o�&(�@)�o�f?�@*ڼ�m@,����>@-d�g�9a@.�b��(�@03��*@0�o T?�@1kߣ�KF@2$g�5d@2�_�/@3��@j�@4fݚy��@50W�6@5��yOˤ@6�\\�*P@7�~bJ��@8��o�|        ?"ь6�ld?Y򌭔 ?y���`֑?�>um*��?�<����?�샊ؤ?��8?�?�8�H��?����9��?���F|y2?�KXYm?�"����?���j���?䍞)ށ&?�9���=�?��{?�Y9���?����FE?�����z�?��3U�@hN�|^�@M$)�A@�N�I��@
/�����@�?�*5@�N����@̂��X�@c�J�@l��@fpߘ�@�2Ћ`@�s1EG@!sܬ�@#$ �`�@$�DO��@&�Ah�]@(�m�ѝ@+��Af�@-K�U)@/�P���@1�=8[�@2r��[;@3�m	���@5S>q�@6�i �d@8�z�z@:5h���@;�7i�1�@=ܨA�/@?�ܘء�@@����]:@A�T3��@C�;f��@DB�i��@Ew6��X@F��D�Ą@HmQ�(@I_�lԱ�@J�P̕��@L<In�@M��<u>�@OO�z�,�@Pw8*8]�        ?"grW�?Q����y?px�/t�?����&�?��S/ ;�?��'?�?���q��?��m7�k?�Vwx� h?Ž�V^��?�P���j�?�L�5�m�?��A�i�?ߔ��.�?㷽�W?�I֨�O?�fBSj?�Ɇ��v?�2�'��0?�	7�Q.�?�Sܿ	�g@����@��hU�u@��*�@	��j�a�@==�^D9@���x�@��X�h>@�%X��@#���@�0S�@nIVh �@\zG�(@!>n �o@"��m�@$� (�d@&����@(������@*�Х�X�@,��g@/43<.(�@0�k��@2 �����@3|ךh+y@4�)��@6g���,�@7�V_z�G@9��硸�@;L��^�b@=Pw=@>���O@@l�"k�@AmAy�@Bw���UB@C�-�Z!n@D��9@E�t+G�'@Gv�2��@HG>��R@I��A5d@J嫎��@LE���3@M���        ?�KM#m�?�?����?�L���?�K�.}�?�8m��8�@	(��jX@��"��Z@s�9���@!�W��@&�ݞ0�6@,��_:ț@1�9>�r@53�$@1�@9&�*ӏb@=u��@A���ڣ@C���1�%@FG"���@I*�ѺKv@L>���ξ@O��Z��@Q}@��L�@SQ��m�O@U?"��Ԛ@WE�}��@Yf,D�Ez@[��3�Z�@]�=�>a�@`0&7���@as�0�Ӄ@b�
I��X@d!���y!@e�B�!p�@gA�ڈv@h�����N@j��t��@k���gn@mk,�aL@o&�2���@pw�~�^�@qc<p��@rUD�(�{@sNet��@tMzY�@uS��N3�@v`�݌0@wt���|�@x�C�(;/@y�� aqQ@zٶ4��@|	�革@}@��i��@~7`��@� �q�/@��G }Ԩ@�3�x��@�� 7�=@��R�/G@�Ji�I �@�n��@��hd��@��b[]�@�Jd�ZLa        ?u�d���V?��ۖ$��?��	��J�?�V�nw?�Q�k~�?�$T 9A?�����?��3<y��?�u���tk@so'�@>@D��8@
��4@ p���@ėE��w@�N��!@�6m�@^$���@  ��@!�n�0�@#���;_@&q�Ӳ�@(Wt��5@*��?I;�@-'bzW��@/�9y��v@12#�b@2��b�H@4���o@5����G@7pˮ@8���F�@:S�'�@<��5D�@=�,M؊�@?�g_�oM@@��O���@A�r��[@B�$�y,5@C��${m�@D�]q�+@E��(bQ@F�qƄ@H��8@I-hU@��@JZ����3@K�Y�A�@Lȶֹ��@N	�+R%K@OP�u�#-@PO93��@P�0�*�I@Q�J���@RV�7 ��@S	�U�}	@S�.��@Ty��	�@U6'm�W�@U���#�@V�i&���@W~'_c؈@XF����Z@Y�W�@Y����@        ?Cn☑)?t�`���[?�����?�V��@��?�Jg��M3?��5��?��)3},?�&��`�?��6�C_?�,�@��:?�CaY?�۸N?�
��$��?��}{�?��mm�m?��Y���@hhit�@S���5@�׊���@!��ψ|@.�wO@�/kcd@�c͈e@�4}Zm@W����n@V�����@�g�%�@!�yk=��@#d�`6c@%d�b%��@'���@)��6��@,=�kX)q@.��VI@0�k� k@2:e�J{�@3�<v@5`N��{@70K�SY@8ޘ��v�@:������@<��_�@>��b�-�@@x��Y�v@A��I��@B��X�1@C�>�\~�@EEq�~?@F��;SQ@@G��	�v@If~���
@J�ƙ�@LjX�T$p@N �"��v@O��8��;@P�8����@Q���@�@Rt�1_��@Sc�4��@TZ� 6�<@UX��_�>@V^Z��nY@Wk��_@        ?UO��}�f?�莌;ڡ?�[�T%?�������?�/�3$l�?�l�H�҉?�菂m ?�a��߿r?�mѨ�r�?�˹��?�o PP�?�:]���u?�����u@ Q�1O�n@��*�,{@և�-,@[�F��@���+1@�#��X$@�*yC��@�r�| @�
�L��@!h���@#@%�'[@%�W�L|�@(K��r�@+���@. {��ϛ@0���T@2d�P��q@482l��@6'�~=�@84$��@:]���@<�~y�X2@?	`M���@@�O��Y@BV8�Y,@Cw��6ɹ@D舯&R@Fi7���O@G�S͉�@I�*�Z�L@KODE��@MVC&wC@N�Vc�|�@Ph���3@Qe���@Rlr��F@S|wX۹�@T��#@U�v+�u�@V�0Z�@X�2��@Y_HM��@Z��R�@\ ��`�@]atCx�@^̪��x@`!W��@`���ȋ�@a���ud9@bs|UG�        ?�$,8>��?���9��@�70)E�@�)g�6@(�jm%�@2�Rs���@;�K��:�@B���
�@H�wN���@OT���)@S_Gk�g�@Ww5<�n@[��IQ�@`g�J��@crN|a�@eڃ��p7@h�5�\�@l�o1bz@ozǉ�@q��E%�@so�����@un����@w��~,6�@y�ͯG��@||,��J@~j�%k�@�t�gQj,@������@�CiF�m@�����w@���g�nA@�{��%��@�վ>_T@���<��@�U�Ӡ�$@�1�_[@����Va�@��HKE�R@��@�M�@��bu�&@�����{�@��O4���@��&@���@��;߫� @���u��@�0�r�]@�[�mx1@����T��@�Ȅ��G@�	�ݨ�@�Q�t���@�P�36L@���(��R@��ϫ�M}@�]>�x��@�D����@���HRs@��'\�H�@�K�e&�@���*�@���c�}@����f @�s|��h�        ?^jnL~��?�ժ�p��?�I��T?��{p���?�]
���?��3;?���T��?�1�n��?�4:k��?����k?�� rWU?��^��8?�����?�����{@�AK��8@Ko�a�@Yz�<W@
b�n�R(@���n��@�΄�D{@M�֜��@0��]Ղ@,>E�b�@?gd�6@j���g�@�ŭ:��@	.�U��@ �q�2�@"��
;@#V�%�<E@$���
�@& �����@'����@)񺆯�@*�c�]G�@,Ia]e�d@-���zp@/�$�R��@0����o(@1��\	�@2���@3������@4{��@5|�nuB�@6��:^'@7�'�?!@8��P `�@9�)���x@:����@<�z�@=;垲x@>qI��w@?�ZI�g�@@x��,�@A� ��y@A�*�+��@Bp�����@C :X�3@C�>7>@D��h��	@EC��>@@F��r�@F�$��|        ?�Љ:�I?OJ.�׻n?l�p|Y΃?����0+�?�x��?�mr%�h?�T�I�D�?�U6]Z��?�p^'(?�l���J�?����{�?Ћ��4t�?�})[�?�m���ֆ?�=�ɬ�u?�a/���?�0 ݴ�9?�s�c�?����0�?�����?��g=��?�&����e@���C@�o@.�@휡�*�@JH�9;@�Tu	+s@|U(�@��1V�@aа@�x���@LG���@=:�<
�@ �0-9�@"a���]@$.A-G��@&���1�@("�Ŧ�@*K147	^@,�3����@/�6�@0��=��b@2 �b"��@3�j3�@5
�6M�@6�=C�1�@8A�*K	�@9��$�s@;���jyM@=�H��@?���:x@@ٟ=�^�@A�� @C	���l@D3d6���@Eh���@F����6@G�b��g"@IQB����@J�����@L+�T�@M�Q�N"�@O8�{��        ?SUz4��?�M(���?�� }�?��@�9��?��yר�~?�9�LLi?��e2z��?���~?��EmR�i?��.�:?��m�(?�>P�*>�?�d|MM�F?�G���@ ��n���@c���@z���L@	��E��O@���'I@��Z�-@�1��!-@8����@�k"k_�@b�qn,e@>��g@ &P�T|�@!� �2J@#��Jpng@%Y��ֱ�@'M��&f?@)_�� �m@+��#�v�@-ߜ�옮@0(���@1q"l�¦@2˂:�J@47��v]�@5��}<�@7G �/V@8��+~v@:�w�$�n@<m�[/1@>M�Pj�@@ k���y@A$�W��@B3��Dg�@CMU�t@Dq��%�@E��Յ|@Fܷ
�
J@H#8���@Iu`�GF�@J�]��z@L=Z�V_@M��aM6@O6�F%�@Pb���@Q0�a���@R�H\�@R��r�@S��%���@T�Sj��|@U�ӆ��O        ?���$�7�?غ�[��?�s���x�@[�D9p;@�פ���@!X��yI@)��:W�@1�N�R3@7]0��e@=�</؍�@B~s5'��@Fu65��A@J�gN�H>@O}��l��@RG����@T�XD�:@W�>���@Z�cGt�@^A�/�=@`�n'7@b��Ş�@d�ّ#V@f��T���@h�	�#�g@j�LH9h=@m0����@o��&(��@q��#�@rQͧw��@s�dٗ��@u���a;@v{:Ւo@w��N���@y���f)@{�l`H�@|�J[_��@~h�FJ��@���+�@��T���@���R�@��3x��u@��q�~/�@��D��Cn@�б]���@�ܺ�¿/@��c$��@���P�j@�(��8��@�O&��AO@�|]d���@��>�'@������@��S]�@��1$B@�ay�e~�@�K��̍@���L1�!@�lFZ#@�!}M�W{@��:9cDB@�����^�@�Vao���@�� N        ?b�.S@��?����$�?�w���F�?��vp��?�G@u.9?��޳�(/?���:��?�"t�m>?�2�w-=?���'h ?�%T}�T�@ |��@��}B�@*��5t@
��`�@ m�֣@�Q�e�@��Co�t@w�w�@rV�@���u@��<zH�@ �T�r6@"���C+@$3��<k@%���$�@'�A���@)�����	@+������@-�5��D�@/��.@1�e.`z@2F����x@3~�Paȷ@4�l��A�@6�q}��@7o#�w�@8�P�?^�@:N:�
��@;���ղ�@=`����w@>�Ij��@@Sn Ò,@A.��X@BZ}���@B�lk6�m@C�֕PD@Dی800D@Eր�*�@Fר�.�@G���\��@H�ax~�@I��vҒ@KdQ*�`@L8�
?}@M^k�bV�@N��
�n_@O�D���@PyI1�(@Q�����@Q�m���@R]�žj�@SS6FI        ?Ufi�=?���;{�?�&���6?�S#�+�\?ɫC�?���?�4?�a��n�<?�/��I�?�"�Ʋ?�$�&#.?���Ou'?��� ��@��y�j�@�A��@	]�$u��@��48�@"�Pk-�@���MӚ@k��f%@d���H�@�f{{�Y@ J�@�J@!�^�m�@#�%��e�@%�PU�C@(!�ҧ��@*{z�T�7@,��ѷ��@/�hp�@1@1-tJ���@2����\�@4(�>� @5��ǃ�@7qEuA$V@94<�x�@;#��vG@<��ܼE@>����W@@�n�i�`@A��I>@B�0ň�z@D�}��@EB!���@F�ͣ!"@G�"�i@IUHf[*@J��6 @LR�]��@M�q��/@O���7�]@P�,;\�@Q~�L�=@RfM��)�@SU���g�@TLp�a�W@UJ�h��@VP��S�@W^l�.s@Xs��웹@Y����@Z����@[�SS��@]5��        ?MK�����?|㚈Y#�?���Lm!�?�'�/��?����7�?���j+�?�Q1ɖs�?���;�?ݱB�Y?�e�[��?軛�|�B?���(�e?�	�+¥I?��#�9�?��%LS�&@ �5`@m7]��$@��^�@
O�3$@L�8���@Wq��%O@�sx���@[��@3%�i��@Hs�y@��RK�@!�B2Ŝe@#��
Rc@%�ѹ>I�@'�P
8q@*;�e�@,��g�`Z@/��ni@11l%rU�@2�V����@4Z�4@@6�DfJ@7�A�.d@9Ѵ�l�e@;ז��pm@=�9�v@@Ts�+@AE뒝2@B�h>��@C�T'd�@Ebb�_@F�T���q@G�jp�0�@I~���@K��
��@L��U�@Nj��@P�ui�@Qt2M@Q��^��@R�0� ��@S��C��@U y4�1@V��|~@W3�?z�@XZk�x#|@Y�,��y@Z��[�D        ?�&@4�d)?��9��&L@��b�@E�֎F8@'��3�J�@3!3r��@;�U�F@C2KL'@I9b�7�@P�Γo�@SӺb��@X&��^J@\���q�@`��*e.�@c{$�9�@f\_�w��@ioi� 1@l�'�T$ @p?P�$5@q�-d��P@s��9���@u�/�/i�@w�9��P@z/��ǟl@|o�@~��p���@���G7.�@�)����@�\��Jn@�Ķ�a�@�:mY#3P@��?�:<�@�P���@��ZR�%@���{��@�a����@�|Ǜ@�A��L@� 7z|vF@� z�g@�	��I@�7R@U#@�3�b}O�@�U؁&@��bfn��@��`W�p@���멓�@�2�.F�@�~�d��8@���n��$@�����@�����m@��R����@�:��ŝ`@����o��@��y���@��/j�0�@�K+�A,�@����@��.��@��A,�&�@���(���@�vĠ��        ?ew�6��?�5v�%x?�Fc~��?��� h4?�r�ߧ(�?�K�{��?�x���/?�ŠF��y?��w��1?����ㆊ@ ��"��j@.ʏ�α@�����@_ Xp�@}AȻ�@��1~5�@�P@R%�@kH���}@fXf���@�Z}qC�@ �WS�&@"�M�S�@$B�%\�@&g`^�I6@(d�h�T@*vq m��@,�zOU��@.լE*�'@0�|Z�#�@1����ם@2�F�A�@43�D1X@5zG`$�@6�j��a.@8#���X@9{Yи�@:���=�@<L �!��@=�gқs�@?:6���k@@^;�f/�@A#)&�@A�D�Y6@B� ��j>@C�=kU�@D\r�R@E3l�An�@Fn��9@F�j0,@G�5��
�@H��'�]@I�7࢈�@J�-�lR@K{\��e@Lo:��Y@Mf���du@Na���jo@O`��i@P1��@P����oC@Q8S 7fe@Q���{@RF��� �        ?_FʳO�?��G���?����>G�?�SgiV��?��Y+�R?܃��څ�?�ӝEE�?�6�V�s?��%�8E$?��%wh�z?��J����@�:KF@�1a�@	l��_��@��:�ҧ@$���
?@���66�@Z��,��@EU�@gÆO�@���[|@!�5j���@#��_H�@%��� s@'�+�$��@*!�%�X@,��f���@/.�}	�@0����@2lQ�LW�@3�`;pp@5���!A@7M�9h�@9̯@�@;��U;@=�|� �@?!j�$�@@��E0@A��S�@C�cI�@DR����@E��]B@G�ٿ@H�+	N&m@JAX���@K��ut�@M=���h�@N��P�@P]do��x@QI�O��w@R>�>�@S<�#�$�@TD���@UT���p@Vnt?$<�@W����@X�	+��@Y��Nf(@[79���m@\��'���@]؂f���@_9li�@`R:Њ�        ?]5(�C�?��LA?�?�q��4?���"H.^?ç�|��?�T6��z^?��]nʩ?߾'-
�X?��^Z�?�	��;?����M�?�է����?�4m�?�x�@�o@��QA X@��k#{R@�(T�@�h�U@@��N[܆@�@
��@S{�p��@��v�g@���*n�@�QY�?M@ú ��R@!��19�0@#pv�?�@%l9�wL@'�����@)�⥾\�@,Y� L�;@/
)�@0�
�F&�@2z�h!]�@4�>� A@5�)���@7�<bz�@9����(�@;�h/=��@=��/��@@ �r\�@AXI#�`:@B��#��
@C�6�P�@E_z2�js@F��⫳W@HdH?��@Ju��{@K���cU@Mu	���@OL?(Â5@P���>y@Q�3/-�@R��!�L�@S��&D#�@T�R�U@V	F�r/@W@��?W�@X�Y(O=�@YѲT��@[+�]��@\�}#�KF@^��ǥ        ?�����/�?��Wf��@E2E�O@ �̃�$�@.�F��b@8n.#_�@A���]�@HUB=��@O��i��@T#u�n3@X�z�0Y�@]�c�2y-@a�����@d�EĽP@g���Z�K@kku��T@oX�ҬJ@qu��H>�@s}t\�j@u���2�@w۵o9Z�@z14�@|���\�@(Ѧ�)@��ۭh��@�Aj��@���M��@���gXn@��/x�T�@�!�]�	@�����{.@�H����@��K�0��@��x�Te@� �0��@��?<��@�ۅ��b�@��g�!
@���Q*@���Z�Q�@�|o��4p@�m�3<@�b
��y�@�ZH�@�UT�`��@�S�E�F�@�U�ܘ='@�Z����@�bt��c�@�mu��X�@�{wGz��@�F4����@��%Io.@�[p�c@��&��q@�v<z#�,@������@��~afw[@�(���7@��'�x"@�Q ��E^@��1�X�@�~�^���        ?ZcU�Q��?�#�ږP?���UE�?�Z����?�0�{a
d?�ߞ�S0 ?ؤ�N[�?��K)]<L?�F|g�m;?�S�|A~i?�j�ƛ?�Ho�;��?�`�����?����=��@R���@��0<C@�>i2�@	����@�J����@#hվ�@����~@�k�qe@�"K	@�H6���@��l��@�0��R@�@ 1A�UGk@!i�`���@"���w�J@#��I �@%W@�W@&��$r5x@(-҇@)��f�3@+18�{@,�IK�,�@.`�ڐ��@0jU�#�@0����@1�5P�@2��!��@3����9@4{���@5qT����@6lp�q*�@7mLY-�@8s��$�B@9�v��#@:��K��#@;����^@<�*`�%�@=����@?��6�)@@#K��d�@@�\�v@A[�~�j@A�k�`��@B�u���@CF�|+�@C�$�k{@D�� �O�@EL���        ?(R�P~?[�0�0� ?yŽ��W�?��<z�?����m8�?�\�I��?��ܓ�[Y?��v� ?����0�?�`�-�G>?��]�r��?�E"6}��?�n�|u�?��2�?�,C(��\?�5��Q0?� ?τ@?�b���?���A���@ �+�n)�@�0%�c�@��%K�?@
N��0z@#yt@+Ao���@vb ��@�+"�@�����B@���H4�@���b=�@!�^�+@"� f��b@$��tG�/@&��x6�@)u�i�0@+g�IB@-�L��b@0?��F+�@1�vY��@3�-��h@4�^w���@6<dH�w�@7�am�,@9��e�h�@;�]�@=�� �@?�	zj�@@֟!�x{@A�=�@Cq��8�@DN��_��@E�t8ǐh@F��~�@H7��2�=@I��bl�@KU�!@L�����@N*5�n�@O����p@P�#����@Q����EZ@R���ħj@Snv�a	        ?J��82?w_J��#?�~�Z�Ye?�P�ސL�?���/��?��KRf��?�No8�#�?��eAM}?�Q�18r?����z�|?�~'2���?��k��?�¸H 5c?�P�/�?�0OBfs?��\�&�@ /
�,�M@ۀI�y�@�0�JZ@		S�@����7Z@&%��g@1u��#@b��4@���rHR@=�#2:@�$Zx�@�k䲥@ ݋ܭ�M@"rm^��@$6p�S�@%�G�5~�@'�	�YH@)���sy@+�s���)@-�!1�G�@0 ��cY�@1)V\N�@2^Rd�@3�-�|��@4�s����@6L#
;@7�0�"ժ@9-�m��@:����Z�@<G(4���@=��叢�@?�?{҃@@���#�@A��+�!�@B�烤�{@Cv��@DtA҈��@Ey�A�V@F��M���@G��Ћ&5@H�-���@IޏJy�@K+Y�@LBW��@M�o僝�@N�M���@Ph�J        ?�9=-$ć?���o�?�~�N@����@5`c^4�@�y+�@%/H[��@-����g@3%�C�@8"k
(T�@=���\@A��&>�@E^֐��@I�q�1@L���xrr@P��C5�Z@Rԭ-��@U7&nw@W�Rrf�G@Zg2$@]4�o�>�@`@�8�@a���x|I@c:CM_@d��f��U@f���F��@h|~���;@ja��[^@lX��B۾@nbM�}��@p?���|@qV�YO�@rvQ�~`�@s��A�m�@t��a�d=@v`Դ��@wQ���c@x���f@y�U߫�@{T���{V@|��P���@~.D�a��@��Al`M@��}	y�@�]JVu@�(�	���@���!�f@��<�."@�������@���^Ծ�@�n�f��@�Y-���K@�H�����@�=�v
n@�6����@�5p��]`@�9V'o��@�B`�h>�@�P�1!�@�c�|�9@�>@��@�����@�^���>        ?OfA����?��ii�?���O�?�/w��g?�@F�7?ȧ��z?�Z��+p�?٥49�t�?�-��:?�zSR��?뒁pC*1?����?�OS�=�?�6�td"?�&�i|��@ I���(:@����@:�W�Pv@��I��?@
�8���@�u=>��@����?@X�"�]@*�	�@^���
@b�7�.@0�1/e@dPQ�b�@��Q�@ �b/�@!�2;��(@#�i	�@$q�.f �@%��7R{@'M^˧�@(�-��@*^tJ'��@+�>�w�@-��:�h@/]R�֠@0���g2@1{h��@2k���Ê@3b��m��@4`��
�@5f�)��@6q���\@7��oΥ'@8�Ia*8@9���; �@:�P�:�@<�	 ��@=J@i��-@>�̸���@?�z��UP@@��`�^@A3�#���@A�����@B�!+*F@CEw/`��@C��˅�@D���S6�@Ey����R        ?1�yM�V�?d����*�?�P�k�?���y�1�?��e�U�?�=a��ұ?���Ѝ��?�J��T,?�X��r�?�(�Q�?�:S�Hz�?����w�?��7�ώ?�Ȗ���?�RjGIf?�F�vq$Q?�����?���@/@�,�
@&d���|@	̵� �m@�g����@,c�r�@��e�$@\^�NP?@S�<�l|@�= �Y@ ��F��@!�	j@#�$��� @&/rW�O@(�I?=�@+j 5{�@-��e��E@0U�%��@1�G�y�!@3~��,@58 S3@7
�y��,@8�zq��
@:�
f��I@="�>f�@?a ��@@�ke��@B��=��@Cfx�@D�@G�Y@F+��= �@G�֫���@I0<o��@J�X'�@Lv���b@N3P�c�@P �=��@P�e&��@Q��E��@R���FJ$@S��Z Z@U
����V@V(�%ӏ@WP²l��@X�����@Y���K        ?8ڸ�[8�?f�f-�>?��2%P�?����y?��;5��?�*K��_?��qgA8l?���h���?�V.f$e>?�1h��a�?ך����?� XsG'?�^��U�?����j�?��F�,?��:�ِ?�$�З��?��"���'?��^ h��@ :bg�T@�O(�9J@��v���@� ��@�>�z]@��75�o@�O�-b@��j�/@S]�2d�@��6� @��M@۳@s�����@ ������@"nm�e@$1W���@&T^��@(�\��@*%Q�hE/@,\�y�Ɋ@.����@0��{~�@1����/[@39��i�f@4�V�@�l@6!����@7����@9N��b@:�����@<®�WӾ@>���-�@@?����@A=f�}+�@BDn�4}@@CU8�R�U@Do�m��G@E����.@Fßì�[@G�돞��@I@�-@J��!�@K�M]Ե@MLg��Dl@N���CY@P��o�        ?�]x'��?��@5SZ?��WM�@ y�J;�B@�9&4�r@E�C���@"�(w�T@*Q�$_�L@1�)��;�@6���=��@<BZ����@AK4-q��@D�����@H�&qMh�@Lµ��z�@P�H���@S
�.�:@U���ఽ@Xd��>��@[U��#@^r�W'�@`�}`�@b�®Ll@dpW~Q�w@f\R����@h`7ş1�@j|K,��@l��2mr@n��ޡq@p�&:� @q��2�^-@s>j�i�@t�����@u�H��N=@wq�T�0�@x��f!�@z��ɶO@|~����@}ŉ,�Ŝ@|�tV�@��	�~�_@������e@�xA;��@�nmk~@�kG���@�n�ۓ�@�x��kJ@���D�5@������H@���W6@��|��tg@��i�\�@�@��7o�@�yn���r@���p{}�@��*@�&r��֥@�м5��@�~���!D@�0->�0@��m��3�@��n��^M@�[<�l�W        ?Z̢0���?��	�¸?������<?���+�s)?�Q��1ͷ?�.��;m�?�9Ht��'?��E�[?�V��*?�a�����?���@ۉ?����L}@ ��+F@�_ �[4@WK��@
�5jj�$@l�ox�o@=�|X�@f�T��@���Z��@!�^��@�;&}@l��ڦ�@ $�nȌT@!���d�@#97��d@$߃���]@&������@(d�J��l@*CZ��1�@,5W���@.9�r��@0(���J�@1=���&:@2\ɗ;p�@3��*��@4��WX@5�W�rLC@77D�)@8���ّ�@9�Զ{��@;?��j@<��96@>��ep@?���X��@@��c6	@A\��g҅@B+T���@B���%<�@C�\�d�@D�46�@@E�[s�0�@F���B��@Gn�"Y��@HbP>�7@I[Sݑ��@JY�bcߘ@K^6nuE@Lh&�H�R@MwĦ��)@N�K~�u@O���O@PdESSa`        ?J��
��?~�g.BUo?��l(� ?�b��?r�?�?v_�0�?�ح���?��V8@�?�AήY?��S/�?���-?���L�Z?�l0�?�Vr�h�?��$R>�?����O��@16 劳@Px{�@� P!7a@�HƟj�@g��@��6��]@;���@��M�"@��k��@*3�a��@ Ш��7@"�X���@$�G3Z�@&Γ3
�1@)\��T�@+�����@.�U6�@0h�0@1�J��Gm@3a�m� @4���ຓ@6�����6@8}}��~u@:_���@<ZU���@>mi�H�5@@LǾt@Ao�vKx@B�r����@C�}�B?S@E&�P��@F K���@G�'��%@IYC�LBC@Jۣ�7@Llo :�@Nˁ
P�@O�ձ���@P�QB2�p@Q��F��@R�S|m��@S��G���@T~�s��b@U�.m��o@V��Q�!@W���:�}@X���]��@Y�>�ĹO        ?�"�4!?Gn]O�?f�»��?}|3({�=?���5S�Y?�	�L�>?�b9�ͽ?�5� �@?��x
4�?�;Tg!/?ʐ�ȳ��?��N	~iL?׈�RM?�c�\�oM?�K�}$?�#�5���?���-F�^?�-<)Qf�?��r�'!?�7��r�?�o$@=ow�6�@Dܙ�Y0@�n���@Wūf��@6E�yV�@r;}��@�(��~@�{x�p�@g����@�UW5�@ m�6�@":7����@$(��@&:(���~@(p'b9]%@*��E�c@-O8sq2n@/�1�&@1h�oxt@2�E@��@4�D����@606V�@7���@9�dz�k�@;�?1P�@=��Ӏ�@@^@<��@A+iN��@B]?f��@C�$^�o�@D�Y��()@FH [c,@G����0~@I.U��dW@J�=9���@LQ����@M�����V@O��=yF�@P��T��@Q�oH^��@R��d3�y@S�1S+�        ?�0�A0��?ۂ�*~�T?���]��|@�c���@z�n�sX@$�vG!��@.F�u�O�@4���t��@;�F!���@A��U���@FK,�{8@K;�mL
@PUHn��@SL���|@V�_t=[�@Y�wՏPv@]��M��d@`��eĽ@b�Q����@e8���@g�mJ�Ŵ@j(f�u�@l����@o��K&�@qR�p@r�5���@t�*�"�@v9�C5�~@xu׋��@y�a�v��@{͕��1@}�!SЍ@����0@����!�@�&#�P@�NP��$@��C�n,@���˔�@��En&�@�P��
e�@�����@�1�@�z;hq��@��@p���@�rJ�)5@�~��P�t@�IS��>%@��K/@������@�� q�E]@���4+�?@��yc�f@�vψ�H�@�f�&�a@�\���r@�W.,���@�W�\���@�^T�F�Z@�jq�4�@�|:�f�@����5;@����j��@�i�)�3�        ?TjȦ-��?�:xl�A?�c�%	A?�S�M|?���v1?�{��F�?�=�j��?�����Q�?�|N�|HD?�?|���?�\�A�	?��x�&<�?��L��H�?�>�g�,�@ w%K��@��W��T@�h��@��Tp�@�[	.�@����@/�a"@ R0y7�@�Y�Z$r@���b�@��<��@-$����@r�5�*a@��K�F@! �9q�@"e�E=@#�o���0@%B�l�
@&vN5��@'��6@)bb�nW@*�%��g@,x�G7��@.RF�k�@/�I�ŀ@0�b�1�o@1�ޣ"N0@2u���@3]u'k��@4J�	�^@5<��i�@64xD4�@70�::��@82K�MER@99+	9rF@:E?-��q@;V��4�@<mǦ9�@=��b-�@>�٣��@?Љ6}�b@@~)��~�@A����@A��YL�@BO蘷^�@B�{!e�@C����@D9|~+� @D��Q��        ?03�`�d ?`WkU�?{�oW> U?�a��)�+?�@A���'?�3<�� '?�/�̆M�?�V�3[?�lwy�/�?ˇaU0�r?�t����?�D���\e?�l�ç{w?�T�
IL�?�1���?�l#���?��.Ke�=?󲈀��R?�O\���:?�`�v5�e?��Ϥ-�@���r@Sg�0�@p�Hye@�o�� �@������@��a�v@Y��8�@�x;��w@!��X@�q���=@��?�@!$��h�i@"��_G�D@$�8J��)@&����@(�	��R@+-�y�F@-����q@0D{��@1j����@2�O��@4X]ʴw@5�zх��@7� �m@9X^��0�@;/�'�}@=����@?!�w�J�@@�@d��@A�N�Z�@B�QF��K@Dos���@EV��?6@F�1�س�@H`c�F*@Ikt�X�@J�.��@Lj[9�5q@M��	���@O�?`y�@P���PĊ@Q�@� eH        ?E����.?tI�+'̉?����!�(?��)�ˌ?��<�Ŏ?��mO�R?�=�m�C@?� �-�?،_)�$?�-��L4?��o� ;�?��] �?�$��+?�q��>?��z[��:?�:�^�@ ��i�:@��긂@��L���@
?�1Ja@(�4RD@;�d�U@���@/���D@�ͧ@SE�,�@l�����@!���7U@#x)\�ײ@%�	m�R@'�"�Y�@*@)�S@,��3r2$@/�}�@1H�2�|�@2ۚ��F@4��ﵜ@6N���M*@80��Zn�@:/����@<Kn}KJ�@>��c�g�@@oee��@A���0@B�A��G�@DWl�ǜI@E���J�@GH��+�@Hܔx�@J�q��ξ@L=�B��v@N�����@O� I�-@P��BE@Q�ƾ�r@S	�lh�@T%��[��@UMO��@V�K�@W��Դ�@Y	��[@Za0��@[ĥ�Ru        ?����ԣ?ҕ�RȢ�?���y��@|���|@ �зhX@����Z�@$q�b�J�@,Y���*�@2�Eե�U@8@����@=�v���W@B6qc�@E���T��@I��L��A@M�OBQ��@Q=�	z�@S�t�],@VH�7�@Y�ΰ@[�a�$�@_��P%@a+k��$M@b���2"@d����cr@f��Z��@h���TE�@j��#	$@l�B�M��@n�F)e�Z@p��A�p@q����@r�,���@t>D�҂b@u�6&(K+@v���^�V@x?{Di:s@y��EI�@{Ə��j@|��óm@~���*@�&�G�]@����p�@�vQ/ų�@�L�Tٟ�@�(0+�@��2���@��3���@��k_Pw�@�Ǖ�%>5@���>zܘ@���l��@���'9{@��5�n�@��w�64@����LC@��DH��}@����&3@�	M�#K@��=�V7�@�-�񟲓@��ΔB�@�\j*K@���Q(        ?\9�h��?����?�k,�H�?� ��?�h��L|�?��!��_�?��� J?�B�� ��?�mݖh�?�΁����?�i	�~�?���f;�@T�{P|@'���)@}n
��@��v,@�� �@�B��@���m�@���;@�:j��@5,Q��@�<��@ r�/x�@!��j{�@#�*�@%A��qP@'<��FV@(�B�tO�@*��%��@,�����@.�""y�@0k�3�0�@1�y�,?@2������@3�:���@5<���R@6D�`d��@7�E~Q��@8�bsȇQ@:;I��$@;��Զ�@=��vz@>����@@��f��@@�NvBЛ@A��tLQR@BiK��Ղ@C>�'͸�@D脈` @D�	#CY�@E���l@F��N��s@G��?X+@H� ���@I��XVU@J��)q�G@K��^�@L�8פ��@M�V�u�@N�v
��G@OП8��@Pum4&�.        ?K��*�?�O��i�?�^.$���?�`�$̩�?�i��>?�5E��-?�jT��w?��n\�?�i���?�پ�D}�?��]Q?��4�#��?������?�M��T@�RigE�@0�T��>@
 �2nƧ@� ���B@��*<�@^x�T`�@Q]o#z�@�]�@����@ �h�$M@#:f��@%E�7�3�@'����e@*Jo�>X@-���Dw@0K���t@1�����@3N��$�@5��/O@7���o�@97���@;%[Ĵŧ@=b��.�@?�����[@A��L��@Bia����@C�1�@E3:�<�@F��6w��@H?�W��@I�Q)��H@K��w��@MP��Y(@O$�Ғ�@P�+���6@Q��?��@R�C�i��@S��-���@T��
�Th@U����@V�'����@X.&@Yl���w@Z��;�@\׭`S:@]fIƌ)D@^�?��/@` rn�^,@`�2K��        ?4�����0?dZ֛��5?���8�&�?��-PP�?�";O��8?�����?�	����?��V�mU?�\k�C�?��@VX]?�Y�b��7?�^wc1?������?�(��?�]w��z?���c?�@UR0:?�T��4Yh?�����@��Ġ��@y+�W&*@�����@IZ�5�@:�4�y@����g`@#�B%�@�'0��@}��9!�@C���@���~�@!�3f�y@#u�����@%q(�M@'�:� �@)ʥD��@,*�4�@.�W�W@0��J�?�@2;�i�@3��)�M@5"q]l@6��u$>@8W�TV�q@:1��[�@;����_b@=�v�Пu@?�*�@@�i���@B��m�/@C%x��Z@DL���@Es-"�@F���4S8@HG���@IV��0l�@J�54�@L12WW�@M�9���@O7U��@PK���B@Q*Fǐ@Q�̖���@R�Un\y        ?��0A���?����Q�?�虛m�N@�0�}�c@t�l-�C@&������@0�J����@7S	�Ҕ�@>�C5	ϼ@C�����@H��	n�@M�kJRգ@Q�L�ڌ�@U4O����@X�!�1d@\��~��@`RE�� @b��M�/@dލƥv�@g`ؓ��@j
��B�@lަ�ì@oܞ< �B@q�c=�@s+�����@t�@L� ;@v�7~R�@x���YV@z���I��@|�치�@~�B,cs�@������@��=�4t�@��мE�2@�3A�FI@�~�^�΂@����W��@�5�j���@���z���@�����@��}���C@�'N���@��w<Q�/@��N2�q<@�����,&@�bv^�@�Czm�^@�)�#; �@�8��@��aou�@���\.W[@���1�� @���/���@��Ճ��	@�C��@�l`�@�)��$�@�Cv�սv@�b5����@�C�#&@�׬b*.@�n�z�8-@�� ��|        ?ATq0��?p׬=oe?�)S��0?�	����?� #_��-?�3<q��`?�IW��Q?͞����?��`b��P?ك��=ˇ?��[A�"Z?�{w�5�?瓷ޑ�?���]\�?�[��Ad�?����͉1?��Q�*Ȫ?���Z�tx?������w?�W��p}@}Ts_�@j=0���@s��:�@�a���8@	�!����@?�E�/@�����t@�I�Dɯ@�j��]@~h?r�@��(,S @����mz@4	� �%@�_��@���=�0@���u@{Lq#^@ ��&��@!��W��>@"�V-yӀ@#��p�3&@%(�<��@&]cƛ��@'�e��_@(�
��ƛ@*:e�G]j@+���-�@-{��W�@.xX��R�@/�-]	�@0��k��@1�}e�R@2]����@33*�t�@4�f��N@4�Cݸ�@5�9 Z�@6�ǭ�}@7����@8��1V��@9�U�r@:����4@;��ҥ�        ?���ue�?P�RsA�?p��P�?�v͚xa?�����F�?�w_��?�tK1Wn�?��=�QjP?�'Ҭ�̈́?��L���?��'<>F?�'���}�?�GW_$?�F��,�R?��+V��?�~v��^?�1J�1?�\|�x��?��k�?�0hc��?��Cm���@z���@Q����@q��0[�@���dJ�@�H0��@���dn@�gcW@_�AOK�@����@�vĵS�@���$@ �!���@"{#
9�`@$<%��@&���j8@(u:��@* �����@,Oy"ƅ�@.��'�ػ@0��c�0�@1�9���@3����@4y�?S�@5�b]N�@7m��ז�@9 �R�*@:�(
FE\@<W*m��@>b^��@?�襸�@@�Ĕ�"@A� �HZ�@B�a��g@D���@E#>�"�@F<�	�@Gi.���A@H�oB�8@I߳��	d@K*#֠��@L~䰄c@M��h5�        ?E��!�I?u�� 4�?�:O���?���\��?�n����?�!�w��?�~$���?�
��P!?�	mE"?�})��uk?��0��f<?���J.?���U?���w}�H@ A`W/�@Y�nGh@�[w�/P@
��'�#/@�pi��@�A�|sO@z���@�u�jpl@��3B�#@��h�z8@ e+���@!��+�L�@#�fŅm�@%��b,�&@'˖��\�@*Qڠ@,o�ڹ�@.�F~�@0� �J��@26pe��@3� 6��{@5=�П�@6��Rϸ�@8�(�UH@:d;����@<G��	]�@>C	*5U�@@+$��@AAA#m�@BdC�s>@C����@D�zjKg}@F\�R�U@Gx�D[4!@H�%��  @JX�����@K��!��'@Mt	N��@O�g�،@Pf3���@@QG���@R1���%�@S#%�!(�@T�&qH�@U�'�<@V(�	�(�@W;ѫ5p@XU�Aٻ�@Yy!p��        ?����&?�2j��|�?⳵�>�?�9>��@�R��w�@��B��@��yŗ�@!��DO�@&�ىnde@,�œ�t�@1���@5Գ쉦�@:6��<@>�`A2��@A�CX�J�@D��9�?@G�(Y٬)@J�]~X:@M�_�`�@P��]�p�@R��k�o�@T���@V���n@X��]�q�@[9�y�w�@]����?�@`��*T@an�����@b�'�7�@dG�=��@è����@gb:��^@i	G/l�@j��IV�@l�!��@nj���>@p-�͓�v@q/��&?i@r<�-2@sR4� Rx@tr���+�@u�?�'@v�aVm�i@x���@y\lJ��@z�xv{�@|>̷�=@}{í|��@~��'�@�8���N@���<Ϥ@���X
|@��#�_K@�n���{�@�J���@�*���]`@��lcot@����8e@��du�@���3�L)@��S���@��2;`E@��n�I�Q        ?p�:�{��?��"���?�i��JՕ?ͷ��e?��}��m�?偵�8b�?�r����9?��3~m�i?��f�t�@2t�:��@��Z���@��&8 @��f@�G���@�H�q�U@S7�@TG��7@!W��		@#>���/�@%�C`{�@'��^��C@*|&)^q�@-&m�Λ@/�1��@1mD/Sd�@2���p�@4�x�:<u@6*�#Ƭ�@7�n{I9@9���Mp@;r�	t�U@=S�xN�@?C�#��@@��w��@A���Z*g@B��K�A@C��n��9@D���N�@F�q)@G-V	;5@H\��[)=@I�d���A@J��ΐpC@L*c��@M`l/��+@N���L@P��^�@P�}=fz$@Qh�渕w@R���@R�mӥ�@S�D��@TT�͚�@U�y�,@U�.��M�@V��
�u�@Wq@��@X?4،"b@Y�WC�@Y�Z
�v@Z���Z��@[�����@\n�u6��        ?oϺ0�o?�1
O"p2?�I�.���?Ц��՗o?�|E�4�j?��Z�~q&?�j����v?�,끎��?���.=ħ@r�:ۨ@����s@
~j��;@KOdȵ@<=^��"@cB/@�Tb�_6@"p���Y@{�D�,@!�����@"���@$��s/�@&���6@)�=9
�@+c4�:.�@-�,�9@0#�$	��@1q��/#@2��ْ�@4;x)'�@5�mr=�4@7A�\6u,@8ܶm�H@:�V#���@<D�̙�{@>�~d/@?��d��<@@��p�@A���@B��Z���@D	��b�@E2��X�K@F\�ˈ�@G�z^�O�@H͆����@Jt�'.@Kj���@L�
0��@N5<`s�B@O�fz�`@P��*�-�@Q_���@R./�y}u@S���W@Sޅ�R�@T�Ƿ�j�@U���n7�@V�T�@W�bt�%@X�� jf]@Y��k7;�@Z�&�'!@[�
�ߪ�@\ԓ ���        ?p�&��f?�H4�?��u�1�b?�ʍ)�!�?�d�}C�g?�;���t?��n��ZX?�`�l���?�I�Ł?�rT�n@�E�j�@��yn|6@c��@+��}��@��*���@�G���
@�UY�@w��}�A@ Z���@"P� �@$'f���t@&cX�5�@(��bl��@+D��@-�MP�@0[Je��@1�X�RqO@3`����@5��b1@6���7�P@8�^#E�@:aZ��\�@<Wy|��v@>dC�v�e@@D"U��@AbjX��@B���@C·�G3@E,lwF�@FV��l��@G�.%n@I!U"���@J��Qv��@L%+�<t@M�n��@Od�C��@P��_�@Qq�s�g�@R]%3:@SP���*�@TL�f	e@UQ%G%��@V^���@Ws��p��@X���(qA@Y�kEX�@Z�;�6@\"t�GN�@]d�6���@^���B@`��l�@`��5k�	@ag(��i�        ?��f.�_�?�	�N��@Ab�|!@)�aZq@7S��C��@B`~D%l�@J��È^@R5��@W��޽��@]��õ�@bJ���}l@f4P�
@j8(
��@n�M��Y�@q�7��o�@tZ��r�@w `��#@zd���@}"	���@�'���{V@��{j�~�@��;��F@�o���a�@�W0�o�@�P���\.@�\<���@�yɖ�K@��4�5E@��1D�'@��`$*'@�JېW��@���/��k@�*�8@�	�p	z�@�X�`^�H@��=@�vo�1�@�qu/�*@�ܱo�w�@�OX��[�@�d~u�˧@�$Η�ڛ@���;#�@���Q�z�@�z����@�H� ?�,@�6�Р�@���)��C@���xv�'@�����*@��
 �c@�aѦ��@�E�v�@�+ͮ�[~@�L� f@�w�
�@��?��~@���ϙ@��e]&F�@�e�\6u�@��!d#M@�_��@D@��1����        ?j��؂�?��"owT?�����?�:y�1�?կ�T��?�/6\�w?������9?�� �*?�'\Q�G?����-�@Xe/3��@�V\
�@��w�&@Ie���*@��ɚ��@uq�O~@��`�@���́�@��o1Z@~��E�@!-��p�@"骶��@$�?\�q@&����P�@(��?��@*�]���t@,��,6��@/��%�@0�(���f@1إ�jY�@3N�'�{@4X�!�7@5����@6��#�>H@8b��Jh@9�_|Y�Y@;F<�@<ƣ����@>Q3��4@?�+$�%@@�z�e��@A�&*g�Q@Bm�/z�@CJ�G��:@D,H��+�@E��%@E�Aq�@F�o�&*�@G�t#�G@H����@I�"Q�M@Jԗ��3�@K�D�J|^@L� 
��@M�"��+@O G���@P
�;��@P�s�2��@Q&.<�[�@Q����@�@RI��uqj@Rޭ*U�.@Su��ni        ?i�^����?����j�
?�kߏ9��?�1��@�?�U���J"?�t�ṱ?�p�m���?�Ih)�GR?�by��?���@i~a?�I����@=n��� @�`�l�@	R�� �@Slyg;'@���)�@&���$@��:�3@Rǫ	�@.SMwN@:r�
�@ �s:�;@"u�H���@$J8�3I@&::4��@(GI�f��@*r$3C�@,��-�#�@/$�;@a@0�L�4c@2,�\��@3����m�@5�!�Y�@6�P]�s�@838��|,@9�5J=k@;�Z7kM@=}r4�?D@?h�5���@@�b��8@A���jw@B��.�@C�'��l�@EA!�;�@FU�g�C�@G�3�!��@H�b4T`E@J=C��@K�Te'@@M�+���@N����@P�ǈ�@P��R�<@Q�~`�H@R��؎�@S`�b"�@TFa�[5c@U3"@y�v@V&��]�*@W"N��j@X$�6�FT@Y.j���@Z?�J�Y�        ?^��i�?����QO?���l�_?��_�v ?�]�by�?�m�LP�?�{;q��?㯜P.+?��ϵ�?�[	F?��N�DZ?��%��a?��?��@["����@�w�t��@	�֭@���0#@��Ǐ;\@�q���@\���X@	1�:I@�XZw��@��A�@ �Aq�(�@"nȑ2��@$R��,7@&U�F<�@(xϫz�@*��˕�@-"úo�(@/���))@1+UI?ޝ@2���z�@4�IE�@5��vM8@79F)��@8�zdE_@:�oc>{@<�����5@>{���{@@?OX��@AJ�F�.�@Baf�q�@C��HO��@D��JI�@E�Q�l �@G)w}�&@Hw\����@I�f\���@K7`��;�@L�~��s"@N'��0�h@O��?��O@P�a�Cw]@Qw��%�@RP���"@S0t��@T�9�^J@UwsU@U�^���@V��d��@W��zy�n@YI�Rp�        ?�b|W8��?�jQV?�@�Z&���@%� �#�@3Y
%�dN@>68e 9�@E�{:q1e@Mu�թ*p@S(���U\@X!��,�!@]�V!��E@a�9��@ev�B��@h�'-	�@la����@p1����@rQj>�5@t�����@v뢈��@yek�}@{��B���@~��δ@��D��=�@�8eXe�~@���iyH�@�Qo`�@����C�@������@�`<|�C8@�+l�Cvq@�3�*��@��r�K��@��獨�@��q��@��m(��@��E���@��=T��@�2C�2�@�R���@�y�e���@��0=��`@�ڃ�U�3@��1�@�S5OT)f@��i��p+@��i�hL@��b4y@�E=��c8@��3:��a@�����@�WR�;�@�lQ�'@��-7�<�@�����§@�?���>@� A�B�@��=oz��@���@�M@�Q��@��P[:@����a��@��� �p@���z23        ?5�s��SN?gܹ<s?�O�T�	�?�!�_?��?�]��ٺ?�J-M��;?�7��~x�?�
���?�D�I��?�d�u��?��YoO��?��q;�N?�j�A61?�5�.V�?�a[���-?����:?�p�+5�b?����9?��%|�D�?��xb.?�[�(}�X@ �8r��@�Q���@����@�p!��@�8+8�@9:)��@�B1d>@@����:@P]D��@���w@W�4��@ws4+��@�@Ҕ@{��OD�@��2�@�~��{@`�1�O@��L;�@ q�3e�@!\�~b�>@"M���p@#E�gY�@$D�Ť��@%J���z@&W]���%@'kH��"G@(�K���O@)�p�3@*ѿ��V�@,B�:�@-9�JzQ@.x��q��@/�*ZH�)@0�K���@10���`_@1ރ�/�@2���u2�@3D�~���@3��>��	@4�����~@5y(ѶB�@6<JgP��        ?�� ��?MC�F�?l�<��	?��1�xF?�6��U�a?�ɶB��?�����#?�Z3Pݫ?�hY'E�O?�,v���?̞ǥ�(?�����?�b���ul?��Z�Br?�X�-t��?���o$�?��R��?���%�?����k�?���WB��?��pոP@ �:��@��ȓ��@y�Q�R�@	�]��iZ@1y�T�@���ΚB@���qO@ш�]�@;t]URm@�U��|�@����@���T>@!^Z�}$�@#"��A�@$�Q��*�@&���J�P@(���h��@*�%�i�?@-�޿�@/hi�nT@0�FI��P@29�BB�=@3���Xz@4�y��
@6z���@8&`��=@9�|�dW@@;S-�/7@={��S�@>�im�@@d�L�So@A`Qk�9�@Bd� �C�@Cs]h,�@D��LW|r@E�����@F���9Ϧ@H�H�u@IJ��m�?@J����t_@K���7�@MD+r�	�        ?.��|�IF?]�2d�?{���O�?�P�f�?�HC�86�?������-?��ͧK��?�`��?�hKsM��?ІP0���?տ\�8?���TQ,�?��i,4?�����v?����/?�O�H��?�3�z�N?�AKL�?�g��Pn@ V�E��@�e8l�@v��V�@�X���@��T]@�Nn�o@�# �ȶ@&9�Q�@���<67@F=��@�/�	ly@��I�r|@ �^���@"�0u8"@$e	��F>@&Fw���@(DP�&�@*_s#�@,��^��@.�.Q_SL@0������@2��7&a@3_SL:Eo@4Ώ��@6O�X�S~@7�n;��@9��7�t@;C�{�z�@=��pG@>��z#�u@@u=���@A{I�ò@B���#@C�/�2rQ@D;=���@E��+N�@G<��6�	@H����@I�.��o�@K:�G.O�@L�a�՟�@N Y�b��@O�γ���@P��3j�H        ?�����i�?����U=?�G�m�?�&n"6Bv?�`���S@& 9o@�g��j@6;�� @ ?�!J�C@%-����@*ͩ�|3p@0���tT@4!�v��@7�R�P:�@<Fn��@@xLc&��@B����*@E��ԑ�X@H�E�8@K͸���t@O&>����@QYӏ�S:@S:�!�@U6F�T�@WK���>�@Yz��mJ�@[À��@^%I���@`O�Á��@a��~��(@b�b�h�@dQH��hv@e�0tR�@g9�F��@h���9�@jP`rt�@k�J�0M*@m�84!h�@oJ�٥�n@p�͆q�@ql+��@rX�u�U�@sKh��.@tDv�F�l@uC�chMw@vI��\3�@wV))Zk�@xi	�0@y��)q�f@z��!/K@{�\J�I@|��� "3@~+4u9@e����@�S�˹&�@���6�@���j��@�J�d�n@���t��@�����@�_�t�@����@�ә�b�        ?p��kG;?�W��#G?����Ҕ�?��Gs��?�]'���?�2t{?���w�?�T (���?��ɺ���@[�V�P@2�l
t�@	�X����@ͽ=Ar@$�@��@ ��:@Mo��6�@���O{@[����}@!��ש��@#��t�B�@%����l@(��C'�@*ka�Y:@,�2f�@/y)�S�@1��z@2{��b�@3��?J�@5t� ��@7���Y�@8�h|?��@:X�i�eD@<��C��@=��FP�@?��д'@@ٺ�+�@A��z�(@B�z���@C�X����@D�i���@F��GX�@G;����@HdT9��'@I���x��@J�21�@L��N�@ME��i��@N�=�4U�@O�@�~��@P�y^nI�@QB���(k@Q񆡚�@R�'�AS@SWx��T@TvW0�0@T�k�U@U�c��/@VCM9Ѿ@WԢv�n@W���[��@X��@f�@YYE��*@Z$���"        ?K�E@x�'?{~�k�ey?�.�׺�?�.���:?��b�cE?�T��n� ?̪���?����O�?��PŁ2�?�w�T�C?�!v;(��?�z�N���?��rxׁ?�54��2?��l�f?�S嚯M;@ ��bGb@%_r.��@y��AY@	&k�@�d�-q�@"����$@$k�d[@N�?}�@�He4�@#J���@й��|�@��u�^@ ܠWȇ�@"{�P�7�@$4:�d�@&*���@'�= �,�@)�;@d@,%�֒��@.j�IBb@0f1�;k$@1����@2�l�@4Wz�B�@5�*ⅪG@7Iu%��@8ۜ�pQl@:~����C@<3���;�@=��F�;�@?ѽ��-T@@���xG@A��@B�2Bf�n@C�$�@Ez�MV@F0�W���@G];��/o@H�G�]�g@I�Һ�9@K㛖ֶ@Ln��y��@Mʰ���@O0x`��h@PO�ܚB�@Qs3w7@Q��-��        ?c�^�p��?����۷?�ѵ7vER?�PC�
#�?̋�����?�����g?���e��?�FXٲ��?���ix�?��R(krj?��o���?��"y���@r�+�.-@�����@	��H�r@F��mj@��Bܖ@$f�z��@�����j@��^�@x�y��@ �2T)�@"��V ��@$��Ø�@&ߧ���@)G�Q�@+�~i<
@.�c�_�S@0�N'�p�@2C�d�@3���z+�@5��p^4@7aJ:-�#@9D�t��@;@gJ�J1@=T�7��@?��6�:�@@咬��}@Bp�]@CV~��@D�Lw��@F,B1ס@Gm��~L@H�,�'Q�@Jy�&EF�@L����@M�3T_��@O�~�� &@P�|�z�4@Q����@R���^�e@S���]��@T��5R��@U���5��@V�n	��L@X'��8@Y^�:Nā@Z��8�@[���a�R@]@m�0@^�u����@`��H@`�о��        ?ų8�U�?���4�@�{��@!�����@0<^]^@9U����@BeS�ț@I+&*p��@P{���I@T��_c�@Y�S�i��@_7E��c@b�Ý��@e�Ǳ��@i:<�Z��@l��]g@poe��^�@r��.��@t�,h�F8@w��@y��3�K�@|�*\�S@~��9_�X@���Gs�@�6��-w�@��W��_@�K8���u@��}4�P@��h���<@�^C�Uį@�/R{S@�А��@�s�-k�@���n�e@�u�7Z�@�4�R�O@�7�"�|�@�Y4��0�@��y��>@��;h�@��~Y��"@�'����@�l[����@��iɞN@��F	�A@�_cV��a@�]�=1@��f.��@��~r�&\@�x��kC<@�1y�RN@��ǈ��@���"�@�j��l�(@�-���F�@����j˛@��Xh4U�@��[��ڨ@�P�?��@��0���@����dg@�ĕ�S	>@����        ?T2����?���� >?��S��?�+Xx��?Ğ/��w?г=S�~?س�H�?�$CH�X�?�N��*?����f�?���0��?����~?�[ȍ��Y?��0�9T@�1[�@�.����@��6W�@
�jvɉ@4�:�ť@ݳ#S��@����w�@��.C@�>-̍@�Ⱦ�`@5��?$@�	qz1�@ 	�cR�-@!U��+68@"�����@$-�x6@%�0��@'�=��@(�LQRn�@*A�MΉ�@+��3�@-�R��$�@/q���@0�弈G�@1�ݯ,�@2�ւn�@3��kUO@4�%eQ}�@5����Li@6�g��C@7ׇ�"S�@8���1@:(��n�@;[��&��@<���b�1@=�ɩ\�@?$�C�^a@@;����k@@�pr"�K@A�E�4+@BQhq��@C�h#A@C��}q@D�Z~l�@EVe�4�@F#���&@F�s�s�U@Gʝ��@H��eE�        ?OW��yK1?�{�9t?�Y��˗?���X�7?�v�6���?��.���?�i��A?ޡx�ɿY?�aT'�ӽ?�?���?�{�����?�KҸǺ?���Z��?�a�eX@\��l'�@RgV=;@��r�@.��H��@��X��@�t�`��@��@�r�	�"@^�.�D@[��=��@�\oI@!��L.f@#b\��@%`����#@'�=��@)�@�Kjx@,4�s��@.���<\@0�2��.@24F.��@3����`�@5\BYOjm@7i���@8�	����@:��O�p@<����@>�hKO�@@�"�E@A�,���:@B�쓢l@D@Ҝ�0@E�N�q@G��P��@Hz�O}�@Jj��I@K�L�jSu@MK�Q�mC@O	���@Pm$a��:@Q^�g�pS@RY>iE�@S]l��He@Tk/��(>@U���=b�@V�쮾 �@W�!�U+@Yb� �~@ZC�e[E�@[�}���        ?+ו�i�?ZmUV6�?w&�N"Zo?��>�c�?��1w�#O?��᥉��?���G?�VۓH~l?�L@
�
�?�Rꅦ�?�xħ���?֮��a?�����D?�vn�x=?�i���F?�b?��,?������;?�̫��?�{qv��?��ĲDP�@  �Sr�@������@�=;��@��
�yy@"r\�@�OB�i@���k�@8g<E�@����+@9�?��!@�+r�@}��@!�&p��@"ؠ0)�@$�#�Bc@&�QL��@(�,8,@*�@U�@-E顦I|@/�-U@1.�kX<�@2��g�'�@4fb�-c@5�q|���@7%@�^�@8�Xbʞ@:�?�8P0@<q�n�f@>`��@@3N��[@AAc'��~@B[m9֒@C���36@D��T��@E��\�@G>���%7@H�x���s@I��X{�@KqU�&Y�@L�̈���@N�=�O2>@P�Z���@P��AS��        ?�Y	��z?ۛeORr�?���D��@����#�@m�#�
@%J��!@/OS�w��@5�u\��E@<wW�f�@B�ͦj�@Fm�����@K-_�Ĵ3@P-@��%@R�U�+�@U�|$:�@Y5���4@\�ߠ=g@`$�Ԫ�|@be�R_�@d���'@f>�5Q��@h~?�ƋJ@j���@mO���4�@o�Ȇ��k@qH6�?�@r�*��B@t p�C7�@u�ܻ��@w1n.}�@x��s�X@zz���]�@|4@,i�@}�jB?|K@�^��%@�����D@�ЍGd�@�Ψ���@��O	�@�ބi�u@@��N�0�@����@�'�g�d@�MT��@�y��i�@���\�n@��@�r��@�&ƌ�r�@�n=�j��@�^d���@�	I�
_v@������@�jOwQ"�@� � ��@���G8ߗ@��j�/@�\G�&@�"��`�@��C\G�Z@���Tz�0@��@8��@�k%�,C�@�HȻ� D        ?m��Ax�?��l`B��?�o'�yԒ?���ԛ�?�ZtR|K�?�����?鿬 zO�?�҈�6?�7�jx�?�����ǜ@I]�� �@/���`@
s~]���@$7���@^��@��}��@�x�#�J@���@�g�|W.@ �&NL2@"q]ǃ�r@$T��u�@&OL�P��@(`���@*���N�@,ǳ��N�@/�fox@0�4k��@2�+\@3Qd�^@4� ��	@6	�k�$�@7v�k�2v@8��@:q�6�_@;�>���@=���~�@?:�׮b�@@t�~��@AQ%ҳ�@B3Fӿ/�@C�-�"@D�x��.@D�U�.�@E�Q��\�@F���;�X@G�Ζ{��@I��Ȃ@JQ�c�5@K-�� i@LK!��@Mn����@N��G�X�@Oȣ�u�G@Py���@Q��c+�@Q�&�ɼ�@Rc��<�@SA�@S��0�O@Tc�.A�@UK�ɳ-@U����        ?^.�PR�?����Vm?��[�?�����v?�KG��X�?���H��?�*]b,��?恪B=��?�P	[%?�ey'�"p?�noW)�?�%�L`#c@Jg�5�L@��Z`�@	�ڌ>y�@B\��k�@����@+c�1��@��֬�@!?:_��@z�r�@ �Acsf�@"yTM�r�@$�U�C)7@&�N��8�@)D8,K@+�2��j�@.EgED�@0�kْ :@2��9�@3��B�zf@5>�=�&@6��׼3t@8Ͱ}��@:�2qWS�@<���Ɋ�@>�Bb���@@�W}��@A��U()�@B���n@Dy���%@E^+]g>@F����@H���$C@I��R@rB@K�<�
@L��Mm�<@N;����@O�)���@P��[��<@Q�VR~�3@R�4���@S��R�|T@T�_�@U��rN�@V�`D%�R@W�|�[��@X�|��.@Y�t~k��@[yr�@\F� ߺ�@]�6��@^ðy®        ?W�� �?�)yP�1?����n��?����?�XP�I)??�Qy��?��Ph�`?�L�x�?�}I�Xg�?�=���U ?�ٳYi��?�Ո'��?��M�P?��/���@ ��
�i@⁕E�"@]/���@
��r�ѽ@s����@Oj"�Q�@��Rm@c�w�@��%%@u� ��@|=e��k@ �V*@"��0G8@$m�4 @&c�n9�@(y%�sz8@*�T�-�@-&�[��@/�z��@1��
�/@2v�|�t@3�Z)|�@5{&�B&@7�ZC��@8Լ��w�@:�=���@<� _B��@>�W��L@@N��G@Af�`�/@B��~�r@C�??LtW@D�OwԲ�@FLk8�c�@G��4��@I:�^a@J��}ؙ@L�D�C@M���{un@O\ޡ�Q�@P��h_G@Qq�M՟@R`��q�@SX&r�~@TX�{�c@Ub���}@Vu�v
	@W��;p�@X�i���        ?���q��?�2�w��M@
z�*B�@XV�s]@*U�����@4��=�!$@>1��Z�@D����Mw@K�j�l�@Q-,��@�@U:=�}�@Y���vs@^�?��pd@a�%���@d�vBr@g�j�h��@k	/#�ɼ@nx��0p}@q/5�dl@r�@1�@t�jnn��@w���.7@yK�'���@{����@}��j�r@�?ln��@���x<�@��/��M@�F(��T�@���ǟ]�@�1�r@��C��@�KAWr��@���*�D�@��ig��)@�J5�w@���`6w@�l��o�"@�YJX��J@�K�wA?A@�C���e�@�BL�1��@�F�q���@�Qk�MV�@�bT�9��@�y���b{@��q�J�@���s"��@��F7�@���^��@�L�(f9"@�E�qb2@��+eI��@�������@�5+C�!�@���q.Z@��`vUf{@�B魽�s@�������@�����S�@�m븀�6@�-Bނz�@��˒S        ??����?pO?�,���?��Ί��??� >6�8?�?\��'7?�I1�H�U?��2��?��5d!�?��f�`�?�5ۃݚ�?��~H�H�?���X��?�@k�:*D?������?�1b�6!?�ո�B�z?��w����?��{1T�?�E�Q���@gLv���@D���W�@:����@J7��@	q�6��@�zJ�@
�еz�@=����W@��i�|%@�(�iN�@.4�!a@���@	�@���@�Ű�bT@� ��@�����@M=�)?�@��(G`�@ [O6��@!>���}v@"(I���@#�SB
@$c��@%
����@&x�Ę@'�N��@('xf!E5@)>���Ѥ@*];���@+��F��@,�:�W@-�M�!�m@/����V@00�L�Ә@0�
1,�R@1~��x<l@2+�l���@2�ױr�@3��u�O�@4G��|=@5�}�~@5��m|��@6��3�w�        ?!L]~2u?X]����P?x���4?�L�`?�k6#s-?����z&?�����H?�_CA�E?��_)�?�q��@H?��t��Q?�>�b?����?�q�����?�.�mfy?���!g�?�N�W��z?�;���ظ?��$:5@ �*�+�@�ś
�@����|@
��g��@戃�"�@g��T@M�a �a@��6$X@~����@oofσ�@�Q�l�T@!��=�@"�6���@$�b�m[�@'P�x�@)b>�>z@+��Uj��@.�*4�v@0����@23Q�@3ϔ�h@5�Yh�@7Uu�6��@9@�3�E�@;H0�T�@=lS���@?�[�ӡ�@A�����@BG�)BlJ@C��j��@D���Ll@Fk2�D�@G�Ծp�3@I�c6��@K,F5=�@L��x�ǳ@N�����@PJ�#Zx�@QE~��H�@RJ)O��W@SY�-�@Tr|X��@U�t����@V�)�إ�        ?6J8�8Xy?c� ?�?��g�I?������?����p�<?����x�?�	�ZG�?���ת?�2�H��?юnB:�a?����}?�GZz�?�`�0|<�?滢�Dn�?��,C:�?�Å$W0�?����0?���0�?��2��2�@ L{�� �@���S�@���ҕ@�2%h�@i�Y@��6�@,�N{_@k��@�a���@vV��!@F���%@K���9@!B�I���@"��3�@$і�ң�@&�&B16@(�f�\V�@+	Ri��(@-[�C�|-@/�4�5@@13�kC5�@2��Ɉ�@4 �v�LB@5��h�9@7'�3�@8ě$�]�@:���\�k@<W�&'±@>A׼�~�@@!�b�@A,�����@BC���i*@Cf�/���@D�J�fR�@E�2�8\�@G�OW_'@Hp�W��@I����@KD�P̱�@L�jm���@NPoq��@O���{�@P�0�} �@Q��m�        ?�:s�Y�[?�}N���?�!����?�5���IT@xh�ѧ�@�nM8D@��Ō��@���P5G@$\3��@*,�0���@0X�%��y@3�El.@7��'_;@<8���$-@@p٫�5F@B�G�C�`@E����v�@H}<s\o�@K�*{��@N��j�'�@Q;C_@R���?zs@T�{�^}c@V��/#��@X��9��@Z��	o�@]!�b~@_r�1V��@`�2k��@b+�r�\�@cuwC0}E@d�ً�Wq@f(�߰! @g��}��w@ijq��\@j���i"@l�"���@m�XkF@oFiAd@px�xN�@qS�zځ@r4�� =@s%R՟@t�T� @t��6�2C@u�K[5�@v�ޮ@�s@w��l��)@y �j$��@z�����@{+
���@|J	RД@}o܀�^@~�l��[@��v'@���6o@�%lI�	�@��D�]F@�p{�5�@�����@�����@�zS���@�.�L�	�        ?Rr:�B�?����t��?���3*|�?��
&t�x?��U�s�?�,�W�	f?�+ҷ�M?�H��?⪊���?��Z,PƦ?��Z����?�:&��N?���}�?��w_�6?��;�L@T�]�x@�&T�#@n����@	;{��@2�Ԁ�e@S�,�@O��C@����@�ՠ6G@�����@�:��G_@�*���@֥d�@v5���@ ����T@!����@#�"�^G@$C�b�q@%��e��@&�f�zv$@(4�/��@)��$��@+h�_�)@,x��fJ@-���"A@/~ݟť�@0�'���@1U�@�ށ@2(')��@2�V�V�@3�\�sߑ@4� ��|,@5��k���@6���љ�@7z�)�6|@8m���@S@9f �Yj@:b����$@;d%�i�o@<jAO���@=ug��@>��2��@?��<���@@Y'��1@@��Iˋ@Ay�orU@B{��@B�����        ?5֦ C6\?fW^�2��?��T��iI?�$�j�?��	�e��?�!���u8?��'��?��Ֆ�?�y�Dس�?�U�$�?��F�6�4?�g�Br�R?�HO;�B?煾4qv?�	�?�M� H��?���E	z�?�}p��b?��.ϡ!_@ ̱���@{�]@v���:@	�c�9�@c���@��O<@ں��)�@8i�@ȭ���D@��_�@��^��@ bik���@"x��@#��'��@%�A���@(
2^@*G����	@,����f@/.E��{$@0�Ґ�'V@2U���L@3��׳�#@5du��d�@7
���@8�E�%��@:���(l@<�3���w@>�5���@@N��n�Z@Ag�<��@B����[@C��"���@E$��X=@FOf]/�p@G��l��?@I��č�@J�n�	'@Le��&@M���Z@OZ|����@P����F�@Qn��/��@R[����@SR�C�x        ?H�{���?vG��?B?�(��(`�?��'Ņ��?�x�?�)?���Z���?�>��l�i?ӄ���� ?ڼ5(��?�锜Q?����q�'?���;��?��Bp�e?��H�~�7?�FlT�?�V$r8@��Ty7�@��Ľ1�@	/Y�7@�u�z@�+�?��@�`���@�xCs�{@Z(��9@_R9@��NgV�@!ز�{@"�*�/�@%"���@'1 T��@)���OP@,�L:��@.����@0�eUzڐ@29%�C�h@3�Z��"@5x�L"�@7;T-T��@9$�Y�@;	��-�@=�q$��@?;��T��@@�����@A�*9�F�@C%��� w@Dn��m^�@E�P�Ѯ�@G*y$��@H�SO�@J!"�2�q@K�+0��~@MT��
k3@O�ԩJ`@Pc��[N@QLm!JW/@R=�'�6@S6���Ab@T9/Jí@UC�A#�@VW%'�?@Wsxs�@X��]��7@Y�">ެ        ?���j�I?�keQu�?�X�N��@^�@�}��b�@����h^@&�rYx��@/�<C��@4�f	@:������@@����@D><e��@H4$��e@L����@P��(Ϯz@S�D�S@U�J�<��@X�uq�r�@[��@��@^с�l��@a-i-�@b��� �@d����@f�4o�(@h�)%o��@j��,M�i@l����@o(��]��@p�#�W�@q��P��@s/:�L�@tu�t�{@u�z��K@w�'�E	@x�T��@y�Z�I�@{c�2�lN@|�g))N@~j���@�HI�S@��֑~�@��ou�9�@�u�ֹ5#@�R}A��@�3�)���@�N4���@�� B/%@���"�;@��i� �@��7be@�❐��@��~b@��h����@��Цe��@�SҌ��@�&/*��@�!v���@���)m�@�FV�F��@���(�6@�u��~�@����@���=��        ?X��_D��?���qT�?�%(��?�j)��?Ɩ##D?�=����?��ROˬ?⭝� �?�����5?麗}_��?���~?���"�'?����j'^@ ������@��5�k@�[ĺ�f@	ʘOF @'�d�)@\�>��@=yZ*iI@7�{u�@Kt�O��@w�H�!h@�h$@��ay�@�r9�~@!!̷*f@"c���@#�2�e_|@%.�d�H@&�M�?�3@()���W�@)�ѓ��-@+U���@,�zd��@.�[��T�@0:N��H�@1!�X�@2$]��@3@6�ɽ@3��#�3'@4�L[@5���/�@7��u�1@8�L��@95�� �M@:T�)u@;xG腈p@<����7@=қ�9@?���\@@"}/�@@��[26@AfO;U@B�<�P�@B��/Q��@Ca��)Dp@D`����@D��ҿ7z@Ev�!^l@F-��N@F����@G����        ?9Q�����?l�R�?���j��?�����=?�tC�e 3?���/�j?��ވw\�?���ݠi?Ҧv�M�?���'�lc?�+��$2S?���Pz?��!�l�)?�Ы*Ō�?�c���)�?�`Ԇ�F?��B��E@ �ᮗ��@l�){�@��Wqh@
Ffڀ��@G� U�5@Z<��j@�G��@t$
��k@]늲{?@��9h_U@���a@!����@#��8n2.@&<0?�@(W.���@*����@-z���nL@0'�
=kH@1�<3W.@3B��2��@4��"�@6���9>�@8�Z��q@:��t��5@<���`K@>�{r5x@@����@A�QE���@C+x����@D�j���@E��Y�p@GgS#4H@H��Ӻ@J�XQ�>@L<i]�4�@M���n?S@OϠ���t@P���	�@Q�kц0@R���0@S�d��@U	P�ڑ�@V.����@W^U��@X��{�1�@Y�e�G��        ?D�ާ�(1?r(a�c�?���i�?�㥭z��?��+U^ͽ?�}�4?Ĭ�@���?�F���Oy?����a��?�}�&��?୷��~�?��>L��
?���FN�?����=�?����b&?���sL�V?����qc?�OP�_@1Ԋ,w~@ #�>��@�?oʂ@v���af@%�ѹ�@�w* �@���o�@y�?�@��!��*@L,2�&O@0l�n��@ ��t@"I��.@$	���x�@%�ɘ'k�@'���q@)���P�@,1�:�XZ@.� ��@0��L��@1�J4���@3.Jۅ@4���N�@6"��@7��~&#�@9`��I��@;0�sk@<�	��@>Ү���@@fd��W@An1�|��@B���n	@C��ֻ�@D�_*1�@E�\��9V@G>!i�T9@H���K�@I��k���@KI�a�@L���˨�@N9R�ɫ�@O��u���@P����Y�@Q����%@R[D:�b�        ?�"�`�0?���ϗ�?��Z)�B@��n�@�J��@!�ה �@)��xw@1a~v�#@6�nl�T�@=\Y �K@B?.3�@F0F�Ki@J��6$�@O0=
=@R8�Ɯ@T���]��@W�yʬ*�@Z�,P[�:@^�G�4^@`�[��&@b��E[05@dn��t;�@fi��(�@hyE�!�@j�6�Xq-@lڞ�Iq@o+1[���@p�R>��U@r\��@sL��X]�@t�!�~�@u����C,@w`죎@x���@zL�,W@{��֏�@}b�u��@~��ܙ��@�Q�7(�@�*�w�f@��v<)@�궍�6@���$�@���*�@���~��@��W#]�;@��g�i@��Ӗ�f@�����=�@�����MQ@��.��q�@���I�@@���F�\@�$S�]k�@�$>Hg�*@������3@�O*��@����x:�@���QY��@��Y|�@��P��@�`ړ7��@���<�        ?j�����?��t�^�?��W}�ѫ?�qe0f�?Ӥ�uK[�?ߏc�X��?�@Jo�R?� fR*X?�h{��?�y�˛��@+�?��@>a���@	>G��L@�29.o�@x*���@2�i�A@"%��@EД��@�"*�0�@ ��� *�@"v����5@$r��슩@&����@(�����@+
��+��@-t�K�k@/��ݎ0�@1NcA_(@2�}-�#]@4���@5��>\@7�\���@8�|�c��@:]��9rK@<�>0�@=ԗz"&@?��� `@@�nT�@A�C�}
/@B�NK��g@C�����@D��,�@E�濚�p@F����}�@Hb��i@IDp$.�@Ju�: &@K�u��Dg@L�'ī��@N4>���@O��׬�$@Plvr��@QV�XI�@Q��H�@R���*>@S?�g�@S�Q{���@T�h�ޤ@U�K_���@VN�gv��@W[�u��@W�x�SPl@X�C�~�        ?8�XrG�?i�fm�a�?��T~��?��ߔSL?����CP9?�S~��4?�N��e^�?�}-Eы�?�2C��r/?՛��;?��X��?��LgM(�?�V&.c�t?��٠�?�W���?�~p�|5?��;a�:?�$��b	v@ r��X�@�z��@�/��qA@	.O��<@��� I@<�C4(�@L���@@�UIV��@�����k@�"(���@M��!�@E�d�@!8>�D`Q@"��C)�@$�o>ykj@&���XЎ@(�����@*�]�vM�@,�[Q~��@/R���R�@0�o|�/s@23[���Y@3�i
Le@4�����@6|"�]I�@8fZ���@9�����_@;^"i��W@="&3�w;@>�I۫�$@@pi<��a@AnܳGI@Bu][_@C��?�P�@D�0񚫵@EĀ�+�4@F���Ѕ�@H+L�B*@In��f�@J�"�8��@L�5�T@Mt�B�LV@N�����@P,�3��l@P��c��        ?kQ|P
�E?��6��;?�7��`Gz?Ȱ��n?��=�?��:5O�t?�Mv���	?��+�)�?��se��b@|_<6'�@*�����@�Uj\(@���>�@?��g�@�eg�-E@� W8@ 0�Y�@"���&w@%BBc��9@(��o��@+&���	�@.j�f��@0�0':N@2���޻@4����@6�8Q�@9Л�j	@;a/�3�@=��/ts�@@2:�='�@A�65E��@B��_CW�@Dn�����@E��/̚�@G�D�r�@IC�d͐�@K���G'@L�}J�M�@N�7��S
@PU�Dݥf@QX��t= @Re��
��@S{����O@T����K�@U�Fm���@V�9���@X0�j�-Z@Yu�-��h@Z�/��O@\m��U|@]~k?q@^�:P���@`/�5 ��@`���5]�@a������@b~����@cM��D�@d!�g���@d�� x��@e�C����@f�ؽ�ǵ@g����[A@h���IPs        ?�f��t�?�� �T�.@	�^)���@���Ғ@+F�۟��@5��F�F{@@3/c�:@F{�e\�r@M،���g@S&R�:�@W�&[,h@]A�!��@a�>S�@d��k�Ca@hJ���<w@l�	�G@pun�&@r<��41@t�糅F3@v��7��@y��P8�@|Q 矯�@/�coG@�m= ��@����@�R��+ݻ@���@��e���@��l�G3@�����@����yV<@��q���@���Z�NL@�֬��@�3,5��@�bۙ�##@��ㄴ��@��A�[_W@�)��@�~�����@��=h��0@�Dȼ�Y�@���8��@�/����@�YS��\�@�t��`�@��"ZqQ@��VD��p@��S��@�eI�a��@�B
C)�!@�#T�`@�	)�!l�@��+�@��v�� @���6���@��ڀ���@��Fk��@��$p���@��l���@���`U�@��8J�@�}9޵:        ?R)�.J�L?�pաפ�?�}5�/��?������?ci5�?�M�����?֍�*V�?�n׿�?��B�:�?�������?�}/�?�S�g�?�U�Z��?���6�y�@ ���
��@A�ـz@��5=��@��n�@�" ��@9SU/Z	@T54J�@"�՜@4پ�e@��.�@�Dy��@<e>6�@}�@��J@��$�@!%�w�w�@"k��CO�@#����M@%CG��@&����w@(
����@)�r��Z@+!{�1t�@,�cq�@.ui�z�@0f��}�@1d͟�I@1��L(��@2�2�Z@3�!�6,@4�M[R�@5������@7	ł?@8%&'���@9I%T��@:tŋ���@;��n.�@<�m�ěP@>(���0@?t�<7	@@d��]�@AkFs�@A�/�C�@B}!�Û�@C8?��#�@C��׳*X@D�����v@E�R�n�@FM��i@GH')��        ?:'��?q��^�H?�6�iL �?��*���?��5R���?�p��K��?̝����{?���E�T�?ܰS
}#?����t�?��U����?�i�T�?�_#Α?��G��F�?���H��@SύZ�]@���JL@�����@	;��@5[�6@��[��@D�=t@ @)���@O+�2S`@��1$cQ@!5�<�VE@#3�����@%W�����@'�|�8��@*>�*��@,�lW���@/�vpKj@1=h�Mf@2��Ł�@4|�i���@6@�B���@8�G�@:Pj-�1@<(���>@>V���}�@@P^��X@A�רg��@B�ׅ@D�O��d@Ex�Y `@F�d+I �@Hjy|�W@I�"�$��@K��k9�@@MR�xt��@O� �$@Pw���@Ql`�O�)@RjaB�@Sq�0�o�@T��Lo�@U�]do�%@V����Kp@W�U3�C�@Y(��?2@Zk����@[�?��i@]3�Yj8        ?D�Ө)wD?s_���?�0�<;&�?��N�n�?�*�Ԁ�?���b�$?��%1��?Ҫ��
[?٪¦Z�8?�
2[1�U?�Ң7k?��s�e�]?�JR��h�?�'\c��?����8�6?��Xh�-}@��s@���o@�f�Y��@]����Q@I�"& @�_��h@/sשZ@�Zu�O@&y�YL@|��9@!d�V�@#	���Jp@%%T��c�@'e�|=3�@)�x�Md�@,W(@5�@/	���T�@0����@2s��,.@4�`)u@5�� w�@7tnby<@9Kڟb"@;8�$�u@=<$���@?W�|���@@Ŏ�|?@A�~��K'@C�Ћ��@D\�d�`�@E���q�W@G ��	@Hh� t�@I���w@K^�Z��@L����@N�!�R@P�\(ٯ@P�,r`E@Q���4�^@Rʽw��@S� K�o@T��u��@U���֚@V�T�Ka@W�}_+f@X�Hc ��        ?�d��e��?�8ظ"?�"��M��@���r)�@�P|5U�@ �ͱhM8@)$�� @1|ϼE��@7?�/ጊ@=ϲĲ%2@B�YP`D@F�Y�
�@K'0����@P++��@R���-�+@U�<Y �$@X��3j�@[��͟\2@_I����@ay���I@cg�Y)��@eoV���@g��d�@i˔YJ�^@l!'��@n����
�@p�(.�VZ@q゛��@sF/��@t�Q�>��@v7�-�@w�`��
�@yb{�T�@{p�\@|�_ԑ0*@~�q���@�6k��@�*�>�r�@�'3��}@�+n5�@�7�eP��@�L`'5�@�i��dZ@��$��l(@���x�Qq@��=�S�@�/bm5x�@�u�g�@�@��!P-�@���j@�>�x!m@��QW��@��c���v@�i폵��@�+�Ť@��u��@��wt
B\@�����8@�`�N��l@�9l��A@�V#ի@����>@��e��        ?S���i�Z?�$8�F�?��C�Y�?�����?��X��?�҄�mC?��~��r?ۃrO�gs?�:�9�?�S����?�����?�n>�a�?�,|H>�?�����{J?��'D1@ ��/��@q��֘@���婛@I�N�.G@� `�@8�@�(@���_nk@FW��"j@�dڿ@��07�C@��ߠ\@���`��@���O�@�·�v�@ {Ac�@!7m�fG@"jG���@#��Խ�@$��G�@&Dph.|@'��2�@)X�t�@*�x�89@+�C����@-����-�@/u߯�<@0]R��@11�'�8�@2
��F�@2��r���@3�	��D@4��p���@5���ۇ3@6�W��>�@7���'�J@8��qA݃@9����=�@:�[_��@;��2b�@<�S(��@=��$1��@>���{��@?�"��6�@@���ھv@A9�,@@A�DV���@BG��%�@B��Xd[�        ?#�?�$�?U�}�ai?s���(?��� �d?�ň(�b?��6���T?���=q��?�����}�?���Ȅ?��Iсb?�!�,'b?��x��?�_}�c=?��&wL��?�'j�ި?�
��9�?�qz���?�A�0��*?����{|�?�^��2T�?��5��5�@ �e�9�@U��o�@D#+]�@	~ǻ���@	����y@t�w6i�@��sDv�@�բ�%�@U!B�j�@�����@���@��؈N@!��:��@#juG��@%N]�,r@'Q��I��@)u��bw@+���ܒ�@.$�k�@0X-Ż�'@1��'8�@3��F@4��I���@6-��<1F@7Ի��Q@9���[��@;b���	@=IJ����@?F��h�@@������@AÊ&S�/@B�[��}:@DZ�ߡa@EM� ���@F���@O@G�ݶ��@IJN�wb@J��w�[T@L4���	@M��r�g7@OV�M��]@P~���(y        ?Qu( K��?~NO{D�?�T;6�:�?�I��1�r?�H}RU?�9Y��Ua?Б9����?�8��xGR?� �e?�,]���?�z
�ˢ?� �y��?�*�����?���T��<?�A�OS)?��v��	@��g��g@xF��j@����#@
!��/@�����@�*��&P@=�s�@ts|5
@��(Do+@�#]���@��&Y�'@ ���3@"�ߴ.��@$Lv,�uF@&+���f�@('��FP@*?��J��@,v!J��@.�O�%8�@0�
�ٺ0@1꫰�SN@3F <F�@4��a#�@60�P�ֲ@7�Q!�@9d/�p#]@;��+�A@<�I/}@>���v}@@[�1C�j@A`��|@Bp]�ocJ@C�$�z$�@D����5@E�?�ź&@G��}{@Hfmq1�@I���a�@K�k�@L�6T�X@M���c@Ox�ɶ|@P��[��@QOL���"@R!�T��y@R�]���@Sؠ55�(        ?� �Н8�?��c���f?���&:�@@D���o}@����-j@�,xY�"@%�ٗ�<@- �z�O@33��F@8Z]�j^�@>0��8��@BP�&��@E�ڕ��%@I��)��@M�c�0l-@Q"��	&@Sh�T�@U�-p�@X�r��.�@[N�֕#�@^:�Y��@`�9�l�@bA��2ߨ@c�Ԩ�@e�,�f�j@g�D�	�l@il^aA+�@kf�^
�@msӫ���@o�Ii�[@p���V
@rfJ`@s4g�s6�@tj�J��@u���aX�@v�i���@xG*�4'@y�!�Q��@{4'���@|vG8ʬ{@}�?�ؚ�@m e5��@�z�O&`�@�C+9߸s@��f˷$@�ࡀ��@���Z��7@��|�&U@�ky6npC@�Lyk�5	@�1~#�[@���W��@����W@���/�[�@��Q�q�@���V.�@��:�d#@��ř�@���c��@��\�g�@�������@��W��@���nh��        ?^��E;?�:��W�?��a[��o?��s���?ȫ'?�o=?��	g8�?�)bP��n?�-�Y�3\?건@i"�?�8L8?�<��Py4?��jI��?��N�6[@?���@?_r�U@y��u/�@�u�*�L@�P�p��@Ĳ8���@����'@ީ-�@W��\�@��J��@N���F@��8څ@!^�y(�I@"ў:��@$S���c�@%�bMo�@'�f\_�=@);h�9s$@*�b�Tԙ@,Ԝ��t�@.�K5�s�@0Y�-s@1^�y�@�@2l���̨@3�!���@4��&\4@5ʿ$��@6�����\@85\�%=�@9w�de�@:����Wg@<�r�@=s��_j@>�_tBI@@$/!�>q@@�K��_@A��@Bf{ �?�@C0� B}@C�j�T[�@D��=��4@E�:�#-@F�5.M�@Gi��I�@HP5I'��@I;0mS��@J*��b��@K	mL�@L�Wc�@Mh�H        ?&Y�~�Ķ?Y����?w��!��?�S��'�?����L�?������?�p���	?���B�?�`��i|?��(Fp|Z?҆�AIr�?���T�2?޻Q	ar�?�I�F��_?�ގ�N_�?�,4���?����?���?��1�8?�i6ي@)P��@�R��b_@�NTdt@
5�:��@ա��(�@�͙�@	��@�_@\S����@ݵ	x�s@����@s2c�o@ E��e�@!���@#��$7�@%�5�I�@'��8��,@)����@+��kͅ@.E	�|�@0E�eI�O@1�� 5\P@2�T�k��@4OT�:�@5�`clqN@7Tߝ�V�@8�:��@:���D`@<d���@>9]"�#3@@<|�@A6���1@BuMe�x@C)�Q�1�@DF�.��i@En5_��@F�j�W�@Gݛ��)@I%��FE@Jy��)�@K�Qh��@MD�/���@N�Y�e��@P 5��         ?I�I�?v>%g�u?���}�l?�c�J�b?��T�N?�R]���?ȉi.�?�aкhF�?זba(�?��-7Gn�?�Ձ���A?�� ���?�})=�?�F�L��?�d���?����9�|?�Nm/G�R@C��
�@'5�K#�@T��t�5@�3���@��	�a"@����ߟ@+0�|�@����b�@+���k5@�E��b@�Ma�@! ���?@"�\��QA@$�H�p�@&���!r@(�tL�7�@*��3�v�@-R�0��$@/�(���@15l��@2�{���@4
-�a}@5�,����@7%E���@8ж�`@:��v��@<c�W@>J�׿.b@@#�a�@A,�a�� @B@�mG�@C^��Ѱ@D��X1�@E�ʘ[�.@F��{ۓM@HH;��@I�?���@K���@Lpf2m G@M겑 4@Op��j@P��U�@QP�I��@R%���/�@S ��~S@S� ��l�        ?�mh�@8?�6�xAF�?�bY��k�@J�	�!r@k��w״@!:�j{i@)^t�h�h@1����!@76_��3@=��q-+@Bp�F��@Fp�P��@JӘ��@O�qt��@R`��z��@U&�W�f@X����@[Fhn�F@^�8b@a� 6��@b����@d�7D�@f��J�Av@i&5"�5�@ki:np~@m�x[k��@p���@@qe��|��@r��V���@tg�}@u�}N�"�@w\���@x�3A�q@z1!.̘$@{�<X�Y7@}������@T'BW�@��F�:@��H@�{����.@�zyk��@��U~�E{@��I�W�r@��\�i�@����;:�@��0f�o�@�	%���T@�:�
�P�@�s�#B@��/B� ?@��k�!&�@�&*NوQ@���|�_�@������@@�51��(_@�옣�L@���(�@�f�rGb@�)����@����xj�@����G�@��eP?R@�[��
        ?h���+D�?��JV�T�?��>��*�?���G?Ղ�Zl?�z�SO�?���+�?���~gn?����i?���(��@�ud�:@Mh[���@��`(@w`.�Ѿ@/]\>�@�	�)�@?t Yd�@��_���@ LD�B]@!���S�D@#�����4@&edw@(C�WxL@*���%�@-��w�	@/��>�@1����@2��VC�@3����|@5x�ũZ@7ȶ���@8��o��@:g�O@@<-��.u7@>&���r@?�缙5F@@��L!_�@A��M�@C�2�{+@D���U@E>[���~@Ffw��T�@G�*2R�:@H�siٖy@JR86�@K\�K��n@L����N8@N3-��@Oo��x}@Pm�h*�@Q(��ye@Q柘��@R�e"��@Spf�fjX@T;�^��@U)�-�&@U���1��@V���g	@W��%�@Xs��j�@YX���f@Z@���P�@[-��        ?Dt�1+�n?z��p�>?�/s)0�?�t���8?�+jJ��S?�;zr�d%?�X��" 	?�\��m?�Ғ���?�-y_S ?햕ҩ�Z?�|�c��?���:&�A?�y� @ j���T@h��|<@��l�J�@
f�7+4p@p43��@n@�Z5w@�6 �4@xy��@Q����@fa�Cż@���W�c@!��5}�@#�0!y�p@%��!���@'�sE�B�@*24�&�@,�|+�P"@/_����@1[ʱ��@2��߾@40�ݍ�A@5�!�@7��_�W@9~�N��@;shY=<f@=�����@?�.�I��@@��I�@B �a���@CZ��z�K@D��:r�<@E��4�@GX��e3[@Hȱ�f��@JFJZ�@K��u��@Mkb{=��@O7�g(a@Pd�Ԩ|�@QG&}<J3@R0��/
@S"+$���@T�Pect@U:����@V#/=��@W2� �sr@XJ?aZ
�@Yi{��@Z��`�-        ?w������?��1z�%�?��ё7�?�Z��U�?������?�.?�";u?����R~r?�б���T@��I�V@	t��D�@(6��#@�v����@���P�S@�>�@c@�Q�.�@!��	��@$Ahɒ�f@&���@)��<�?�@,����@/�9Tʟj@1�x�y@3yV�;�@5]�����@7]i�>+�@9x4�g0�@;��W�)@>�ڎdM@@:GSD@A���O�@B��~*�@D@HD��i@E��@ڎ�@G?�2��@H����@J���6%@L@-܆ӱ@N�B�g@O���*�;@P���@Q��C�$6@S� �}4@TN�8@U?�=%AL@Vl��!�N@W��H��Q@X�k�S�g@Z5"�`w�@[���Ɲ@\�I� e�@^b�O}@_ݐI���@`�v@�p�@a|(�ER@bK�;T@@c!�]�8@c� :���@d���@eɓ\��N@f�����@g�ڮ`��@h�ZK��@i��K��        ?�@ �~�~?�!%%q@d=M�-K@#l�:?}@1��JV�@<͕�P�U@ED~dWl@Mn:%o��@Sm�򮆧@Xý�s_�@^���^ex@b���"�@@f5$��2�@jQ�?@n>��KZ@qY|���@s�/��]�@v>� ��@x��B7,�@{�?6F�@~�E/���@��kY���@����Y�@�4o�XF@�� tm�@�����I�@��`�X@���M��m@�ԑOgd�@����T�@�T�2r�@�HT[X@�}&�6��@��趴�c@���+D@�]��L)@��k$��Z@�*fגּ@��n�6_@�#{�AH�@����x�@�$F\5>�@���_O�y@�̽ڡ�F@��2�D@���O��@�r�l�@�_Q�䬺@�Q�%��B@�I6�A�@�FHC�� @�HŠ5��@�P�
R�@�^n���@�p�8���@����@���K��<@�ɀ��^�@�x�y}�@��j��@����@�D�L�W�@��D�S�Z        ?KI�\�N�?���%�?�p�1xC�?�I�g�?��}qb�?˜�r4yd?ԉ��S�?ܢ�w��?�nv�o�?�t��<�9?�#�,��?��N^��?�\�XÖ?�i��$D?���$&'@�.#���@O�*7w@���U@	��1�/�@Q��6@"��)�@�	1ՠ@�#�n�@�Hw;*@���
�@��M�}�@�&��N@/���KI@ J.
��@!�+��{@"��::~x@$-_f��@%����@'�BPxH@(��c6�@*���\�@+�J��6@-O|�<s�@/\O+�@0bx�e@1J4>��D@28�[�8@3.���0�@4+}�0o@5/M8 @6:'[I@7LVY@8e3Q�,�@9���'��@:�f���@;����[@=FLq��@>S�(���@?����4@@vKލ�@A"�`��s@A�-���@B�8G��@CAB�S��@C���5��@D�����@E���jQ@FQ91H        ?C��㚇_?z��x�?���4Za?��"-�ܾ?�~�WpB?ȕ�h?қ�IX�!?�WS��8�?��AoD��?����pP?�?7.��?�)�<?�	�qf�?�n�a�X?�R+�(��@]XR�@W PΈ�@�5�}�x@*O�o�@{��@��Z��@f�>�@�M��/@�0Ζ��@WO6)B�@b����@!RD,8�+@#`��>@$�mk��@&�I�Ɩ@(����z@+2i:�
@-���@0}�Ԙ@1R+�ު�@2�G<}-@4&�����@5��!:��@7H��e��@8����@:��m��f@<��cy�@>�f���@@E��פ@ATG�#��@BnT�3��@C�$;��@D��L�'@F��$�@GN+rO�	@H�3Гc@J	D�o�<@Kz��d�@L���%��@N���_@P2�	�@P���Y��@Q��E��@R�R:g�@S������@T�j�3@U{c��@V|{�A?i        ?B��m?H�^�:?g+ ��(�?}l�/m�?��d�k?� �p�H�?�*�2�B6?�&�
�A?�)��?�ʼA�&?�s���?�aD��?�{,��|N?ۧ=u�"�?�Yg�?���+:?��ԭP��?�l��Q?�ϱ����?����ۨ[?�
!i��@ z�C�)@9����@Hm����@	�F��/@g<��@�A|�:@�U_�*@p*]���@-H�8@��y|��@b�&&@ ��u��@"�'���9@$p�4�6X@&���x��@(�l�l��@+�"ϰ@-��Cj�@0!~E@1��2l@2�o81-@4����m@68�q0n�@7��{���@9�l��@;��2o��@=ȍ�
�@?��8�@A��1��@B?R�%�@Cx>�ak@D�b��@F�6��f@Gxұn@H��Nv�@Jn���@K��xa��@M��.?#[@OS̈��@P�Lӎ�@Qu0���@Rg���!        ?�Όv`�O?��ٳ�?�O-��@��u�~@��++@_(^��2@%�K�y@.�\�<�[@4w8
�@:K��W�7@@kL���p@D>�AS�@H^л�@LY�"b�@P�q��`@S	��r�@U�LZ�J�@X���<8@[�&��jx@^��V�@a2%��r @cx�U��@d�f�� @f��8�:@i�Z@kBys�m@m���%�=@o���t%*@q?��4�@r���)D@s��Q �@uU�erh@v�p�9s@xR��fj@y�᩵�@{�`�#�@}4�k��@~�h�"BO@�^��0<@�J���o@�>�Y�F@�:3�<E�@�=*����@�G�ͫ��@�Y�+��@�sP+�h<@���
�U@��� l]3@��n�J��@�'Yj�@�h���X�@����@�@��\�;@���«{c@�c��sQ6@�M6�e�@�׌����@��y�,
@�^��ZN@�(V�|<�@��B��C@���z�+�@����        ?S�=��/B?��}�Z�?�酹T��?� ��?F�?�w=��>�?К��bx�?؟��O?�%�e�}?��NJa+?�L*7!?�NG:��?�`OuӉ�?��Kg�%�?��k�`�@�?ʫ�@g6�"�@z����@��y�q@C�)�Bp@|Ь��@sF��i�@�A��	�@��yܧ�@�G猣�@a��)�t@�Iqd��@ ���(�W@">c��@#�g �e�@%g��^@&�t*�U�@((��6f�@)�u�XE@+��o��@-Q��2�@/)��JM@0���H@1��羟.@2����@3�#�~6�@4�dU�z�@5ŷ�s��@6�D)�H@8�l�a@9K�d�;@:����Y@;���@=�,�w@>mx�3I�@?�BhQ
@@����O�@AN^_��@B��*��@B�
�ƥs@C��L}m@DP~{�@E�(ŧ@E��Z��@F�d�8�@G������@Hk��T�@II�qwA�@J+�_j�        ?J�.���?��e�`�?���$�g�?�ך�Q��?���6��w?��M<�%?�twt�t?�jR���?�xA�8?�o,Av�?L��8?��wv�S�?�*$d^?��hR>�@ �,��@�j�7��@�'�N�f@
]4a�@M���[�@N����@�O���@9�3,�@"����@Tw�F�@E��z>D@!dR&0k@#H��^�@%O���uB@'}7�>�@)�M�=s@,O�' ��@.����@0�&����@2i`��@4���@5��vR�@7����֎@9i��ujU@;lC��&�@=��+3(@?Ƥ���H@A�����@BK�<Q!�@C�FT�w�@D�=��@F^-x)L@G�U��:@Ige�r�@K�^5|=@L��ٰ�]@Nw&�	3i@P%u�U�@Q�Xg�@R��pw@Sω0}7@T*@��)x@UCb����@VfR�#@W�*����@X����@Zba�!@[V:e苟@\��2$��        ?B�N@��?q4؟�?��
�U�Z?�T��ď�?�\��yNv?���{7�?�VLat�?�Ъ�v�?Ӄܛ.�?ٍ
�XT�?�J��Jd?�W�X=?����ɝ�?�7�Z�̉?�Q�/�?�_���|v?��)`�?�'w�+0a@ �3G3�@R���n�@<f�N @	i���@D��c�@��6A�@�D��V@�(62�}@��AV�@v��@&��C@��Tv�-@ T��[�@!�O�:�@#�i.�j�@%G��C�@'![��Y@)QV��C@+$F�b��@-N��}�@/��,˺@0��7��y@2;bd*��@3�x0���@4�0a�@6Q���'@7��@9Ujb��7@:��{�@<�m��i@>L4$�H@@	:��@@�����?@A�PT�]@B��Ĥ�@C��<��@D�~�D�@E���	�@G��S�@H4�	$9@I\�[8;?@J��C!�@K�����^@M����@NIW��~�        ?�eE�a�Y?�z� PR�?�3��໥@3�'�̵@8�)m�@%:ժv#K@/d��X�@5�|���q@<��{;�/@Bys�<�@G ��j�@L����@P�1���@S�*H;z@V��z�fd@Zi�.WM�@^�^���@a����@c�B)@eIܐĪ@g���(0@j�	v�a@l�Iʡa�@o6̇=�@p��@�)@rmq�Q9�@s�n�[@uz�N4��@w}�D�@xÄno-(@z~�	��0@|I�-��G@~$s�g@�0�#)@�Q�o�@�	[�#V@�����X@�,,(	�@�I��� 9@�oY7��@���v �@���7���@���d�@�ViԘ�@����B�@���G��@�V����:@�^L�@�@��d(�H@���!��S@���J�@@�O��=�@��IIVG@��h�i�@����gx�@�|؁L�@�Q��~��@�*%�<��@�M-N~�@���g��@��t��x@��a��w<@���WHߩ        ?Qǅ����?�76	G�?������?����F�	?�6�Q;�?͊�_�ں?��D=�P�?ނj\��?�Leq(?�xSb�?�N�K�5_?��!�
�?�����??�^���@ �ppl@+��z#�@�ɑ�(�@�0�7�A@$m���@�����-@�)��ZE@z �4+b@|̆�.@��q�k�@ԙ<L�'@*N�rN�@�X�4P�@ ���LM@!�P�^W<@#O��D�@$§q0Z�@&DA����@'�m���@)s��j@+ ���@,�1��6&@.�tƯ��@0=��V�@10�Ҕ��@2*'2 _�@3*�����@42�X�@5AS�h<H@6WA���@7t^\@8��?3{p@9�oV���@:��ű��@<2CT�c@=t�f^aK@>��B<\�@@A��@@� c�`�@Ae�N�k�@Bү���@Bӹ-[�6@C��0�2�@DQ�Fe�@E"�>�@E�����@F�yY2��@G����"@HWm��        ?AWn�W�#?v��F��?��'g8��?�V�1�?�t"ga�b?�Q���_9?�C����?�DY��H?��B9�)?��[M���?�ݯ˧$e?��T��?���v��?�5�!��l?�3vSc�N@�*�R�@�*7bz4@e�����@&X���@ �	�5�@\��R�q@���G~@i55�@<SN��@E�(:�@ Bm ��@!����%x@#׊e#�y@%�3�*4�@'�:�Ȗ@*]M)S@,kc+g@.��ci@0�:��9@2���C�@3��E�}�@5\���b@6����3�@8@w;B��@9�2�2�@;�z���}@=��*y�5@?�����@@ܮ�.'�@A�N��@C��I0�@D:�XzM�@Er����@F��Z�;�@Hxzߚ@IeX,@Q�@JЀ0�!@LI1+8��@MϬ1���@Od2���@P��H�ާ@Q\2�x�@R<L%�8@S#�W0��@T9T�;�@U
K�E��@V	C{�m`@W=$��        ?&��ktP�?VR#�(�?t�lt6%?�����?�jj���"?�2��|H�?���w�?�Pd���?�&��Л�?�'F�C�?��W}bG?�W��P�H?����-�?�]���e�?���k?�{(E�_?�j��V�>?�a�H��?�E`�5��?��V��@�o��
6@��} ��@}��@�B]D��@�yd��0@F����@ɭ|O�@���za@��e�`�@ώAu�@ �4��W�@"�c�̠�@$�3]���@&뉡n^�@)TU�C�@+�H��6@.�6��@0Ӫ�G��@2h�)�k�@4�Cu@5�Y?�J@7�+Fr�@9�� ���@;��:>�a@>@����@@T��@A���ș"@B���E�U@DWQ�R%�@E�()s�!@G_���P@I��@J����[�@L~�{1,�@N\o�X|@P'Z� �@Q+
�i�@R9n�J;@SR��F�@Tv�85�@U��#�/�@V�=ۭ@@X%��        ?��]9�?�W3�57�?������@g.�h��@�^t=�@!�V�m�@)n��@1�Y���J@7�5 ��c@>��ǡ;�@C!��Yf�@Grw�j��@L7x��-W@P�go@S�؁*�@V�����@Y��[C \@]���q�@`��{[@b�#?p��@d�}�wf�@gE�G�@ir�ב�@k�+�=�@n��~�@p��_�H@r� .�@s����@u6�;$�@v�c)-�@x�	?��@zW���f@|.��w(�@~,� B'@��H�@�
�;\@�h�_;@�)�4�~@�E��@�hk�c@��΃fc�@��R�庩@������@�A�5>��@�����a\@��ј�~@�7��-~�@���m�i@���wy��@�;���)@��F:�E@����Ƙ@�Cv��]@�I-]k�@�}�@��i���@��
��7�@�����@�zg,(�^@�^7 \1�@�F���e@�3J[�>@�$����        ?:V�� "?j�"W$:e?�����ۡ?�p��Ʊ�?��f6�?�x��5�?��md5��?�"恑u'?���@OE?��nsr?����L�?ޞN�n��?�k<�?��y���<?�Ĉ���?�C�s�?��b�[?�<T�K�?���RǸ�?�VD�i~�?�!�/��?��}E�@ �}�C:�@@��2�@�>��tT@�I�j@��m�j@	�h�2�{@��?�J@�I���@��MJq@;��`�%@p�%�N�@�`V3}@�7�ʭ@TU%�@���.�@$?���(@��p��{@ ���@�Z��'@H�r���@ v�$�+�@!N4~r�@"+s� @#+��'�@#􁡐df@$��9:P@%Ҳ��@&�{s��@'�Z_�q3@(�F�p��@)�:7i�[@*�0��
@+�)`W�l@,�'�Y@.3T�m@/5X�$�@0,�_c[�@0��ƞ @1YQ1��@1�5bH�@2����         ?��P?H���?h����K?��>q�q�?�SP�O�?�n�U/�3?����{k?��?7{{u?�3P}��?ĐQF��?�u#��1?ҭ&��כ?�Q����8?�8
�_�?㋜`W}�?�;��p��?����V��?��<�0�?���
�Bk?���%x?����@� �{\@V�z�_@lZJx�@
�y��˪@�B�~;�@El*�'@t�Hm��@л
?�@[ �e�@1
��@ @��@ ��O��@"7?T��]@#�Y@%��*�e@'�s>j��@)�0����@,�Y�3m@.i�s���@0l�l1�@1���Վ�@3����@4n��ܔt@5�|#�b@7l��q+{@9ҹtVK@:�<�1@<i8�e�@>6��	�@@
�L�T8@AM�<t@BmV��[@C��ˬ@D&V�R~J@EE`�q�@FnL>^�@G�6����@H�=QK�@J%}�K�m@Kw֜2@L��~;@N9�Kh{�        ?+sH��{?Y涸@L?w:U�1�H?�v�=�.?�m0���?�H]$5�`?�2�}|��?��U��Q�?�=����L?˻W�y��?�x��cǹ?� o:\?޷�E8�?�L?�-4?��)�>?�>��w��?��.�^ ?�3�_J��?�.s���?��6��}@Y��4 {@(8I�e@F _gt@
����@��D|��@V��S@�o����@"����@��6M�;@����I0@��ÿ�@!"?>N@"�@)���@$���.<@'
u���@)K��W�%@+��u[��@.D&�,+@0G�ӑ@1�"����@3{V�3A@5��]@6�r[-T@8����[�@:��P^{D@<�[�A}@>���@@q��x�}@A����M@B�*���@DuB*��@Ek!���@F�oz��#@H>�F��@I�ܩ��@KNni�>@L�ߍQ�@N�S��1@P-�١e�@Q�C���@Rr��@R�,�//t@S�,�	        ?��cu#��?���f|��?��	��q?�1QcG?��#�Q�@�G%{�@���t�@�W��,�@��9:̞@!�U�*@&O��m�g@+>���b%@0V�u�y@3L~7� h@6�>S� �@9�+?i�C@=�:�Ǡ�@@�@��O@B�	Xd�@E=�I�qS@G�֐��@J.x#=4@Lۮo�@O�&��(�@QQZ�S�@R�P�D	@T}���KD@V/qLB#@W��*���@Y�U�5��@[���O��@]�u�z_v@_Ē����@`���w/@b�+Z<@c6˔�<�@df���rZ@e�5�p�l@f㉼�V"@h0�D8��@i�4؈�@j�v=o�@lQH]��f@mĢ۵�$@oA}���$@pc�a c#@q+�2�7@q�` �5�@rɥ�I/�@s��N9�@tz+�RdL@uY_���@v=+�	��@w%�۝~@x��e@y#%�s@y�/*��@z���*�@{����d@|��:f�_@~M%V��@���@�
۠O�