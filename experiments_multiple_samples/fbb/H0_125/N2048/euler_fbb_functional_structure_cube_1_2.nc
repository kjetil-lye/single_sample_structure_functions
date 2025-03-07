CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T103538        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?��l�v�?��Oĭ�?��uʝ�c@<l
�@P��v�@�D\(�@�р@̈@!|;�db�@%w���B@)���
N@.S��"w�@1�*Dj�k@4$$u�+J@6҂A|P�@9�B19V�@<���Y`�@?���
$@A^�dV5w@C s�쩖@D��l�p�@Fl��_��@H7 �59e@J,[CQ@K��=�K�@M�B&��@O�\v�{�@P�i���r@Q���
v�@S
�Z��@T�fe@U9x]�$@VX�����@W}@�Y{7@X��!Q�@YՇ���@[	�Χx@\Az@Bo@]~���@^�T�;	�@`P���@`��}�ڴ@aPB����@a��$z�2@b�ۨf�V@cS�p|#�@d�O�q@d�&!�Ө@ejh����@f �<�x@f�bdt@g�]��Rx@hO��ɷ�@i�J���@i�Ys�@j�&���6@kT|�>\@l�'Y(@l�4QƎ@m�b̡t@nvgS���@oC���@p	5�{j�@pq�m%��        ?�zɪ�Z5?��w��q�@ ��~J:@7�,?c@Y��7�@�|k��@#��C	@)z�O���@/��q(t@3,���@6��W�JA@:�S�Z@>�i���@A���E&@C�`�KM�@Fc̨X�@H�w��[@K�����a@Nb[f<�&@P� �c��@R #�k�f@S�B���o@UC�(U�@V�<LEW$@X�}�JS�@ZS�ݫ�Q@\)�	�@]�V�š@_��?8H@`�Pg�D�@a��R�H@bұ[��@cր V�@d�=�cj@e���i@f�c��f@h�{�-@i1�����@jQ�	s�@ku�ξ#h@l�����{@m���a�@n�؇@p5}��l@p���h@qT����@q�xm * @r�)��@s<��j�@s�I�+�1@t��Y�  @u5���<@u���!@v����|@w?u��w�@w�ד�k�@x���A}@yX�Cǹ@zM%N�@z�}��h)@{�V%�^X@|<�f��@|��8�        ?�m��MFk?�%$�Q��@ \�
�_@�-b�39@!M���@�����@#��F ��@)4��'�@/FOK~��@2�C��L;@6��u�R�@:X�}R�s@>k6�a{�@A]C�s��@C�k?��@F8�jǻ@H��Т�@Kj��@M�0��T@PL�rL�@Q�!��@S=�ݲ�@Tǟ��$@V]��@W�z�2w�@Y���ߵ@[^Vb2�@]/�[��@^���X՞@`]��F�@aL;B{��@b?_خ�@c7���Z@d3-��@e3�eq��@f8[�}&'@gA?q��@hN9�6�@i_5�)@jtz�d�@k��-��@l�YU�
@mɅ�ES:@n�H��PQ@p
G.*'@p��..Y@q6� |��@q�_���@ri��JD�@s���-@s�%�:=@tB)����@t�3���@u�϶��<@v(\پB@v�\M��@ws�29�R@x�T'�w@xĸ�m��@yo3�i@z�80�@z����@{vi�i�        ?�Y|��z@ >��@�e�F�R@��;
@%��^r�@.U�\��@4#���h@9����z@?��qʰ�@CA�8^)�@F��{�@J���`@N�Y�w<�@Q����"@S�;���U@V&�}g_�@X��P���@[0��Q@]ە�Р-@`Or���@a����9@c61�'�r@d����&@fJ[w::@g��KN�@i��N� @k9Y��)�@l��r��@n�`v�4�@pA�#@q-�c��@r��,Z@sd�k,@t
=&�Y@ui���u@v�
�<b@wm�l�@x�3F�@y%�g��e@z7w]��@{L�,���@|fJ�Z@}�Z�=9�@~�����@ȁ�Sm�@�x@-��@��q}@���36+@�>˲M5@�پ����@�v_����@����r@�����@�V77�g}@��n-pZJ@��@&��@�D��="T@�쨱��0@��:���@�AZ�wH@����@��1�t��@�K�9��        ?����/?�)��[�?��_O8��@Y�Je @��y��@!2]*�@Kp�	�@ �e~�֒@$[��@(d�}<��@,�j��Kj@0�Y-C|n@3�3�@5�����@8&�T'K@:�\be:@=����@@R�S_@A�Km�@CfkJ5%@E�6��@F���.@H[�k�@J$7L�@K�ֵR�@M��Ԭ�!@O������@P��/��B@Q��hs@R��f-�@S�����a@T�j����@U����F@V���²@W�A�lG@X�aϤ,@Z	&u�J@[&y��	�@\G�]�[�@]l��:�K@^���
;@_�"A�_�@`x^�	��@a⼸�@a�����@bI���@b�de���@c�vI��@d*l�P�@d�T���#@erqT�@fTB�B@f�	���@gi.1-��@h����@h����Z@im5Y�@j����)@j�� �bW@k}7�	@l/�v3@l���?a@m�//H?�        ?�k	Z���?�/��~�@ s�eӃ@�Q�g@/��a�]@�뻯y@#ˡ� ^j@)W�u�� @/|���5z@37�{V9@6��>kJj@:����@>�\ש��@A��ip@C�i�P@Fb��@H�+��!@K�1��@Nhp��`"@P���N/^@R&{(x>�@S�p��U@UM_ '��@V��Z�F0@X�n��@Ze+���@\/�K�@^[w 5@_�Y���@`�6��,@a�c���@b���x@c�X)k�@d��\)w@fË�@g"$�!@h0���d@iN��'�@jo�_���@k��AU3�@l�o ۔�@m�!#�@o!��M	�@p,w�N/�@p����@qic�l�@r
@n@r� �h�@sS��m:@s��2��n@t����� @uL��,S�@u� xb�7@v������@wU�W$�@x�$D��@x�8���@ym&b{:b@z"���@z�wL}�@{��'��i@|K�J�A@}�y��        ?��Rq��.?�@܁9?��C�C��@��5�@��?��'@�E���+@#*�iu�@(�O�T�i@.p�3`(^@2s���@5�ь^�@9��ЄMH@=�9�2�@@�-h<��@C.�����@E��HB*�@G�d~�"�@J����@M.˰@O�%��@Qe}�^@R�T���@Tcq����@U�[���@W���;p�@Y6�-���@Z�,c%@\�����@^i�Wo�@`���4@a	�`�~;@a�,��A@b�J�C,�@c��)���@d���6@e�6%[�@f��J��@hZ:P�m@i*@j$���u@k<k�@lW:�䷜@mvY�Ey@n�r`<��@o�R+�r@ps�se�@q
=�@q���7�@r;���0J@rֈ����@ss�s8�@t	]���@t�l�+V@uQ.�H  @u�D��Mc@v����;�@w;L3=��@w�-Ε~�@x�DC��u@y0����s@y���Οn@z�t���@{0,��        ?����y?���5@o̟;�@�X�1�@#������@+YU��l�@2"Q�O�@7��8�@<�$���@ABz�v�8@Dq����7@G�{o��@Km�R��@O5�r�bD@Q�ef�|�@S�Nw��@U��:S�@X�_�dR@Z]t�δ}@\�c��@_9���An@`��!��@b/����;@c����\�@d��0l�y@fMatgo�@g��9�@i4A{�x@j�)���@l9j���	@m���3�@o[9��ֱ@p{9�o�@qL/,�@r n�-�@r��;��@sҟ��@t�x`�T_@u�j.�
�@vud�%�4@w\W$Ӌ�@xF2����@y2��~D@z"e���%@{��-��@|	�]�\�@}�@}�&m�Fp@~���j�@����@�|��@����Ou@��5��&@�-OȺ@��t[���@���x��@��AC��@� �7=.M@��@����@�4���;�@��FY"L�@�L�q��@��"���        ?�w�'6F�?�ŕ��@?���oG�@���Xo�@���@�u��C�@�@BN!'@!�\�@$ף6AAY@(�B���@-V�
t��@0�3��Y@3k�,��@5��)��:@8�:5�U6@;g���@>F��kdu@@��=c�@B(��/<�@C�>��f@E_y���@GV>*��@HĈ�@@J���h�^@LU�|G��@N.^��8@P���@P��0�`@Q��c�@R���Z�@S��!W @U	2�VE\@V=��B�@W)����@X@z��΃@Y[��$�@Zz��1@[��Қ�@\�u:���@]��h�e@_��qX@`)nտ�@`����7@aa�?�9w@b �:a�W@b���F:@cD�&I@c�X��@d�S��<@e6����@e�l��}@f����9@g7>5��@g�|3G�@h���[N^@iG(�#�@i�C�Z��@j�����@kem��@l�����@lլݕ�%@m�&�^��@nL#%�9        ?���o �B?��g�D�}@ "+$�Y@o�?W}@���M�@M��N@#]��Qh�@(�LO:��@.FʷS@2�^6��F@6/΢��@9�N�*Z@>��+�k@A(��]@Cj�7@E��5>�f@HGN�85@J�P�t�@M�*�S-�@P/����@Q�Ňz)�@S"[���{@T�X�e�@VEt���@W�]�bbV@Y�}�}!P@[O���@][� �c@^᙮J�1@`]�T�'@aNE��^=@bDg�$=�@c?S@��@d>�=D�@eC��z@fK�>:��@gX��#"5@hjHU�@i᤯�q@j����(j@k�\���@l��<��@m��D��@o(�	[C@p*�(��A@p�_��@q]8��@q�,���@r�ص�݂@s62�M��@s�1Q�S�@ty��b��@u���NI@uè�R�@vj�A8�@w���޵@w����~@xiܭp�@y�L�M@y�/�>�@zs�w>�@{$���@{��귉        ?�2�r5E?�Š[�Ȕ@ +m��?�@�(ϞS�@�sb�0@L��R2L@#|��YOg@(�|Y1��@.��a!j*@2��`��@6Jj��@:)u�v@>#% P�[@A69��?&@Cx�9I��@E�̶@�@HS�L5H\@J꺼d�@M���G#�@P43Q�Ц@Q�ϡ�kH@S%�x��@T��{L@VG�2e��@W��%��@Y�D8�x@[P&R~@]h��:{@^�F9x�I@`\�U���@aM��]bH@bC�<}�f@c>�ҟ\H@d>.��Ɉ@eBW:�/@fK5���@gX#O��@hi���e@iJ�n�,@j�0Y8^@k�8֟�@l�R��@m�m&�q�@o)w��4@p+�Է�@pĎ"���@q_L�-��@q��a��@r�P��9?@s:����@s���Y�@t�2�vH @u%���@u̠j[/@vuJ 6o�@w�:&�@w�a�i�@xxā��@y'��Qf�@y��̂�@z� �SY�@{=Z��@{� �,S�        ?�Z/�U�U?�u�W4��@�1.,_)@mѫ�@$k����_@,��,r~<@2�����@8L?4L�@=ϻ��3�@A����ؘ@EOe�&@H׳6�(�@L��Y��@PBu�7�@RR΢��@Tz�bp�W@V��ap@Y�AG@[v<����@]��@��3@`B�Oe�@a�����@b�����@dU��~uP@e�xͰ��@g:!V��@h�,n�
X@j@�,���@k�B�\I�@mg�ȅ3e@o3<�c�@pW+t��@q.>A
��@r	��2@r�X��a�@s���@t�D7�@u���[sd@v�{�,|�@wqn�r �@xc���Z7@yX��}h@zQW"�/@{LUx�i�@|J���}@}K⚎�e@~P
��@W���R@�0p;� ?@�����O@�>d���6@��d�2R�@�Q�R��@��N<,�@�j'ψ��@��=#��'@���87��@�Efø@����~�8@�<��u#V@�а�a{�@�e����K@��8ջ+Q        ?��C�|le?�&HP���?��`����@aaaN�I@>���_@ͼ|��@i��)�l@ ���Uv@$z$�p u@(�cm�Q�@,�IsR%@0����@3(��V�@5��tk-�@8W�0a�@;�_j@@=�[�.�@@s�إ&@A��*rz@C�(\Z.@E+:A���@F�s�a�.@H�y�(�@JF��t(�@L��E�@M�e��@O�7�;�$@P��KR9/@Q���]#@RĮTj�Y@SďC��5@TȔ���@UТ���@Vܡ�@W�{�@Y ��!@Zx|\q@[2uN?��@\Q���@]s3�z@^�np\l�@_� oM�@`v�"˕@ap~l�@a��~}@bA�g�UX@bݓ+�]'@c{���b@d�l�@d�&��@e[����@e��>��@f�	�f�@gH��%�u@g�U��@h�N��9@i@t�Vǰ@i꿦�_@j�)oS�Q@kB�Y�m�@k�G��@l����w�@mN�)�)�        ?� ay��?�0��Ɠ@ B_h�&�@���w7@�B�pT@_;�/@#���f@)�r8V�@/��j@2֩��υ@6j�k�x�@:B��S1@>[W��4�@AYͧ�n@C�Ã"�!@F�.���@H�諊��@K6��rU@M��b~��@Pg+쵡�@Q��X�hz@Sg�����@T�~�&?@@V���ʅj@XD]�!
@Y��́��@[�E"�@@]��AS@_`*��a@`��9F�@a�H'2�@b�7�uA@c�E��2�@d�)-}p�@e�ǯ��.@f�oR�@g���l_@h�����@i���\Q@k>iw#-@l8!���@m`B�Lh@n��u#C@o��_U@pw�_7�@qn}�K�@q���u��@rPE�`�@r�Y�	
�@s�(	{��@t8���@t��h,g2@u�����q@v/�<RD@v���th�@w�P���v@x5;����@x�42�@y�a0/@zG���G�@z��\�@{��h��`@|fp���        ?�6I@�?�d䥼�@ ۛ  9@bْ��@�2���@$��ͥL@#fW�@(�1�I�U@.ش}��'@2��)��M@6D1T/O�@:���~�@>(��'q@A<�.�p�@C�IN2�J@E��U��@Hlm��@K
�ŷ4�@M�N˟z@PMq���5@Q�y��D�@SJv��p~@T�%$ut�@VzB��@X$��+�w@Y�ʑn�|@[����E@]j�~@_B�K�@`�3�a�@a�s���@b�b��@c��@�d@d�����@e��2@�f@f�rh�D@g�#����@hܖ8�μ@i��&Hf0@kq��;�@lG����h@mtn��"@n����Yp@o��~�@p�G�]j�@q)+�n�@q����P@rmd]��@s�ȏJ�@s���ã<@ta��!@uEzH҄@u��m�@vge�e�@w=���R@w����Q@x|�Is��@y2��g\@y�L��@z���I��@{\�K��@|��r�@|�a�ǥI        ?��]�#'�?��Kl!1@�*�C�@D�Q�x@#Բ�Ͻ@+�l-���@2`����@7i� �1@<��><�@Av���FL@D�,!�j@Hv/���@K�8v��@O�43I�2@Q�1д�C@S�t2ͣv@U���@X<���:@Z�����@\�M���@_iռ"a@`�_�� g@bFh�K@c��E2��@d�-`֝@f^p�=�x@g�R�%��@i?����@j� ��@l=�q���@m��2�7@oV�x�zz@pv���^ @qE+�Y�H@r����@r�1�I��@s¢��@t��aUI@uz�N@vY�St'�@w<���j�@x!�\O�@y	���[!@y��(�n�@z�/u�@{��#�Ё@|�q���]@}�K�&h{@~�k�D��@�ƃ{��@�O(궄�@�́z���@�L�"��@��Q�Ȓ@�N�����@��#3C@�T��^�@���՘-@�^���@@��2;P�@�k>/`�9@��,c�a	@�{��'[�        ?��K��r?�Zz���J?�;�n���@�̸�@f����|@hɄ��@�1�X(�@!���@$��t
@) �c'V@-���o��@1*ɏ�p�@3����a�@6Pچq�@9�[���@;�K��Ս@>�|g��@AF����@B�gv�@DNH�/@F�j(�@G��;du@I�=��@Kxx?���@Mby�@OWR�Je@P�G�3�@Q�*v@R�k.��@S�6�y%@T��x[@U���ҥ�@W�GJS�@XC�r.��@Ym)/�Ak@Z�w]�ρ@[�o	wa�@]���\�@^A���-@_�a!2��@`c�~�S9@a�=�"C@a�c��>G@bV�	6e�@cU���B@c��rQ+q@d\#����@el��e>@e��\k@fr�Ë�@g(����@g�O_�]@h�ܛ���@iU2zd@jI�V|�@j����@k���Kg�@lS���H@m�*V@m�O
z�@n�j��M@om�N��@p��>�        ?���>��?�=hG�QO@ �t$ ^@˻S�jh@�(l
P7@�!T�IE@$Sq
A�@* ��D@0$	l���@3��3Xv@7G�0�o@;B��"�@?�C��@A�戁]1@D]�)+�@F��Q�3@IvMJP�@L.vg&�@OC ���@P����@R����W@Tǁ �
@U����6�@W_D�-=�@Y$��!@Z�w{wH@\��!�@^��;�W@`8���@a1в2+m@b0e����@c4=��@d=:4���@eKCB�g�@f^?�	@gv��2�@h��A�y@i�ôx@j�S�G�@l|��@m3[N-TF@nf����@o��~V(@pl�k�:�@q��D�
@q�?'8�]@rQ�&�Q@r�z���o@s��S��;@tH)��'�@t�5�"�@u����7@vN��٥u@v�¬,�@w�����@xd3�c�@y\f��@y��d��@z�o^�,@{BL��ώ@{����@|���a%�@}x�%�ά        ?ұ�j��?�Uv��@ �ϱXk@Ovꛋ�@u�#n@$�6�H�@$nʨ@)���@/������@3`i`��@7���W@;����@??�R�!�@A�Mn�>�@D:L �@F��e@IOΎ��@L���&@N٠�+��@P��0Y�@Rh�$^�@S�*z�@U�O��-;@WB�7�y�@X�	�Ci@Z��)��Q@\�3%�@^`j*�S�@`!��!�@a[}���@b$3��@c�*���@d�퇻;@e$���y@f4,��@gG�P��@h_�k_½@i|N	�bX@j�`У�@k��`�i�@l��k�%@n��9@oI,��_@p>�*�8e@p�DLR�@qyl�J� @rdy��$@r� ����@s^�U��@t�~��@t������@uR��j6�@u���7Q�@v�o6!v�@wUxR�w:@x�sJ@t@x��_��@yeh
��M@z?�$/<@z�|���m@{��G�@|9S�e@|�f����        ?��8�~�@ k�Z�Lx@,Nh��@:W���L@&X����@.��h��0@4�nřP@:I�͋�@@J)�zL�@C�h�{��@Gf�J�t�@KW�)�M@O����/�@Q��?�tX@TM/Qc!�@V��(���@YG���K�@[��+f��@^�_Xm�@`�'�p'�@b:v�{t�@c��C�ђ@eNM��m@f�(j�!�@h�����@j?.��6@k��К �@m�pk��@o��A�/@p��^�<N@q�R�Ei�@r���8�@s����w@t��-�"�@u�R'��,@v��8�@w�2�z@x�`�;�@y��"��z@z��Q7�!@{���N�8@}Xq&@~93���@^��&0�@�D���8@��}��̃@�r���d@�>���@���zt��@�Dz/]jK@���_���@���a��@�$s��@��t�O%�@�k����@��8nY�@��2�h�@�a��B@�h�@���h"@�dN�G��@�f�\K�@����_Z�        ?�묻�'�?�<�T�]?���a�@q��r)i@CZ��@$���@r����h@ ��Aw�@${�b�}]@(�R@�y�@,�(�@0���{S@3%�k�P�@5�A��@8SW֕�@;�0��@=�]x�r@@s����%@A�R���@C�?i�<�@E2mޖ�T@F߆���@H�1��6�@J\$�Ff�@L+&%r�@Nų�i(@O��dƞZ@P�a�*�@Q��g;�x@R��ؠ|�@S��<�@T�
�b(�@V3���@WeN%��@X3z�z8@YN���z�@Zn�6@:(@[�����@\��7Q��@]�R]@_#�|ǹ@`$��Q#�@`���`�%@a]O�7�@a�ٺ?J�@b�F�g�@c>P�z?�@c���֖@d�ت@e-� Us@e��H�t�@f�����@g*�"��@g���s�3@h����WU@i3��4S(@i�X�%�@j�$�Ku>@kI@����@k����m@l�Zn�U�@mjQeM�@n"�"�G/        ?һ&���?�~[B?���qʲ�@��1LP@�`$7R@�L{c�@#,lV�Y�@(�C���x@.���@2����P@6	\6��@9�%�p. @=�t���@A�� �@CX���qX@E�}M�Q�@H;r�r@J�)�Wp�@M���K|'@P2��#X@Q�/Ǩ:O@S.�7b�M@T�\�('^@V^c6�,@X��XT@Y��Ϣ�-@[��I[A@]NF�O�.@_&�CO& @`�:x|h@a|]5V�3@bx��G��@czC�3T�@d�Ҡk�[@e�P���@f�����-@g����<@h�n&��N@i�cֶ�@k�U��e@l3����L@m_A��rd@n�Q]p�@o��C��@p}�	C��@q�fj�@q����@r]�>�@s����@s��l��R@tO4��[@t�� p@u����V@vQ�Ħ�@v��?>#�@w�HP�	U@xb`I�$T@yl��e@y�i��|@z�Mf�u�@{:�;�M@{����@|�0�2߰        ?�9
���?��(��Z�@ 1oXbJ�@����S�@�ɖ#��@g�o��@#��eT�@)C�C�@/���5@2��6�@6w�:j�@:RCr��@>nL�F}@Ae	)���@C��5!@F��#�@H�{��	�@KJ�-�@NM6� �@Pt�A�h�@Q��̽$@Sy��$�@U����@V���W�@Xa�-J��@Z����@[�f�2@]���3�>@_��F�@`�"{��@a��LI�@b���/�@c�L	�s@dĨ���@e��סM{@f�5*�0;@g�2�J��@i�Tݖ@j<*d2��@ka��}��@l�<S7@m�߰�]@n�ѥy�@p�k�s@p�+U�;�@qO�sm>@q�32�b@r�P�c�@s:��`x�@s⍝[�Z@t�-�v@u7]#�z�@u�'���@v�}2�/�@wD6���@w��]�-^@x��Iq�@y`��0w�@z(Q�5@z�?٭�}@{��v5(@|H 
S�)@}� �5�        ?���=�?��(O2��@K��d�@��D��<@$�H@uQ@,�^6}@2��|�	�@7¾�uVV@=cʄ^@A��~ ��@Eҍ3��@H�!B��@L7<Xi�1@P���x@R���?@T<��_�I@Vv%��@Xő����@[*�u��@]�X&q)A@`/�h�@aj�/�@b�d��U@d(�X@e��k���@g
�Ҋ�@h��5��@jMF�B>@k��6X��@m3�<6@n�+��@p;p�u@q����@q�(��{@r�د0�@s��/��@t�r8���@uw2rK��@vb$��Q@wP6~��w@xAU)p�2@y5m�K#A@z,m8H�@{&A���/@|"�-P�@}"% ���@~$�V-@(���'@�ˤ���@���5خ@�"~��d`@����hӓ@�1�X1��@��lT��J@�F�R8~@���pȷ�@�^�ݬ@��Z�/5@�{�<ā@��c���@���xx6@�/%��Z@��f�֛        ?ʧmV�q?�	��?����^�@A�j���@��%�@���@'�3{�K@ �:��|@$;�OaA)@(;��5M�@,~�1Z�@0�Ofi�@2ެ��E1@5Z����@7�F���@:��G�r�@=qz�&��@@+���m@A�y���@C5_�'�@D��lT@Fk� L��@H�I�@I�Ji�z@K��G��n@MT����E@O'#���e@P�j@١�@Qs�1�@Rj~n`��@Se����E@Td�Ѭk�@Ug�
��@Vo.E5uX@WzR���@X�N%��L@Y�b��@Z��[l@[̊�En�@\�ȟ�6@^��W�@_/BztB@`+^�)�@`���
r{@aW�^*Nb@a��!�"�@b�����Q@c$�,@c���M@d_��11�@d���@e���Rc@fA�����@f��x��@g�t��ԏ@h/FE�a�@h�V;���@i~��8�E@j(�_5@j���^Y>@k~�b��@l+�+��@l��ʵ��        ?���p�{?�-;���U@ C����@�&<nk/@�e���*@Y="���@#�!�S@(��{N�[@.�OJ_�@2�X���g@6Uu��|�@:%��U�6@>6al��@AB7�bK�@C�����h@E�Q��[k@Hi�1�l�@K�$���@M��G��@@PEx���@Q���<`@S<�iup@T�����@Vc��|0�@X	(6�R@Y���
@[vVwW�@]= ѷF@_�T�WB@`ul�g��@ah��5�t@b`��$�@c^FM�@d`s�E��@eglF��"@fs/��@g�\#E��@h�#��#�@i�VB^��@j��;U�*@k�	U�@m��'�@n@�l��@on�w���@pPa#C��@p�V�%*v@q�6x���@r&����Y@rǏ���@si��f,�@t)��L@t��w@u[��`%�@v�v�}@v����@w\��<�@x
��Z�0@x�t����@yk��7�:@zWUl@z�~��@{�J�LK@|?�#        ?��	\	?�� y@ ���a�@�b��Q�@��mn�@��FD�@$y^��@*5rn��@0Gw�T�"@3�ܘ��F@7�@͆�@;�9�3�@?Ց�,��@B2 㽉@D��#��/@G �e��{@I��U��@L��%��@OiH6r��@Q2��C�@R�zN�e@TX�'��@U��S�|�@W�P�؄�@Ys��&��@[@I���@]���٠@^�$G�(�@`vfS���@as�x�3�@bv����5@c~�T\Sq@d�5��@e��f|5@f��Z�7p@g�G���6@h�[��@j m�	?@kC}��7v@lr]o!� @m��& �@n�Pt2�@p��@�@@p��H#�@qN�P�r�@q��2y�@r�32�M@sA\NtLj@s�s�>�@t�m���@uEB*��@u��@v�U��[F@wY�h���@xo
?�@x��z�P@y}U���@z7E�iA�@z��oh_�@{��}ݱ�@|n���@}/ 7T@}�Ѓb$H        ?��f؈t?��e����@��H��:@3���@%J�J��@-�=g]@3��uR@9'3܇�d@?�K�_�@B�Y�t߃@F<�+��j@I�־�h@M�4�_�@P�/�XG@S���C@U_Q��ч@W��S�<2@Z$\�Y�@\�od�l@_@׀Ȓ�@`��#�h@bW�Y��@c�����@e4�z�@f�e�U��@h6�d�4�@i�r�,@kZ�
��@l�ը���@n��+JW@p&m�)�@q f���@q�|��h�@r�h:�s@s��n&U@t���'�@u{�ˣ3\@vj���%�@w\��5�@xR#W@yJ(�/&�@zE�.A)@{B����-@|C(Fq��@}F6Q7��@~K�J H@TYD�@�/i�1�@����"�@�=�N�L@���(i
\@�P�)K<@��/cDX�@�h�N�L@��2KD�@����`4�@��!Tq@���(U@�7�#n�o@���j���@�_ȸv@��`�P��@���1�|�        ?�~��S�?����X�?���_�@�-�ӯy@���k��@Axն�@d��>W@#v�I�Q@'M��ﺄ@+� jT�@0C�ت�1@2�P�>]@5_	cI��@8��LX[@:�ݓ�� @=�
�%�@@t"q$j�@B��L!@C��Vw�>@EM�X\��@GZ6�0@Hô%i`@J�4���@LeTm��@NE�{ly@P=Ր޳@Q��]�@R��2@SW�o��@T��S@@U*~���@V;���^�@WQBan�@Xk���@Y��2@Z�7\��@[�j�܂@\��$�}A@^)�#��@_[��Hz�@`H�d��@`�[��@a�
�P�@b$J���*@b�A?�5�@ci���@d7�-\%@d�,0Q~%@e^�B�|@f��X�@f����H�@ga�\�r�@h�!�x�@h�=�j��@is�S��@j&_�v�@j���0C@k�3��$@lH|��g@m7? ��@m�A�UΗ@nv�,�v�@o33��        ?��V���p?�#��E�?��K<E��@�L�j@tw�N�@���)_�@#߰,r�@(JJ!�q1@.�׮k@29��S�@5�F�a�@9Q ��SB@=8H��@@��F�]t@B����f�@E"�
��@G����@J�Q�_m@L�Wz��d@OHi���0@Q����@Rv����d@S���w@UwV�: �@W���P�@X�Fr"�p@ZH�/K@[��y�|j@]����@_v� �@`�zd�b�@a��G �@b|>!���@cpXL �@dh���_@ee�\|��@ff�@Q>@gk��8u�@ht�
�@i�
d̴'@j�#h}�@k�JR��@l�ˬ/o)@m�/R3D�@n�*{@�9@pT�.q@p��&�ɦ@q8�*��O@q�ϔ��@rhJ���@sd����@s��3T@t;\6	@t�/,�aV@uz��W@vf�.e�@v��+!;6@wd��S��@x
���v�@x�td��+@y[�5/��@z����T@z����        ?�@H�r})?�ӴE��@ /��U-@����l@߇��#@Dnx��#@#t#n��@(��&'@.�v�z�@2�P4PP|@67C�Q��@9�U�<RK@>��\"@A%x���@Ce��

@E¢���>@H<( @J����@M��� �@P%�,�/)@Q�y�5<O@S���}@T����a@V7+k�E@Wم��3�@Y�^�I�:@[@N�@]���Ci@^���Rt@`V�]{�Z@aH��%ȯ@b@�^>@c<LٰtG@d=}@�E�@eC�A�AZ@fNH���.@g]�;�@hq�M��@i��ފ�@j��>@k����z@l�}R2(R@n|FG@oD�%]ɢ@p;/|���@p�y��@qr���*�@r~<ͺ�@r� �)@sT�mז@s��Us@t�i-�@uF�lx$@u���@v�	�`k�@wI)��	@w���/��@x�j�6+�@yZ~JM@z+t� �@z�l���@{z<��T@|2�aT�x        ?�2i�]r�?�2�^^�@�+�4@Ώ@
�@$;l���@,I���<�@2���c�@7��,���@=�M�T��@Aҗ\ʽS@EB��j@H��d$�@LTp���@PamP��@R-i́�@TSSPC�@V��k�&@X���8V@[O9:y5@]Σ����@`1�,#��@a���0@b�xQ@@dK��d�|@e���o+@g7`Y��L@h��.�@jF�)tC�@k��K�@mw�K�R@o�~V��@pd�>|�F@q?5
��t@rp�.Ɖ@r�s�T%@s�+��T@t·G�϶@u�tR�(@v���b�@w���/��@x��A���@y�np���@z�)��=�@{�>_�@|�;&?�@}���v@~���c�@�u�	@�`�ڈ�/@��>�Z�@�t�³��@���,/@��h7�B�@���+@���;Χ@�>ZQ줝@����(@�d�"V@��~����@����qpj@�&�g�_(@��Xu�J�@�X���D�        ?�G96y�?�XC��5e?�9C����@eع���@|�p+2�@�1�fO@��[p9�@!t`�쒷@%a!F@)���*vt@.�+��@1f� 6�@3�Qꦶ�@6��S(�@97�A�C@<����@>���A�N@A�x���@B�#��0�@D0�k@E�犒�#@G�ӯ���@IOλ��@KPT�@L�c���@N��c�@P^���B@QX����r@RXLV��@S\�0+6�@Tf+i��@Ut>��%S@V���\��@W�B���@X�^҇�@Y�Ex�a@Z��WL�m@\'��%@]T��.�@^�����@_��P�}@`zV���@a����Z@a���%�&@b[<1n@b� ���?@c����P@dL4�͟�@d�c��K@e�E��y�@fL��V�L@f����`@g��_��@h\���d@i��w��@iĲ��@j{'=��@k3/�%@k�ņgA�@l��`Y�@md��	ZH@n"�?ߩi@n�h�|�        ?�A%q�O}?�{ z�� @ jglW��@�.{�p�@�Vz�X@�6�*�@#�%��*@)2�����@/F�5�@2�UO�P@6��Š�@:e�y@>j���@Ak�]r�@C���urw@F�n"�@H�~^H�@KEpFP@Nw��s4@Pl1oۭ�@Q䗍Q��@Si�D#��@T��%$��@V�$��@XA	D:��@Y�F��@[��[�z^@]~��h��@_Spg��J@`�:��Aa@a�ǒ	��@b�@b+@c������@d�� o��@e���[@f��JaR@g������@h�5%ƞC@i��u��@j�K���@l���@m=��w�@ne�
�i�@o�nÖh-@pa[�	��@p�O� @q���@r4|R|�@rӦBl@st}�
�/@t�����@t�=ec8@u`ʤ���@v�Q^�@v��ޭ'@w[�h�2@x�}*׾@x�`��&@yb�
�q@z��Q;@z�4��T�@{v�3��@|+��X�        ?�����?�w����#@ ��v}4@P����@��uz�R@�h�a@#P��E�@(� �Ga@.��줦�@2�9�@6���|�@9��щ�@=���H"�@A��>-@CSA"K�-@E����+@H&�Fi#@J���=$�@Me�Z���@PK�M�@Q�[8N�@S�+��@T�.ꨮn@V_���@W�
���9@Yi��Y@[�#@\�U����@^�]�e��@`@Q�� @a/���I�@b$���$@c鲺�@d��D�@e��w�(@f&�J��@g1��#ǥ@hBa�='@iV����@joL=(��@k�0&�a�@l�'��B/@m� ��@n�
���|@p�SӀ@p�6����@qFdS�L�@q�jg���@r�A��#�@s�jr�@s�L�b~~@tdt��C�@u	U���@u����x�@vX*���@w��$�@w���uH@xZ��"u+@y	��P�B@y��΃��@zk�xF��@{5�gv@{���]�N        ?�ˡu8?�[�f�J@BӉ :�@�W�\%@$��'�
@-8����@3`����@8��4zV@>�-�o�@Bsֿ=��@E��g�G@I�r�V.@MY�oF�@P���K�"@Rխ@��@Ux
��@Wa#uw*k@Y��M�b@\I8�>8�@^�U�@�Q@`�^ ���@b#�h//@c������@e8j��'@f~d��n@h����	@i�{ݳ��@k,�eJ�@l��i�@nw'*���@pI�6@p��
(�a@q��[�@r������@s��}| v@t���.T�@ux�i�$@vk���9@wa�Z+�@x[u��y�@yXTnݟ�@zXo}�m@{[�}(+�@|bdR�@}k����@~w��$+@�gig#@�L��P�@�׃3���@�c�H�@��"a@��@���TJ$@��h���@��acV�@�5��r�9@��A�|�@�`B9��@�������@��I;���@�*ER��1@�ŉƂ�@�b���@��յB�        ?ʖ$ ��?��]���?��8�e�<@*0�l@���'�@�
ȭ@�=��@ �
�!@$Aq+9��@(K��;6@,�P�.�@0��D�%�@2���aoK@5��0Bω@8*K�:��@:��ʊ�@=�Y t\�@@_\�p@A�q`(@C|[ r�&@E���Q�@Fʚ���O@H�nwa�=@JG��cu@LQɕK�@M���wr@O�0��r5@P�~6
8�@Q��W���@R�b|�}@S�u�U�0@T�83@V���4x@W�9d�@X4l�]@YR!��@Zt��s�W@[��N�*�@\ƌ��G�@]�� �@_(�у�@`/����@`�h��V�@alՈ\�@b"�n"1@b�H�	7g@cVB'��@c�
G�5�@d��+
�@eO��M4�@e����L@f�����=@gYL��k@h
b@h������@ip�&�@j&����l@jݿ��x@k�w�˭�@lP��nd=@mY{�>2@m�y�0��@n��ky        ?Ӗ�c�l?��'�m@ �^�F�@PuI>�@j_���M@�{{@#��TQd�@)�"�9@/��D^m@34�GJ�H@6�����@:��k�D@>��₣@A��PJ�@C�!�gV<@F_���@Hꎫ�;:@K��wdq@NR�1�L@P�����j@R��D�@S�`^p�@U.^��,�@V�`I�S�@Xz��@Z1N�FO0@[󲯟{�@]��9�@_�PR��@`��͋$�@a�+�=�@b��0�d6@c��8��v@d����@e��݉�@fͣ{ӳ[@g���q@h���@jĉ�U�@k5H� '�@lZj6r@m�Ds\@n�?dI��@o�{�]@p�^�VC�@q'�z�Dw@qƍ�CT@rg�$�)@s	c7�r�@s����l5@tS��Xی@t�d��u�@u����@vP9��@v�4T���@w�ܺL��@x\+G'�@y��:_@y�����@zv�K�y@{-SG���@{�w�&�F@|�v��C        ?Ѥ8p�r	?���.���?�V�$��@
���� @E��Lv@x�y��@"����[@(ES(���@.'F�^@2J�s�	@5��4�0(@9��퇜�@={��k�@@�_��@CħV�@Ehؿl�@G����հ@Jg����@M����@O��IYD�@QT��F��@R����}@TRԐ:y�@U�K���9@W	��7�@Y%ǉJ�y@Z�@��h�@\�2s�.�@^Y]�}�@`�H��@a�^Q@a�{D%:R@b��%�%�@c����7�@d�u�ޡE@e�U��bv@f�}*@g��GTA4@iG��+�@j!�`���@k:%1C�@lVj^؅9@mv{P4@n�B����@o���\��@pvN���Y@q�@�D@q�h�P�@r@���k@r��U�T@sz�P(S@t�qS@t�Ϥ�^�@u]uCf@v ����@v���Y�l@wL ��@w��/���@x��-}�5@yG;@���@y��7.�@z���`M�@{M���&�        ?�p��t�?������E@��V�@L|���(@$��:��@,ݱ,��G@3%����=@8k̋]��@>81��)�@BA�9��z@E�2�T�s@I@�C�@M7��B @P��q@R�P��u�@T�Q��O@W/���
@Y�\�g�@\_�O-�@^�LO��@`�@���@b3.�@ck5�û@d����@fX_���O@g��(]@ij��u��@k1"�@l�TWZ�@nG�^O9@o����f@p�����@q���x�w@r�ƆU�Y@s�u��� @tnݺ,��@u]��0D�@vP�`��@wF���lq@x@'\9�?@y=
o���@z==,_@{@�����@|Ga읦�@}Q:�䢡@~^3���@n@�勜@�@��$��@�˶E�k�@�X:CHRe@��0�i�@�u���z�@�[j�g�@�����#�@�+��e��@����|o8@�V�A�
@��H�f@����3%.@� �>i�U@���V��@�X9�HO@���d��        ?�-��@?�u ^��?�RĮB6@��n�5�@hS�ʵ�@^k1��S@��m��@ �n|9�@$�����@(қ���?@-3�+*k�@0뀞�R�@3] ]7h@5�,��\6@8�� f^@;ez��r(@>K�d�)�@@��U@@B4PZ��@C��"J�@Eu�����@G(�ї��@H�C2�I@J��	"�@L��X��@Nh�?\�@P*yY|@Q%�_�@R&@��J�@S+��̒W@T61�^3�@UEqV�vu@VYj�&d@Wr����@X�7 ��@Y����BQ@Z�
��KA@\�߄�$@]0t��w]@^c�6�@_��!�@`kV�<��@a:�GV&@a�*�VŇ@bQ{�Be@b�4���@c����@dH�a�*7@d�r�Tp@e�LF�@fQ���@g�M� @g��Z5(k@hj�3E�@i!���o@i�(�x�;@j�f� @kPZX���@l���K@l�C6I�@m�*G,`@nP�!@ođw�z        ?�HCM�?�w�A�
@ f��,�@��9m�T@ߨ��@�k}@#�J)�0@)$C%�[@/3q��)@2�u�f��@6{�_x�@:Q$��D@>f���	.@A]�*��@C��7��@F	�t3�^@H�P�)Ա@K(E���@M�	dh��@PX�Y�9�@Q΋�)�V@SP~_��U@T�swZMP@Vx�*4�@X3���@Y�p�yq@[��!V�@]NR�Z^@_x�n�@`|c T�y@an�]gJ@beuu-�@ca'Y�5�@da|&�$@ef[��@fo�\s?a@g}W�@�l@h�M6�1�@i�y�<�@j�ʲ/�@k�-�;n.@m ���8�@n&�#1B�@oP��8@�@p?pԕn@p�7��H�@qr�R�ڜ@r>c��@r��ڛ@sL�l>��@s���a@t���\�@u5m�?p@u�^M�^@v�ȅb��@w+�v/�@w�쒥�@x����_|@y.���!R@y���@z��5Y
@{=�b�S@{�B[�%        ?�,����?�F�wQ@ "�5k�@�&3y4@�Qg��@?CBOQ@#tĊ�ή@(�eQ��@.���p��@2������@6Fa �4@:�90̽@> f��p�@A54T�;@Cw�}z,�@Eׇ��@HS+���?@J��I9@M���"��@P3x	p�@Q��[J�@S$Y���@T��%��p@VE/�'�@W��d���@Y������@[K|���@]��J�?@^ژe�+{@`X�AR�8@aI˹�@b>X��g@c8R,�ӣ@d6�=K@e:#���@fAѱ�q#@gM�-���@h^Jr3B�@ir��e2�@j��~ex�@k�rV{S+@l�9�F�y@m��`�[@ofz���@p!UA�'@p�QߴfK@qS!�>[@q�]���@r��J1@s+(���@s����@tnV�{g@uaтL@u�nm�@v_.��J@w�>q�0@w� �@x]���X�@y
�"�?�@y�g$n\�@ziUb��@{�=�@{�J���$        ?�,��Z�?�u/c�@5�BNR�@���PF�@$Ԋ�~y@-(CÐ�@3W��o@8���� @>������@BrT��@E�2�w�L@I��ERtq@Mc�zA�@P�VIx�D@R� ^Y+@U��;�@WuH��K�@Y�M�V~@\hBn�)P@_~�/@`�4@�e@b=;lT@c��^���@e!�Ejh�@f�4p���@h.
�v��@i�B��d�@k_���q@m���2�@n���E�|@p6J�`�@qAn{��@q�N�i�@r�\���@s�V�S0�@t�+�qZe@u��.-"�@v�0��@w�F�+@x�Ə�@y�X��g@z�<}��@{���I�@|�{/�}�@}ѸU#	�@~�J�nr@�&���@��!�=@��m�� @���X@�;��*@��F�]-@�d9'(8�@�����f�@�����0�@�,A�Pp�@��K��ӊ@�c�ul�G@��U���@��`��H@�B\�2��@���[�`@����Qq�        ?�)�Gr��?�A.�D��?�!��Y�@Qƨ.L�@]�q��]@ݴ2��@���[� @!`���y@%I�� �@)y�տ�@-�Y�#�X@1Sv@s�@3ͳ �gP@6fJ ɋy@9�Ғx)@;��뤉h@>��q8�@@�f�B`�@B~�nKg�@D�7���@E�,v�(�@Gu9Q�x=@I3}�I"�@J���(�@LЈ_��@N���,��@PK�)��@QD��ma,@RB�L<1@SEJ�O�@TL�|��@UX��� @Vif)?{@W~��@X�[ 1~�@Y�a<C @Z�ݴ��@[�d�*u�@]'�/��@^V�Nd@@_�,��q�@`_�K�V�@`�C�Ѓ_@a��"��@b=��d[�@b��x�@c�,'���@d-.M���@d���7*@e��P��@f-E�e.�@fۓ�I}�@g��)���@h=q	���@h���s�@i�)�ؼ�@j]M��@k�Q�'	@kϥ�=@l�T���@mH�[��@nHP��@nǄ�Ǳ        ?�s_� A�?���S�@ ����uc@#4�	��@F.\���@���"�@#��D,^@)U�nhW@/nN��@3
B~�4@6�,\p�@:{��\��@>����J@Aw|� 3@C�<Þ�@F(�g��@H��#�p@KL�'~�n@NVY���@Pn@��� @Q�����@Si�@��
@T���hz@V�Nf�(�@X>WT<�@Y��	��@[���н@]z^�h:G@_N�e�n�@`���@a��Q#-@b�f8KI�@c���lz@d�~۫ �@e��)�:@f�\��@g��~��@h�)�\�s@i�w��:@j�/�W��@lt{K�@mC̈�b�@nn'��?^@o�t?	�@pgP��@qN���@q�,��y�@r=��o�@r�i2��@s���bY�@t$�	�;@tʎ�C��@ur�9n�@v&��Q�@v���ف@wrG���U@x =���@x��WXu�@y���#�@z3����@z秋F�B@{�Q��@|Tw�w�|        ?���[��f?�V4�,!?��7Z�p�@+�TxU@�9��g@�~7�@#5e1�.�@(�_��T@.�h��@2|,-��[@5�K�D�6@9�����@=���(Ê@@�-�މ�@C3-I�@E�[����@G��a��@J��v��@M,��σ@O��id.@Qa��;Z�@R�:D�(�@T\gX��@U��c�@W�m���@Y(�����@Zח�֜�@\���B�7@^Sپ�`�@`d��#�@`��u�7
@a��By@b�s���@c���36/@d�J�p�@e��?�@f݋y�5@g�S%�8=@h�	7�@jə���@kP�@l5��-,7@mR����@ns3��?@o�dG8<7@p_��v1C@p�jt�@q�Z�
_=@r%Ad]@r�ǭ�@s[�'��@s���v�E@t��7���@u9x���@uۣ��z@v>L��s@w$A!}3@wʤ`"��@xr`ڻ��@yp���@y�Ш�s�@zq{�v'�@{m�{�b        ?��i��Mp?�ttR�u@q��	�/@��b*4f@%̀�w�@-��Dv	@3�)]�K@8�����@>�_�6��@B�����,@F�B�i@I�x,3��@M���*��@P�T�9�5@S���#�@UJ�W���@W�G(�1@Za�pt@\�^0��E@_)�5Q-�@`�)�eK@bK�R	�@c��o�t@e)VUQp@f�@R�e@h,9|�5�@i�	�e��@kR|���@l�a�>&�@n���i1@p%n3q��@q�dm�G@q����@rť�yp@s�h� xL@t��Q�z�@u�a�D�@vzϗ���@wq �~��@xj��^@yh6�K@zh��=@{l���e@|t2��y@}~��}@~��%�@�vB�y@�X��M��@��Q�lM.@�qdhfT�@����a��@������i@�!q��{F@��W���@�H�i-Y@��`U���@�u{�N��@���Qd�@���!i@�B��Jy�@��x��o@�}H��~@�gg�Fl        ?���qL?�dH��?��'p��@$�ҥ��@��}�@ح*U	v@\�
W.�@!EAl���@%*�2��'@)Z}���@-Ϧ���@1C���/@3��^�+@6Y1��� @9��A6@;�>Q���@>�L�gE�@@�ج1�@B���;w@D!�����@E����3�@G�����`@IF���'�@K�'
��@L폩�Z@N�5�`�@P_��#�/@Q[�B��@R\���@Sbၭ�@Tm��*��@U|馆p�@V�ʈ�@W���ڱ@X���\2�@Y���@[�&���@\5� @]bE��@^�] ��@_�7��{@`�\wmɆ@ac�y�@a�'@I:@b_���#@cƋ�@@c���m�l@dN#"��@d�;�ˏ@e� 6|�@fKc)�K�@f�^��@g�����@hW�'��@i����@i�ޞ���@jp��~@k&�St3�@k�Nz^��@l�f�:p$@mQ���p"@n�U�@nː?��        ?ө�l��?�dq���@ �K��@r鎙,�@�g���@,�P&0@$�YxN�@)�yi�@/�W���@3N,N
%�@6�`n��@:�3�)#�@?g��H@A��t��@DG�*@F�MAbs9@IU�
f@K��*�o@N�Q���@P��b��r@R-D���@S�M0�@UKW��a�@V���0w@X�-<��@ZO/⃼�@\�q�@]�[�s�@_��N�@`�-O1�@a�?����@b�XPZ@c�q���@d�T��@e��s���@f�)���_@g��4G@h��36�@j���@k$��<Q\@lDP��R@mg��G��@n�����@o��w���@pt;�n @q;(���@q���B�@rDd�U'�@r�H�.@s�Gk7 @t#�4o�@tƱ�9v@ukMV��@v{�iݿ@v�6��mH@wbx�d��@x;zoa@x�x�4[�@yg*�� [@zK`�ʏ@z��x�MD@{x�G�Z�@|,��>�        ?�8��xf?�˙���;@ /�kYw�@���[��@�t���@_��8@#�����M@)��AĨ@/񷨪�@2ӆ�yx@6d\FZ�@:6��D@>I��v�@AL-�
H@C�v��c@E�bn�U�@Hqn�@K	��T��@M��֫.$@PC��b�@Q����C@S3�{Q�%@T�z��@@VR#H	@W��J�@Y����@[O�OAe�@]�+M�@^��J	!�@`S���͂@a@�=���@b2XS&@k@c(]��71@d"���e+@e!&���@f#��G�@g*T�+ @h4׎�4�@iC.�͜_@jUD����@kk`���@l�Z_�{@m�4V���@n��WT�@o�.׷��@p��q�@q3 ��<@q��T��@rJ'���%@r�p�@s3p�Ҍ@t����@t�BJ�@uY�n4��@u�����@v���!s@w@ZJ�A@w�1򛘆@x�L
�R@y2���V�@y�5���W@z������@{/�5��        ?�s��@�(?��M��Y@�٬o��@��@@$y�W�}�@,�!���h@2��;{@82�`6&}@=�r@B2D&@Ed�4��@H�uN��@L�>����@PT�{"�@Rf��reo@T�W<	@VҌrcf�@Y)�
�8@[�,�|	}@^0p}�S@`V�[@a�0��'�@c�����@dnDFv�"@eݴA��q@gU����@h�2�ް!@j^ˇ�;e@k�S���@m�����@o'X��9�@pg9���@q>V��@r�n�Κ@r������@s� hjʹ@t�YO�L�@u��mP@v�MpY~}@w{�F��@xl:>\�@y_��.��@zU��2�D@{N���3�@|J|g�#�@}H��5�w@~J�|��@M�8]�W@�*׃׳@���:.)�@�4*� �@���Ai@�C�I.�@��R��@�V�s*'@��GJY�@�n��>	@��ʌ��a@���Sw3r@��7�;g@���!���@�?L؎�@��G�Jں        ?��T^�8�?�>�& *?��H8��@u���@y�&�@-���3)@�D���@ �|s�@$��^@(�"΢��@-��3�@0�lS;�@3J�s�Hs@5ۺ���@8��m��n@;U����A@><�Fu�2@@�,�#�@B,��d��@C�0�~��@Em�v:�@G /U{VS@H�H'��@J��P�N�@L|Ibu�*@N[�j�"@P"��ŝ@Q�v��@R9�!}@S `j\�@T)\I��i@U7���@VIed�]@W`=�--@X{��P��@Y��K��@Z���4�Y@[���P��@]��@^B�f_(�@_v��P@`Wy"�@`�hAF̽@a�="�@b6�p'�D@b�p	��%@c���K@d&ɭ�y_@dϐ�ؙ�@ez�ӾI@f&"a鯻@f���f��@g�,�s]�@h4�=B@h�}�^�n@i�s7
<@jO�L���@k��[?�@k�:3bR�@lyT��~@m41��4@m�� 7@n��+��c        ?�od֭�?�1�f��@ D���
@�����@�KP�h@f���@#��P0%g@)	dxӣ@/�f�2@2ܡ5O�i@6r�6�"�@:L��w@>h��r��@AbK��@C��I�sO@F1h�$'@H�q�8�2@KJ�=��@N��V4�@PuZY[{@Q�, �@Sz5���@U���@V���/@X_�tFX�@Z�r��@[��U��|@]�,����@_�o�@��@`�+,@�@a�O�-@b���@c��a�ؽ@d��9���@e��8�@f�9&t@g�'�x�j@i�'Q*@j����@kB	v�36@lh��n@m�[�g�8@n�8P��I@o� W��$@p���@q3m4%��@q���86@rt�M�@s:���@s�A���B@tc��G@u��1@u�)�3@vbGzA�@w���@w��f���@xp�x�ӵ@y#F)��@y׃�W��@z�M��f�@{D�2\c�@{�h7�}T@|���)�        ?���GEd?�3Q><?���(F�@
�a����@u&(!z@�;���@#!���G�@(~�?�	@.n���IJ@2v�E�q@5���@9���;�@=�6�a@A�(�@CB��e��@E��h��/@H!����@J�o�z�@M^�k��@P�ﺺ�@Q�@na)�@S0%^��@T�e� �=@V(�X[a@W˃,��@Yy�/�Ah@[3bE��@\�Ѩ�!#@^��#Ї�@`P;`�.@aB��<@b8�����@c4���Er@d5R����@e:�a��z@fDg�F�o@gR�� @herؐ�@i|v��@j��j;�2@k��7.@l�s8�U�@nӖB��@o-�4)&@p.�j��@pǃu�#E@qb�,���@q���.�@r���F��@s?~�%@s�M�K[.@t�!`k@u*�W�C�@uы::t�@vz�u�@w$�PzS@wςnGur@x|`�5�@y*��i8z@y�:H2�@z�$GP�@{=W?�F�@{��fA�        ?���p�?�+��3@��m�Ǭ@�]
Y�e@#�$�G@+k6/�5�@2.�1 h�@7.o��@<����v@AP���g?@D��\��G@G��q�@K�A�sW@OV�b�|Q@Q��S��F@S�So�0J@U겪�n�@X+fGzF@Z��v�v�@\�5���@_g����@`�r��@bL���6�@c��3��K@e	k�U�@ft����@g�[�Z.@id[[�@j�ŭ��N@ls<A1��@nR�&w�@o��tIJ+@p�a�v�T@qu�Ŭ��@rM��؋@s)l0n�@tE�Z%�@t�p��@u���;t�@v��I%D_@w�_��\�@x�SdR~@y�R��R@zzNiV~�@{r58-�@|l�i�;f@}j���V�@~j�];�f@mŴEr{@�9��:��@���vy��@�B��dE@��jS�q�@�Q�*��@�����@�c��!��@��'E7�P@�{zi��@��e��@��w�j-@�'5*(�@���s:��@�Ih��^        ?���5�&?�<��GM?�#���-y@��W�@N���@VV�m�@�L�G�@ ���s�^@$� ���g@(�@3X�@-H�K|sg@0�ﾋ�_@3j�',%v@5�{�n@8�I�@ @;s/��@>XU���P@@��U�;|@B8�G��c@C����@Ew"�cx�@G(k&^@H�\a�1k@J���\��@L�;KP��@N_�X�P@P$d`��^@Q4b��p@R*O��@S!(����@T*3'�T@U7�ُ��@VJv��R@Wa
6��:@X|s���#@Y�<����@Z�Q�ہ@[�wv�@]#�1�x@^E��d��@_z��I�Y@`Y��{~@`��υ�@a�N�q�@b:{�G��@bއ{�>@c�l�#ٶ@d,(F���@dշ�k�@e��Nw@f.E�`�$@f�?h�Q�@g�  ��@h@�IQq�@h���,k�@i��_��3@jbT6ѕ�@k��A��@k։]�(8@l��ۍ@mQ ��zt@n�#w��@n��,���        ?�f�3��?﯍֜L>@ ����g@2΢��@G�.�\�@�ݲs��@#ݘ�%VM@)kv�5�@/��z�@3$HM��@6�v�d�@:���*�}@>��W�Uu@A�Z�N�7@C�\�b��@Fb�.ӟ!@H�!�J�!@K�R>�x�@NccNs�[@P��Uv�(@R!:ѝc@S��S��@UD��OR5@V��9!6*@X�T���@ZU���	@\?q?�@]�6��J�@_�(��1�@`�i왍@a��I��@bӲ"��@c�l�AD:@d���K@e팸���@f��C��@h�ډ��@i2��_g@jR6�Л@kvY���@l� �;�D@m��`ԏ:@n�获�@p�&�i�@p��&�
�@qT�`Ճ@q�m�|i@r��{�n@s:ѯ!�@s�>�@t�k6 �@u1Ֆ��@u��Wu��@v��1���@w8v��f@w��F�u@x�t�W�y@yLulDe@z �}�fH@z����g�@{nu-��@|'exڮ�@|��ʧ�        ?�7E�2�m?�6�Y�^�@w��L�@���2i@�\JoF�@�N՗ׄ@$����|�@*?���\�@0I7��@3�.�?s�@7u��_��@;t(�r��@?�{��L@B~�;�@Dy�����@F�����@I��
i@LK����@OCٻ2�@Qs��,@R��YԿt@T�n(.@U�Pn�@Wj%-UP.@Y"Pk��&@Z�2l��@\������@^��Yi��@`<�䌨@a6D�3@b4�o�ڛ@c8х➪@dB!�[�@eP�>y��@fd16��@g|��:,@h�?ln�B@i��<	d`@j�P�f@l3�+c~@m?hV �@nt��K�@o�,��k@puMj�nO@q(��d@q� �?@r^*�r1�@s?'�#�@s�T˲�;@tYcT=@uaP{��@u�Gl _�@vfش�@w�_��@w�b��!@x�L�?}@y;C//L@y���NF+@z�Z��Q�@{ml��C�@|,$%	�p@|�y�$@}�hu�[�        ?��+<}��@ �*��@QDc,8�@t�=�Jp@&A�g�@/(E���@4�toV�@:_�v
�@@R"�آ@C�(���R@GdM��2@KM��m�@Otԅ�6@Q�v�I�=@T7@����@V�x��h@Y"L�k�>@[� ���@^t�+��@`��+��:@bڒXЏ@c���S�@e�]ߵ@f�L(��@hS�ѻ�@i�~��`@k���?X�@ms�L��S@o=3��J�@p�Z�[�@qv����@rj6]Et�@sb�c@t^�`�@�@u_h�-fU@vd��=y@wn%�)��@x{�!�@y��U�P@z���G?�@{��ᐑw@|۝���@}�v���@#)<�լ@�&T<��@���#��@�Uf���_@��zӷ�@���D��y@�)��&4a@��	���@�jB�/o@�(^�Y@����K@�Wڝ��@������@����U�@�S����@� "0..�@��l��@�]lx��@�M��q�@���lox�        ?��/���?�pM6.�?�d�)��@揘L��@Q3�w��@��^�K�@�&\��@ R_�@@$�u��V@(�Y;�3@,?��t@0^V�O��@2���@54��X�@7�]]�*4@:{���@=FH!@@1�t�@A����_Y@C�'Zo@D���G�@FT�� Q�@H ����@I�_\�@Kx(�zXZ@MB���e�@O�F��@Pz�ϛ�@Qnyb�?�@Rf�����@Sc)���~@Tc��X�@Uh���w@VrhY�@W:���s@X�U�~-@Y�V��@Z�/�9�|@[���Zi2@\�'ajAM@^%L1@_F�7I��@`8�S܈7@`�,����@ai*�ڽ:@b��r{�@b�;����@c>D�0��@c��� �@d2`�@@e"(���@e�d5V��@flE���@g�9��@g�p�]��@hf��+r�@i?��;\@i�1s�B�@jmu�{�@k�c0@k��q}�@l�r�a�@m3f&�        ?�㨽v��?���c�{@ S�@f�9FB�@��R���@�QQ@#Z��W�G@(��5=�9@.���ǭ�@2���&@6/C�k@9���"�@>]���@A'ʅ��&@CjQuE$@E��u�H@HE���T�@Jܷl��@M�����@P-'(e��@Q����5@@S�TYo�@T�����N@V@+w�@W�'�	U@Y�T�A1 @[Gd�A@]
?[�K@^�B���e@`WP��=@aH f��N@b=�T2�H@c7�53�@d7Jw�{@e:�ȭ��@fB���@gOr^��@h`_5��@iu��IS�@j��#��@k�Z�k@l��1n�@m�=��E@o�[�@p$��/�l@p�8�e@qWy<l�z@q��f(@r�c�K�w@s0�Y:�|@s�N����@tuP�#5H@u��&m@u�EdClF@vh)Z5�R@w��\�@w��L8��@xi'8gr�@y*m��j@yƥR�@zw���)�@{)���4@{ݩ�� a        ?���Q}r3?����0@ �p�P�/@���WD@�Mv��n@��,@$_A�u�t@*��Jw�@02�#A�@3�b��J@7a��iz@;c	�nm�@?����F@B� /@Dyi�殉@F��GgE�@I�}#c�F@LWK��?�@O0��K��@Q�j��@R�Z�d�@T0��b#@U���q�;@W�"�^;@Y=���Te@[efǬ�@\����T@^�]G��@`Q��[�@aL��!��@bM"�g>@cS��I�@d^B9Un@en�g��@f�:K7�@g�����@h���Xu@i���L@k
�8��@l7�f �@mi�e�q@n���Jj�@o�,�)3�@p�m��d�@q-ך�Ȃ@q�K��Y�@rv���@s3��'�@sǗؚu
@tr��@u ��-@u�xA*@@v�/wBs@w2���j@w��vo�@x�K��V@yU52���@z�"���@z��/C�@{��VSfA@|E_�p�E@}b����@}��K5�        ?��2��C?�e��/�@k��'��@��h�n�@% %�[m@-�a���B@3��_AB@8��0v$ @>�J`:��@B��;г�@F#|4�
@I�� Vf@M��7���@P�tu���@S�z0�@UX����'@W��A_��@Z#�n]B\@\�p��X�@_H�}�!�@`�kNO@b`�dma�@c��se7W@eD~(�ɑ@fĐ'�[@hM�#��@i��^���@kz�W��@m��ezA@n�~I���@p>��[@qh���m@q� xN@r�Nw�@s̱L`�i@t�w�Y	@u��e]�X@v���ꙿ@w�ڴD)�@x�r��P@y�Wf`� @z�x�Ʌ @{��l�@|�2��o�@}���S@�@~�, ��@ �j�@�j�.�3@����O�@���C���@���|R@����C�$@�0�Y�@�@�¯����@�Vr�|�@��ȼ��N@����ϫ�@��+J�@����\9�@�J^:#�@��`�y�u@�����!P@���EZ        ?ʹo��
?�_+� ?��� L~@RY�QO@�/��@ȃ�N@J$
���@ ��S�)�@$`6��@(m��pk)@,�O�?`@0���	`�@3ԁP��@5��J؉@8H�����@;��mX@=�@@u]A�l@B �c���@C��o4��@E=�~�V\@F���U'^@H��T�2�@Jt����@LInD��@N)KR�$�@P
%ZM�@Q�D@R`q?R5@S
�t�w�@T�e@U%/�_��@V9��o/@WS �p�@Xq5ں�@Y��
�n�@Z�'���@[��]X��@]�Ԩ��@^K0o�:@_���Y��@`` J���@a j�|�@a��kIQ@bFՓ�@b���L�@c��`
�@d>nDc�r@d�՞��v@e��6�@fE���`@f�Sǃb@g�9�H&@h[�[�(�@i�����@i�a��T@j����*@k997Y]@k�]��v{@l���K@mn��͙�@n.e�9=#@n�/��         ?�u��?�(�V�h�?�r�E�@n@
��ā
�@:���~�@^�@�Ft@"�̑}��@(!���C!@-��b�Z�@2(���#"@5��>�_@9J��/m'@=9���@@��#ZA@B属`7@E5J��6�@G��E�Ӕ@J')y�ێ@L�}��(@O�¹��@Q+PR��@R����z�@T#���>@U���� @WJ�d7��@X�C�b�@Z����rM@\X����@^o��r@_�l�9j@`�/נS�@a�g��	@b�f��o�@c�_Ng:@d�NN��y@e�C�_V@f���@g�mbb^@h���?�o@j ��
�@k��9@l5�h�A�@mU�
�_�@nz
&��@o���yh@pf�Dk��@p��ߦ^@q�4*�T@r2�Ej_@rΛ���Q@sl�P��@t�����@t��6��7@uP�p�@u�J��6u@v�5��`@wB�È�}@w�c0�[�@x�����@yA*���y@y�c�Eh@z�V�[�N@{K��K        ?�)���?�H�@ ��@��)��@�h0�p @Pe�Sj%@#� ʥ{@(�����	@/�4FC�@2�;�<@6pַD�N@:M'3�@>l�s�@Ae��j@C�K�T�@F#�ɦ@H�ƽ2�@KYd���@N�m�z@P��g@Q���Î~@S��r2I�@U$�~o6@V�R���@X|j���@Z:�t\ r@\�K�۴@]�'\�F�@_�wMa�@`�v��x@a���rV�@bφP�
�@c�jԀ�=@d�i~�y�@e�h/�@gN3YJc@hv�U�@i=m���@j`rcL�0@k��o���@l���P�"@m�)Xh�@o�J��m@p(��!@p��9W@qgF����@r	���n�@r�����@sS��i.@s����@t�9u�x@uP����	@u��,��@v��K@�@w]<���@xiGƌ�@x�0s��[@yx�Tq��@z/s�Ł�@z��NNp9@{��ּ�@|]K�-b�@}3F���        ?�XH���?��abl'�@0�q	�@�G��Ѕ@#c ��K@+[��e@1��	+@6�95�:@<V~QQ@A�f���@DC�o��@G�@pE�#@K1Jڮ@N�����@Qp��?�@Se��4@U��c�½@W�K�,��@Z+eo��.@\�zd�;�@_ <ji@`Ż��d@b5r8��@ci��+zr@d�
Zn��@f0�����@g�[΢�#@i�d�m�@j�����O@l#I����@m����b@oK�dTB@pu�z���@qH��'�"@r�<�s�@r�7T��}@s��'�@t�O2Do�@u���-#@v��%��@wpaDp�@x^G���@yO']͜@zB�ĝ�@{9����@|2�sw��@}.�ql�H@~-����@.���O�@�m��@5@�����W@� ���sd@���Ǚ�O@�-6=��@�����@�=��ؔ@��夘z�@�R�hN��@����8\_@�lV��@��.?��R@��J�x�@�g�W!X        ?̡�#��?����?�v�]�t@�x�1B�@�V�qD@8�`1�@˕,|��@!�2����@%j{.1҆@)�M�{�K@.
H�Y��@1\���<@3�h�l�@6de�i�@9�u@;�~��l=@>��ϓd�@@�Q[��@BcE���#@C��j,�@E����@GC�9ߣ@H��א�@J��k��@L��L�\�@NY��(!k@P|�XZh@Q���E@R	��-�@S<	8Ix@T	���@UU49�r@V�59x"@W(a�@X;:ڨ�@YQ�}z3�@Zlm@�@[�
'�70@\���R��@]��jmh@^�L�Hd@`
�|�V@`�㿶k@aI��x�@a���	@b�P?bi�@c$T5��@c�n�@di{
E
@e�3e�t@e�K�iف@f]��q&@g��v�)@g��nmN@h`0�O��@i֊���@i��h�O@jp��]�~@k#��[�@kء,ɶi@l��r��@mFI�x�@m�A�ed        ?�9��d?�`��@ [��hB@Њw7[@
�{���@�h��s�@#�9��r�@)��p=�@/-��J�R@2�:|�W�@6|�2A@:U�1`U�@>oE� -�@Ac�썕�@C����q@@F2�>��@H��}�b@K=���V
@M������@Ph��$�@Qᩬ�ey@Sf�:WM@T���p�b@V�eVF{@X?�Ѷ�@Y�c\"Y@[�����@]��D?�@_WS���@`�s�c@a�����@b�qK=�N@c��L4@d����{�@e�����@f�����@g�VKo@h�T(DW@i��P��@kb$�®@l0Fw�@mXK�דt@n�`\7��@o�pW���@pt4� �@q8�J@q��ʻ\@rM~�a#@r��zB�@s�1nҒ@t6����@tݘ�#@u��m�,�@v/¢C�r@v�C�G!E@w�Wn���@x6�^+؍@x�����@y��>���@zK�p�R5@{ r�V�@{�sK�*!@|m�_y�        ?ѪA����?���5%�b?�S�ƽP@
�S1��@<���2@gR�<m@"�e� *K@(,I@�5|@.�6�@2/��PQ@5��?X�Z@9Q$�bi�@=>�  @�@@��+���@B��pЮ�@E1܁u�@G��S'�@J�����@L�����@Ol<���@Q9��OA@R�2���@T7MJ7y@U�Ypy�@W&'��-@X�V0_4�@Zj���Ԏ@\�xZ�@]�W�f�_@_�Cw�U+@`��"L�@a���ꨌ@b��1=�U@c�%?�|@dx��r�@etC��_�@fs��Q�@gw�	��@h~.���@i���6`@j�L�tg6@k�"�0�~@l�a)T=~@m��2�D:@n�Ó�;�@p�&�H�@p��ɓ�@q,f���@q�\���j@rU�e��@r�x����@s����S�@t�yk�@t��J9��@uT�`��@u��e@v�t���@w/�mM%�@w�U��#@xr&N"��@y��E@y�
�뉃@z^ֻ]�        ?�U�]i?�Z(���@���!l�@��U��@#���@+���z�@2E��b@7I�MC��@<͏�\@Ad|q�@D� �?�u@H�	�#@K��j�@Oz8��i�@Q�x ��@S�����@Vi��5�@XHF'�ԗ@Z��30�@]>�nں@_�:��y�@a�W�ܲ@be@���t@c��~7B.@e'y[}p@f��B^��@h�w
@i��_Z�@k�{��@l�߷V>�@n8�V�p@o�_2�@�@p��r��@q�[x��@ro�gT��@sMT�5�s@t.��ځ#@u���@u����n>@v�D\@w�]�o=@x��I�/p@y�II�E�@z���t��@{�>^Y@|���7)@}����K@~�z@�˃���@�]��co@��Vסv�@�jM��a@���>@�|����@�۵�d @���FҶ�@� l�_�@��W���h@�=Ԥ'�@��r��̂@�`.ϥ��@������@������        ?��a�U�?�u��N-?�ް6�ĵ@�ZV{\@5_-�A@�l×
'@=s�9I@!.�ݾW@%�M9�@)2�B=y�@-��v܅@1$w��d@@3����b�@6-=�F.�@8����>@;�
8�|@>��S��@@ˎD��E@BZg��i@C��� �@E�A���`@GR���e�@I�v��@J�.Jau`@L��5���@N�|�S��@PC�|�=�@Q?��t��@RA'&��@SG����@TS�e<s@Ucw�.,T@Vx��ՙ4@W�X��
�@X��~�'�@YӃƛ@Z�����@\&Z/���@]V>v�;@^�_pD�@_ª��@`�!ߛ@a�bS�@a���D�@bf?'j�@c/Q���@c�6'&��@d^#fE�@e	�y"��@e�����~@ff���T@g8���@g�7�I�@h��4�@i6l%�+�@i��6T@j�p�ԛ@kc�Q��@l!	g��@l߹"B�@m����@na�\Yp�@o%��7�        ?�Be_I�?�X�*��m@ Uq��@ǫ�J�^@��D��@�ʘ,�@#�2���@) �m�@/6:y�{@2�ݰ��F@6����@:gV�^�%@>�����@At�!E�@CÊK�d�@F1_�q �@H��$���@Ke*�Z��@N)�1�=�@P��M7<@R7D
J1@S����y�@U#�p��@V�~c�@Xw8+4P@Z2��ߏ�@[��]f�@]�(�d�i@_��s��1@`��(���@a�>[�@b�ʴ�':@c�e��@d��o��@e�^�{F"@f�'��@hgs���@i�mP)�@j>�K��@kcݓ�e@l��?`�@m�t�) �@n�c��	�@p/��_@p��i��@qJ�g@q�j�6�@r��]�q�@s0�̎��@sք#��@t~"��w�@u'�&��\@uҕ���y@v^E�gS@w-�G0y�@w��~o��@x���槸@yC��,a@y��p'�@z��2.�@{f���H�@| a��s�@|ۇ�rm        ?��';�s�?�6��O?����q�@��]K@�����@�'R�-^@#-,��̂@(�S��@.x��N��@2y����@5�|�G�@@9�MH��!@=���5�d@@�G}�%�@C9�O4��@E��n��@Hf�t;@J�_���4@MA��Eٴ@P䄲�}@Qqhg-X�@R�;�+@Tr��E�T@V�*���@W��^��@YI��	a�@Z�e�A'�@\�bT!Z@^�pQ�@`(�����@aق;Y@b��J�@b���DP@c��Ē�l@d�~l
@e�n{�q�@g�@��K@hT|��C@i�4G@j0ӝn�@kG�U�	�@lb&�#<q@m�+�^@n���M�@oƐ�:��@pwh �v@q,H���@q���a�M@r=�Y�G�@r�
�hzT@st3��h@t���@t���Cڛ@uQ�\7@u��/�:;@v�;8J&(@w:��`�@w��Kya�@x�a��A�@y1#w��@y�8�<�@z���v�@{3Q=:YW        ?����?�����A@�R�v��@S�l�G�@#�@Ȩ�@+�j	�@2l���@7z��;�@=Ȝ�)@A��^�}@DJ5�W@H4�s�h�@K�wD�T3@O�A�7~@Q޾�t�@S��H8�T@V-��<_�@Xv6 l߽@Z�M�)�/@]G;�!��@_�y�nkp@a4��6�@b��\�
�@c�H" @eVCj��@f���]5+@hDln@��@i�`jE�@kT�
��f@l���-@n�Y���l@p��:($@p�n�6Y@q�Dj�u@r�}"�T@s���{9@te�6kj@uM �5��@v7��=@w%��tR@x���p�@y
��n�s@z5���@z��>�2@{��e�Q@|�0:��@}�i�s�@���g@�6�B�@��S5�F@�Q���@���&��@�%���@��7~SB�@�=�V��@���q�7@�[	���@��|Wݑ�@�}5Q���@�)k�j5@��Uԍ�@�9��ኙ@��D��d�        ?̒���
{?�C�0�?�|�5���@�n��6@�15��@a��|�@����@!���j_@%��R�̋@)��o2@.�ɜ T�@1��7�@@47�3�a]@6�Z��3@9���t�@<��Lޚb@?|����@AI%aWH@B����@@D�A}c��@F5یᤦ@G�cy�I@I��V\}@K��*��'@Mly�	v�@OU���m@P��1��r@Q��$?�@R��a+#@S�뀉�q@T����&@U�����@V�q4���@X���i@Y&��ơ@ZK����>@[u��׋�@\���	(K@]��'u��@_�/W@`#$���K@`�Bm<}@acM��r�@b;1c�M@b�����@cQ�@g�@c��ё&T@d���I�@eO���%@e��m��@f��w)��@g\u;���@h��yy�@h�Z/��@iw��4@j.p��z-@j���k@k��1px@l[��{<�@m�U�@m�����T@n�`H���@oWk�P        ?�G�d�N�?��zh�f@@}�o��@S����@,���[@�"0�@$���v3�@*lK�<�j@0d�*�ύ@3�jC�l�@7��<i��@;��+�@?�����@B9�^�+�@D�/���d@G��v�@I�D�[�w@Lz, �j@OQ�9ٔ|@Q"p���t@R�� :�@T<��)@Uܤ cX�@W���ei�@Y@�R?f�@[4��yY@\����E@^��O�ʙ@`H�5�m(@a?��1R@b<}�"� @c=�M�Ӵ@dDY��9@eOp��@f_%��/4@gs_H#ٚ@h�[��@i��e�i�@j�#�%
&@k�u9�_�@m�k<��@nF2@o��@owu �o@pVE���K@p��ǒ�@q��qW<D@r0�f�M�@r�ҁ�~@svf^�@t�G��@t²樧�@uk_���g@v����@v��^5�@wo9��@@x]�i@x�
,�n@y�7ώh@z4݌B-�@z��r�V@{�q�z@|XQ4���@}�}��7        ?ҍn�ҳp?�a3� ]1@ ~�1�r�@$��?1�@S鳡Z4@�J[�i@#�/X�5@)�q�~w@/��k3�@39�h�a@6�=|} @:�����@>��e'��@A�;�E:�@D
9��B@F~a�s^�@I��.�M@K��R�P�@N���4@P�f�ܣ�@R6 O���@S������@U[�j��@W��hzr@X�f�@ZpX�hP�@\9#���@^(�4@_�(����@`��oX�@a��*�u@b�N"�*�@c���]�@d�ɝ��W@e�����@g��g5�@h*C�6@iE�	sz@jfX����@k�!3]w@l���h@m�F@��@o�ݗ�m@p#���H�@p�����@q_ Ap@q���vJ@r��;��@sF3j�c@s�D�T0w@t�&��@u=҇W�+@u�@�7�@v�k)��@wEK�
��@w��V),@x�,a�@y\ �IW�@z�~�s@zȭnT3@{�i���v@|;�f��w@|���Ϡ.        ?��[�2@ u/(��{@2�z�@:6{���@&�u:�@.���X@4|�j���@: �\��@@*l�6v@C��Q�7@G(h�)�@Ks���5@OWU���@Q�7���@S��&��V@V\2}�@@X�8N��@[g�E��@^=���@`i{�?�D@a��L���@cM�4D�@d�-�$?@f[��,!@g�op�Y�@i� ���@k=fy%R@l�1�^��@n�@��ڕ@p:055�Y@q!�=?T�@r��%��@r��F�d1@s����@t�(P4�@u�o�m��@v�D��D@w��n�@x�=s/@y��2�j@{�t�c@|P�$�@}5�a @~Nf��6,@kԷ�O@�Ez���@�� ��@�js�J4@����h�@���T��K@�,^yl�/@��g�c�@�_�!��R@������@���뽛@�7����@�ק�b( @�x�����@��H�@��D/rr@�d��ic@�2� �@���E���        ?�x9��d'?歝��v�?��0�@:�@�V�{!@���a�@����;4@ j�_�
@!���^@$�a3�@)��_�@-�� 	��@1'�\"�L@3��ZN��@6EQ����@9�cO�/@;�Z�{�@>֫�B�@@�{��I�@B�6pyl�@D2'�q�@E�����@G�Rɩ�@Il�H=��@KCn��k�@M%���SD@O4?�<�@P��+@C=@Q�� 2)@R�����@S�����@T��&�@U��YE�@Vܳ���@W�!$\��@Y J��@ZH���S�@[uD�ҹ�@\�C�E@]�f�Y�m@_�-Q��@`(��m�@`�PHn�@ak���&�@bܫ[+m@b��o,-|@c]���'*@d!���@d�Uw��@e_6Zk�0@f��@f�ދ t@go��<j@h"��l�@h��:Lm@i�H=��@jFIi�	�@j�ҩ#F�@k��վ�@lw`8wk�@m5T+�q�@m��NZ/@n�u��q@ow����=        ?�:[I?�y+��s@-n�8s@:�R�|@ T!�r@Jɇ@$��/��@*x='�@0rm�>.�@3��bO��@7��x@;�_�j�@@�)���@Bl]�k@Dݾ۵�@Go���]@J �烄@L�2�@O�+�i @Qt*��/�@S[4O�8@T�;�:�@VVq�3�D@X��~�@Yن|�]�@[��|��
@]�a�@_z�>��@`��|'�@a�0&�T�@b��@c�0�H�@dތ�חz@e��%@gM���L@h0p���'@iUC�w(@j~�ol�5@k��Q@l��v�G�@ng9���@oP+>�@pG�'��@p��Z��@q�]v��@r1��zV:@r�ߦ�Љ@s��#O�^@t,����@t�Im`�@u��:�ei@v7���4O@v�H�c�@w���M�(@xQ�5ڍI@yߒ��@y�4z㝽@zy�@7@{4���@{�;���@|��V�@}o*�G@~0鳮O        ?ҝ��Q�?�RD	�W@ ���+2�@J�~59�@p*�˽N@��6@$���@)�,|V�@/тLE��@3Jr0�am@6�D�"@:ޣ���@?��G�;@A�ن�@D���#@F��S9�@Iӗ[kf@K�\#���@N��a�O�@P�m�\	�@R8�4�E@S���	@U]�c��D@Wd��@X�&�9�z@Zo|I�@\7I�{@^	��A�T@_������@`�_CoT@a�`�Z!�@b�i8�Ӡ@c�_퍻<@d�*�X
@e����@g�d��k@h�����@i6�=��@jU�"΂@kw�AM�@l����@mɭ٥�9@n��Ro�@@p��u@p�\�T<@qNWnlH�@q�j��@r�K�݋~@s0���CH@s�dAó�@t{�!��@u#q�J�@u��Y�@vx@(`@w%!hP�@wӠ}Wʧ@x��П�W@y5`����@y�6ig�@z�P�z��@{S��d5@|F��zC@|�wgZE�        ?��v�1�?�P`��@]g�xV@�Ga� @$��k��@-_A~!�e@3x/��=@8����r�@>�;�,KA@B����Y=@E�M���H@I�j K-@Mr�b��4@P�PA���@R��H��@U  ����@Ws�1Z@Y��YG@\]F��v@^���	4�@`κ��
�@b.�3-.@c�4�xH�@e	ؙ�+�@f��?y��@h
��H�x@i���
@k.�Ў}@l�e���@nr�շ@pr� L�@p�QH���@q��s�@r���Y�@s��$%�`@tz��m�@ug�Y�@vV�'��c@wIQ�	�@x?#}��@y7�>*�@z3�	�/@{2~,"�@|4	��0@}8`�V`@~?uȬ�@I?�|��@�*�5�@��g��~�@�;?q-e�@��\xR�x@�P�I��@��P�$^�@�k�
�@���j�V@��?��p@��y���@�����@�Avr`�@������@�k����@�x-f4@��9�_�        ?̄�9�dc?���M�?�pC��@��)���@�!���l@A�<A�4@��_���@!�����T@%���f#�@)�TE�@.:���d@1|P^V�M@3�-�)��@6���,M @9ME����@< _�7�@?�osi@A
�,�ʟ@B�&;�A@D7���@E�̉�@G��^V@IT�6!� @K��O�@L�|�{�n@N�
12@P`�h$w@Q[*f�@RZ�� �<@S_y�Hs@Th�C�)�@Uw*Yln}@V��1@W�v*ܬ:@X�Z�.�`@Yݝ���@[&cC�@\*��c��@]W��9L�@^�a��-�@_���]�@`z���T@a����0@a��5O�D@bZ���Ј@b�$�m�@c����Z@dJ�uvN@d�~��T@e� �[@fJH:Dt�@f�-�
�@g���nw|@hX�J��R@i���H�@i���	@juD�@k-i@1@k�m��P@l���vv^@m]rC6�@n���@nَ�fy        ?ҏ�=��?�X�d�Z?��X�3�@
柝iK@X����@����@"����@(C����,@.���@2B
i��y@5�sR�U@9mk���@=b����@@ɺ!|��@C ���@ES+��j@G�Z�09@JLۤ+m�@L����@O��o@QD���@R��׺u@TAg/�C@Uы�@Wm'��@Y�ɔ�s@Z���� @\�d�+��@^I}n:|X@`q�r۔@`�0Ё��@a��$lſ@b�e{��@c�L�b@d�R��@e�	�a�m@f��5i>@h SS���@i����@j)�U9/�@kD��6�$@lc���|�@m�����@n�w���@o�� 	�@p�@5+r@qK=�#�@q�'<�3@rS����@r�4���@s�V"�o�@t4)Y���@tצ���V@u|���@v#��d�@v��x���@wu�x��R@x!�BZ@x���JU
@y|T_�۸@z,C(l@z�GR��@{�χ�j�        ?��戹?�|9�o�@ ��7ѧ@O$�U\@���@����@#O�E�Fk@(�_�NU�@.��aX��@2��:�.�@6 w!�u�@9�dj84@=�W{��@A����@C\����@E�K%�pp@H6! +p�@J̩}�W(@M~+��ņ@P$����	@Q���yp�@S�D�;@T���[�@V:
�G��@W�1�`=�@Y���\��@[Epwۛ�@]
��Q,@^�5;���@`Yh\�@aKM'�N@bB-\Z�w@c=�e��@d>w��@eC�Hy�?@fM�V�@g[���c|@hn�u��2@i��6v?�@j����I@k��[�m@l�/�c}�@n��贅@o7�R��@p3��`�b@p�|ǋ�@qi3n83@r��損@r�<�W��@sG��}�@sꓵ85a@t�l
��@u6��G@u�\���Z@v�k)�bz@w4,�@W�@w�J��@x����æ@yAz� v�@y�����@z��)��R@{]|R��@|�B�8        ?�|s�e�?���Oc1@J�xB:�@���)z@$c���f@,�� �@2�����@7�Ei�=@=Y� �S"@A�l�<��@D����F�@Hyౖ� @L*õkr�@P!ygo@RCM�`@T2�K�@Vke���@X��%/�@[�!��@]���9�
@`�#���@ab+�u�@b���,J@d]d��@e��
�[i@g ��@h~��u;@j6ϚX@k�����@m*Kd��@nȤ�:@p7P�$wD@q٠�@q�p�hQ�@r�nN��o@s��Ӝ�W@t��P��@uuP㸲@va��5�@wP:���@xB<L��|@y7�ځ47@z0
��l�@{+��.@|)�E)c�@}+e�m�@~/�M�@@6���@� b��Р@����3Dn@�.~m��@���w	�P@�B���@����p�{@�Zޯ~6�@��;�%d�@�xިT=�@�	�m� @���Sn>1@�/9>��@���,�I�@�Yx��:n@��X>m*�        ?��p-m�?����P�'?����z�@���]@yZ=@5sO��$@c�65J@"KO�P��@&[=��X@*��K@��@/M2s�y@2D�5��@4��#ɛ�@7Ek{���@:n�1߳@<���!@?݅�r4@Aw	gɎ�@C��de�@D����R�@FW����@H3M
�c@I�jQ�x�@K�Q�Q¾@Mu���_@OWI�x�@P�~��j @Q�N|�n�@R� V5\@S�{*�{T@T������@U�d��@VɦJ��@W�T�j�@X�[	5��@Z�����@[>���@\e�x�
@]�
�F�,@^�e��\@_�2���@`�=Ƌ_6@a2�>  @aћ
�6@brjD�0@c륡�9@c��,E(@d^���/I@e91��@e�'�p0@fY���Z<@g��rn�@g�!/��@hbr�n�@ilt[�@i�,WO9@jwK���@k+ě�[-@k��O@@l��:d(Q@mQ!�~:@n
�S/�>@n��C�2�        ?��x$�?�؇����@ ���w�@Q�µe@��u��{@�]4pA@#?#��L@(� ��Y@.�����@2��2�@5�q��'�@9��RU�@=�YV�(
@@���&�@C7.�	�@E�az?�T@H��;�@J�n���q@M=�'�#@P-���"@Qp!=f�;@R�z����@Tr�62v�@V,�	B�@W��H#�'@YN�Y�8�@[p�p@\��}��'@^��� @`1\�<��@a �D3@b����6@c"@Q$�@d	t�?�@e�C���@f�e3�@g!{e�D�@h1��Y�@iF&i�1D@j^���o�@k{�� �e@l�)�7�@m�h�☄@n��x@pl�W�G@p��+��y@q?b��u*@qۯi^�@ry�L
�|@s��1�(@s�sG~��@t^�}^��@u�A�@u��l��@vSI�Qe@v�VfA�@w����v�@xV *i$|@y�;��@y��Q��@zf���	M@{�m��@{�C�-��        ?ѿ�3z��?��)��<?�p+;��@
�Qz�x@B��P�@d�ut}4@"��T�3;@(���J7@-�*n�@2v�`��@5����.@9)G���@=�r=e~@@��O��@B��E�*V@E=�[�#@Gd�+-$�@I��E��Q@Lr/���@OC;��@P����Q�@R^�܋u�@S׌j��<@U[���U@V�����@X� 9���@Z(E���@[�/�'$@]�F.��@_Pv��w@`��P��z@ax���@bf�����@cZY��u�@dR�W@@eN�d�@fN>�y�^@gR�Rdm@hZ�ɗi�@ig˖��@jw)3*�@k�����@l�����?@m����w�@n�E8�%@o�_;pN�@p���F�@q&Qff�)@q�UJ���@rS�v��@r�J�C�@s��m��@t#�Z�T@t��Ym^�@u`�"Ԩ@v
hS�J@v�֐��@wE�b�@w�n�y�@x�.n�_@y72�W�Y@y�v�g��@z���Y        ?�/�;�A?�+\�L/@����!@Ķ�)�@$1�.i�@,7����@2�f�S@7ɼ;g�@=bD1��@A�ɖ�?�@D��+��{@Hm֍>_�@L�-@O���@Q��N��@TK6�@VE���@X���,@Z��"���@]OVՁ�@_���j��@a0�b,�P@b������@c݂��?@e@�ؖ8�@f��;�pR@h �V|�'@i��3�{@k �g�x@l��'��9@n?�D�D�@o�^��[�@p�0'�@q���z�s@rj�1�<@sE�	L�Q@t$�bY��@u�U��@u��k��@v�=Ϻ��@w��v/�@x���o�@y�~�0��@z��&>y@{���[@|���U�@}��_\ @~�v"�@�vC�Ю@�B�:��@�����@�Je�^@������e@�V��pA@�ޙ �)b@�g�p�@@�����@�|�
(Y�@�ω0�@����䆻@�$I���@��:hDM"@�CO���        ?̦1��l*?��xa�?��<:�0@����ER@��H�w7@tt`*Y�@)bY�K�@!�; �@�@%�>���x@*��tl@.�� }��@1���	�d@4L��3�@6�M�ԥ@9��P�F@<���4H�@?�
K�@Ac�Z�@B��IōA@D�ͯ�9@F^�Pv�@H ��W@I����Q@K���Ջ@M��u�m@O���:�@P�	�P�@Qѭ����@Rگ'�n@S��tU�Q@T�I��!�@V�]��@W1ߢ���@XSݬ|@Yz�E�X�@Z��٘�F@[�3��@]	:��j@^AI���@_}�� I@`^�{���@a �� GQ@a������@bJn�,"�@b�&���P@c���e=@dG��m*@d�$��5@e����P@fS���إ@g�lk5@g��#� :@ho$"��@i&׵�@iޟ�w9�@j���l��@kS��h@lē{y @l����@m�hH���@nO9 g,�@oX���@o��ul�        ?�
_Uw�?�E\��@ 2���C@���%�@�p @CS��Q@#y:<�Zd@(�
��km@.��D=��@2Ȫ���N@6[�
0��@:2W����@>J��ɿ�@AQ�lm�l@C�����@@Fݱyy=@H��2h�@K3_���@M���ʖ}@Ph����@Q��"�9@Sn����@U+�U��@V�yd5`)@XX:�uP�@Z&���@[��2R�l@]�b��
@_�-��@`�:���@a�w��U@b�7"ʁ@c�/C��K@d�Aa#�@e�N�s �@f�:�גb@h ��\@i7�	@j@�%U@kfR���@l��
9�@m��2��@n��C!(@p��,�@p�;*@qQ�GQ@q��O?R@r��@s:ֱ�@s�{�nn(@t�����p@u3�	wfD@uߘP@�@v��h�o�@w;�;��@w�Xz�--@x�g�I4@yR 9Ķ@z3�@z���@�@{u�j�/q@|/e�K�@|�dxj�y        ?�d�5�+�?�`Z�0Y?@3�W��@S���@4��,�#@'��bL@$����p@*��n��@0s��g@3���zw�@7�n��@�@;�5�B�*@@
��@A�@BS�T��m@D�~��2q@GFO�ʋ@I����ݧ@L�����@O���{�@QI�n @R�=BK�O@Tr5:���@V�7^��@W���X�@Y���ɍ@[`�*�@];|I���@_"Br?'�@`�Z(��@a�F�,�J@b��/�U�@c�����@d���9/@e�]�~�_@f��n��
@g�AC>��@iz���@j>dA2�`@kj���Wu@l����LV@m�+�;��@o
���n@p$I��ع@p�9�[�M@qh)��@r;�7@@r��i���@s\��@t�l��@t�7�,�:@ua1�Fw$@v�g�@v�+Gt=\@wu��X@x)�]r�s@xߣE�.@y�0NL��@zP7�ߧ@{
��=@{ƑS[f@|����@}BlwSq�@~W��        ?��]�v@ 5~�-�s@�!?���@�x�]�@%������@.�&y�r�@4D^�T��@9�4�0:@@qC��@C^�����@F�㕴I�@J�䮌�F@N�>��])@Q�Q�r��@S���EԱ@VC�Θ�"@X��k�҇@[P��9Zl@]����E	@``ybsnU@a�*��|U@cG>k	`@d�l��B@fZp��J"@g���̏@i��v(/@kE֝��Q@l��/̭(@n��xl��@pD��jh�@q.��<@r��G�@s��<j@t��"@u�ԧ�@v �!�S@w��@x*�v��@y���e@z$�3o��@{7�X@|L�h� �@}fj�^ah@~�e0.�@�ϲq��@�c��5A@��^,8�@����/��@�#a M�@���F��@�U��.�@��$��Ә@�����@�,nv=�p@��5��(@�m_���@��r��l@����T�@�X�9�!�@��T֫��@��OR��@�O����2@����%L�        ?̉ ���I?琛v��5?�pZ*���@��9��@��g�to@7���`�@��&9@!�1���z@%r�n�@)�mI��@."[�Q�T@1n�|9��@3�ce��@6�#��.@9;��Y8@<A?҆�@>�R��@@�w����@B�� z@D)�!�"L@E����@G���'�>@IA$n�ȑ@K	���@L�qf�@N���L��@PPpb��4@QH��Ś�@RFEx�mC@SH8x��@TN�텣�@UY�aۤ�@Vh��>�@W|p/� @X�0��=&@Y�N=@@Z��Uٝ@[�
s���@]��YL@^G���f�@_wP#���@`UH:r�@`�i 2@@a��jZ�@b,�u�r@b͌TWeu@co�. v�@d���@d�r��e$@e`�f�}@f	J0|q�@f�|,)�i@g_'Us@hDta�r@h���%��@ij�!���@j�����@j΋�@k�l�B)�@l7�ژ�@l��	%�R@m��xer�@n^|ϸ�        ?�Q0\��?����۫f?�B�#�@
����;@�lc@-'���c@"�V ��@'���"�f@-�v�#��@2���O@5h����-@9hI��@<��h���@@�#����@B�[g��:@D�J߅�z@G[.�h�@I�O���@Lm��I�@O�ų�@P�D��@R`��cl�@S�l����@Ua�|$�@V�j8B@X�]�S@Z4�w�h@[�Q\��@]���%8�@_c���@`��f
@a�G=gf�@bt@U��<@ch��;9@daV��<�@e^@˪�@f_F�U��@gdN�h�F@hm@�hj�@iz�U�P@j��c�@k��$:�@l�Bf�
�@m�[���[@n���~��@p��/�z@p�T�,��@q/n�pa-@q�W׍@r\9�v�9@r�ؕךN@s�竕m@t*^�C��@t�5 �w�@uec2�f}@v��	�@v���#�B@wG���ߧ@w��0Rj�@x�NU��@y4�6��@y۔�;2.@z�b)J2        ?�Q}@�LX?�	�J�Zl@ S�<H@ܳQ�4@����q@�\�n(@#��T�N@)I	<S�@/jھ��	@3�:�'@6�G\m��@:�����`@>�Ң��[@A��5��H@C�C��@F]�ۉ3�@H�q��;@K�W��V@Ni�}���@P���c�@R)�y7�Q@S��8��@UT<�^�@V��-h@X�\��&@ZrL�
v@\?$L}-@^�P�A@_��ʯ@`�\�O��@a�r���@b��5��@c��@e	Ȯ���@f�ض�L@g3��n�@hO!̧��@ipp���@j���c��@k����@l�a�?�@n"�ͻ͑@oZ�~�,@pKnR��@p뷞}��@q��®�@r2��� @r�	��@s��\vT�@t+�Wm�@t�I���@u��Q�E�@v6��<	@v�����@w�5� @xQ�7��@yш�3@y����<a@z|1F,@�@{8Xͫ�@{�p���@|�q�r�d@}vUZ��F        ?��H�XQ}?���?umz@�GΉ@o��rFH@#����%@+�`�kR,@2��+P^�@7����a@=>�՚j\@A�8��$$@D�8U�bo@Hk�)"��@L7K�!�@P ���3�@R��@\~@T-�zW@Vf�v�b�@X���@[�(��@]��%��*@`�~�@aab��@b�zx�R@dp��@e��ؿIq@g Q���@h~`����@j�Y^^@k����b@m*��#&�@n�h㕱@p7�ɝTh@q�B@q��7���@r�TL��@s�X��5@t��^�4�@ux�N�i@ve*�*�j@wT����X@xG�-e�@y=�e	"�@z6�Xȭ@{2�M~�@|1�w[@}3Y���@~7ѩ�P�@>���Z@�$T�Ꞌ@��v ݝ�@�1֢��@��p;�	@�D<�i��@��6S�k�@�[W�B�@��ey@2@�v��#�.@�z	�U�@��	㪰�@�(��1��@��W�i�@�O�]�@���3t�V        ?�2���?�&�8J?� ���@2����@-O�*�@����@eWˈ@!J8��3�@%1/�L�@)b�w_@-ۍx:��@1K���0@3ʾ)��@6h�O�!�@9%dD���@;�N�C�@>��}ڨe@AE{�=d@B�[q�$�@D?�`�ƽ@E��h�<@G���&�@Iz���d�@KRM��R@M5�{��@O%H��@P�����K@Q�Ձ��@R���z'�@S����ѕ@T�b�G�@U�p˲�@V���Ic @X���.�@Y>H��g�@Zj�\r�|@[� �>�[@\� y��@^���j�@_K겐��@`GɄ/n�@`�ҥ�`@a�bsP�@b:\Q}�&@b��I͞�@c�=�G�@d?�N �@d�/ n9�@e����A@fV���IK@g)�)�s@g�@*��@h)��,�@i:ݙSP�@i�P�ͩx@j�{�;�@kxV�_�w@l:�Tp��@l�2 �@m������@n��R�@oU\�&@p��ܥX        ?��n-G-o?�`Oe?��rr@& |�܀@��z̅@@��$@#)�5�_]@(�����@.rQ@|U!@2v�Ȉ�@5�!ptI�@9��h�@=��w5:�@A y^R@C>�_�V@E�T�qρ@HU�S��@J��idrr@MS���@P���w/@Q~��'�D@R�T�Vjg@T�z��7@VD�ĩB@W��L03�@Ybj�	�@[���0[@\װ�(��@^��/��@`; ��A@a*;��GI@b.C��*@c�/���@d=1�l@e,q�@f�
��@g'p��5@h6��lt;@iJ&�@ja����?@k}$��u�@l����p�@m�,`ОN@n�pE&@p	6���T@p��7�2@q9�K��U@q�|���@rq�cΠ@s[S��@s�I��� @tP�A�,�@t�����l@u�����@v>�}��@v�8��h@w���\�@x:�^A@x樸z�@y�-𘰿@zC�6H�@z�_���:@{�PL��        ?� 1����?�q�"@ !�0���@�	$f@�]����@H� �p@#~�o@(�tӣ�S@.�x+09@2��	'A�@6`=�̇�@:7^_��@>Of�]�/@AS��M�.@C�?��ư@F��z�@H���Nh@K.�� �y@M�TP�\x@Pbc�R@Q۪ЩԢ@Sa����@T�6�f@V��#�3�@X<�N �-@Y�����@[��\\�@]�>"�X�@_W)"�@`�H^m3@a���-@b�����@c����@d�"z�A�@e�TWs	S@f��P�@g�\/�v�@h������@i��FH�@k
�I�B�@l-�7l�@mT�ǿ��@n�>N�@o��T2�@pp�dR��@q�%�@q����@rG�[�@r蛭�v�@s��ߔ@t/(��@t���»�@u|y�D�u@v%�\tޙ@v�Y	u4}@w|��?@x*��N+�@x���d�@y��ݷs@z=:�{ �@z�
��.@{�E(n{%@|\�'8]�        ?���6q��?���RD;�@q��O@t�O��@#��5;>@+�A�)@2��L�@7��׈�X@=B��<�Y@A�AY���@D�^)�lq@Hm����D@Lѣ���@Pef�_@R����t@T0��r
@Vj�8F�@X�DQ(�@[!�XWP�@]��==@`�`�@ah��?��@b�L����@d)u��)�@e��*9�/@g>mj�z@h�xs+,@jZ���@k����%@mCv�ʮ�@n�ZRGil@pG�ؼ"�@q N���@q�6�L{&@rݱ�Uޥ@s��0���@t�����@u���ɹ@v��+��d@wu˓-5D@xk>?�l@yc� �N�@z_�{���@{^�݀�@|a	��*@}f8 ��@~nr�Bw@y�
�Iu@�C�6�@@��Z�mmX@�V;�,�@��{⎘'@�n[���@��(�%@��<^كy@������@����n@�@�5dt@��ɣ��@�j=��@� ⍹2c@����:l�@�1�m��        ?�}j��k?�ɫ�?�mu~ B�@�R#�[�@u�:��%@b>u^�@��y�@ ����xU@$��#�-�@(�t?�T�@-8V�{�@0�n�q��@3B�]��@5�X��@8m�4 ��@;,}��@>��h�D@@{EG>�@B %Ո��@C�Ş�`_@E,�{�Ӯ@F�, ��2@H�~�Y��@JC��=�@LJA޵�@M�Q��3�@O�uW'P�@Pϻ�`�@QǌE��@R�&�4@S�!Go�@Tʭ�~q�@Uԙ�.��@V��R��@W�1�6�@Y�',�@Z&0W8_�@[D�G��@\f�#�-@]��#!�@^���uP@_��Ȓ@�@`�L���@a$j����@a�9�1�@b]� {��@b�҄C��@c��:s��@d?ߕ~y�@d㾉�.�@e�"�M�4@f0�[H�@f�Ui��\@g�x3@h-+h���@h٠�4@i�k�p��@j6�-�.@j���[��@k���>�@lK����@@l�씪פ@m�\qk*N        ?Ӆ{�G��?�ܿ�\s@ ����@8u��@A@��}@�� |�|@#�fI�@)U�V �@/p����@3�rw)�@6��:m�]@:�E΄�k@>�"A@A~#&�@C���R2@F3g��[@H��{}��@KZE-<��@N���B@Pv�6@Q����?@SsEn�0�@U�8
@V�]��I�@XHb�Uq�@Y����p�@[�%H @]�A�@_V�����@`�<���@a�,9y,�@b�
�45M@c����"�@d�6�Q��@e�V��do@f�
�d@g�=k���@h�ظJ��@i���a�~@j��k�I@l5��xX@m;��P�@@nd��Tl	@o�M�B�Q@pa�E+d�@p�G�U3@q���	@r6�~��@r�� E�@sx��Rw�@tI��@t��Ϩ�,@uh���| @v<��w,@v����8@wg~�܃@x9��
@x����#@yt�0���@z&�E8k�@z�o�3^�@{�y��Õ@|E���        ?�\i�p�?�Ea�D��?��<�X��@
7����@��	��@�7;>�@"� �f�d@'�{H��@-tm�U�@1�8f�r�@5=J*�/�@8�2,�jJ@<�ᄞ�l@@j9�(^@B�4��@D׽�,@G7j�Fxy@I�i]�@LE	�J�@N񨉅F�@P�Q	ٛ@RI���@SÏ[�Z@UH�y+@V�͸���@Xs�����@Z�lЊ,@[�� �@]�FA(�@_C�A[�@`��mū@ar�Ȇ�@ba�{�;@cT��5��@dL|h�Z@eH1�D2@fG�+G�T@gK��*<�@hS��F�@i^Tq��@jm8����@k�̮�@l���g]@m��CS� @nˠ�*x�@o���,S@p�S2ĳ@qoT���@q��-�@rE4 �@r����@su���H@tL��L@t���@uIHґ7�@u��V3 �@v��be�(@w(��4�@w��a�~�@xnA+��@yꃨw@y�����@z_�� �x        ?�7�1��?�!��@k��&Q@�yn>��@$$���	@,*�)�@2���+�
@7�F�H��@=b�����@A����@D�n0��@Hx��`'k@L%��My�@P'��NJ@R	 �lQ@T&�:lb�@VZ{h�Ґ@X�Ai�@[ z!@�N@]q~��I@_��]��@aF7��C�@b��L���@c�д�4@e]��)�_@f˛��_@hA����@i���@kE��fS@lҺ��|[@ng4�@p^��-@pҐ���@q�.O��@r~�_�@sY�av��@t8��Jl@uW���@u��O��6@v���^<@w�1�?j�@x�Qt�}@y�BQo��@z��{L�@{�c�-�@|�vǲ@}�%o�A@~�dE� �@�(��V�@�C3�&�'@�ŋ׫�@�Ig�'5@����z}@�S�4��x@�ڶ�?z@�b�9*ly@��r�Y@�ve��<o@���1�x@��/8;2�@���3�@���a��@�9lT�        ?˜����?��$L�� ?����ѕ@&��@�����@Έvф@[��}#@!K�9w�@%:��ƅ@)uM�@-�X�'�@1^�\fia@3�H�>@6�9*� @9F���1�@<%8�e�@? y�@A�c��@B��D�%�@DZ����%@FX�B��@G�hX�>�@I�~�˞�@KnNZE��@MP�΋@O=�=R�T@P�����@Q�R{��@R��W�A�@S�V��x�@T���sv@U�)J'��@V�;l��@X�d�W�@Y0>?4�@ZX��@[�9$�G�@\���Rf@]�at�@_"�T�N�@`/ާ�(t@`Ѐ�h�	@as(�RQ�@b�$ ��@b�nY�e�@cg�4j@d�����@d��[�@elC��1�@fp�.��@f�q�z�;@g�=�yc@h7�Z�@h���:�@i��NPM@jb���_@k�K}@k��No@@l����?b@m]��|@n G�-�h@n�sng,+@o�!�r�        ?�%�p��?�Jo��ߋ@ R���p@Ƨ��@���i�@��E �_@#��R|��@)#��]��@/:ޓ8 @2�3.@6��y:@:j/D���@>�V+�@At��4r@C����
�@F0ī+=@H�(ھ@Kb+��@N%�w�=@P���8=�@Q���&}�@S�o���@U�I��@V�ގW��@Xl���@Z&�֛��@[�AGY�@]��:0@_���*��@`���˩@a��s@b��V�@c��A�)@d�}���@e�.~��{@fެcz�@g���ؐm@i�,+�@j/K��eK@kS^��@l{��Od�@m��⿀P@n�o��5�@pnj�@p�(�V�l@qDR�{Y@q唘L��@r��`�W@s.?w�v;@s՗�t@t~�k5�@u*�|��@u�>>]��@v�9�4��@w7 �@w���R@x�����H@yT;':)@z���M@z��=�H@{��[e�@|<���v@|���EM�        ?Ҷo(A�?'8�!@ �m}�'�@Y]f;�T@x�
)�@"#A�K@$����'@)�2����@/��D$�A@3J*(��f@6����@:����4@?�Y!s�@A��و�8@DД���@Fy�O[�A@I}��h�@K���ã5@Nw_��2@P�V&�?@R)�}�
F@S��s�q@UJ��j��@V�*�,@X�U'���@ZXb�U@\���v@]��}�Ө@_͹}i�o@`ڻR���@a����@b�IP�k�@c���@�@d�;��KQ@e�T��@f���1\�@h����;@i0EWu�@jPhc� =@ku	{@l��)E�@m�{���@n�*�%#@p���	�@p����g@qU��4I@q���`:�@r�����@s>���@s�3ѣ�@t�\�ҝ?@u8�¿��@u�YN�?Q@v��)���@wCl ��@w�2j<@x�c<ΚI@y]c��33@zB�j?@z�G�@{�@ȇq@|Ax�@|�\s���        ?���}b��?���ZPب@{X��Z�@�����@%44�v�@-�3Q��*@3�xiV�@9-��~ �@?0�29@B��R��@Fb"=e�"@J$�Wi@@N"pH_L�@Q,�7k�@Sce[Ҡ @U��$9@X 	a�%@Z�:}��8@]@�ۗ��@_��0_ݏ@a_�v{9�@bПaU��@dLC3�*j@eҏU]�m@gcB�}Q@h�!_�l�@j��7׳%@lQ�>; S@n	�Ƿy@o�!�3}%@p����p@q���+q@r�	5x��@s���¶d@t��Wf��@u���^�T@v��OJ��@w�7L�#@x�� ��@y��E
z>@z��~u@{��En�@|յ&�K
@}�%��v@9��^@��T��@�����k@�>�D��@���Is��@�lpw@~@���\@����@Cm@�=��T@��+���@�z�O�!O@��կ(<@��)�Z��@�b)�N�{@���[��@��u!�#�@�V��87@� W�)@��R��@�        ?�c�<��?��4N}B?�m���i@�q�Q@�nG=Mk@���O�@��=�})@!�R��@$�;R3a@)
&��3�@-w�e���@1.���&@3���e��@6$��t�@8�FC�2 @;��4J@>��0�T@@��Fa�@Bd��=�@D�Z���@E�x1Ln�@Gg"��@I*�����@J���:�$@L�㘇�@N�y])��@PT�A.�@QR5Y(�n@RT��lJ�@S\Sm�<�@Th��o��@Uz���:@V�g6��@W��{�O�@XɪY@Y�$�7��@[�g�r;@\@�H��@]q	�^	t@^�?1���@_�v�4W�@`��MאH@a,���}@aο��/@br��£�@c;t�l@c����l�@di�m��@eC�#@e�<	vҢ@fp�F�@g ��v*i@g��N�@h���7@i<����S@i�5�v@j����!@kh�3�z@l%��<�@l���%]@m��4L�@ne�F�|A@o(��bY�        ?���\��?�c�0yc@~�3EF@
��6�@�6�3]l@Є��@$~��+��@*8(�s�$@0F�  �%@3��$�W5@7z�BTS�@;~�h��@?ƹ���P@B(��_�@D��nr��@G<�T�g@I����Z@Lp�v'R@OLBÐ�0@Q!Ѣ�O@R���!6@TA�	�<@U�1��Xp@W�f?��@YQ���oh@[�BV)�@\�:���m@^�XVb��@`]hc�@aX�r��:@bY{�aK@c_��D�:@dk	^�c@e{��bg�@f�F$�8r@g��%�O�@h�c0�K�@i�H(w�@k��|ݚ@lF8�E��@mx\Cm��@n���0�@o�G_c@p���v��@q6���e@q�zg�_z@r���R@s(�L���@sҥS4(@t~���Sm@u,��S4@uܴ���@v����a�@wB\�]ե@w��
]�@x���kI8@yh�z]�!@z$(��@z�/5B3�@{��Nb;@|`��lD�@}"�`Ώ�@}��]��        ?��"���?�,�v�7�?���|��@�Io��@vU��@��g�f�@#�K@(p� ���@.V�|n@s@2c�B_��@5�[̋4@9�8d5)/@=�!t	�)@@�c�>�@CA֦�Q@Eo=�P��@G޷y���@Jh�c(@M�}�)@Oʉ��>@QPT��b�@R�g���@TJ,5�q@U�S�e˹@Wq����|@Y����@Z�>�-0@\}#��@^@��@`f-z��@`�=�@a�h��ŭ@b��O�>@c�ұ�c�@d�6S�h@e��$C�@f��?�n�@g��q�Y@h�a�!�@i��T��@kٌ�?@l.��t�@mL�6HM�@nn� L�@o�&AL�E@p]�;m�[@p����A@q�~��ء@r$ӡ��C@r�ʽ��@s\[`�d�@s�}ry�a@t�)�?It@u;Y���@u�%�+�@v�-e�&�@w'��#@wοWV(J@xw��D@y �?8D�@y��dh�@zxC_u�@{%�p���        ?�8J�@��?��I��9@�s���@3�(�x@%K��9W@-ʹJ��@3��&bqq@9.�n�J@?&��*Z@Bϰ#�3@FJ�Y�n@I�Mȣ�O@M���Hy�@Q%�&�@S3ޛ��@Ux�T�L:@W՗y��@ZI��?�z@\��;�@_v�F�@aNYm�/@b{���l�@c���挚@ee��L.�@f�&g;�@hv,��=�@j~FE	@k���_��@mT+T�BQ@os���@p_<Bf�@q@�J0�@r$ꔸ�O@s��_�d@s�eOT!
@t���l9�@u���-�@v֩�F��@w��B@y�@xЕ�^�@yҫ��y�@z��jr@{��!3@|��S�f@}�޾���@!�1Yl@���H�i@�����@�+��t�Y@���'���@�K��|	@�ݹ
��@�qQc��@�X���@��Ȕ���@�4��T��@����Јz@�hc�~`G@�K�R"@���M2�K@�@isb9@��΅��@���w���        ?ʝ���?���O��?��<j��@7	m��S@Ã&jMA@��ݜ5@6� =A�@ ��SBl(@$X��'B}@(i^f3XB@,�:�2�@0�2��$@3��z@5�7?z��@8Q��[��@;�Wv,�@=��Y.�@@~��6�u@Bi{�O�@C��3��@EK2��@F�|]<��@H���O��@J�4쿦�@LY�S?BM@N9���@�@P��sKP@Q9<1�@R~�s�W@S�!t��@Tz��@U%�)�q@V7뷣�~@WN@&j��@Xh�ފ�L@Y�����@Z��ɐa�@[�l|��@\�V�
�@^+6
�Et@_]���@`JM�1@`����R@a��䋭�@b'f�e�@b�CՔ'@cnd�.�@dv���@d�7izB@ee�]��B@f���v)@f�[�r@gk��g_@h�t�9t@h�9'r�@i��Tɻ@j4��ID�@j����D�@k�f%j�@l[���"@m�2��@m�"��5@n��r#��        ?ӷ��+�X?��Y��O@ �Jd�q@~���	�@��B(7�@F�/�@$&�Ҡ�@)�P�
ެ@0�r�k@3rh��@7&��J�@;!���P@?_����@A�0�nR@DP�G��@FоH���@Io7I��>@L+j��vr@O�FE��@P���/@R�xw���@Tc�0�@U�lZ Č@Wn@Ė>%@Y*����@Z�.��6@\ǉ8zj@^�����t@`I�Q��@aD��FQ@bE�De�@cLif�L@dW�%��@ehTc�n@f}��RNo@g�2���@h�Ve��#@i�T�X��@k� �ş@l1k��@mb�����@n�{~�,�@oҝiU�@p�v��؝@q)���Z�@q��Sޟ@rrB6e�@sF���@s�U��@tmA�@u@�~@uȍ,��@vx�<�y@w*ڥ-kA@wލ�9�@x���ux@yJ�I�KH@z���t+@z���Q�N@{y�Q�@@|6���B@|��G.��@}�'�h        ?�tXl�d?�@�f8�@ pX:Fm�@�H���@H
M��@�N[@#�r^�M@)� c�@/��E,sD@3:�(��E@6�M�t:@:�����@?��R7�@A�l�Tl @DYP�@F�RkH��@I'��&T@K�B�P��@N�����@Pͧ�T��@RR&q���@S�	0��@U��iu@W.�9��@X��\�>�@Z����@\{V�_!@^V�H�g@`𐿡S@a$���@b�o� @cS�)�@d#Jݟ��@e1Ny0+E@fD?�Dx1@g\ av�@hxq��/0@i�t���@j��)�{
@k辍A)�@m�d�c�@nI0��@o?/��A@p\���#�@p��HΓ@q��w�A�@r?Bi�)�@r㹻F<�@s��®b @t1����@t�\0��@u���C�V@v3<����@v�|I8�@w�7� �@xBb�z!�@x��?��b@y���S<@z^ �CϪ@{�\�m�@{�gl�u�@|�^��zy@}?�� �        ?�K��s?��C�_�@S"M�+@J��f�@$�R�|�@,�
=��@3 [�o��@8b/R�^�@>)'��@B7��|@E�>&�@I,�b�@L����5&@P~����@R�r˟m@T��>B{@W��,_�@YxLZ�a@[��L��@^}?���@`���3�y@a��s�A�@cO�A��@d�g��*'@f69�ە�@g���|s@i@���m�@jҮm�$*@lm4��@nj�'_4@o�����E@p���ॼ@q�i�F�/@rr�,le@sVu@�<@t=��|��@u(:����@v�u�0@w� �@w�<ն��@x�{��@y���x��@z���0@{�9u���@|�Q��T@}�AUQ�@~���̇@��ln��@���Ի)Q@�8P���@����g��@�'���i�@��;�m8�@�A��-`~@�Ћ����@�`��]�@���+�r@��9B�@�ٲlv@����"@�B�^�(�@�ٲ�:�}@�q�H��        ?������?���0��?������@�ET��@�я���@�[x��@1�,�@!)5v�\�@%�(6�J@)/K�0h�@-��R���@1$��G`@3�c�v@6/U�6\�@8�kC�ە@;�D�q\�@>���fG�@@��K�@BX,��c�@C�8�H�@@E���=�n@GE��>��@I H��@J�LM�6@L�_J2_@Nm.z��T@P'���@Q}�ȼ@Rȶz�:@S����@T�C�V@U �y4}r@V,@���@W;��-�)@XO���@YfU�
�P@Z�\鏜
@[�"�K�@\���U@]�����@_�${�@`�ٙ\�@`�F!
m�@aRWZ�@a�Z�t�@b�^|FӃ@c*B;br@cʰ�g��@dl�&��L@e*nH�@e��T�y�@f[K�b�E@g	x��
@g�)n�@x@hV�d��@iv�V9@i���lM@j^��q@k�X���@k�����1@lp�����@m$���@m؉L�        ?�He{9 �?�M#n]>@ l괯�"@��_��@"��	w�@����N@#�4|h�r@)8Y�@/Nm�>l@2�:�ƱN@6����J�@:m�/���@>�[5�@Ar���)�@C��0U�@F(�a5�@H��V��@KS) Lx�@N��F�@Pu�(G=@Q�%J2��@Sud~׫�@U��O��@V��XuH�@XP�'T?@Z��� �@[ǋtN@]�r�Y�@_j�=��@`��b: �@a�}4؋@b��La_x@c�hk�s@d�O[Z�@e�$t�y�@f��m�v�@g�W� �i@h׀g�ct@i��1�@ks҆r{@l3��y�@mY�+�,�@n��v@o�a�y��@pr.[�v�@q���Ѳ@q��=?�@rGХ�Y�@r����Q�@s�Y�-�@t,��8(�@t�I	��V@uw��EK@vQ���@vȊ'=qT@ws0�A]@x=�T��@x̨O� �@y{h� Y�@z+v˶�@z��0[:�@{�[�7@|C$���%        ?�Q�Xq�?����i@ Rxy4@�AJ�]�@���0�@�ѧO��@#�b�`Dq@)G)��@/g�#�h@3�#��@6�	:Bp@:���T��@>�T��ޜ@A�!2R�@C�w=�{@FVS��@H���O��@K�n��Չ@N[<�Dx@P�����@R}��[�@S�O�t@@UE�5��@V�&4�"_@X���_2W@Z\��PZ@\'���@]��K܊�@_�[K�P�@`����@a߽�y�5@b�2X��@c�ȳ%��@d�e`�2(@e����՜@g<���@h-@(٦h@iJ���P�@jl����i@k�tR�U�@l�B7/�}@m�G�:�@o mX�57@p+Ά��@p�`hy��@qh࣌��@r
C)l-@r�{؄�Y@sR}��=�@s�<��Z�@t���*@uK�E�R�@u�ud�3�@v����o@wS�s��@x�Y�@x�����@yh�����@z[.	`@z�A��@{�t�`\|@|B��^�@|��x�"�        ?�C4�h�?�M�Xs]@�����@�cܿ�@$P��#9@,g��I�q@2�?��!�@7���O,;@=���Ǖ|@A��Ku@E+�`~p�@H�+�|�v@L`��m��@P#�f< #@R/./?@TQ]�;��@V��"+=@Xף��_�@[:�=�@]�a���M@`��A��@ak���@b��@d!���5`@e��G�P@f���~@hq���@i��T@kx�,g�@m����@n��Y�o�@p�GA��@p��:e14@q�_�R��@r�����@ssw�h��@tQ J{��@u1o�=S�@v��&�/@v�����;@w��N?@x�	l�@�@y�P9#@z��ޗ�<@{��ebmg@|�,ZKM�@}���(��@~���@�6q���@�AM	�b�@������@�B�)S�@��c��@�HK����@��{o7��@�Q�G��"@�צ��e=@�^��
��@��o���(@�o%y�@���`�@�@�����k@�[�Cm�        ?�2J���?�p'���p?�D��'�@�rj��@F��SO�@C�,s�@���Y�@ ������@$�QΌ�*@(�v|�*@-#�a�@0͹gQA@39�2^��@5ò�Gh@8j��Ѱb@;.-�A/�@>��
��@@�
R�}@B�T�d�@C��2�zp@EE'-X+�@F�|x�9|@H�l���@Jr�CM�@LB�%���@N�^��K@P�u�U@P���P@Q�YW�p@R�
���@S��1'�@U	���.@VUL[�)@W-�|�I�@XF"�܋�@Yc�MTu@Z�@W���@[���u�@\�%NZ�}@^ �^>�@_2Uu}F@`3�Bz:O@`Ц>^�@aoC�S�@b���}w@b��Z/�@cV,5���@c���@d��i��]@eM%D�S@e���:@f���{^�@gR��.u@h��C�@h�WG~G=@ig]�+�@j��4�@j��yWkM@k�j/T�@lBS�a�@l��	k��@m�R[��@nuU����        ?��6��<?��3���@ ���Z�@]���0�@������@��_�@#V[�T�@(�\�+��@.����@H@2�,#�Jj@6.��H�@9��$��@>	�0�h�@A+��Ⱥ@Co��gM=@Eє����@HPQ���m@J�xj��@M��U`@P8���'@Q�ڕ\|�@S/��";'@T��^���@VW�Db��@W���;��@Y���N�@[k��=�@]2G�
7�@_G�ڳ@`p����@ac6��@�@b[@嶉�@cX��g@dY��S�I@e_ֹG�@fj�\o@gy��3@h�	ks��@i�����@j���=2.@k����@m�8
�@n,���� @oX����@pDA�l��@p�	�B�@qy����@r��D�@r�W�;�@sWN��d@s���<P�@t�L=�@uD?]ʇ�@u�ɹD�@v�ㄍ��@w?�M�E@w릘࿫@x�@a���@yHJ�9�@y��G<6�@z���M�;@{]�u�(@|.��hM        ?��k�y??�:K��9h?���~���@$�k���@���W�@�f,4�O@#>�g�!�@(����w@.���}@2�L���I@6��=�@9�3��q@=��F�#@AgF�W5@CbL�h�@E���?_�@HB��R�@Jݣ���@M�Y_���@P3�FE@Q�*PJX@S,;�m��@T��bQ^@VX"ĜM@X j�2{�@Y��ä��@[tM.��*@]?d��qp@_�Tu�B@`{Z��_'@aq?���1@blb�Ku@cl��/9�@dq�|���@e|6R7W�@f�J��y[@g�mA��@h��s��@iԙ87h@j��ǋH@l�lp�x@mF�I@ntnY]�L@o�ءҮ�@pn���A@q�3�H�@q��0�@rK�U�m�@r�v@s�-id@t9qV��@t�|��&�@u�7T���@v6�gs�Y@v�S��A@w�ZJ]n@xB#zT^�@x󨹂ZM@y�����@zZ���Y�@{�H	�R@{Ǿf<f=@|�Y<�        ?�y�Bs��?��N�yJ@I2ˍW�@��[�;�@#n��@+-o$�@2¹�� @6��'��@<^	��@A
�'��@DFCK�vc@G�oL��@K0�4@N�^G�ƀ@Qm�J�h@SzKQR��@U���(��@W���$�@Zص���@\U:�Z@^��z���@`��YX@bY�TV@c[��j�@d�y(6z@f�����@g�@��V@i��I�@jt��`�@l�֢��@m�-��\N@o%q�S3@p`lY�@q1b�f�@r�	�j�@r�]�K��@s�sa�� @t�����x@ux6�5w~@v\�-"o�@wDa�T��@x.�����@y��E �@z�QW:@{ ')M�@{�$	�~@|�ֳ���@}�1��|@~�#�s��@�b�c�@�u���@��~����@�|a�m"k@�p+a�w@�����{�@��I��E@��h
�X�@� ��3 l@��{Pݱ@�7���@�ë�7��@�Q@ '5@����PkA