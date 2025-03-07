CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T104900        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @               ?u'�8��?��ee�1�?�fD��:�?�P��~4�?˴�0�0�?�>�i>�?�]Ej4�-?�IǴ�\?�诠�H?�	˱w��?�Fv'�?����SgA?�cB�M�@ٟ�ߊ@��d���@�~�_>@$��+@�v�Kv@,.�ˈ�@$bVM!�@7�6N�@fc.,J�@���i�@�v;]�@��^<t�@ �����@!�Ҵ���@#[@�j7�@$�&ս�@&T�\x0@'�K�
7@)���߭@+/~��A@,�!x��r@.������@0A$�Q�e@11�+F��@2(��/W@3&���u@4+;�@56R�@6H#1��@7`K����@8(�-�o@9���X�@:И���(@<'���@=<AV�>�@>{�I��@?�)S`@@�_2��/@A0��U=@A�ȸ���@B��4�P6@CA]@C��kr��@D�5�zf@Eni��@F.��U�@F�4�h��@G��KO @H��S���@IM�0�)        ?k>@s��?����4��?�+����[?�1zI*�?�}I5��?�/��?و�?���EX�?�?O@k�%?��0O��?�"u8�?��>��?��HB�@bΑec�@��B2��@	�����@���T@�k���@sҲ?�B@0���@�}qe��@�$K�ѱ@և6g��@!���(@"�o�4�@$���,�@&��-@(�rR?��@*�#j�[U@,�7�E}�@/@�A��A@0�~����@2�!�@3a�D�G�@4�"���@6 �P���@7�X��#�@9Q���Z@:��=�@<627��@=�+Y_�@?�ߝ��@@������@A�I��}@BwN�ٌ�@Ci�4�6@@Db����@Ea�>[!@Fgo���@Gsy�}o@H��.��'@I���r��@J����c�@K�okC�q@MR��O@NA���=@Ozy��@P\y'R&@P�����@Q�ķ���@RM�| K@R��A��@S��O�+        ?q����?��z��~�?�\�b?��O��?�o;�?V�?��J�8!�?�����?扬��b?�G���?� ���?���N�J?��2RV�@��N��@�c0r@
� ^��@5��J@Ġ3W�@����@���,�7@���Q�@�Rk��@ �e��&�@"����|@$���>�@&��P[�`@(��#!��@+���J�@-uD��Za@/�	�5�)@1I|�V,�@2��t�@4�XUk`@5��R��@7TM/��@8���@:KC�̭�@;����@=�4W��P@?�s��h@@��9]�@A�y�fdw@B��9J^�@C�|9O@D���ET@E�e����@F�S�R�@H���m�@I<�` �@Jo?��5@K�Jt���@L����@N3�텗6@O���)�u@PnpW@QP�4* @Q��KqG�@R�a>�}�@SD�e��@T����@T�@��&�@U��*�3Z@VW�u�@W%�Y�E        ?��z��	?����w?�l�v�v?�Me~q5?��TH!?�Jd ��@��b��@C�9��@y[��l@mf d!e@�ы��t@!�Q#���@$�� �T[@(���Eiv@,�_]�@0~�l�@2�uԫ�@5A��'w	@7�z���@:�KsR�@=�kgCi_@@N8��x\@A�-$x@C����\@E\Zd/3G@G2�G�/@I�s�a@K�d��p@M)"3��@OL�h�'@P���%�@Q�~�F��@S�F�/@TL�w�: @U�_�ل`@V�PUY�i@X-����d@Y���n�O@Z��
@\cN���@]�>/O�=@_`�M��@`v�|�(!@aAz
ӟz@b
/��N@b�8�%��@c�9A�@d�f[j��@e}_���5@fc�C��,@gO	��@h>� N�@i2�C��@j+�� ]7@k(��b@l*�ɥ�@m0��Q�(@n;�&�.	@oJ��UCL@p/Z5�]�@p�ou}8�@qI��\�@q�?�	�B        ?jd�l㨤?�CYc:?��/i��?�!�l��?�s17/I?�wZ�Xe?��!��D&?�k�n�S�?�-,��?ꂬ��b	?�����S�?�%�M�8�?�(�u?���l��l@ ���6�H@9�w��@��{a�@�cm��@1��D�@h-��	@w
���@RxG6��@Fd�:��@RҞ]{@w�:.�@�Fb�M@P$��@ <�ֹ�@!�q/��@"�#����@$+�o@'�@%��su��@'��@�@(��0��@*�f?�@+�y�A6@-ON��@.�yRC�a@0\���R�@1@5=F0�@2)o��W@3vEBˡ@4A Ǭ�@5�,!�@6Q��G@7�y9u1@8qa@��@9*�϶��@:AA����@;]w����@<*@ε�@=�O�Bmm@>���JM�@@f}���@@���U�@A<Q�\AB@A�>��@B����c9@C&��ۅq@Cϲ��l�@D{�,�@E(�;*�>@E�dG���        ?i�u�ZX�?���ق?�=.&s0?��e�H�0?����S?���&��?ڬլ���?�߫F�O?��͹:?��fF��?�h�AŃ�?��ם��@ [I>�e@��#�b�@o�h��@�o�2v�@u�[��@pdt
7@�"�O�@�e�i��@����@+�Wh�%@ ζ-@"�NF�b@$��E��\@&�}�h�@(�y��B@*����~n@-\"���@/�!�4g�@14ڑ��@2�����@3�?����@5f����@6�,���@8z
�b.�@:?���@;���P�Y@=��.��l@?MOP��$@@���3�@A�ֿ�aO@B�����@C����@D�~l�\@E�60�!�@F�+m�s�@G�[�88�@H����@J)`�J@K^.��ˋ@L�(�1@M�KJ��o@O'��AO�@P<zyD�v@P�!F$�@Q��ͲP�@RK��W/�@S�xp;@S��$Y�@Tz�'��@U<%�V.X@V ��        ?g��I�?�|����?��(~ *_?���|(�1?ĄM���?Аv���}?���#��?���V?���h�#?�J����?��m�@�?���V��?������@sA�ѣ�@������@	�~��@�f�[}@R�n���@�q?\��@F���!@`(�9�@s�.Qn`@��"���@!���R,@#rbj9�i@%d{?�X�@'qG�e�@)�[��@+���<��@.:�/�z@0Y�GP�@1�����@2�=ID�(@4cݦ��@5؍�FQ@7[\Q��@8�W��@:���jn@<9wl¯@=��ؾa@?�ցW2�@@˟��@A����@B���暗@C�S���@D�E���@E�h����@F�Z3,@H
B�fe�@I/� 9��@J\߾n*i@K�����@L�9i��.@N����@OXC���P@PT�`$�r@Q w��@Q�����v@Rc�#@S��ʦ@S���@I�@T��+�73@US�&��        ?�Ř��T�?�=O�Z	?�d�8��?�2䄘�6?�%u���X?�:���k�?�������@5E���@ c:�/@�u*�@NI��(�@7�4�j@ Qw�,�@#HAa@&�Jj�@)���m�$@-�rݪ�w@0�W�Q�%@2�3�,-h@56�aP/�@7�$ۃ�@:.��#X@<��Y% ;@?|B��`�@A/��F�@B�`U?�@DCb��1@E�XqFD@G��Pb��@IZO���@K,�#�d@M�G��@O �>�s@P�3tN�@Q��w�W@R�)�V_ @S�9�`�z@T���S�@U�Mp�8z@W(;m��@X^�k1h)@Y��o�� @Z�?��@\.���@]���z�@^ޓmg�@` ��|?�@`դh�@a�2��<�@bJO����@c	��@c�9�4�@d��=(S�@e]�
� "@f+D5}�>@f�'�lG?@g�k����@h�+U@i� ��y@jaG�|L�@kB��)�M@l'����5@m�)z�F        ?q@����F?���f@�?�A�Mz�?�3�(C��?�$�ɰ?ҟc�[��?ڻ��z�<?�5� Q?��N4��B?�A�H�Y9?���}�,?��&�R_?�!�/J��?��o�Y��@�-�y��@X����@U�>��}@�I7��`@�Ve3*@=�$hg@!zx���@E�)-@4U�U��@c� �u.@�=��x�@�6�@ D��b@!��[�z^@"�9��x�@$HZ���@%����2p@'3����@(�o9��@*Q<�2�~@+�]t)n�@-�ȅ��s@/Yt����@0��]�/@1x�V@ګ@2g�=�
�@3]H�O�@4X<�gL%@5Yn�
�@6`�C��3@7ng聰@8�LR���@9�t�\@:��9�Ė@;ޠO���@=	|�v6W@>:+XwVi@?p��Ū�@@Vm��~e@@�h	��@A�=�$@BA�\�@B�q����@C�ΧO�@DG��_&@D�
���@E��*��@Fe���tE@G ���        ?n/�I8��?�����V?�Wq/q?��<T�E�?ȆC➟'?ӟ��[]?�,���T?��ߡ�B?�5N��?� E���?�$�h��?���AE�@��<Xa�@֯A@	v��ʄ@i���/@(:�D�@��$p-�@o�/7�@m��俐@�tZe @ 
'���@!��lP��@#ð
�9�@%�lm�D�@'�Q��"�@*2�'�@,��ZX0@/
 cx��@0�X�@2)��d@3���Mu�@5�XV @6�R	旧@8��H�@9������@;o�?f@=,x�&��@>���v@@hє��@A\�prz&@BW���m@CYy1�@Db[��@Er4��~@F��@@G������@H�c䡰�@I��p�@K)_��b�@Lb�8���@M�ԁ��@N��[�u�@P���i@P��h"�@Qs���N@R$崦�@R�\ӏ�G@S�3냼Q@TLiq�n@U
��,��@U�芗�6@V�-Ý}z        ?k�? ��$?�kA��?�*d�?�G��B�?�tp���?��'�`�?ڠűk�"?�i��I<?�:cQ}�?�tO�)��?���5���?�����p?��Q���y@	А��M@��G�.@
o��}�@��ʿ�@�@�+T�@^jT�@���_�O@��vA?<@��U�c�@�5x��@!������@#[~T��@%<g#��@'5h�k[@)F���f@+o�rub�@-��7�#b@0�­�@1?�bձ@2�|#��@3�!�9�@54�Π@6�(c�@8�Un��@9�4s���@;&�'�@<�Ea���@>h���N�@@$pw�]@@��s;�@A�La�@B�"��e8@C�H_���@D�z��Y�@E���\�Y@F����b�@G�9�gz@H�x0o�t@Iݮ���a@J��%��@L��{��@MC��uML@Nq�;���@O����Y@Po�}�f�@QG����@Q��Å,�@RWeA	�R@R��:�~�@S�'O�        ?�yР<�a?�ď��v~?���)�?�+�Y6?�5�s�UO?����'�@��F@
ū%L@*�:R@��Dً@㋵	��@ U	���(@#�{����@&�;�y9@*�\~X��@.�����L@1��uPv@3��*lR@6VԶ�T#@8�)���@;�ə���@>����`a@@��E���@Bj8��@D_Q�y@EҚ�Xf�@G��qߙY@I�M���@Kzi^���@M��.�X@O��f��@P�@�Y�@R?^�o@S+�8�{@T\�6cV?@U�@�6@Vڜ�@X&��K@Y|5���@Z�h��i&@\A�3T�d@]����_@_*a���@`V���@aR�H�7@a��5���@b�R�@c�s��@I@d\2eg��@e7?�=%�@f���M@f�,����@g���L�@h�'��@i�>���@j����>@k�6����@l��b�{�@m���)=/@n��M�]@o���� �@pb��׆@p�ψ��Y        ?gC[�x�?��7y� ?�� M�͞?�NRZE#?��2@r�,?ˆ��p�o?����ڮ�?�f����?��?L�3?��n6y	?�5&O��?�v���_�?��]׃?�������?��
�	�q@ ��T�(@�|��~\@`���t@�.rT7@
�ZܤT�@õ#���@n6~mk*@�b��@�bz�@�{4:�@]�o��@H�>%3@FPL���@V��,�/@y@���d@ �/��Z�@!��y<��@#'����@$]���9 @%���@@&�Όrnt@(5꼠}�@)�	��c�@*�&�rQ@,_7\i�@-�5,� e@/R^�a�@0lf�;��@14(��y@2 K���j@2����j@3��g��@4~Ė��@5\8���y@6=�ܥ�G@7#�>U@8E+9!�@8�ϳ&��@9��~�@:�=�@;��CL4;@<�f�@=����@>�l��@?�1$�c@@���^CO@A�⺒@A�mw���        ?fK�uޣ?��c���?�]�H�/?���Ҵ�?Í��^c�?ϧT�p?׾�k��?����=c?��|6{?�rm�I?�3�9��?��σ���?�e� �W@��Z�M@�VVx�@�B�m@���@�F�T(�@�����@�e�\g@J�"�@7����x@Tn�Q�8@ ж��?@"��Wr&@$f��ß@&WF�X@(`)wp@*����@,�-�0�/@/�D�i�@0��(o@2D8]x*@3S���'�@4���^� @6�mt�t@7���c��@9�:m�@:�F�)ǵ@<C�B�+@=����@?� �d�0@@�W���W@A��\��@B�`;�`=@C�!�?]@Da��}�@E��X'@F�X����@G�랚?@H�?�c�@I��Ғ�@J�?^;�@L���H@MJ��vi@N�>��@@O�4 r3�@P�̛�F@Q%�r���@Q���
�K@Ry#p�GR@S'��Q�*@S�UKt        ?e�� 9U�?�!��w;d?��'���?�K8�%�A?�:�{�I?�+K�g�?�j9��2?�؟�'�?梎�t�o?���� *?�9�`XK?��e���?�Fw���e@�_�W�@�_���@Ϫ�~�@���y�@���G+.@��@�h@�X&A=f@~�ߥ~�@{l/h�@�KB&�@!�uH@"�!$�j�@$�æ�@&��_&�!@(����@*��q��@-H�J�g@/�� �@1���y�@2f��~�@3� zI{�@5*�g ��@6�8q@8$�}5@9����}@;T��pt�@=W�Z�@>��Ӕ/@@A0��Pl@A+�s��@B�]�4�@C�� �@D��M*@E��y��@F&u��b@G9W�D@HS`;�9�@It0��:�@J��
߼�@K�!��P@L�?2��@N;�j��@O}�u��@Pc�Z�OF@Q��vG�@Q��^�P9@Re�3��t@S��.a@S����	@T�q[*�        ?�����?��E�8r�?�g߼��>?����?樼�Ѻ�?񴎠~�f?���
�s9@���N1�@J/��U@�H<E��@������@��aP�@��xw@�J���@"��or@%i�9L�&@(r��7�n@+�ė���@/R����@1_ ��ϴ@3H��|	:@5K�SI�@7fa�8�@9�\q���@;��C���@>L �:@@d���#@A��{<�n@C��ʆj@Di���D@E���R�@GS��y�U@H�Թ�Ǉ@Jm��FX@LI_���@M���*��@Omm5d@P��w'��@Q~|9g$�@RkC�^��@S]�"��@TVS0Ѻ�@UT��=��@VX���A@WbI���@Xq�+/�m@Y��HУd@Z��A�H�@[��M�@\�2̍�@^��|��@_E��D@`=�c݅}@`���4@a}b�@b ��.j@b�G>�:@cp�O��5@d�ó<K@d�A$�@e|�ylr�@f0����@f��'e�        ?s0<���G?��J�Q?���r ��?��G�B�e?�2��w?���Yh��?�	(��"c?�o�fo�?껛��?��u��?����?�q1��E�?�W�C�by@�d�Y�@�(���,@��#J�W@'6j>N\@���9�@8�
@4��~�C@LA���@
-of@�$}J�@6�8M�@��~�@ �k�j�)@"
�b���@#u�J�֡@$�:�P�@&t"�X@(|e�� @)�BűCY@+VqTX
7@-r?�@.�����@0X�Hʺ�@1Jy��ś@2B�.�`�@3Bz��@4G�w�lF@5T.w@6f��I8@7�f<�*�@8�Peޟ@9ƴ�9�@:��@<&�=�@=`�ȷT@>���w#�@?�����:@@��{M�@AC^mx@A�tk��@B����M}@CR��?g�@D�Q�]@D��B�I@E~�qo@F=T ���@F�����m@G��
@H��,{@IYǞ@K        ?qA%���?��r3�J?�>ت��?���q�?����ϕ?�=��*?�v���޲?��S��?�*r��?�@�Vl��?���t�4�?��"���D@u(�=�@\��s�f@�~c�@5���@ˋM8*�@�> =�@���I(@߾H�d�@Y�z�M�@!�� � @#��i"Y@%��@�@'�TVk�\@*թ�@,�0�@|�@/��]@0�Qx���@2M�+�@3�W@�:@5I'�[w�@6ޏ�W�M@8����b@:8@��� @;���C�T@=Ќ���@?�.�u�@@ӹ�z�@A�+w��@B�i��ȴ@C�qeÛ@E=l5��@F(���@GQ׶C
@H���%�@I����R)@J���}�y@L>�t6R@M�{b��@N�%�C_@P �N+^@P�<-�9Q@Q��A&7P@RC���i@Sz'C�@S��u�~E@T�7�:Ș@UQ�s� @V�� �@V���#i@W��j]94@X�L'J        ?lv
��1?��]�L?�8n��.?�m��$�?ǁũj�?�́7��?���Vo�?���?ꀆ:Z7?�K�t�?���P�r�?�T�V�)@ �G9��@����@�EKf�@�(
X�l@'hU�k@���>�@,�$�~a@�V�\u�@�q�o�@'����z@ �6��G�@"�����@$tTXdD=@&rW��l@(�&3�@*�؅C�@-�m�s5@/m@�3k@0��|L�@2C��6�@3��<���@5�Xz�W@6yP�rX�@7��ń��@9��H�x�@;%�7
a@<Λq#d,@>�똧S�@@$9n�@A�[��h@A���@B�.թ��@C�c��#�@D�2ܵ�K@E��/d݃@G	��{�B@H .�ކ�@I=T�GV�@Ja
�V��@K�M����@L��Iv�@M�q9�12@O1Lal)�@P:�K�_@P�D�nc@Q���7@R4��;��@R���Lc@S�dǪ��@TK��=f^@U�<�t        ?���W��?��$o��&?�L�H���?�u���#?�9
W�)`?����>֥@G�+7�I@�i��$�@�^���@�$�
@�K��	@" �s���@%���}�@)w�*��@-�AW�@1	��G�	@3mG�C�G@5����@8�1�J��@;�f���@>��#��*@@���1�@B�QW��@DE Z��n@Fݹ"ʻ@G�����@I�<X@L]�+�@N$`��پ@P,��n�%@QP�ch@R~�,hk�@S����.�@T��r�@VC|S��&@W���޷@X�x���@Z`ho��@[�M���@]N6�1�@^ӿ@�z�@`1n�m#�@`�Ĭ텊@a�����p@b����2@cB���@d^��.W@eB}�h�v@f+�r�5@gh�]x�@h
TT�DD@i ����H@i��2�@j��m��@l ���m@mؓ'Q�@n6����@o(2tS�@p> j�d@p���x�^@q<YMD@q�>Iw3K@rbZ��x�        ?leJ3>�?�B���`�?�NAD�6t?��$d2>T?�~���?��}$.��?��l�C?߈��Y�?�P5���?�n%��?�k�Պ�[?��J���~?��@��Hm?�2����@ l���D@�0A���@���k��@z/F��i@�/e_@�����@��lz@�to
�@Á*��$@����N@���Z�=@�H1/�@:M~蕖@���&@�@!�x8�@"E�.���@#���B��@$�n�t�@&Y":?@'̹�s�'@)L3�0��@*׌�.�	@,n�lxn�@.�g��@/���KL�@0��L35>@1��t���@2�����Z@3xw�>�)@4m?y��@5gh���@6g�s+��@7mlNl�@8yi?!@9�n�I^@:�����5@;�`hz��@<��m�d@>	/|�U@?7"�X�@@5b�`H@@�
��lq@Aq�ӗ,�@B�,��8@B��}.JX@C`�`�J�@D��Ii@D�@Si�@Ei��"        ?d�7��4?����	y�?�̿$�?��$0���?�9�j /?�-Da��s?��`��F�?�s
_�?�)��π?뻧Fv��?���@WA?�$����7?�$���7@@ ^�%��@y��n�@�Ӄ	n�@
��D�@��R�@�����@�MZ�$�@f��?�@�~�-@�ch�9@�����@!���)@"�ec��@$�}|˸M@&h�}aH@([��{��@*eAy��6@,�=]_��@.���\�@0���e�@1����_i@2���\2Q@4<����@5��lY�@6��g�0:@8ZѸ���@9��na@;R��g�@<�����8@>x_���@@0�`�@@�� �5�@A�da[a(@B��eR�@C���|�@D~$�[@Er}���]@Fl��j�l@GlI��E.@Hq�w���@I|�>��i@J���p�F@K�ٗ�V@L�?��L�@M�
Ԋ��@O	|��@PI�%'#@P��� d@QP����@Q���j?�        ?m�dd�*#?��|���	?�X6qlK�?���W�U?ȯ�˘??�ʤ4��?�u�Ƈ�A?��m�׌�?�Mm�v~?�T	p%?�R�IJY?����;@�'��@Tp��֞@	O"� �@���Y�@9Jav9@�����'@�4j��@�m)~p@�6�saY@ Ժ�@!��66gp@#��4�@%��=�@(�0��@*E4��Ot@,����Y@/��$�B@0��)��@21 �e,}@3�����`@5�7��@6�9��i@8&S�#@9��T@;xSr�~�@=7GAO��@?�ŭ�?@@p�+�sK@Af���@Bb�"`�	@Cg���4@Dr�Z�4@E�rnD�@F����dZ@G�2�2V@H��!~@JOʋ��@KQߢ_/1@L���3o:@M���b��@O$����#@P<��>�@P�ͨu�%@Q��V�1�@RQ�6�@S!�@@SǴ'�Q�@T��]�@UL
�~p�@V�Q�@V����v�        ?�'+j!�?�B�D�d?�f�h��?��!��N?렌bx�?�}�j�F?�0eAf@L��"GE@
����@��gl@<Xr��@�"�Wi@ 6Ȳ�c9@#"41�Ä@&M%� I@)����1s@-a��¤@0���� �@2��2'W@4��@7D��r��@9�2�;�@<O����@?q�>@@���Y��@Bi4��L�@C���yx4@E��̳h@G=I*~�V@H���R�@J�0t��&@L��o�?6@N���SE@PHn�|e�@QO��>+B@R_%2��@Sv�q���@T�R��v@U�^¨@V���W�@X%b�-�w@Ye��r�@Z���K�@[��*�@]S9��/�@^�W�k@`�ޜT�@`�Px�g@aRxc�9@b>����	@c���10@cȟQ�l�@d����@ebHf.�@f4�4�"@gr^��u@g�����@h�A�'@i�"uT��@j�%��@ku�C�^@lcgpex�@mT�{Yӹ        ?l?u����?���r&n?�2nE?����D�?��zrg9?�QK9�Ɵ?�}��?�	�+�f?����?�=!���?�����T?��=\{?� ���e?�=�z�/@ i9$*[!@�Tǉ��@����S@M��,$W@F�gH�@i�75�@�t���@���=ww@i�,:@O�L��@Kq���k@\?�D�=@��乒@��T�~@ �Tx��@!�����@"�iK�m@$<�:�,@%�P�s@&������@(O�m��U@)�V��%�@+:����@,���:��@.NHO1f@/�4@��@0��v\a@1�"���@2vT�@3VlW�6�@4;dp��@5%9�V�H@6��]�.@7og�@7��آE�@8��O4�A@9��"��,@;�rw� @<d�[�b@=!�xɲ�@>6�� �@?PؚBA@@7���:@@�c�o��@A]cb�$@A��v�@B�]h���@C'U����@CĞB�y�        ?n�+�&S?��D�+]�?�ĹY6*?�����?�PW���?�#�$'T�?��+i�B,?��l��2?���� 5?�<
�r�o?��w�?��B)�@t-�-R@��w��@ƏY���@����@���X��@FN�d�=@�*��G�@�6A��@�Ⱥ]�@,+�?@!R��ں@#(�V�?�@%	�,�@'#Pι�1@)G��Tz�@+�O����@-�6 ��@0)��Y@1o�	2�|@2�|�ΟT@4$W�0@5�E�es@7BtQI�@8�F�ǡ)@:*Kq�j)@;�Gms�@={1I��@?6�ۢp @@��p,@Aj���@B[���*o@CS'�W�@DP��ä�@EU&ݜ��@F_�i�%@Gpg-f8Y@H�uc�F@I�����@J�[���#@K�-뫝o@M":���@NX��4�@O����`@Pk�1��@Q:��.@Q���s[L@RbFV�@2@S�&�;3@S���d9�@TtCE;��@U*���1�        ?i�7W���?� !VIy�?������>?�^X3�?ƹ��?�Gh�%Z�?�GK�J��?�A�qO�?��x��;?��4x��?���5@_?�v���z@ ��V�z@��N�l@�*4�z�@��>�r@V-2�@���f�@&JQ�4@�'nUK@���+��@1u�f@ ����u�@"�&�:��@$��)8H@&�Y��
�@(��;|�@*�uC�
]@-4�D��@/�HYrr�@14�8�@2h5�c&�@3ǰb���@54��s�@6�$���k@87&�.�@9̲���[@;o�t���@= k��(@>ޘ�4��@@U'�Oa@AAƩYYa@B5(��H�@C/L��r@D01��%@E7���Ju@FF:�e�C@G[Z����@Hw6<=l�@I���MA�@J��=@K�a��	@M)� �,�@Ng�e�v@O��<x�"@Pz����/@Q#R��I�@Q�*k�|�@R~EɅ˰@S0�G�@S�8vg�@T�eמk@U[�        ?������?�ۿo\�?�+�<��?�k�XQ?﯁��?���%�@n@�q��x>@%�KD�@�i��5�@)4�u@��'@e;U���@"()7ە�@%a�I�k@(����B@,����JG@0Q�8�o@2t��1fW@4�WP7d�@7�@��r@9���y�@<L鎜��@?u� �@@����@B���+�N@Di��L<@E�s�i��@Gr���t@I7��X��@K3��1@L�u)@N��s@z�@Pvs�#�p@Q��_�@R�J���S@S��	�ec@TφW��@U�T��z@W*�'�@Xd#6��@Y��j�1@Z힋��u@\=�*ڑ�@]��8�@^��;�@`-�#E`@`�YQ�@a�� b�@b^����@c!A ��@c�+��2�@d�!'lS@e~�Pu@fOޡWP�@g$��[�@g�o���@hٲ4;t�@i�����@j���}N@k�5��@ln� E@m]-�3z]@nO4y�E        ?ve�$�a�?�� ����?�_2BN1?�p��ɍ9?�sN�H�?�*��cM?�G�'�Է?�t�$I��?��C�?�_�i�Q?��_�L��?����
�@>��c(@@	��I@~�)�A�@
�x�\I
@��a�,g@V�v�n�@q# }4@�:���/@��?j�@x
?��@�	3U@�d�q&�@!H4�o��@"���n�@$FSnP�@%���1�@'�?ϳl@)3�o�@*��@lIH@,�QP<nh@.��'�A�@0I�{��@1H9�j@2Mg��y@3Y�A�@4m��	�@5�!T47B@6��e6�@7�L3՘�@9����@:7���@;t�:�Z@<�pSUI@>}�0�6@?R�32G@@T�%vY@Ax~I�-@A�6_Pr�@Bj�\2�@C"+�3�@C�b�H�@D���5��@E]NQ$S@F"���@F����x@G�R �@H�Q�G��@IT�E�@J)�V~��@Ku��]@Kܘ �D�        ?r�,��?�B�q��I?������?��!�9?����6L ?���^�\?���nF/?�e���Y�?�J�!>�0?�Dig�H?��'�r?���n��@3E����@�#Y'�@|-��l@����@L2*�Xj@����)@��?�@����~@6�J��@ �tM~�@"���̌@$�!d�O@&�8��m�@(���yh@+6�Bv@-���я�@0c�Y��@1^���5\@2�>��@4'����@5����b@7*��$@8��.��@:gm�i�o@<�tuF(@=�|����@?��,7�@@����'@A���gL�@B�m8�8@Cĳ�O`V@D�k�3�@E�q,�U@GR�p�@H(�Ƥ�m@ITSR
@J��B�@K�m���@M��#�@NN�in�@O�ن���@P|N2�@Q,h�E��@Q�;9��_@R���i�@SR��[I�@T�p<�@TԊ�;,@U�׏�@Vd�H��@W2y�.f-        ?lv�y�|�?���]�?���ҧ{�?���[�*q?���uM�?�Z�[�?�@�J��B?�+;V���?���b)�9?��-T�?�}��A�F?����>��@ V�,a�[@�㞴i@T�H
��@_EB�@ɗ��4�@J���U�@�.��@����V@��7�J�@�\\�@r@ ��N�w@"k���@$So}̴@&U�\��@(sk7��@*�N#��W@- �d�@@/p�Q� @0�_�jo�@2RZ*?U^@3�h���@5$�d H@6�	`*��@8/��.��@9����(.@;t<.s�@@=,"p/p�@>�<Z��@@c���@AU���9�@BN�����@CO �	��@DV��3��@Ee��
��@F|Ui,�@G�,��	8@H�d�)|�@I��M;@K��e�=@L[[Ty�@M�!'R@N�M:R��@P�y�ʦ@P�n��_>@Qy�C?	�@R-����@R�$��K@S�uѥ�h@T_{��X�@U"6<�=@U���        ?����.�?�{Y����?آ�܅�N?���}�?�
)Kh#%@ )�ř�%@�+=�h@gY�x�_@��k@���\K<@ ���!@#t���@'/�D i�@+?9���@/�G���%@2-�I���@4�..ݫ�@7d�ƿ	@:>�_n@=C3~O=�@@8��As�@A�z��v@C�Q2H@Ez_#~n@Gd=���@Ib��u�x@Kub.���@M�z7|�@O��<�3�@Q�I�R@RE^��:@S�#EB@TƱJB@V('H�@Wof�L�r@X�[��g@Z>�/�9@[� 0��@]4��v��@^�ށ�PR@`(%4��@`���Q],@a�e��@b�T����@cz�@��l@dZy���r@e>���e9@f&����@g��v�@h��ew�@h�ݶF�@i�hvP
�@j�<��J�@k�\%Ro�@l�����@n��R@o����k@p�����@p�l�E�@q-��o�{@q�͹���@rPK�]��@r��:��        ?p��u$��?�R��Xx?�8��`_�?���j���?Ǟ��b,�?�B//��E?�?�S���?���9�N|?�p*�(��?��R�3ݗ?�k�V�8?�Y���;?��B�.?�X߳o=@5Q��@��!E7@�C�R�@
�H!d2@<�P��@��*6@�Ll'@���y��@��8>&�@�=�t��@�h���0@># �c@�Q���}@!��m�@"V����@#�D7�R@%;-��@&v�ѩś@'�na�(G@)o�?��@*��i菹@,�6/x?9@.8�[/��@/�H��y@0�)<L�d@1�4�v��@2���I�.@3�iM��/@4x�vF�@5o륏�8@6l�'�W�@7nz��@8u���B@9��1��@:�7Ǩǎ@;����@<�o��"�@=�@v�h�@?5�v�@@����@@��O�@AN��Q��@A��})0@B��qD�@C.G4ZF2@C�n1vW�@D{6Ym-9@E%��#@Eҭ���        ?hB��Pn?�����Ń?�j�P��?��3:�?�W�⃾�?�h�-e�?؋�7`��?�^.J�<8?�w�9w?��5+A��?�v1�?���c�?��Cq9@��/H�@ѿ��@	:����=@L{S>�.@�ڻ�e�@;��T�@�,X�@�^�3?0@j�y�r�@��4~�@ �OAD��@"��i(��@$h�F@&OO!.�@(L����@*a��%�@,�o���@.А\˭@0�w�Z��@1�HXi}x@3����@4b�m�O@5��;`��@7&+�S�@8��-��@:�c"��@;�\i {�@=8�{�N@>�a��]�@@C���4e@A �M�+�@B/�X�F@B�����@C�����1@D�.+{�C@E�Uʠ�@F�h��@G�i�!@H�Yl#pG@I�:����@K���I@L!�D���@ME�`�\�@NoGi&P@O��L��@PjM�v��@Q���@Q�����@RL�![T�@R�Ն-�        ?k"}C?��V���I?������?����:5?� m���?ѝS�J�?�.G�km?�k��-�?���q\�?�9
�,�(?��T��?��p~C;�?�GA�X�@ɒamo�@D�16�@
���Y@<�m�z@]�U'ٛ@�ڶt3M@b����i@(��ٗ�@�Ŷ��@;�&��g@!D�y	4	@#��Ё�@$�Wٖ��@&��5�E@(�nED@*�/X�i@-~���@/T�^5w�@0��h�@2�-p�@3Xli���@4�	�w�@6�x���@7k�'m4�@8�<ZG?@:[�����@;�,p��@=w̎�[�@?�g��@@`"Utߏ@A:��s�@B|Q�+@B��cR�@C��� @D�v�F�6@Eу7Ϟ�@F��d��@G�1��@H��:�k@I����i@J򷵤b�@L	�u�wj@M&��$[@NIT`�@Op�t���@PO%B ��@P��GD @Q���p@R#���@R�okm�        ?�F�bGy?���u�-?�o�79?�Q/t�f?��j�"?�L4�@ ��w.�K@�o5��@ǛQQ��@��l!y@{޴.��@�0Ș�@!
����@$�����@'T��\�@*ب(n+�@.�ӡ>s?@1N���@3od���@5�-�4@8@L]��@:��H'_�@=)���@?�k�!$M@A`���]@B���1�@Djc1�qL@F�dV�@G��h�+@Ij�]�X�@K3��XKT@M�r��o@N���hO@PtMυtF@Qv�,Fo�@R��L�@S�ޫV�@T��G�^�@U�p�'@V�z���@X���n@YP���n@Z� '�qW@[κ�z`@]H�Dk@^h��X��@_��.��@`�b���@aA���Y@a�mׯG|@b��4�E@cmO��$@d-S<�!i@d�Ն=@e���F��@f����@gOLs���@h N(���@h�����O@i̛�g�@j����@k���{h�@lh�%C<�        ?jN��s1?�ց�A9�?��WݔxX?����ϝ?��o�w?�}����?�O�E�P�?�0ݍ�d?�1�~�D?�qo.U�?�X�YYd�?�r�Y7�?���s��?���k�x
?�2�=�`;@`�uT8@�#�6c@f��R�@	$���@V
�:@'��@&���@��P�n@���L�@i��~}�@Q%j�@m@K&=�/<@W�{|�@w*�Tƛ@ Tt��ڥ@!v|E$�m@"����S�@#ռg�_$@%�Z�o�@&X�o�7@'���5V�@(�A�f{@*_���RZ@+ȶ��8@-:{���@.��=�:@0�M8�@0���Qk�@1��#��?@2zc��@3M���@4$ �,�_@4�(M�G�@5ޅ^8�v@6����z@7���@@8��ak�o@9��j���@:y��ަ�@;r?��{@<n� @�(@=o,_��@>s�L��*@?|c�<"�@@D��6
�@@��=��@AW/f��?@A�|��T        ?g���'�?���d�?�����YW?�(�tOF�?�ꑜ$��?�R��?�\�Z�L?��#�?�:fZ�.?�	{�M?�*��Q�?�e~�+d?��}���8@T�C2@��9��@	XF9ώ�@�+����@	�0�@�j:�@*��'�@�,@�\A@V�o��@!f�d=@#<]�dU@%,�]r@'7�1�I�@)^'h��
@+��e<�@-��&��\@0:�Aw�i@1���*��@2ܙ5܊A@4B�~�߇@5�|aY��@78F6Q�@8ȟ��r�@:f�?s8�@<p�O@=�<h��@?�^�?t@@�r�x@;@A�n� @B��L5$@C�.S!
@D��a��R@E�!�7��@F֝�LT`@G�x�STh@I�Iӟ@JI_ |na@K~t���@L���Iv@M��6�9m@OJs��

@PN���n@P��G�U�@Q��(m��@Ra�
&J@S)�I��@S�l�%��@T�s��H@UZ;�+5�        ?j�D�x?���oT�?�����"T?��,G��A?�rm#�a?ѱYF;�?�X؍�d?���K2t?�Y�;�?�hZ�:�?��<T�u~?���`�H?���c@��|+@��7L��@
�n_z��@��^��@@����(�@F�y��@�饒�@�=�Q��@�V�"��@ I��+L@!�"�2�5@#��	�z
@%��S:@'�Tސ);@)�F[��@+�rͭ�
@.B�I��@0V���&@1��$��p@2簄��M@4C'��5�@5�R�<@7 ./�@8��,��@:/�kV�@;�Ȫ���@=r@s|�@?&N#�@@sti�Vo@AZ�Μy@BF����@C9�b�@D3z��@E2o�þ{@F7�2!�@GC���+�@HUu"ϡ@ImV[�B@J�GY\g�@K�C4�T.@L�C��"�@N	B.�+@O?8�
��@P=�$�3,@P�yŒ�@Q�S~��@R)ɞY�@R��B�U@SgF���@T.�E��        ?�=�HU�?�&�m+wV?�᮰Q �?�g쑋^�?�G�ek$?�p��xx�?��q�fi�@?XF��@
��c�:�@���@˜F��@��f(@�F8���@"��F�N@%�1E�@(<X"�4-@+�2n�#f@/I%��vG@1�y:�Sk@3���m��@5�\	@8_�6�o@:c��Ɯ@<݁��D)@?r�,��@A�&��@Bw�_��:@C�v��@Elo*�9�@F��O9��@H�L�<��@J?���6@K�̹��@M����@O�G�_c�@P��O�7@Q���Y/�@R���g`@S�-�3=�@T�D�@U�7�)��@V���_�@W譆Q4�@Y	�XPJ@Z1~3:1@[__5�7@\����Ύ@]���t[@_�%g\@`*΃���@`�bD�ܴ@a{L��:@b'�@��@bײ�s�>@c��b��@d@� Q�@d���ߡ@e���e$]@ft�c�_�@g7
�?�%@g�-��x}@h�M)�u@i�e&5�        ?l2Li��?����� ?�j3�"�R?��KJ��0?ŠJ��z,?��C:#?�Y�m��?�yQ��?���� �?���0��?�a�4X4y?�'�eC��?�Ng��S�?�֠���@`)�G��@ֶ�b�@�p���@	���@ҕ��@Ce+�@��!@�W���@�^���,@ Eɕ@>��Q�@��^-��@�ۓ�v@ �I��1@!� 	�~�@#Rܿ�$@$�k�
x@&#I��@'���4@)%D�q��@*���&o@,Xl���@.T����@/�p�f��@0�_��1@1���>��@2����x�@3�r�p��@4�/Je@5���\_�@6��Ts�@7���-�@8����
@9���	E�@:���ָ@<�8`@=7���@>h��u@?�.=RCk@@n����3@A�1���@A����FF@B]L�*�@C�o@C��er=�@Df^�;M@E�f�@E�b�,��@F��[-D�        ?g����t?�����0?���=��?��#�-�_?�[�e>�?�Yg�yf�?�Z�	��?�)���?�-�y�DD?�G�&'ެ?�@D�˶A?���_D:�?�9�"�@���i�@��j�@dO6:�@It���@AO��U%@�Sy_g�@�I�L��@��`lh@`ӫMg�@V(%�4.@ ;�U�]@!�;N�PX@#�����@%uE�Pa�@'`<���@)a�0��Z@+zh�1�@-���&�@/���D@1&��T��@2`�&a�@3�,��b@4�9��@6S�	��6@7���(t@9/TH4�@:�Np�Q�@<8�4��o@=Ή����@?o�=��@@�!i�=y@Aj�m�|@BK��Ϭ�@C2�G^��@D��[g@E�p�aX@F	�3��@G7B���@H
6WkA@I�M�Q@J ����@K4P)UҺ@LMW;ffU@Mk�c,��@N�̇O�@O�2\�-�@Pt?O;G@QA�H @Q��HDr@RJlW�}         ?h�.8�s�?�8���X?��\�խ�?�U�e?�޳7��9?ѥ���\x?�h�3գJ?���T?�Z�޼?�wB�a�?�8��{�\?�|���@ 9BR�9@���Oc�@B6k��m@U'I��@ɧ����@P�,QK:@��"�@����I�@� FB�@�̦�K@ �I��"@"�k,
�J@$v���P@&~�D��@(��@I��@*���ªE@-=$�m@/��6�@1#���i6@2{qj�@3�q��@5U���3@6�k
w@8i�����@:	!2jx@;�IJ<@=t#4�@??v��7�@@���
%@A�:=�@�@B}r;�@C�PO�V�@D�h�1K@E�*� @F��w���@G��{�72@I ���@J0�$�]@Kh�N�@L�Ȍ��@M�-@O=���+@PI�����@P�h@�F�@Q��cN@Ra�P���@Sη�(J@S���1�@T��m�m
@Ua�q�@V+4�
G        ?��/�^(?��inQ=w?�+�,2z�?��O���(?쩓Dض�?�Q�V/��@ $�Y���@ �MT�@~��@����5@�Vs�@��M�@ ʔ5��m@#��]\n�@'��{@*��oU��@.Xa'p��@1/,@�@3R\���@5�:Ώj2@7��&��@:��/%	@=%3o�[@?�W�Q>@Ai�U$�@B�_%k@D������@F$����@G� ��_�@I���q�{@Kr'䝬�@MV��hL@OK���o�@P�=&��@Q���2��@R��9ֽ�@S�:�R�@UmT?��@V+�d��@W]��RH@X�m�,�@Y�5��6c@["�)b�@\tp1,~�@]��M�C�@_/:(.�@`L9��r@aŨ/y�@a�?8z@b���E~@cE�rR$c@dY;�|@d�/d��\@e�Z*��@f}�{	�?@gUsp7t�@h0�_#o�@i�f�a@i��zo��@jفU`	�@k�Ի��I@l���\A?@m�~�u�        ?nu�o�%�?������h?�/ô7�:?�����?��弦85?� 9�g�?�~� ��?�MD���?�����iy?��(K�?�T]�jh�?�p¬'?�(��?���|H�n@;�����@�]f�5`@�R�6�P@	�� ٗ�@�-���w@�M��@Чit��@���G�@��b���@�-a)�@�!7��@���.2@Us��eZ@ ^ߏ�@!��$9yB@"�:�b�@$Akv[�@%�E�#�%@'�3�O@(��o��@*�I`��@+�,߈�@-A=�}�'@.����a�@0O��;F@1/�o^J@2�4�B@3 _!}f@3�{��*@4�Ý�[;@5�>ލ�@6���@7�P���@8�2	�Ca@:����-@;*���.0@<I���X@=m�j_y@>���u��@?� ~��~@@~�M�@A4�p��@A�"���@B]ʍ+ƍ@C*�`�@C�?Q�M"@DV	��@E���@E��S�1�        ?f�'+�?�!��I?�v�uΑ�?��tEi��?�}��b�j?�{�|���?ו-FZ��?൒~܅?�-���?�ȓ�A��?��i:�?���9ŧ�?�<���@��[��g@�~rhT�@�t��r@�
0�@tw�w&a@�5��#@W�R��@,ϳ�@��]��@s��q|@ ��s9)�@"c�7fm�@$7q��)@&#�Q��D@((]�?@*E��,�;@,|��n!@.�0r�@0�z�"�@1�|��T�@3))�+z@4��;p��@5�^�)@7^�T�h�@8�^8��"@:l��d,@<��g�G@=� �^@?crӊ��@@�sUo��@Ay�NK�@Bgv|�1�@C[űN��@DV�X��i@EXx6L�@F`����@Gn�0iQ@H����qG@I�^��s@J����@K�u^	�@M�/��@NO�a��@O�V��t=@Pg��_�D@Q��zq�@Q��$�Q@R_�c3"@S�}��@S�]h���        ?h\D8s
 ?�i�OM$?�%�e"�?�Y��!?����'�?��Rc��&?�3w$~?��T"U��?�&�ż�B?��:�F�?�1)W3�?�0��~�?��'�<�@��
j�,@,u�*�@	���Y�@-j�ꌬ@a��i@��C�f�@� ���N@dta +�@ru����@���坐@!��r#\@#f2u�"@%Sif��
@'Z�<�(@)|��b��@+�,]�@.���@0Aqڅ|&@1�<E��
@2ܵ����@4>�vƤ@5��`��@7,����@8��j�U@:R���Q@;��:~�I@=�ũӜ@?uM�?'�@@������@A�EX�{�@B��1nT@C�larG@D�;*|��@E�4� �@F�Z)�Z@G̭(�nM@H�.N�	l@J���H@KI��f�@L��<5j@M����@Or�M@P*�M�x@P�ꏧ'4@Q��P�>�@R4yNk�_@R�k�ue@S�dz֓(@T^�.���@U�>��        ?�y.����?��ﰜ�?��eʲ�#?�dx���?�̣�j�?����?�urx�;@�A�7�@v8L��@�}�e�}@�D<�}j@}H�]��@�W���@"��ф�r@%����&@)��@@,�lcG�@06�Ga�X@2:�e��@4[��U@6�]��է@8�B*d@;uI�K�@>l��@@c���@A�����@CIp�l�@D�+�r�@FjB[(�H@HQ���@I�XV�R@K�T��;V@M`E/�@OC(B
@P�}툊�@Q��Is|/@R��2���@S��0��@T��Ǜ�-@U��TncF@W��d$�@X9ȅ~Z�@YnV3F��@Z�P:k�=@[��Q�@]8v~�ߎ@^����l�@_�N<��@`�kv�� @aVs�O��@b��^�@b�fR�Oh@c�J�G@dJ���ŵ@e��.�@e�z�^@f�����@gxh�ES�@hL�5Vo@i${���@i���@jޝ`EEw@k��z�s|        ?o�b�?�[�A��?���U�?���:s!?���T�D?Ү�d���?��%3��+?�]�
�7?��ًƁ?�N�q4�?����[�?�
���g�?���U8\�@ /����@пg���@���%��@�����@� n�`�@M^���@tʻ��@[����N@[j`�@s��s@���4	�@�3U��@P4�X�@ eW�ֆ@!��NA�@#l9>Ғ@$f1��?@%�>md�@'M�3l�@(ӽ��@*ei���X@,ݼ�6z@-�TO�4@/`����@0���	3�@1vX�
w�@2a���2Y@3S���@4Iٸ�z_@5F=3U@6H1<�^@7O��F�@8\�e1��@9o:TA�@:�=�'�@;�����@<ǯ��t�@=�~�V�@?�ͨ5�@@(��SCJ@@��_.2�@Ac�;uL@B�/�w�@B����8@CP��5��@C�P�b�@D���@EUJR]�@F��f�@F��9�=D        ?pgi�u��?�8�{5�?����<��?�%� B��?˺�p��?�1G���C?�}9��9?�3Z�!V+?�N��Q?�p��'u?��v��$@ *Wb)P�@�m�m�$@��c߷@+��M��@���[t(@-P���@GTA@@.��B�@��L�c�@ ǅ�-�@!��Т��@$FA]��@&0x�t�@(z�e�N@*�k�S��@-p�?�(s@0���8�@1uG5_��@2�3���@4u�[l�@6@)�, @7�|P�
@9s�܇��@;@XB>�@=;m=�@?;5�@@���@A���}�B@B���.��@C�94q�@Dߧ���2@F����@GA2d�J:@H_�^e@IƇ��@K���C@Lo�\Ж�@M�0�]?G@O=��_o�@PY
���W@Q��G��@Q�KO�u@R�N�َz@So��}�;@TA'H %j@U�=��@U�v  �@VЍ	�@W�E&��@X���[β@Y���LF@Z{A;�y�        ?gܣM7�?����M�?���t�Z?��5:sl?�a���?�[��{?�]
/?�,�s��?�7�#e�?�[�B���?�R5Û�6?�|����?�d�OR@������@��N_@�l�7z@�� �>�@h�q$�@���u�@1����H@�:ƃ�d@��>��;@���@ j�D@@"aPu/�@#ڞޘc@%���p�@'����~H@)������@+�حS<n@.4)Z�@0(j��@1Z��#�@2�b��@3��y@�@58��ы�@6����@8�~��H@9���^�@;d�o��@<����&�@>0�+��O@?ؠ��;f@@�<Mݝ@A���U"@B�4��>@Cv���Ii@Dg���ɨ@E^���@F[�J{�@G^7�a�c@Hf�e��@It�D0+�@J��7�@K��N�N @L#���@M�$g@OV����@P"/"�7m@P��� �@Q[�; P@Q�
�(h�@R�����        ?�)�R?�e�a+�?�KD�e]L?��.Gv?��� �?�5����6@��>)��@	Ѵ�H��@��:qO@�~�P@�4;���@ A�r��@#l@A��@&��$6�@*���Њ#@.�����@1xV5�@3�<���S@62�3
6�@8�ď��@;}���@>X�GK@@�'�@@@B=��G�6@C�2�T@E���8�@G]��M�
@I6���j@K!��@_�@MT���@O,�;P[�@P�Z�ÚR@Q�$"
r`@R�@ghU@T
�<h�B@U=��T@Vy1��ag@W�2���F@Y	���,@Z^��ˎ@[��@]!�Wz��@^�/A�վ@`bR�7�@`�د��@a�x�۸@bN@|�q@c-��6�@c�?z�wB@d�s�q#0@e�Ȱ�v�@fs:�qS�@gS�n�@h8gI1z�@i!N���@j�Zg��@j����x{@k�Z�uc@l�j:3l@m����*,@n錦��@o�5G�+�@p{h�Z        ?m4j$'Kh?������?�vuK�?����(mg?�d^����?ϙ�5cl?����]�?�%����?�t�2u��?�
�,��I?�)����?��
�e�?�~�N��?���O/R�@ ��^A@� �K@(LS�cF@�1�T~�@
��I�@�S5@�� '@_�AcU@/T��$"@�XU�@��X8@T����@?��A0@xn��C�@ b��T=@!����O-@"�gJ'@$���\f@%d;dܳy@&���k�@("�qÌ@)����(@+��U"�@,�塱��@.���@/�?�,@0�L�$@1y׍���@2S:U�O�@31p	T��@4sxC6�@4�?�S�@5�ς�in@6��c�G@7�)=��@8��V��O@9�bM��@:Ί���@;�c8�Z�@<��/< @=��q��@? #.��@@�E��@@���o�@A7X���@A�#�mi@BcB���<@B�����@C����h6        ?h|�C?�Gz��=?���횋?�7��PT�?��>�0�7?��X?Q�?�FPs:?�Ϗ�?�9/i���?���̆?�87bt0?�`FK*�h?�沞��@9�{ �@}Vμ�@	G�/]G@nN�'�@�/D�@j����@����M@�1�;�@�UzP.:@�]K�@!A�D�%@#�l+��@$�{�:@&���W.�@)l�!6@+I#�e�n@-�6)��'@0�\^��@1Dr�ɋ@2�[� ��@3�+�@5\`[�Q�@6Ԏ��N@8Z:��>@9�kwo�o@;�&d��@=<p�̵@>�K�.7�@@`�3� @AL]�~�@B>�bG<@C7�>gF<@D7�C:��@E>Ȝ�"@FKbp�@G_^���@Hz(�{*@I�SF��@J�:�J� @K�\��@M&�|�=@Nb9��8�@O�0��*�@PvI��k�@Q�)j�D@Q�:1cN�@Ru���@S&��u/@Sڹ�&u�@T��dְ        ?i��V�|�?�?;aw?�����?�Ҋh��b?�E����?��1K�?�s�|
l�?��nb�C?�F_N��N?���t�?�5�9ۧ?�)�)0#?����Ź�@}�A,�@�h(�&@	��7��@��.7@)��4TN@�����@)�~��]@�p�0۵@�LD<�x@����b@!)�?��o@"�[�:�@@$���&�@&�R/�L�@(��To�@*�)1k<@-��/8
@/^�|fF�@0�S~��@2#���z@3o����@4Ȃ7Z�@6-P�K�{@7�Y�<\@9���@:�!�Wzm@<:�֥q@=��洼@?�	cÔ@@�ňWFE@A����@Bo�^F0;@C_0��@DT�����@EP`��% @FR"�=�@GY��.t�@Hg�#Φ@I{��)j�@J�{D��1@K�Pb�G�@L����D@N��$�@O8xթh�@P7�����@PֱKG�H@QxM�c�@R�MH�@R�3�?(g@SnvHF�         ?�@�]G?����.�?ο�U��?�E���?���Vw�?��Q�/2�?��+[m�@��2 J�@
�5��g@-�ұ6@W����@���.@"T@"N�W���@%P��bO�@(��~��@,��}�@/�����@1�#v��7@3�V��@6c@�`@8b)�w3A@:ˍ(<�m@=Qo�I��@?�-�@AY s�d�@B�z4��@DA؏&�@E�+3't�@Gb`�!��@Ig6��@J�+�;�)@Lz��q�@NH���A<@P�P�@Q�3���@Rè���@S��Uu@T� �@U�s�@V0�@J�z@WL� ��4@Xo�Ԡ�@Y���-M�@Zȅ����@[�����G@];F�gH�@^~J�L�@_ǵ8[�E@`����>>@a6�.���@a��m@b���B@cK�n��@d�1��q@d���l��@e{۽a|*@f=pI�\@g}֒b7@g��.@h���� @ia�R���@j2�H��        ?pYpM4?�o>��a?��P\��
?��;i�?�q�n�?Ҡkb��"?��t�R/_?�SH��)?�9ch�?�\�;��?��h7F~?�K��|?��O:��@ 75�e��@��J
��@�fy��@��#���@	��8��@�K�@�9I�u8@�T�GN@�P�K�@� �m�J@��r.&@C��8�@����~�@ �?��:�@!����@#M�8g�3@$�ٖ��l@&0V�q4�@'�c���p@)D�H��O@*����@,�_`�Pp@.A&;���@0�$V��@0�Ұ��}@1�&�S0@2ɘnǦ�@3�#�Ȯ�@4���Z�@5�x�4t@6�:�n@7�sr�@8����Ē@:���r�@;?s^#w6@<i3�ub@=���*@>�z?Z�i@@��mP@@��z��@AI;wL0-@Aﶈ�+O@B�bh#@CEI�F��@C�W��Gm@D�6ae��@EZ�,,@FT�)�@F̋�b�S@G��]��        ?j��5"?�zp��r�?�n�z{?����$�=?���c6?�6�i�Y�?��\��?��a��̓?�X: �I?�NV/I?�$[^�{?�@0@  -q9a�@4�2��@�_xF�@
�F�@ܩ�t4@�F
7e#@2�6@�-�8�?@��IWM@�J$f�@�
�So�@!��Όј@#qG���k@%S���$�@'N�F]�
@)bj�B��@+�pƭ��@-�f���@0C7��8@1S`AM@2��gA�@3��?b��@5O��(�@6���f@86C��L�@9���@;Oi��\�@<���RT�@>�!��+@@)��8�T@A�ZS>n@A��,GG@B�\f�$�@C�10��@D�bl��H@E��'�f@F�����@G�$=��<@I�'}"�@J#�)�֌@KF���@Lnƻ��#@M��>�;@N���n@PQ�3��@P�?���G@QLO#��<@Q�~iv�@R���Ch'@SK5�\��@S���        ?n�]i�?��/�}?�tB6�q�?��m�?ɵj��y?Ԕ�D?I?ޔv�Ư?����?�����K?��Z���?� �X�H�?��G��z@-�Khp@�F]I[S@	֎��q@>��q��@�Z�j3@/s���@�\oC#@�j��KO@Ե%�F@ D���@"2��IW@#�"����@&��%�@(!ٺ�@*\��"��@,�(u��.@/$��j��@0��L�M�@2-'bW�A@3�)�56s@4��
x9�@6|��Q��@8�oh�@9���6@;H�1�@<�����n@>�x����@@G�V��`@A7Nӳ @B-�Q�@C)�iE@D-���@E8@~C�i@FI�� Ss@Gb9��@H�Q�A�@I�d��"@J�P�jy@Lڌ��@MB��?͍@N�$�@O�j���@P�¶Aa�@Q8�z�@Q����)@R���>D@SNP_��@T��� @T��@U��e7*@VD�e{&�        ?�)�wܗp?�	�VoҪ?Ӧ<�+D�?�����I�?�6;4B�?����A@D�pG�.@
\�/���@RK�My@��O�@c��k~x@ ��з�`@#�觶�C@'{J����@+V��s��@/~���5@1���Hӫ@4W�0q�@6ܾ�y��@9�;:D�@<V���L@?K�riO�@A2��_�j@B�B����@D���@FH
;�<�@H5����@Jm5=�=@L �=�M@N�
y}[@Pkrg�@Q,���@RMM��@Sv{�$@T��C�06@U�� s.2@W$��@Xo�h��@Y� ��i@[�7�@\�)�0��@]�a{@_d[�阑@`p����j@a3:g�+�@a���Y�@bĔ�;��@c�Q���@dfy.�X@e<��)�@f~f/�@f�[g�(@gأ�WYv@h�
z�@i�HSt�@j�Um\M@@k�)cA@l~����@mx+�(@nt�.��@ou�c�@p<ݒ�,�@p��1        ?l�I�F��?�0#�7?�l�ص\G?��04��#?�vx�0{L?Щ�:�e?�
��h?�q�W�?��5O�?�|ٶ��Z?�SF'�?�����4�?��#�g{�?�/��j� @ ����ݕ@���jg@KQ�b=�@	9 9��@UZ�[e@�6:|x@��7.�p@^�:|:F@H���@I���4@av��k@�"V~2�@գ�Cǈ@ �	`V�@!R����@"�z��h@#���A�@%C��K@&����$=@(:���@)�.��)�@+$���B�@,�X�ҕY@.Y�q�U�@0�e-su@0�"�]9�@1�`��g@2�S�
?+@3�����@4�W�?\�@5}g��@6{,��4@7~�b"�T@8����e�@9����ޖ@:�W�"�@;ŧ���@<��8��@>h����@?6�p޺�@@3�����@@�l��6@Am��3@B��w�@B����@CYƜ&�@D��!�&@D�Cȏj@E_��b��        ?ktk�,?���u��?�{����G?���}���?��r�Q?�ZE�u��?�H͔�N�?�2����3?����p?��p��?�|�0��?��M�G��@ L�gk(�@��_���@5�c#�d@1_�@��_��@%c�#@�oX�4e@`~E�{�@IאJ'@c���ڒ@ W�.�R@"��@#���@%�@��)@'�@�*@*�_wX@,H��{�@.��Z�n6@0�G�L@1ͫx���@3 �R]@4�33$@5�Aσ�5@7f�"!@8�	���@:�<¡cC@<"��v@=�_�6:�@?�ZF�]@@�P�}�@A���h�E@B��T���@C�$���@D�e����@E�M���@F��}��}@G�j�g@H��:e@I�U�<��@Kf�5cf@L5D��@MiTF�c@N�)�O  @O压�
x@P��:��@Q=����@Q�w�0v@R�3�=C�@SG-UjL�@S�b��j@T�ϋ'f�        ?m��C��?�����c?��YS�)�?��g�S?�&S�"�#?�Yd��,?���J��?�Dj���?�_PV|��?��)k�x?��`$$�?�P�Wv�@L9��U�@�n�4��@�C�ث�@��V���@З,x�d@Y���@�؉�j@�z+y@.%ʕ��@���"r�@!���_x�@#u��-R@%w���'@'���A��@)жh�S@,(1M�J@.��\��@0�~ h�@1�����@3T��к�@4��d��@6M܆��@7��a��@9��X�=1@;4��`F@<�T�F�n@>��IN�n@@QS��?Y@AH_��!@BGɧ�@CM��r�@D[�Z��@Eq}�,�@@F���nG@G�s��	@H��i�@J����g@KS<���S@L�ķ�߶@M��V�@O8I����@PJ%�y@P��J@Q��a��+@Rk�|4Q�@S)V��'*@S��T]@T�vs\,@Uy��^�@VGB�M�@W���        ?�J��S?������?���W�;?�H#���?��2�?���HU@���R�^@:�SU�@۩��@K�'� �@6�ԥU�@�r�t�@"Z���@�@%��rjk@)6s�8@-�2@0�Rc��K@2�'�h;@5s�q)@7�7�9��@:6u���@<�1BvE@?�k���K@Aq�[$<�@C5��:@D���ԏ�@Fg�G��k@H2�}�5@JZBj�@K��(e@M�~CP@Pc���{@Qz�@��@R5���i9@SY��p�A@T��2q�I@U��P�l@V��^x�c@XC�	�@Y���H��@Z��X�M�@\R0B-�@]�v���@_3ζ6�B@`Y�G\@a�n~�E@a�(�ώ@b� ���@c�ga`S�@dY]��@e3�h��@f�iZ��@f��WW@g��򚾳@hˢ�dǰ@i� q��@j���(#�@k�x�2�@l���D>�@m�M��@n���C\@oő�#v�@pk���=        ?h2�ټA�?�l�D�Q?���6�?�PÔ\��?G��t?��oA=3?���$Ԩ�?��e$)*?��>G�iR?�<�E;(?�'��#0?�^��W ?��$�Ӣ?��p짯�?�;N�`�}@lL:��@�6Jei@��d��@	T�NY4@K��y�@liѽ1;@[z� �@�Q�"�@䧏4I@ȇ�t��@�B��o%@�۳�&$@�V+���@(����r@ ����w@!�����@#&)�@$k�'�=?@%��j���@'�����@(z��k@)鯕��@+c�~́@,��Vkx�@.t��ze�@0q�-�f@0צ^��V@1��6�`.@2�\����@3i� �S�@4Or]�Y@5:;�Զ@6)�b�A�@7���@8��a@9�H�@:�W�S@;$ʭ�@<2�$r��@=F���@>^�x
Q@?{"��*�@@N��`J@@����@Aw�9��?@B7�uS�@B����}@CH)TҌ        ?g���?��EZ�ӌ?���W�hD?��D<2A?Ĩ�W�O?Ы��jVr?��}s�	�?����t�?��>^�`�?�i���}?� ���?�)ۆ�?���ᦒ@r�9���@쾼hQ�@	�H/�@���t�e@9��C@���cfS@L{
N��@K���4@����@J�����@!T��P@#�;(�p@$��BY�@&��>id�@)U�C1�@+.H֔��@-o� ��@/�]>�Z�@1���$@2b�e�@3�OND@5Ĝ�p@6{H���@7��)i4�@9rF̀�@:���%�@<���Pԕ@>=��x�p@?�c�KbX@@�Q>1C�@A�60.�=@B�����@C�)�/�@D�!���d@E�����@F��
��@G�����@H���F��@I�,��f�@J���]@K�]���@L����"@N��%�@OE��|`@P:��`@@P՞��Dd@Qr�dӰ�@R��n�@R�����@SYt�	��        ?fҭ��?��(��?�`���?�TF�l��?���Di?�?��0~?�Y�*�?�A@+���?�m�7��R?��K���R?���)?��ݫ!! ?�
�e�Wb@j-�j@��%�B@	N��l�(@m+C��m@�BN�@]�{��@�S�A$�@��,�,Q@�Ǭi�%@߸x� *@!�^���@"�^E%�>@$�.��Ɨ@&���S�?@(�}��?)@*�'�i�<@-&�2?]@/~���ڪ@0����FZ@2<����@3�x��j�@4�r?d�6@6V��T�@7�p�@9Qw��M@:ባv@<~$���n@>'H���@?���_6�@@όY�9@A�޺y�Y@B�l_���@C�2]�d@D�-�[�R@E�[,�`r@F�����@G�@�	@H���u�@I���[@J﾿x�@LԻ�q@M@��7@NqK�q�@O���:.�@Ps[��@Q��)�c@Q�u��h@Ra.�@S��a@S����~        ?���Fり?���-��?̀P�Z1r?�0�R��?�U�Jla?��: �ˉ?�����ߩ@�,^c�@	�T�)@���%"�@��z�,�@�����@���j1@!�˦�@$�[�:s@'�����@+�%sy�@.���$��@1-�V�|@3.	����@5J]�,��@7���S@9ր6�`%@<F'�5@>�r� %�@@�)���S@B`��x@C�Y�J�@E	D#TR@F��$f8h@H+����@IїM8��@K�)|�@MFc
em@O<���@Px����@Qm�?��c@Ri~����@Sk�`p@Tt��@U����s@V���x-@W�ۥ3@X�.��s�@Z&����@[5���K�@\l��{��@]�>�I�K@^�O��@`o2@@`��v��G@ap�s��@b�5[a4@b��[�=\@c�>ֽ+@d?�0�2@d�3���@e��]��p@f{�ZqH�@g@��hB@h�a�֮@h��~ @i��(\%        ?p�5�m��?�?)�H��?�:��	�?��'��?ǬN��?�NB�sǴ?�R�H�te?��@�^I?�mBt�?�޳U�6Z?����=�?�s�\"��?�� "�y�?��� �BT@P�n%d�@�n�|@��x��b@ pF���@q�K��b@���o[�@�Yw��@�&�@���d^�@�Q��#@$v]6z�@t*�hM�@�N��@!,���j@"w�x��@#�5��@%/�Y�Ƈ@&�c�y`@(���j�@)�N��"@+(%���@,��7ؠ@.f�0�k@0NN��F@0�|؋U@1�R�Щ�@2�q�d@3��~1?@4��{�Պ@5�)0Y��@6��*���@7��ed�@8�@���v@9��zͷt@:���g@;�j_@=l@<��^�@> !<��@?7+�P��@@2GE�L�@@ˑ��%@Agoj	^u@BޘB�R@B�ڻy�3@CJ_�YW@C�j~���@D��X�I�@EC�q��@E�v3�        ?i��) ?�p��W]?����u%?�3�poK?Ŝ[h��m?�W>*̈%?��R�Tbu?�3w��,?蘷���?���"m^?�u,�f??�v���c�?����OA@��/��@2���@
E	*q�@6��adg@`����@қ9vQ�@s����y@Cq�LY�@B���@qq'�![@!h�P�N@#/�A�HW@%c�x�@'yO��@)�Ĺ�Y@+@�U��@-�vd�,/@/܋���B@1'�@&N�@2mCvꀶ@3�9��	-@5����@6�%��@7�� ϝ@9�!�@;���fG@<�=4Wb"@>U���@@����@@��g�<@A��w&�@B�	j,ڻ@C�<^�X@D�lv��@E��P�i�@F��$�\@G��?n)�@H��:�!�@I�A�s�@J������@Lo�@M7,�j�@Nc��;�o@O�k�G�@PgD֒{@Q#G��@Q���R�@RL=����@R�p�{)�@S�bg�        ?l�*	�?�n�{۽?��E\)�?�M���s?�i�n��?ҽ��<�t?���V��j?� ���?�v��M/o?�HJ6F_?��g��O�?�W��Sɣ@ ��Z�@���@�(gy}�@����@4a����@����|R@B�՚��@���.@H�ur�@P��ţ�@ ��6�/@"�A#�(@$��_�@&��>��@(�M�g�@*�$-3@-F��qb@/�����@1ݘ�ӿ@2r�
�]@3����Ħ@5@���o@6��.��@8Fd���@9���Ϡ�@;�VlgC�@=6��sme@>��Rf�@@c�vm@AR}���@BHA�3lt@CEn�|G@DH�)G3@ESؐ�{"@Fe���@G~��#�`@H��G�@I��g��@J�@S��9@L)4k�@Me�LP�@N�'�`�@O�{�}�@P���3�D@QN��R��@Q���3�@@R���?��@Sh��d4i@T#+(<�@T� �E#>@U�n�#޸        ?��{]t�?�5az ?�(��&.?�b�zs�I?�(�|?�z����@�|��
f@�y��@�6�?@Ԟ�sn@�J���s@5/��D�@"	���g@%;��$@(�1Y���@,ijD�t@02$�>�M@2P��u;@4���	�@6�Rx�1�@9r��'@<;�ft�@>��ɧ�@@ݝ���@B_G�^��@C���� �@E�x��@GC���T@I��C�@JՈ�x�r@L���}�x@N�c��5@PR.�`$�@QYF�=�'@Rg��M��@S~�Y*g@T����#�@U���+�@V�����p@X �A���@Y[�txH:@Z�J���@[�K��@]9B�}�@^���G�!@_�|��@`�lJ���@ac���E�@b� ɩE@b�.�<��@c�c\Q̤@de7yK(@e.�hL�s@e��o�]@f�H���@g�q�4��@hx&�ٽ�@iSb)�!5@j20�yt@kY0t*w@k����@l�/2#�a@mϿ���        ?mJH�J'W?�Ln"���?��3���?�:dma�?��s����?��M��6I?�k��ݾ?�o��8?���t@V?��-�#�|?�\��![�?������?�>��U�?���쪝�@Pa�
�@�Jd��@�r�^�/@	��ɏ{�@��c�@(]fb%5@�_�asG@�V~j07@�:8��@� ��@������@>�u�C�@�gy<@ �s틔�@!ũ]
�@#����r@$om����@%��cMu@'H?�̿@(�I����@*P�9k	@+����@-��`�"�@/3���x�@0v$�h�~@1X8��\�@2@h:j@3-�6�n@4!W��#@5"�M@6�b>�@7~�t�@8&��/ҕ@96a]��I@:KU.��@;eĿW�@<��x���@=���F@>��Y� @@�5��6@@��W:��@A;1�n;�@A�M��6�@B~~��v@C#q�4�T@C�pP��q@Dv��w�@E#/���@E��+���        ?i<����?�^�?��嗛��?��X�=�?�YŲx��?�1��ٹA?ٱs�M<�?�*"���?�a	�J�?�"\�v?��Zv��(?��>f<$�?�r����o@󍡏L�@�H3xdP@
y��=�@�!�*�@�tT��@E;o��H@��\`c�@�q!�l@@�um�@ /�����@!����@#�ʺYC@%��Ǥ�@'��Z7�	@* �N�@,X�;ж�@.��n%�@0�Kˆħ@1�Fk�@�@3LX�5m@4��)ʊL@61�j�@7���>�@9O'>�z@:�����@<�y�C@>hݨ��@@�6,�>@A>��	�@B8M X�@C��F7�@DwN�͟@E�7�?@F)�a�{q@GF�xSb@Hj��te@I���Y�@J���՚H@Lީ:�i@MF{�<@N��L	�@O��:��@P�XM}�@QO%V�V@R�l3_�@R�v���N@Sx��9�z@T9w��e@T���=��@U�;u�=�        ?gm�hwı?�b��"{?�xT�/�W?��x,@�?���݌?Ѝ)�`��?�ȂZ�H�?ጣq.Z?���bo�?�?�Wp�?��Y��?����LD?��OՔ�@h�Е@宴h�+@	��*su@�%�t�@B��ӎ�@�5[��@e��d��@@���I~@M�q\j@���/�@!6�.Z�@#Q�Ѝ�P@%=�c7ؙ@'C�F�B@)d �u @+��l(�@-�S@01����$@1v��G�@2�}Ϩh�@4)��|�@5�rp�V�@7�@�5@8��?{�z@:2���F�@;ׁ:�X�@=��96%@?JF�Z&@@�9�@�'@AzA��#@Bo<X�4�@Ck-�Q��@Dn.;�-@Ew�����@F��@���@G��~c_�@H���T1@I嚩7�u@K�|�@LF�˛��@M���x]N@NøB�Mm@PqrS�@P���t��@QZ2,�YY@R	^|q�1@R�]˒�@SrMmрx@T,#{�@T�VϿvw        ?�&�@��?���-��+?�D)4"oP?��*N���?쵮����?�X�6�D@ )��%%�@)���@.3h�`@�1���@$N3�q@/��E��@ ��a��n@#��� ��@'2w��u@*���ٹ�@.���be�@1O���B@3x�5��@5�N���7@8/@����@:�xǧ'�@=j�D�s@@b]�@A�����@CYw�@D��88@Fc%�}ڃ@Hǀ�n@I��C�@KŃ`��@M��G?�@O�(~/��@P�g��@Q킝f��@S��@T$���_ @ULwu[�D@V|�>Z]�@W��^I�@X��:0@Z>^�Γ@[�E��t6@\�I��&@^I`��]@_��հlf@`����k@aN[�+g�@bܐ��@b�O�nq@c��m`�P@dh���O@e8:�jͥ@fY����@f�[���S@g�;D�H�@h��wJ�d@i��)ѐ@jj�U��@kV�zN\@lD�|��0@m7�?��@n-�*\        ?r u�(�?�#ŢM�?��S"�8�?��*�D?ɜS��?��%Q"?�i�l��?�^i����?�a-��<?�Ҍ�
�?��Ӯ�C?�B~�K�-?��9�6��@��.$@�Z��@�c��@
�� �@x�\�E@�zk��e@|ǥ��@�1�`@��S�n�@��A�f@ElU[	x@�f��@ 'e:4B/@!~J+=@"��Ak`�@$U��.@%�	�Zh@'b�qN��@(��E��@*�l��e@,\��h'�@. ��C�@/��B5�@0�TX�2@1�t�z�D@2�J4k\j@3��ֻ�G@4�&?v"@5�����@7R	�W@8/`յe�@9T �2I�@:*��|�@;�جer@<���[a@>'�dQY�@?l�����@@\ ��@A�DG@A�4M:�@B`�_�w�@C�b�A@CȒBW�@D�K��@E=!J�0`@E��p�:@F�����@G�&O{��@HKJ׸�/@I}!'�        ?n�i���?�O(�ijL?��Y�� ?��>�,;?��ܿu�?��6d�5?�T(i���?���p*
?�%��c?�IC-��?���P�?�s{u�̫@WD�k��@��$~@��g�2�@ڎ�N0�@�ʀ��R@3,��5!@�D���@�p9ͱ@Д��hQ@5�ڃM@!F�[;�@#�o.@%����@'�Z�@);�Y��@+z���\@-Ԧ��@0$���,�@1l!=�*@2�8o �@4#���%@5�h��M`@7����/@8��L��+@:3�e"@;ً�7��@=����@?Mv�I��@@���8#@A{�䭗#@Bp7g�ʯ@Ck�T]y�@Dm� '��@EvY��"B@F�ۏ1S)@G��gz*@H��{��@Iܨ�D��@K�b�e@L7��_@Mo�*f��@N�M�E@O��A6
/@P�O��	:@QHr7+��@Q���{�(@R���q��@SW�E7:e@TO�=@TǼ���5@U��akM        ?pq��)�Y?���U�?�_|#��?��@\Z��?�A��??��� ?�	��	q�?����]<?�W�u��?�b1�?�F�Մ��?�(}��	^@d��T@�~��|@
/�+@@��<Ru@���W!�@r*�&��@PW��@e]���@�ǫ�Ի@ �INoX@"wԵ��?@$q҇s�@&�;�y�@(�2aa@+
����@-w6�ڐ@0 5g��@1S=NH#m@2��)Ph@4$��Ր�@5����@7/�\Rh�@8�����G@:t�ƭb�@<,�*G?�@=�؞ �@?�{�y$�@@�5��v�@A��B��@B͊�Q�#@C�bA��@D�S+���@E�[�s�@Gv�[<@H6�����@I`��U3@J�V0ہ@K�i>��P@M	��M^�@NP_s�e@O�GC��@Px����H@Q&W��ׅ@Q�d���@R��HU��@SC��'>@S�:�i� @T�}���@U�K���@VE�
�(�@W(56        ?�ə���t?�NǤ]�?��pbP�?�F�LJ?���mA<?�+�A9ˊ@�|�W�@�;& �@�z	�x:@�-6c\@�I�.x@!��1�@%s�?�=@)D ���@-e���{�@0�am��@3N��n@5�Iw��@8��a� =@;h^Q��_@>l����@@�}#D�@Bv�z�Ŗ@D5&�[��@F{7Zs@G����T�@I��]��7@K�����@N�F{��@P&��;�,@QK���A@Ryz��@S���zI@T�s��@V>�wo�;@W�'���@X�����+@Z[:��h�@[�	��@]HI<m�,@^�꿼F[@`-n�_J*@`�	4�x@a�;5۾V@b��J�m�@cwG��!@dUq�=@e7V���$@fKc�@g	,�%�@g��7�V@h��
��@i乾"��@j�2|�J�@k���@l��3�I�@m��a���@n�@[�9@pP3*e)@p�
3�@q�fi��@q��Q �;@r>O�Pi        ?f�|H���?�V���?�:up��u?��A��p�?����h(?ʇw���.?�5^�R��?�[e��?�Z����_?�"��Ij�?냙"��K?��NW?� t��I?����jt?�x�R��X?��K�:�@	�Ʒ�@g�I�5@����@	��r�!u@X	����@D��H�i@*����@��f0@n濏��@*���@�4�M�@�%��@���L�>@ģ��g�@������@ ��5@"��� �@#4ro+�n@$]e���@@%�`@��|@&�M�_7@(��@)P����K@*��Qv$@+��]��@-XNL�aA@.�:_7@0�=Cr�@0њV~@1�?��8@2R ���@3�7-�@3��ħ{@4�����@5}��@6QjSٸ�@7(y�?D�@8�qi��@8���f�
@9�	��F�@:����@;��%s�4@<y��!vV@=h@G,��@>Z���@?O���@@#��~�        ?f�ܦ^7b?��hR���?�Q����=?���Ҝ�?�s����?�|6L��?ס�:���?���S�>�?�ϗO��T?��ʹ�?�-_Vf?���Ú"�?�km:�j@�KO譁@%8,��
@�uq@��_o5@�r�/�@�򶾶@�ap �@ws=��n@nX5n~@�I�̇�@ ��:S�@"�����@$��U@�@&� B�@(�<�݃@*�,��fk@-Z��i@/y4���q@0�˂���@2D3�bn@3��W��@5 ���@6sH4�4�@7�p��$@9�n����@;GW�v�@<ï�odU@>y����@@�@�u�@AEO/eN@A��s�Þ@B������@C�M=�{@D����>!@E���L��@G
N���@H"�� r�@IA駈M�@Jg﵊�@K���ge@L�d�{o�@N�F	@OD�/��@PE���C�@P�\�HI@Q�f�H@RF:�*��@R��C95�@S��@=¾@Td�ʨ�	        ?f!�;@�?����@�?�m�MHI�?��V���7?É�QeLC?ϔ����?ת��E��?��^1b��?�ȭ��?��ôub?��ĉ�?�� [��@?�DpJU�3@�W��U�@�I|7@��\0l@������@�h�eP+@�~�5��@7)a��@=3���@+
A�;@ID��-�@ �1�5�@"�nq�
�@$e�u$P�@&W���@(c]P��@*�i��k�@,�#�8R@/��ǽ�@0�#��j@2��T�;@3c�!@4ô�Yo�@61�����@7����y@95���D@@:�}`!@<n��>z@>�N��|@?��9�@@������@A���5w$@B�-����@C�L��@D��f��@E���CUe@Fǂ��00@G�C#YN@H���?�@J�+O��@KHk�p@Ly�2z�@M�
I�A@N�i��l@PYW?@P�ې�t�@Qm2YO�@R�<1@R̅��#�@S��Z��4@T:��W�        ?���2���?����%�?ɿ��@׋?�JT�9P2?��h�ʝ�?����?������@�$l�@Cx6��@�"I��@u��B�@y��h@��w��@���ƙ@"u�3b�@%C F��@(A��ǵ@+r"v=�@.�c���:@12����@3��rT@5��0i@7[��L�@9E�5��@;��/��@=������@@$��r��@Af�
�*h@B�H�~_X@D���i�@EpК[p�@F߿t���@HY�c��X@Iޘ�{��@KnYm��@M����@N�	# V(@P.��d+@Q��T��@Q�=Nx"*@Rբ�qLG@S�'V_�@T�����@U�)EYH@V��.u@W�'mm@X�Z�D3
@Y���sY@Z�zJ�@[�:?N.�@\� C6	@^�c���@_/��L�@`+4��s�@`��m��@aX�ؑq�@a��|��@b�\�9[w@c.�:�+@c�
�I:@drU�>�@e��@s3@e���Ea�        ?p�E���?�m�-2G?������v?����' ?�$}ճ�B?�	���`?؊��'��?๣T��?�蘢�%>?��(�`|?�;QXs?����7v�?���̨]?�^lN�3�@�.�^�@��x��@b1�q�#@	O��!�@k�SUol@��g� @�l�@j��@T.d��@U� �@l��0�0@�B=/G�@�I�\�@ �Fv�U@!Vủ�@"��T�w@#�A��/�@%D��5[�@&�����@(i�-'�@)��<ۮ@+P3wH�@,���b}@.Jn���@/�kKX)@0��s�b�@1�X�
%@2�M蚲8@3}��Iw@4lj���x@5`�GD�@6Z�D��@7X�|��@8\�a`�I@9fp ���@:u)au'@;�%@[e�@<�_�PW�@=��
� @>��	��@@�x�֠@@�Ī�p`@A7lT���@AӬv�@Br�\��J@C�n�b�@C���hN�@D^�[��g@E��^m!        ?g!�%�SF?�����?�*�:�M�?�HxӦ2,?�Კ?�?ξ����?����A��?�Co#�RK?���Y�/?���>t�?�s�_{?���3X�?�.�o��@ �ˣ�j@.S?T�+@�����A@�z��Xi@��iTS@�m-@�b8���@&���@�N�r	@ߞ9ךL@  )�q�@!�aT�Q�@#e�&��A@%:��P9@''�1/��@)+�e*@+F�@�-,@-y���x
@/ģ�-�g@1�&n�p@2P����@3��3�[N@4��ֺ|@6Ox�?u@7�b�i�d@95M}��D@:�;�B�@<K/��X�@=�+����@?�15c]@@� @tc@A��%�T@Bj>�1��@CV�߃��@DIm���@EB���/@F@�<
��@GE>A��@HO�y��*@I`hn\^@Jv��75�@K�|}�[@L��x�+�@M�q��� @O��K��@P ��,4@P��[;�@Q]�٢��@R"i�e@R�1Ȼ�        ?m,U�
;�?�+�ҕ?����:��?��#e??�5��-�d?ҏ�*��L?ۑ�[�|?�c���l�?�(��AS?�[��?��	!�?��"���@ v�S�@�un�@r��	��@yE.~u@ܳRf�t@O�v�@�}#��@���ډ@�L�h@��d�K@ � `�B�@"E�JK=�@$ �V�Z�@&4�ʔ@("�8/
�@*IDO\)@,��<�@.�:`��W@0�RFs��@1�0)ޜ�@3B�8_�@4���!�@6Ǵ>�@7�MoXl|@9z��@:�K ��@<;��e��@=�φ��.@?�}D8}�@@�b$�@A�����\@B��4��&@C}���@Dx�}�@EzZҮ��@F�'�҆@G�3ޑ�|@H�|�Mc(@I���,ox@J߸�.ܜ@L�nJPX@M3�`�@Ng�h�L@O�p���@Po��t�@Q���f�@Q�����O@Ra�U�@S�Zx�@S��O�Z�@Tn��q<        ?�b߱nt�?���O	�(?Џ�(�PN?��'|�?��g�g?�����?���k/��@���O$b@g�}���@-Z�@c)���@2�RcK@ >���@#!R�)\�@&A@��@)�����@-9G�Dy@0��e��(@2�z�}@4��>���@7 /���@9k�� #�@;��@>�>uw?�@@�#�/.@B����@C���br�@E'�Q�@F��<��@Hpz~:|�@J*�RN��@K�4���@M�%���*@O����@P� YD�v@Q���M�@R�!(�݄@S�i@UN)�� @V&=/S�}@WLaܫ�@Xy�lZ^@Y�4!�O@Z��,�Ff@\,�|�k�@]v}�F�@^�q��r@`�j�2�@`�:ӐF�@ar;�/-�@b(�6���@b�?-~�@c�VTL@d`�?�QU@e%>1��@e��B`L@f�#�}|�@g���-,@hX��[)@i.�֜U@j봦D�@j��ae.@k¦5��        ?ow]�?���\6�?�������?�,
���?�t�rvd�?�3� �s�?�>��;�?���n?燾`YE ?��ɛ� >?�����?���oC�o?��+X?��;m�@@^B��3@VQ���@@0ۃ1@3���@�N����@��i�F@�3?�@Ҥ(Tմ@݅�B�@ �x���@;���Q+@�N�\�I@�эc�x@!?0�$�@"���h}@#溗h6�@%Lp#^�@&�����@(;�u�>@)� Pܑ:@+Z<���<@,�HUCz�@.��@00XN�i
@1s
@1�~N+�@2�QYK�@3��jypl@4�_Q�؛@5ԏ^�R$@6�}.P�@7�!�q��@8�t>���@:
l�m)@;&:dY.@<G,b%'*@=m�g�U1@>�ں�D@?��V3�>@@�����@AՉ��@A�ز ��@Bd���"@C
���P�@C���A� @D_���<@E����@E��pq7@Fq�]� I        ?i�#wz��?��|j��?�\����?��qqFG�?���QL?ѭtTtR�?�X����H?�S0�'?�U)y��?�m٘��?��&�]$�?�bSr�?������@*�/(�@�t?�@
�Q���@���@��f��@c�DLE�@.`�@gІڻ@&'��<�@ ;qN7�A@!���T�@#ٲ��F�@%���7@'����@*n��@,R��(�@.�L�Z�@0��BuA�@1�":n�@3>�d���@4�`�h��@6/��H�@7�?� @92�Q�@:�I�I��@<���=p�@>=��Yr�@@k���
@@�C� z@A�]�-Ȑ@B��7�#O@C�ro7�}@D�z�}�7@E��1�-@G�8��@H7�R�Ȟ@I_u���@J����U@K��	5N@M�3u@NH�7=@O��+�@Pu񚓿@Q#�V�@Q��)y��@R��#�H�@SC����@T#��@T��[�@U��놽        ?h���7�8?�%���0�?���b;\�?�#�Lt�?Ŭ��?�y�r��?� /H�{w?�y�9N??�
��?�i8/�?����~ح?�ߍ��	?����ķ�@C��[ڒ@���H�Q@
�ef.��@J
���f@�=XZ@��/�	=@a�����@[�NHv=@��&!K�@ w'm�@"C�2�e�@$+�m0��@&.���@(M:4��@*���
�H@,�+#���@/P��s�L@0��{� �@2E��@7@3���'��@5K��y.@6�8N�@8,�:���@9ʑ a�@;w�*{@=2(���@>���]�^@@j`h@A]���c�@BXrt���@CZ����@Dd"[Yo�@Et��W?�@F�0?N|�@G��I�`@Hӛ��0@J��KV�@K7]��Ə@Lt=��`)@M�q�-�@O��@P+es��@P�w>�6@Q�/[J@R=�����@R�����_@S�4B.1�@Tp|��J@U3f��s�@U����t        ?���qNTg?��oǒ�?кc�L!�?��/u?����u�?��՛v��@ ����vb@�n��'�@�M���@�2�j�@��=/@�"���g@!)W&I5@$6�f;�;@'�qȐ�7@+��JRB@.��:�C@1u�Ole�@3�1c#+~@5�"��@8G��?s^@:�2T��@=q���I�@@)#��3@A��1�.@C�f�
�@D���kK@F@�a_�@G�dh@I�gl��@K�� (�@M_瓺��@ONT$���@P��2@Q��fQ 4@R���!@S�ٱ+�{@T�`یr�@V��V@W@.z�@Xtd�Ȓ[@Y�C@Z�C�֣@\=�ް'@]�ʣ�w�@^�.{��@`$��H�@`ذ�=��@a�*O�ac@bK4I7-�@c	���@c����DA@d�y'�.8@eZ�B�@f']���@f��|�@g�?��3�@h��Kf�@iz�i9@jX-�O��@k8�|��@l�S�b@m�]�        ?q��̚�?�e6���??�H��.Q?����u;\?Ǧ�wi� ?�F�(���?�C˖���?���qR�?�od����?����'V?�h5&|;?�S!�v�?����I��?�M��rP�@.z�Y�@�$!Y�@�`�
e@
�wbя�@1֩�)�@նg�z�@��z���@��|*�q@��<JM@�p�ݜ�@�_`�g�@>��D@����ݖ@!�����@"^���O@#���ڌ9@%�p�&�@&�U�xߢ@(	f(�М@)�����@+("ǱO�@,��YZ�@.wJ;�[@0�#��@0���_,@1�Ȕ9@2�l1��@3�Gg7�6@4��J�]@5�Ɛ�x@6�`���@7�ۍ�%�@8�0�s�,@:Y�6�+@;O��<�@<CS��u@=l�w�z@>��c��@?Н�
�@@��^��&@A%�`�Ȧ@Aȩ#�
�@BnsF�I�@Cm�@Cy�p@Dp��7Ɍ@E"	E��@E�q.�@F���\w|        ?fj��R?�=��W�}?����r�?�,�Q���?��\�k8?��l�̕?�1�?�wz�$$?�f:��ԉ?�u�!�?��w����?��1j�K?���i1�@|����"@ջ?Tps@�Ҹ���@��*
,F@|X��@���1@n����@.��K��@p�s�]@@���:@ �_u<�@"�(yc�@$e��'��@&Y�˒0�@(fc���@*��p�!"@,�6��;@/%i�F9�@0�%�yM1@2}�q,@3eɫ7.@4�BB5@63v�d`�@7���Y�@95�{��F@:�m���x@<l�1J�7@>���D@?ؙ����@@�Tx!\@A��cr�@B�|�{@C��gp)@D����@E�,&�P@F���}�"@Gо�X��@H�V�@Jr��,;@K5���0�@Le[�:�@M����f@N؆\w�@P*�n͋@P�zi�ˉ@Q\1� *@RN�9�c@R���Ѝ@Sj�M��t@T ����        ?t�A��b<?�S�f9?�BB���"?��]d�t?�5���?إc=��?��A��?�.����?�ѫgaqD?����x�?�l����>@ �)^�#@�>i�u\@z / �w@����@̮4N�@`�:^m@(���K�@$"K�?@S�/8@�����C@!�E�P@#��A�,@%���F�7@'��P�(�@)�hP6A�@,0e��<�@.���]�9@0�����Q@1�$gUt1@3;����@4�ZM��7@62܃4@7������@90}�0�@:�+V�f�@<x��k��@>0R��@?��#�@@��@A��"l�@Bǐ�>�3@C�siA�@DŻ�MA�@E�h��}�@F�x��X�@G����@IÁ��&@J0�N&�a@KY�b,��@L��.�@M�	I��@N��d	�@P7�F@P�F�s=h@Qi�V #�@RVB��@R����@Ss]u�@T'a�^@T�>���r@U��[�@VU���֌        ?�o�qT�?�T4!��!?�=���W?�h�ww@T?���?A?��ݩ��@m���@
|�<fab@Zb#�@
�W�t@O�}�E@ �bam��@#�$��h@'K���8E@+�A�X@/+�����@1�-���@4OL]��@6�*�_�@9/�ݵ;$@;�֬��@>ح����@@�$Y�V�@B�bXJ�@D5 �̽�@E�l�ZJ@G�Q�4B�@I����[@K�����@M���j�]@O�'��TJ@P��L���@R_Z	�Z@S=q��L@To�w�(@U�[ݢB�@V�)F�%�@X>)w��@Y�V$�e|@Z��t�2@\_R"�@]Ѱg��{@_M[�F"�@`i7�@a/��� @a�exN0)@b�V����@c����[�@dx���V@eV=
�S@f7�G@g*��@h��:H@h��~u@i�Th�@j�&��5�@k�Y��M@l��r���@m���͉�@n�&J��p@o��/}i�@p���B�H@q�)FE        ?uM۞��?�=��?�f��sZ?�t��d?����S��?��|�جZ?�T��N<I?�(����?��6��?�G����?��ҙ�s?�KF�� @ <��p]T@P��u@�eq��@	S�Sj+�@�$o��K@<�[
y�@/��sT@>]1��@h�z��@��	�@ؼ��@�߬�U@ �_,�E@!f�0�@"����t3@$>N���@%�����@'I��\@(��[��;@*��h�s@,;!��@-���~K@/�U�
i@0�wo@��@1�]yH�@2�P��-�@3�D�rL�@4�.�2<�@5�cJm�@6ӰM��@7�,�W�k@9ha^�@:%Tйd�@;K���@<xc�v+@=��9��(@>��( @@��]'�@@�I�@AS�sɿ�@A�\�/��@B�uW��@CO!N�'=@C�S��@D��P���@Ea�t�@F�/A�1@F�O[
)!@G�`\�O@HD��	��@I@˨�-        ?mq-5��?��@��M?� ��G�?�I^����?�4�0�b�?�Sl�P@/?ܭ4���?�(�q��t?�1է3�<?��J*+>?����:��?�-�9f�@*gG4w�@�G����@� zh�@���K@����*^@6=��
@�+|
ʼ@�^e�@�e����@Q�}k�@!n�.XW@#P��0[@%Ll�>�p@'d2��N�@)��&) �@+憣D��@.QWmI{@0l
�I2s@1�n�ʤ`@3�+S�C@4�s�{+�@6*�w��@7�R��H@9()�Ǘ@:�}D�� @<�����@>E�b�@@}<&�@@�)�ؼD@A��d l�@B��c?�@C��9l�W@E"�#�*@FkՍ�@G.̱<�@HPE-�D�@Ix���@J�p�]�@K���uh@M�S+@Na��ʋ�@O����y@P�7�!�@Q-4��y�@Qݺ �,�@R��ɦ�p@SIZ�P�/@Tu�D�@T�-A�x@U�:Wӟy@VJ��>        ?oA�py�?�"�>TO?�B�e!m?�?��9?��ZSe-?��|N?�%���O?�4�L?�f�#�m?�&.��?�����$?���aL��@ Z�R�5@�l�d�2@*���1;@��E��@Y��?u�@����0@x��Q��@#�`]�@�6��X@�p�!@ ����v@!���ţ�@#����)@%����~b@'>�#�@)�����@+���f�.@.ܭ��@01�-�@1m*�JN>@2���9X�@4d0��R@5hj�ӕI@6Ը��Ѽ@8MN��,@9�+���@;cP[�\�@= ��ju�@>�n�޳e@@04�&Ʃ@AWEї'@A����ƶ@B�
���@Cٗ���"@D�C�!t�@E�	��h�@F��x��E@G��
L�@H���0HE@J�
��@K,��L�@LP�:�"W@Mzɻ	�@N���P�$@O������@P�0�h��@Q/����@Q�Ϲ�W�@Ry�zw�@S#�c@SϘ� W)        ?��k���?��-�o�?���
Y�?����h?�=�o?��+�τ{@jǿ$D�@�W��E@��"��\@n*~@�L��)^@!�J�hax@%^�&7b@)�pCx&@-8����@0�Ŵ��@2���"�@5o����@8��8@:�}[� B@=��%�@@Q��I�8@A�ġ��@@C���8��@ECI���@G�M��0@H�V��+@J�w_G��@L��b**D@N�?��@PO7c��@Q�cY1�~@R���� @S�d�8�@U& �[:@VI��&�@W���Ǿ�@X�}R2�@Z$�#�i@[|_h��4@\�f2$Kr@^D%_@_�@ ֚S@`���F�F@aS��)�@b��%�i@b��]	@c��=�@dt�<�m@eE�%\��@f��x;y@f��j�'�@gΦ�T@h�֘'<�@i�ex�
�@jvBŇ�\@k_]89YI@lK�	��o@m;f��@n-x����@o"��}@p�)45�@p�W��qZ        ?l!O
YR�?���)�?��i�r��?�ah�{�A?�8��Y?�z�0�?�����7?�6�Eְ?�D����?�2A�~e�?�G����?�����B?��ɚ�'�?��'!��@ G���.@��d�@g-n���@9�C�@.@8PDzj�@b�<	4@ܹH��@���^(@t}n�N@`��Ǥ�@b�O��4@y���@�v��s@�<��Ǜ@ ����Ȥ@!Մ�E&@#딙YR@$`�[���@%�Л�Y@'*�X�@(~�%v�@)�L1�^@+o��H��@,�s����@.���\�+@0��J�@0�a�!٣@1��ħ�)@2��v�L�@3x<dj@4]�����@5G�����@66E�l�@7)��6@8!K����@9�����@:����@;$ &��@<.חR@=<�uТ�@>Oҍ��@?g�ֺ�@@Aｚ�@@�Vi���@Ad�v-Jy@A�Ԛ�U�@B�㽅�Z@C*"�@�@Cō��        ?e����	?�)n7�X�?�.c��ҭ?�u]��G?>-R�<?�U��6�?֣b�c�<?����o�?���2EU�?��*ݍN?�^R��6?�:X��B?��&Y$�@?�S;eR@���|ɳ@6��kT@6�)@G���@�%AIn@*�E��@�c�[L@�Am}�r@��x��@ �Y��	�@"O�v�i@$##��4z@&�~��@(D쳘@*3�mSX@,j�u�l�@.���K@0�:��#�@1Ӈ#;@3!s�T�@4|Z�@5�>d�- @7W%p�n�@8׻�|Y@:e�?.@;��;b�@=���x��@?X�S�h�@@�lk�%@Ar���j�@B_��ݚ�@CR��߃W@DK�%slK@EKtn�ks@FQ_��$�@G]��yO@Hp��e=@I��d�pK@J��8rd�@K�	PPo�@L�|΍�x@N*$���@Oa�	Z4�@PP ����@P�G���@Q�?� ��@R?xmeo@R�'��@S���s{        ?lF�/b?��̷m��?��;��B1?��#??���-e�?�^a'O�?�P�r��?�9JQ� (?��4��~?���qʨr?��3��7�?��ȴF%j@ X�2���@����.@J���@L'ph�J@�7`
�@3G�^s�@�;��@���*�@n�_��@�1F�x@ p�Pwx?@"2�b*�@$&���@&ɺ�O�@(��z�@*8yʺ��@,y����@.Ԣ���w@0����C{@1��x�̦@3@�%�@4�k�_@6�t�G@7�&g"@9�RWm�@:���ʥi@<Hx�u��@=�!ϥ��@?����%@@�����@A�C%KL�@B�_=6"@C�� �@D���k�@E�5��`@F��,��F@G��R��@HƟ�j=@I�-�KN@K̬��@L3r0�c7@Mdt��B�@N��.���@O�~J�QE@P��3`��@Q3�?� �@Q� F��@R�Z�b�@S5�7C+@S��x�=@T�����        ?��֕��4?�~p@��?�y�?ݑ��lpF?�I��U?��lO��?�ڡ��~@ʒ�)q�@
���?�@��*���@��;�_{@+M�b@��m@!��Z8��@$��R��i@'҅�G!x@+/ɪ#�@.�D�~�@1IV�7��@3Kݕe@5j����@7��y�	�@9���@<i�U�w@>�#�>�H@@��3mX@B.��-|�@C������@E����@F��;F@H6kq���@I�+�o�@K��vsk@MEg}�ހ@O��؞@PrM/�Q�@Qc��@n@RZ��O�S@SX���X@T\/︘@Ue� ݡ8@Vu�����@W�.Y4
@X��9��@Y��=���@Z��8�@\����@]No:Z��@^�� k�|@_�v�0c-@`����@0@a(�jk�@a��>�x�@bz(��@c'7��@c�HB5@d�Ŋ�P@e?9_�@e�l\`e@f�Y�4S]@go��.c�@h0L�<~9@h�H�f�x        ?n�O�.M�?��+�Q2?�Z
c[6	?��R5�
3?�>L�?9?�DZ2�?��6։Z�?�	F�CY�?�`����?�{pЊ.P?�vl��?�|�:�v?�����[?�?����@�8�.��@B�A�4N@h�A�_@
%�>BK@_:'V@d"ܳ�@08+s��@�eR/@h[~T�@"E�Ur@L����@� i,M%@��g�|�@ �t���@!��_��@#> ��(@$�}�|`�@%�i��m@'o�h���@(�fқ�p@*tjN�'�@,���2�@-�[��w@/P;c�f�@0����4�@1b�x]�=@2H�O�i0@33�ntg@4$ps�@5�=�@6.dca@7%?��@8wd�@9)�V#@::�}7f@;PK�f�!@<kȼ��@=�����@>�q�	l@?ݑD�j@@�}�@A!�o�@A��̐O@B^�KS�@C2޴��@C�$N ��@DM�w�U|@D����@E�#�omr        ?h��d���?�� 9�~?�9�(��?�����@?��|.BW?��o?�mƛ�CX?����A�G?�`�߹~�?�����at?�a�~��?�k�e���?�f�b�@��4�@G�q�g�@
*�e_��@i�� 62@�+U�r�@�'�@�:��u�@���@�H?t�@@�/� @!�h��B@#}c�D��@%jNa4�@'pN��,@)�4����@+���֣@.e"U��@0Em��j@1�)�K	@2���-�<@47��Q�L@5���J�@7�.���@8��_���@:2,T�@;чL��e@=~�/��@?7��O�9@@N���@AiIN=S@BYӊk��@CP�dI�@DN�j�&�@ER�8;}@F]]�H)%@Gn��ᶪ@H�,
�K�@I�F� ]@J��N��@K�Ĳ�+@M%b'@N\юC��@O���b�>@Po����o@Q�R@Q�Vc[��@Rhީ��^@S}U�Z�@S�.7c�@T}�5���        ?k�J�m^�?�{ܡ;d�?�]���?����=�[?�ղ�.��?�N�!�7?�?B~�A?�1�g�?��S�ʛ?��v���+?���"'J�?���A
� @ ff��u�@�1$�=�@iI���{@u�~g@�s�(��@U�c��@�zOo�@��i�l�@���N,V@����]�@ ��$�{@"cv{�@$D��01~@&?�j�2@(T�j���@*�t�ט@,�ѢH@/-�Q��@0����9�@2� ݍ@3w�9�4�@4܁��ʖ@6N+Q�>V@7̹��
�@9X)M�%)@:�s۸�@<�����@>G|��i-@@�a��@@�Ƙy�H@A��?�V�@B�)
s�d@C��UE�A@D��Q��@E��h`h@F�H�8�8@G���)��@H���]/X@J��>@K:�8��q@Ld�7�:@M�K���@N�`�
H�@P�'�
@P�0�7�@QI=s�*@Q�h����@R���c��@SG�C@�@S��&vrW@T�����        ?��Vb�?�c9��?���{;�?�*�:8�?��$=��?������r@ ��d���@��H��@���7Ô@�`n-TA@�J�d��@�c��(�@! +���@$-bWpL@'{"�B/�@+	6g��@.�d�ss�@1r��<9�@3��j���@5�'��>7@8FN�-q@:�����@=pوjm@@zn���@A�
hPI@Cz�.�@D�\?Ͳ�@F<���@G���!@I���z�x@Kv|�6*�@MRS	�h@O=�Afq@P�Dn���@Q�b��@R���n�?@S���	�@Tקt_��@U������@W!m؅�@XQ��ik@Y�ʭ)6�@Zŏ�0tL@\
Pox�^@]U�C�r@^���4�4@` �cWO�@`����@ad�:��<@bL���Q@b�h),H6@c�Μ�M@dSzᆁ@ed�3�@eމ��@f����T{@gvny�ku@hG%Y��@il�@i��5U@j�+4#��@k�j��D�@l��Û��        ?v �B�	�?���n�:?����s@>?���14�p?�Ƨ��?��v�U�?ߋRN�t�?�g�P(�?���M�?����Ԗ?�׬5�<?�rR�k9?�~F��N�@}���@tX%�	�@�OYD82@
e�)vi@���6u{@�_*W��@���+�@�5�d�@++W���@�����@�-�^�@���=@! NTj@"��*��@#�o�@%y��2��@'�Wz@(�ލ�{@*OR�@,����/@-˹�]@/�C�a��@0�% �@1��Β;�@2�ډ�_@3�����'@4��>x�@5�Ř"g�@6��c@8��]<@9+%i��@:U̴�_@;�׫2rd@<�@��@=�ٲ2r@?@�$�s@@EA�s��@@횟2�@A���\@BG�P�/@B�f�@C�3S�}�@Df�>"_@E!���B@E�����7@F����@Gd�G��@H+�C+`@H��L�@I��S�        ?j�7�	�2?�&>P �?����ŵ?������|?���3� �?�Zj�o��?ٰ����?�X�7+z?�;���F?��	+?� �����?���GH��?�;"y>M@!q;�+@u����@	����@����@�/���@�ͩ��@ZY�@'�Y�(@�%���@����
�@ �K�W�G@"B�c[�C@$��u�@%�CR��@'��ϼ$@)�Y��͓@+��L@.1�$�QO@0?��]�@1r$��+@2�@'��@3����;@5Oh�^T�@6��%k�@8G�	?u@9�m�!@;�v��@<�����@>Eq(ؿI@?��2���@@������@A�O7?��@B��=z�@C�*��R@Dp����@Eg��e�@FdT}r�B@Gf�s{'@Hoa,C��@I}�T0��@J��Z��@K��;H0@L˜}�q�@M�;����@O��d1@P&���am@P�rQ�Eo@Q`ׇƄ�@R�\o�@R�I���:        ?y�H�Kp�?����?��d�'?�,m��BG?�d��7�?�֖���M?�yJ��4?�,��^?�mp`��?�Pj�51?���c]�8@s-MGB�@���&P�@�_z�@��7���@Q�B:ZQ@M��+Y@�����~@Y��s�@ ]l9N��@"Z��L��@$x�|PW@&�;��fe@)Y��
@+��7YLM@.B4ݾ�@0�a�
�@1��(]L=@3�v<l@5��@6�R��@8�<R(6@:R�ؒ��@<4=�� @>(a���!@@�[�%*@A$E��i@B:e³�N@CY�]�@D��}�	@E���5@F��؅�@H7��T�@I��NaN@J���P@LC�U}�@M��`�OI@O'Gr���@PS�lL�@Q
�e�z@Q�*M�U@R�A�ϴ�@S�T�	�!@T_g��l@U=|�=�@V �'��@W�:)_@W��չ@X�2.O�@Y߂��Y@Z�㐒y4@[�U�sD�@\��ZMZ�        ?���Kڰ�?Ð˸�'H?ٽWAe?�"X�[?��ѷk �@ ���*��@Ѹ�4��@'�1��@ɽ�xC@�t'���@ x�x^�@#��a�g@'���5p@+���'@0+_HP�@2����@5 w:(�@7�� 7�@:�A�/	@=�M�3Ue@@���F @B0�<Y!�@C����f@E���@G� �[k�@I��nuŤ@K���O%]@N��a@P ��	x�@QJ�%v@R~���	&@S����6@Uz%M�@VV>kA��@W����^�@Y6T=2@Z�I�k��@[��j�i@]�\y^@_D�U�g@`QZ���R@a �N��a@a�:�A2@b��XY�@c��$��@d�ɲ-*�@et�:d@f`Oa��@gP�� g@hEff�C�@i>��A@j<��D4@k?��͆�@lFڎ�S;@mR��Q��@nb�Q�@ow��Wb�@pHp��@p�E�r�}@qhQ�Z�@q��]��@r���7�@s(�"N�        ?n����cH?�%b��?���� ?�9Y�H�?Ɣ�<�B>?�]�cl?�5�H���?�8`����?�=`�D�?콻Y���?��y��?��$�{�?��P?O��?�{�Ӭ>�@�
�#�@ko>gC�@Lݴy�@
^ �R��@�^�,�@�!K.M�@^avq�@Jzҕ�@Ov�(i�@m\�v��@�35oE@���e
w@\��@l@ �;�g@"<��p\@#�h9�@$��vϓ�@&o���d@'���@)z��$��@+
����@,��n.�W@.i0�f@0|��F!@0��}��@1���L@2���i�@3�@K ��@4�2�Ë@5�S��@-@6٥h=��@7�&��l�@9 ׵۳�@:�V`K@;@�YAѷ@<j%��@=�}���(@>���XK@@qGns^@@�h���@AJr��~@A�gM�q@B��%B@CH�a�UH@C��F
V@D�M��@Eb���H�@Fˏ'N@F��a�I        ?nVd���?�?���f?��EM��Q?�����?���X��?��F0`q�?ݷ�7�?��3��?�?�d[{?�t�$���?�{,�*�7?�9����@�5�U	�@{��|@	~���� @����v@]�ǣ+�@����"�@ψO���@�����]@�z�<@ J����@@"#q��&]@$�=.CB@&*u�@�f@(X��aZR@*�����@-�iIj'@/�ل X@1XR��@2xʬL
m@3�υ�@5cq�(d�@6�\�-@8���-�@:1{w߽�@;�Φ?�@=�`9:�@?���NR�@@�]�Z��@A��w���@B�� J�@C�n	���@D�s�s�@E��`�@F�����@H$���@IR�7ȭH@J��-���@K��7��@M
�k�k@NV�RL1@O���v�@P�)� ��@Q4���/G@Q��	�:Q@R���,5@S_��I�@T &�U�@T�cJY7�@U�[4�b�@Vx?��@WGw�0�        ?iw�2]�?�g�C?�
���.?�TsxD�^?�ɼf��#?шH"� ?�-��yX?�~��Gt�?�|v�a6?�i�`E*?��MBЫy?���E��?��4�Gw�@?��\�@�9�r=�@
�Df�0@>��_
�@���D
@�)���y@SS۰f�@I@8�6@r��:��@ g��MT@"0�q�@$;�!K@&m�i�@(+�X��@*`qΊ�@,��bǚ�@/���7@0���ɑ]@2"E5	.�@3�p�X(@4J�=@6iu[%�|@7�M�W@9�F���@;-��>g�@<���B�@>�C�L@@7"Ê�@A%�Mj�@B��3�@CL��֒@D�E���@E ��{��@F0�}O��@GGx�0�?@Hd��v~@I�E�@J��/>&@K�Q��~@Mma��@N\%C���@O�q�^	@Pv�%�bi@Q����@Q�G�_�@R{��K�F@S.݊�:�@S����@T�N��ͽ@UZ�-l0Q        ?��'���?���B?���h�?�Y�^J?!��Q?��"��fF@��`��p@6��,�@��K@Bb�aֹ@(�d��@��x��@"N�̬@%��O��@)#��̕�@,�%1%��@0��Q �@2��Ұ)@5����@7���/�@:#a�+4�@<�ls@?Ū����@Af%�,�>@B�L��+�@D�H�i��@F[~Н�@H%�,��@Jx�*�@K�C�#D?@M�5u�@P �i�\@Q��o��@R-Us�V@SP�v��@T}9eR\J@U�yc��@V�.�];@X7�6��@Y�T�n�@Z���mGR@\AZȸ�e@]���jp@_����@`M��T@a[֛�@a����@b�����@cp4��6�@dC�;l�@e�N�?@e���h@fص�R�@g������@h��,D`O@i�7
�)@j��&��@k{�ې&�@lu��_�@mtD�t@nvʛj�X@o}��Ϩ@pD1G��        ?i����?�>4,5\?���Ӵ��?�<���:?�B?���&?��p��>S?ղgI�]?ݽ��O�@?����?��N��W?������?���d8c�?���u�0�?���A��?��ԍǓ4@�$|&�@Y\�@�G�a�@	��N @�k��*@���Et@�Vig�G@u�w� @J��#��@56}!�@4��]Z�@Hҹ[a�@q��.�@�o��B�@! ��E5@"4N��*E@#rW}��@$��*���@&O�'�@'h9�%Ϡ@(΁k��@*>����0@+��QR@-=*Ś"�@.�"sQ�@01o�h�@1)1b�%@1״�9P6@2�	�ͥ�@3�4��V@4t���_�@5]e��1 @6J�R��y@7<=o���@82�@�|G@9-\	+�	@:,���>�@;0~!�eg@<8�mJ@=Ej��)�@>V�ޭ�@?k�~���@@B�h� u@@�oH�^@Acj{�N�@A���b@B��3h6B@C$���        ?k��n���?�����vQ?���|*?�w�D�]�?��+�-�?�.O�q̗?ܵ}��q�?�S���H�?��=��a?���X?��l�X�?��6_E�@�>��=b@[$.�@	j΂��(@�ͭO�@e��F+�@��wSL@�8�G@*��r@f���8p@ |.��m@"b�қ�b@$g|�o.�@&���vot@(�}y^��@+-O^Lߪ@-�U坕h@0&e8�8�@1�����@2�f��,�@4tܾ R�@6fO\�@7��p|@9S�7Sx@;�A��@<�����@>�_�=@@[H���@A\��@Be"0D�@CvkcOx�@D���'�-@E���pC
@F��Y�S@HZno�@II���@J�5��i�@Kק� �J@M+u\犥@N��K�
@O�)||I@P���&f�@Qg->��@R&����@R�
	�@S�D�O��@T{�;�@UKZ�v��@V:4��@V�S�!�@Wө!�m@X�:ۂ>\        ?hjQ�P�2?��Ж��?�}8B��?��%R;?�LHAǉ?�T(9���?�_� �N?�6j�y�?�M܈�?�4Z�J�?�o^Պ?�7�Ut?���M]��@��V�@(zf��@���ٸ@����K@�4 %�@�%h1��@k(��:@l�8"�@�7���&@����Y@ �#�Xe�@"H�~L@$^Y'4@%�q���]@'�4X��!@)�إ�M@,����t@.I�.F(@0L��_�@1���b�@2���@�@4x۞��@5\>0���@6�.`;�@8'=�C�@9�_���>@;�.��V@<��"L�@>A�=�;A@?オ�H#@@�jc-@A��-u�@B����H@Ck ۴�B@DV�1�I@EG:C
ͼ@F=k�`@G8�;�e@H8Iy�s@I=+:�^@JG/��F�@KV �1d@Li�˙i#@M�|Q;�@N���ł2@O��G��Z@PtEmr�*@Q	諍@Q��7P �@R;�|8D`        ?��T0��_?�*k2�/?�+���cW?�ַ24�D?�>5�ʥ?���-�eA?�'0�*`�@�ˑ�s7@= ��@_�䚘�@��l�~�@OykW;d@~����@"��/6@%���E�@(�;�b�@,{
6�@0 ����@2"�]�@4A���xD@6S[�i�@8���|@;T�v?$�@=��m0�F@@QLj�9�@A�s>J
@C3�_��J@D�\+��@FQ�{q��@G��t=�@I�~Jq��@Klܜ�dl@M=��Zq @O.��B�@P�|Ny4�@Q����_�@R���"R@S��W@T�m@U�Pbt@V�q�-'�@Xv��o@Y:S�� �@Zo���@[�f�^j�@\��@^9H����@_�����G@`pHf�s�@a�[��@a��Whm@b��@c>`_�@c��Ip�@d�}���@ezBj���@f?(�tC8@g/�|�@@g�X�d��@h������@ir�s@jF�V��=@kT`C        ?jګen�?�|�H��?�tc�u}G?��Tl̀o?��jܓ�V?��A�!?�t�Ǚ��?�х"���?�M/�V�?���$��?�V���?�
��:?�}b�	��?���U��J@ #ؒ8��@��m�n�@<��d�@I2�@|�վ@17Mh�)@�1
 �~@��?m�@Z𼲐�@H!�p?�@K�4If�@e`n\��@��9�@�1�$�@ ���<@!փ�H�@#��M,�@$l���'@%ǯ,��@'.���~�@(����@*�1^@+���7c3@-:B��Y@.���}@0A��Ρ�@1%���P@1�R�y@2�a��@3�vR~��@4�lt��F@5����_?@6�^A�@7���k��@8���b#@9��pW^q@:�4�@;�G W�@=Mf��(@>1��:�@?Y*����@@CY��u@@���ˋ�@Ax� e��@B�EGL@B�!Ӷp�@C]1)�@Dީ@D�&ѳ�        ?jǯ%b�?��*Uei&?�9֛���?���Z�?�æ��?�Ä�T�8?ڒ��M(?���Jn��?遁�-?�h��|?�Y�=��'?���c��@ RO˩3�@�3x���@f
���@~���ا@���0�@ltMq�@��B:f@�K���@�Τ�@.
�{@ �x��0D@"����#@$����@&����?@(�Q����@+��+(@-s*M�@/��V�#�@1EZ��*@2�Ш�(�@4
� ��;@5�'�f��@7
#�O�@8����y@:C�Ǹ�;@;��I���@=��#w��@?�+H*@@�.	&�@A�A���z@B��̇0�@C��Kh8@D�D�w�:@E�A��ox@F���ϫ@H�� �@I>e���@Jq���*@K�@���@L�_��L@N8blA��@O����k�@Pqf�,��@Q!��<@Qվ����@R���I!@SI3��X@T��Ja�@T˾z�@U����L�@V]W+v�        ?c������?�����?�zn>`��?�����/�?��k���=?��z�[%�?���-�?��l�Rx�?��!�m�?��B#?�Lɸ~?�"R�c_�?�&)��fZ@ a�Q�@�v~�H@��約i@
���oȺ@��:\7N@�;����@��o4�@|�w'�j@2Z�@+�^F�@"���!�@!.��p�\@"�Aa���@$�S��@&�H�D�@(�=�	��@*�F�u�W@,�v���1@.��t�2o@0�>�h@1��b@3"��Ay@4p��~/<@5�����@7/	���@8��@�d@:%���@;�*\>F8@=7У�gl@>���h�@@@�� �B@A8̤!�@A�@��,@B�+���@CЪ��N@D���vK@E�*Kp
@F�i��g@G��@��@H�	b^�@I�.��d@J�	�;.@L���+�@M$���@NJ�[�`5@Ov�M��@PT���@P�y\
@Q�� ~D@R/W+¡�        ?�����?��Zenǰ?�W�Gjm4?�� ?���9ܠ?�Op~+�P?�q"'v�@8���bh@
��!�|d@����@3#+%H@����f^@��=��@"Fu^bֲ@%N^�m��@(��:��v@,9�6��@/�۾rz@1���w�@3���@67�~�-�@8�)����@;�^�@=�M����@@"�<��@A�jM�ɺ@C �uhoC@D���l)@F�`=C�@G���3��@Ir�H� @K5=���@M˴A�_@N�s0��)@Pk��q}@Qj��x@Rq��@S�R͈�@T��ҷ>�@U�_mT�@V׼4N��@X�J�V9@Y7m�i��@Zrvr�zc@[��/�P@\��q�
�@^PD�3��@_�P��v@`�� �}@a8i��J�@a����ao@b��#�z@ci��$@d,�cQ~@d�n�@e����&@f����z@gY��Q�@h-����=@i����@i�����@j��u1��@k��tJG        ?d�NM#�?��)�~d�?��[jj�}?�W8���?����A?�'�*�@�?�Q*�?�@��8�?�E�7�?�\O�Y3v?꠹�r��?�>����?�y���X�?� nkG�?��ޗ��x?���E���@�{���]@�S^�@����t@@	'm�p�@�g��@�f'�U@��=���@���O#@B�dA�l@��V��@֢���@���q�>@��
�r@�=�v��@���(R@!�T$6�@"#��{��@#L����@$~xFC�G@%�RL!j�@&�E	s@(I�i��@)�ꀣb�@*��N.nt@,c���3�@-���T@/K	\�;�@0e�a��"@1*BhХ�@1��Ƹ�@2���Y�@3��T��S@4fߕ��@5?Y&i�@6�� �@6���T��@7�7��>|@8�eD���@9�q���@:�R�:�=@;����I@<�mg�	�@=��M:|@>�}�E ?@?��3-@@O/��D@@ԫ�dM        ?f�ej���?�꬀�?����c�?�ֳ&� �?òE�?��?���s�Ad?���+��?����舽?�&\��2?�^�K)�?�i�0w�;?�B��a̢?���M��}@��|@W�� �<@	.gA�@*鈣�@����@1�/�X�@ú���f@�͐Ů�@r�j;s@��E��@ �5O�@"�l(5�@$+�?�@&k��h�@(ox@@*���	@,�]�m1@/	F�g=@0��I͝�@1���n�2@3;�k�k_@4�$:v@5�:v5�@7[�
�P@8�$Fc�@:U�+�:�@;㥚��V@=|�(ns�@?!l��(@@h��{2%@AE����@B(��>ц@C+�)R0@C�� ��L@D�7L�ex@E�ճ
�]@F�ϵ�@G�(��@H��<���@J�rD�@K��}��@L.!xO@MK�"�0Z@Nn}�L|�@O�pZj��@Paĵ�)�@P���&��@Q���e��@R4î�O@RՃ�}��        ?e+d��?����p?��p1c�?�Hcs���?�ELyl�?�N����?א�&c�u?��R�9=?��q3��`?�x���6?�F#�k��?�"nr�?��3�%�@�5�=�@Z":��@	$kKpo@J��Z@��3K@Yk��m@����(*@΀�"�]@��0M�@�&�{@!8��Ͻ(@#�^.L@$�LW�@&��ì�@@)��S-�@+:T���@-����*@/�͛���@17�}���@2�oq��|@3��F|�@5GnQ��@6��8��@8=y�4<@9��:�@;g��� �@='v�vC@>ŷ�)��@@D!g��@A+�weT@B�i
@C�Fv�@D	ߨ�7�@Eg 9@FV�L��@G!�0�~@H6]�}j�@IQm�ɫw@Jrշbܣ@K��:�^�@LȟP�/@M�����@O7�D���@P<=���H@P���l��@Q�|n�{@R0C��@R�";R��@S�0���@T@\b�        ?���h��?�ݚo�}(?�,O0��X?���c1�+?�ޒD@��?�^�A���?��0�\0@ lE�T�@��`m2o@��RUI�@O�݊2@�i��N@P�͕<1@��,p@!m���F'@$^;qR�@&������@*V�b�@-?1��=@0V	��b@2$j>o��@4
�2'�@6�h��@8qc��@:Kݳ��@<����$�@>�nb�H�@@���G��@A�b�  �@CG�XW@D��q>&'@Fs���@G���D@I o:
��@J�>(`�@L!d�pQ@M��\�N�@Oouc�S+@P��lϪ@Qu�I�@R[�?
҈@SHc�]W�@T:8��ȩ@U1q��0�@V.]T?@@W/��/@X7���@YCm;n1K@ZT�*}@[k�hݷ�@\�]P��@]�F@�L@^���D�@_�M5~�@`��m�~�@a-�ed�"@a�R�/�@bi�'@c
+M���@c��Sm0@dSB/�q$@d�>=��@e���ұm