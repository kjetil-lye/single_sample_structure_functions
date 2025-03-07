CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T111205        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              ?ko��`�?��;|��?�>/�~K�?�I͊ɯ?�/{���x?��G7�)?���/��?�e2��-?���%sf�?��`�Շ?�/r���?�ct�7�?�fy�.�?��ɖH�j?��!��؁@ *�:�@D�ʡ�@�T��@-ACC>�@	�T��\@��ٻ@�����P@^���@�8�[[@��u$�%@vE�B�L@N2�π�@8ǟl:;@65��@F��*�@ 4p�=�@!O>@��@"ss��>�@#����6@$�2��@&p� ��@'b/�e`@(�G�=��@*�gw�-@+w;�@,�,Y�[@._O��@/���  @0��匡@1��D� @2N�C]@3"eĥ�J@3���Ae@4�RK�@5�����#@6�۸/6@7��$��p@8x�sv@9m�J]�@:e�f��@;b�/+�P@<d�V]�@=ko+W�4@>v�����@?�lW0�@@Mn��nW@@����.@Ah�Y�N�        ?c���L�`?�0o��^6?��pB?��?���� �?�f����h?�Dƶq_W?��7<�� ?����B&�?�*���r�?���A�f?�����?��noW�?�t�Ş��?�Z�j�@ ����2@��_@�@7�ݫ6@
���5�]@���Z�@zZ�xf@�U����@-�e�R�@�y�y��@��>��@t���"@ ���)��@"h���uv@$!R"+@%��7(�`@'�0�R��@)��5�@+��r5�@.���j@0'A2�i@1SU� )@2��]�]@3Ζ.e��@5פ���@6x�����@7�ȭ}c@9R�
�R@:�#��s_@<[��|�@=��G�@?�hLF @@�WF	�x@A~sl��@Ba���4@CJ����@D9�;���@E.�9��m@F)��x��@G*��;��@H1»bf�@I>�"�Wy@JQ�=�r@Kj��X�,@L��+�;�@M���*�@Nٺ渹�@PYP!�@P�ӟ�@Q?L�;@        ?cf(��5�?�?�q��?�݃��	<?�����x�?��L��&r?�SϱD�b?��a�_�?ڒ:P��H?��}���[?�y��H�?�ᘮlt?�I4�=?���mc��?�\
BrHO@ =Mj�T@�V�@ Y��v@	vwE�F�@�-��@x|I��`@����s@�'���v@����@�7(���@>M+?}�@Ȧ�@ �p̩nt@"�f�=[�@$���@%�[��0@'�x66s@)ab`�)�@+H�oT�@-A����@/N���@0������@1ϔ�4Q@2���@4���@5R��NZ�@6����2@7�}�)O@9)Ru;*@:�a#Su@;�~#�@=S��L�@>Ȭ�np@@#��]9@@��=��@A��|(s@B}���@CN�1u�0@D$���y�@D�IR�0@E�\V��@F���X��@G��6/v�@H���-G@I��Bb�@J|�D!!�@Kv�ul��@LuF\c]r@Mx�ʷ:        ?�0�j��
?�9Eg4wj?�ϝ܄;�?���?�7\?�]L���?�����?��	`��@�Zؼ�@����@eU�݁@@.h<H�@4 }��@��Bz@N����@":�F��p@% �4�͌@'�k��.�@+&�~�K@.�|O1��@1�r�}�@2�[⼜@4�s�%�@7�.X�@91"P��Z@;zB���@=��e	�@@,œ�Ț@Aw�ԕ@B���q��@D4��-�@E����pH@G%gC!'�@H���S@JI��@K�����@M�\�ﺶ@O`�<4�?@P�:8;�"@Q�����@RuZ��S@Sny�v@Tm�
uC@Us���y@V�C��@W�A�?�@X��N�@Y��#A�@Z�x=-�@\l���@]L,��@@^��'��@_���*4S@`�t�f\@a(@��v<@aЈ���@b{�P� �@c*RC��@c��1Ow�@d�_�ɳ�@eG���kz@f��<�@f�ao�s�@g�&ZVG�        ?d�RjJ�?�y-B���?�%j��H�?���^9�?�*@V�E�?�:�9��o?�H(רk=?��Tv��?��7�J�?�H�9��?�C�٬@?�  �v�?�(��0�?��ԩq?�Y��Z��?�a�N�~�@Y�"Y9Z@��a��@S�bC?@���E��@m��)�@NRϸ��@��c�|@>Ik�@��cD�@��}���@h�0�T@E�V �@4�g�@6b_:@I�U6@ �x� $@!�k~2��@"���^��@$#�8�@%ZOY1@&��u��@'��`.v@)1���@*�EK�t�@+�:��G@-V�)�I@.�F��W@0#)v��@0����@1�.����@2w&I_�7@3Ff}��@4�\�s@4�!�!�@5ͬ	'��@6�ߪj�@7�Dq�Fb@8z���1P@9g�����@:Xm�I��@;Mk��@<F�����@=C��@>D��۝@?JC��@@)�t��;@@�|�p�z        ?c.1���?�*Շ�?����/�8?��,�4?������?��h��.?���G��5?�4��fY?�/���o?�����=?��"�u��?�߰ZE�?�T��A�?�S �
@o!U�g@|��~�@�{�5H&@wU�Б%@f�	���@� �z��@f�qq#@��-,��@��d_@�a�S�@��҇`e@ ���Q�@"���Ϟ3@$Al�+F�@&|��^�@'�C,B3�@)��_�@+�^GK�@.5�xY@0##�Mp@1J,2[9 @2|zl�k�@3����)@5����@6V����@7�b�}@9!-V+ @:�UuBe�@<�9��@=����@?> U�@@p��Tĝ@AH}Pұ�@B%�����@C���h@C�`a	K,@Dߺ|K^@E�Į���@F�}w8��@G���ʋ@H��@)�@IܫD�@J���1@L���@M�$���@N?�9xL�@Of�k�EF@PI�Z�3@P�{틞        ?`�$�J�?�U��a��?�4T#��?���LSY?�?t��?ǆ蒉��?Ѯ��`��?�$�_��?� �&ߙ;?揽L��??����
?���S��?�HgLť?���x#@ A���W@����3@$Ҕ���@	��m흨@Z�S5R�@�b���@�Y��@8�-��g@�&�9�R@^�	{��@/_�w�K@ ���K@!�y��_@#O>ʓ�@%}����@&�_�V��@(�	�,)@*ƛt�F�@,�2��1@/��*~@0�mB�@1�/�ƺ@3�Þ�<@4G䲲9�@5�.��c@6���p�@8Q�;U~�@9��罈@;;Y�c�\@<�:G�@>Rt�A��@?�
�>��@@�~a�65@A�$�^�@B�w����@Civc�@DT2_�,@EDm���@F:`���@G5�f�f@H7%F�g8@I=���W@JJOδ�?@K\@}�h@Ls�I\�@M��;���@N�G�O@O�I>gkA@P�a��        ?�m�E�?�`�5�e?��E@���?�u�'�.Y?�?�W2 �?� H�?�
�g�@ �&I��@�C�)�h@�łD�t@G�0[y�@� ���@7��x�@�v�@@!W�q��@#�ȓ���@&֐���g@)��%�3@-b�4�@0@�q@2g֫��@3��a�T@5���hJt@8 ��H@:,dO���@<o�6B�J@>ʫL��d@@��"*�@A㜤4jk@C4[�7DA@D�̞��@E���
@Gl����@H�㒤nx@Jv�I�F�@L�ь�=@M��%��@O[��g��@P�n�]\@Qk�j��@RSl�B`�@S@���@T34��u$@U+r㔵�@V)8�|��@W,��@X5>O{@YCmfi�@ZW�id>@[o���ֹ@\�F��r@]�ާ9�@^ڹ�2aF@`gIW_v@`�
$�d�@a:A+Zyr@a�F @bz[�a�@c7*�/@cė����@dmy�8��@e�6&�@eƹUJ��        ?c��%|��?�6s�}�?�eeU��?��B��)M?��Z�I]3?ƍ�0A?�PS*�6�?�]�Qbz?�n4C��y?������?�O:�x�%?�^]k^�?���:�?� �C�?�J#[,~?���̰�n?���1�@T
@ [q@y Âw@��z��@"p[��]@
��,���@J�Մ�@G����@x�j-
�@�vȋ�@��B�>�@,���U�@ݿJ"C5@�Y��{@n���TF@N�E�a�@>!�_��@ ���7@!��>z�@"���5�@#ːF�G@$��Ў1l@&��^~@'={r��@(r��j�?@)�og��@*��Vp8@,?���4@-���#@.�����@0(1�G\@0�[�I@1����L_@2RqM[�@33�j�@3�����@4�C�/�m@5hc�j�@67. dj@7	�Pe��@7߷�e<�@8�q|}U�@9��?8׌@:w·w�@;\U���@<D�"��R@=0E���m        ?\�:2J?�D�dR��?��M4?��U�6K?��S��P�?�Dq�C?΅tJ�7�?պ��A��?ݤ*�z�?���G�?��]5e�?�k䕃�D?�S^�ce�?�c�o��?����|@ u|,�e@3�lլ�@1k�Z�@	o���5^@�3��(@X� 2]@[��Mq�@�?�7�@Ƚk]��@3I�O�@�ie8�@rCx���@ ��#�7@" !��N�@#��Ĩ@}@%O��Θ�@'�VN�@(�Pw�ߖ@*�X�%�n@,��<	>@.�W��&@0K���$@1]2��@2wϾ(�a@3�π2m�@4�5^�@6 �`v@7@A�D<{@8���g��@9�"놺@;9��,zP@<��{�@>?�l�@?�H�}F�@@�i�l@AKnƕe�@B6�0�@B������@C�����@D� 3}�9@Ep�}�8�@FS��)lw@G:�y��@H'�~��@I����@J��Vʿ@K����@L/�^�a        ?c|Qἁ�?��EC ]#?�3�ۮ�?�!F&�X?�7 '/E9?��.�ш?�r�C3?�w��^�?��E�l?�\�1x$?�=�Yj?�a�J޾?��SwN��?���f=�J@���j�@p�<�@F��|�@
֊c��%@��'
��@l�.��@�
@��@
�,�F@��\'�@H����@%2Xڭ2@ �uS��@"-2=:>^@#��s�G@%��+�D@'sY:�z@)`7�$E�@+b�d�5@-z��i�B@/�%,��W@0���w�@2#�P73I@3[��Co�@4�O��@+@5���z�q@7G�����@8����O<@:��?�@;�K� ��@=(��.@>�`W�y�@@'{��^@@���+v@A�.�%�P@B�kEsi@C��8�-@D�"���@ExA�X2$@Fo!�d��@Gk�F`�@Hn(�b��@IvS<�*l@J�D���8@K���rM�@L��p�>@M�ЉJ�#@N���;![@Pg��" @P��Qr4        ?����{?������?�`d���?��=�ޭ�?��F���a?�|zNv,�?�[�5	��?�R9����@R�BK5k@�*'aw�@����_x@��M�@hM�Z�^@r�8[AY@���f�@!����L@$O4�5��@'��o#@)��k�=@,뗹��`@0hIj��@1��7��@3�7-� @5aW�N�@7Q艞��@9W����@;s>Y
l>@=����@?��b���@A"�=W�@BZ�u�8�@C���w@D��+��@FB�P��@G�K�0ex@I$��[�@J�mK�j�@LF�9�@M�1?��@O-�j�6@Pg1q�YM@Q<��_�$@Rg�:|@R�5��3@S�!D^�@T�&�>v�@U�B����@V�q��Q3@W�����@X����T@Y�Q��r�@Z���=�w@[�
�+�P@\�g�#��@]���5�@_ ֌��@`�ϡ��@`��Ls��@a9Y�"w�@a�a�8�@bk۹���@c��&_@c�#�`��        ?`�+x���?�C�ၢ?��K ��?��m�o$?�	V F�T?�e��u��?ͨ�rv?�k���>�?��f���?�@ʦ�C\?倨�@g�?�<�lP��?�tz���?���J|�?�����o?��8�*(�?��U����@ .���7�@3Ѧ:$@V�>�
Q@�<\�@�FfV�)@qWJ�@
r���@`��j�-@��i� >@C�e�.c@�c�g�@a��W�=@�28�@�-q�8]@|Q�ɝ@M�G@@,;�W�@ ��v�<@!����Z@"�Vӷ�@#��0|W@$�n��?@%�0Ön@&�F���@(�:cJ�@)E�j�@*|��*�@+��o3K6@,���EF@.Kf=d��@/��3s!@0{�i��@1+�����@1�&G��E@2���%@3O���ơ@4N,O��@4�멆ؽ@5��w�2@6Xۤ�а@7#"j\Ӭ@7�Jド@8�2G��@9����4@:kΧLu@;E�^��W        ?_�J��wb?����J�?��wh�J?��/l��?������?�q|R�h�?��#�vڌ?���mB?�0왶�?�C��\>?�-���?��e��(?��f*�M�?�";����?����C�z@�*�S>n@zo��@�nhY�A@3����@���6��@Jh�a�@b+���@�~J��@��:. �@z�{@����@�h0K@!h`t�RL@"��uc�@$��)��}@&5��(��@'�ˏ�f@)�7�K@+����#�@-�Sk֤�@/�O�o�h@0��g��@1�~k��@3T5dw@4:C�'�b@5kI�1]�@6�dS�X2@7�t:I@94�օ��@:�	���@;�Qa��@=O�[L��@>��	f>Y@@���@@@ݦ\�@A�2���@Bm1R�ߵ@C;� �LB@Dq��
�@D�ڂ'�@E�@��E�@F�0[��z@G�s�	��@Hn�j�@IZ��1Fm@JK�����@KARJ_�i@L:�7���        ?^�J5��x?�]�D�d?���3�؅?��WG �8?����Ga0?ƥ���0�?��΅��?�PR1W�?��#p"�;?����M<?����|�?�z&� ?���K/�?�>fn�?�WD$�^@|�����@�Ԡ�0�@�aV�@�&�J>@J Gyj~@j��ͪ!@��e�ގ@ &@���c�@s��"�@Y�L*�@!4X�BK@"�A/z�@$���<�@&F*	��@( lBK�8@*��@,y�g2@.-�Ǡ�@0.T=�@1P|��&)@2}ar���@3�n9`�@4������@6D�u�@7��<z@9 `v(u@:nHх�@;�X�K3@=k�J{@>��ץ��@@I�!�"�@Aua�@A�|ߧ��@B��x��@C�)Bj�@D��pq�4@E�on�P@F�`�H�@Gy!B�:�@Hx��^�@I|~#��@J��iZx�@K�#-�@L�Q�]��@M�����@N�f��T�@P&X2�        ?��J�*q�?�����D?��0�h��?ӏ]�:��?�Zy�5�?�ܷ@�?�o��!�\?��I����@��Į�@�^�&��@3'���;@5'���@�9�+�@`��]S@o���Z@ g��r@"�jН��@%>�B�d_@'��UԎ�@*��W�@-�Q�y�j@0b�:���@28�@�@3�I���@5�A�O�@7\���\@9K|����@;MrpDX�@=b���h@?��[��@@�����@B
('�Xg@C:���߂@Dt����@E�� �@G��.-�@HZ�[��	@I�.#���@K"�&�ĉ@L�r�ˍ�@NS܏ l@O�OʹQ@P�-���C@Q[4��b@R*���Z@R����F�@S�qrm�@T���:��@U��ˤ@Vzg���V@Wd$���!@XR#�;@YD\�~}�@Z:��H]�@[5\��@\4�ʥy@]6�9�@^=�(|@_H�� �@`+�*�Ķ@`�Dl�@a@��叏@a����        ?g0~� (�?� ���?�Ùj��?����7?�[�[|??��Y�K�?�nO���u?ڑ����?�q�@���?�20� p?뉔��n?���@2?���#��?��5��=�?�c#˖?�������@�?��2@T���E@�Jx%�3@	z��̗u@D��J�Y@3�*8��@#t��@�/��@l�v�6@,�䎵@��O�@�:��%�@�Tr�@�Y���@�+JO"@!����@"+�x/�@#Q^�MZ�@$��I�P@%�G�R�@&��.�x@(<SZn�@)�҂�]�@*�v5�s@,CU����@-�?�(4�@/3?)�s@0I��=6_@1	�_���@1�i�6@�@2�C�:@3ag�?@40ʥ��;@5x��X�@5��/Y@6��p1u�@7�#��t@8z���d@9a��7��@:M��u�@;<*<ҧE@</��@@=%�n=�@> q%��@?В$�@@|(f�M@@�r�N�]        ?e����?��w2 �?��3�Y�?����E�?�YIVpc?�d�R�i�?�ۼ5|z�?��e$��?��S��?�+�6H5?�JKj�d?��CNg�L?�Qf���?���cy�@�ǥŇ@m8���@	���bw@����<@�^`ag@*/��@���Q�]@����@ߧ��ݷ@��@�@ o�Y�N@"a���@#��� @%�D6޼�@'u�]:�v@)n��g�@+}� ���@-�voM@/ߌ)��@1�E�e@2M�%HO�@3����@4��t@6/�X��@7��o��@8����*@:x�۹�@;��*�o@=����@?(o��3A@@g���e�@A@׻��@B�J�U�@CT�L�@C���b�@Dވ�bt{@E� �G�@F�K�Z��@G���5@H�ta#b@I�c����@J��⌫w@L
奴}w@M'r/�O�@NI�#y��@Oq���o@POK���@P�^���@Q�gT�ܪ        ?^���n�w?�	,��:{?�o��Q�v?�PZ�$�?�`��C�?�2Y��>s?Я�%���?׺:�?&g?�)�D�ڊ?�I�j�0�?�G�6_�??���Ƥ$?�J�i?�j/�p��?�RCf.��@���Z��@�#+�@���@�#����@e~�@��T�:@�?�J��@?�6i�@���P��@X�m-3@�F��L@ �Z��O�@"B]�@#�ۙ�}�@%^H�!�@'#�&��@(�Q���@*���x@,�Q�P�@/˿B\�@0��8�	@1�GQ�<@2�ǘ3G@4E��@5R�O�p@6��*&)M@7������@9Lz���@:����,@<'��R@=���ĭ@?+�KѾ@@^�}��5@A-L��@B �j��+@Bي�(@C��x�>�@D�*U��@E��N$�=@Fr3U��@Ge� k֘@H^[��@I\�AyZ@J`���@Ki�䮹@Lwx�ffd@M�G�P�_@N�����        ?�w���`K?�?p/�G�?�1=���?ڶ�\�?�P̥�i?���La��?��-*6Z@�&�W+)@]���@Ŷ޳C}@~/�a��@������@�S�/�m@�҂�r�@"y@p�=@%G����@(IȂ��@+~����@.��vz@1@|���@3&�>��e@5&��aNw@7?=0��@9p�Ỏ@;���K @>A>@@L?F�<@A��eV�@B�p���@DL��j�@E�W[�Ƿ@G3u��٤@H�:���M@JH����@K�V�,@M�xP<R�@O=ؓ�4 @P}��o�@Qa��,�@RK��U��@S:���3@T/e��6�@U)C�	��@V(i��ã@W,�R�Cj@X6d�8݄@YE*�a�@ZYH]0@[r+���C@\�`��7�@]��;�� @^���*/@`�<T@`���@a9��5�@a�+[�@bx�'��	@c1

f�@c����@dj�0��@e����5@e����^{@fp���        ?b
{8�?�M��y?������?���)GL�?���so.�?���s�rE?�>D��q?�ʮ�	]J?�p�(Z��?����P?��＞�y?��I���?��0�0,�?���e��;?� w��x?�c59��?������@ r�di5@��(��\@�m�.D@ �E٨�@	n���@�n`^@�E���p@��_Lnq@0V��v@�� c�8@JB>�j"@�o�0>�@�.&�@d�&~�@73z�pN@�M�x@ �H��@!���]@"��ԇ@#����@$1&�Y9J@%N�m�E@&t]��@'��u�^@(�e��RL@*~u;x�@+Q����@,�a7i��@-��#6q@/C�{�CF@0Qy@`�@1~���@1�	�Q�@2u��j@32�����@3�S[F@4���J\2@5���@6K�W@7�Bt׏@7�ҮP@8�� ��@9�{���@:um�Sxw@;T��m�@<7B�2��        ?^CD��M?�N��-��?�;1^(8�?��c Q�?���7D?�#7�c��?��'��%?֑]�5B�?޻�kzJ�?�;EA�J�?���w��?�:�R1L?���w*�?�&?��m?��a��@ ��]��@�7���l@�ǧ��@
"nR�@�U1e�@��k��@ԡ/�f@���$@W����$@�+�~~@g�z�(R@$��L��@!��G�@"�(��up@$��U�#@%��G*@'x��Q��@)C�����@+ �ݔ�@-*���@/�B�
c@0�of&@1�cԳs�@2�����@3��(ɳ�@5ݰ��V@6PG��	@7�8?j@8�#�Zs@:1�~��@;��>��@<��H�P�@>g�7��+@?���{F@@�� Xi�@Ay��5��@BD���1�@C/k;�{@C�2mF	V@D�L&)@E����q�@F���cZ@Gnb=1(�@H[�<�@IM}��~�@JDS�@K@���@L@�{g2        ?a�W�S$?��y�?����?�z!`?����&�?��x�q��?ҥ̎T��?�tq�?��?��H��?���^?�C$�b�?����r�?�@}*��?�S:�@ ��� ��@��Pc�@��˗@
����\n@l3CN�@Ks�>��@�q	1�@��a�.@{��su�@2���M@��P=�@ �Ccz��@"* 7d��@#�/���@%���$�@'{�gf��@)m)GAy�@+t���N@-��-_@/�
�@1���@29�X\��@3u�Be��@4�ak�͍@6uW+-�@7ons}@8�WdW�d@:O@oA�@;����f�@=^A��:�@>�q[�˖@@N<�yxV@A&�:�^�@B9"ZM@B酢3�O@C��I��P@D�Y���@E��"S&�@F�Tu�o3@G��N,@H ���@I�aϬk�@J�I�)wi@LU^���@M"�2Kh@NI�M(Ye@Ows~Z�@PU��C��@P�WƵ        ?��3U�?����?Â���K?����o?�]0Sg�?�$�b�?�|��]�?�x��0�@��h7@�;n��@��	i��@m�4#�@�&m-�@����@�F�C@ ����o@#
Ux��@%�Rc��Y@(PY���@+1k�g�@.<l���6@0�|V��*@2gz�\��@4+"�z��@6a ���@7� ���@9�K�r>@<�x<��@>0y����@@7%�&�@A`��@B��j�{@CϽ(T%�@EdEN�@Ff���(�@G�M���@I%k�N�@J��[l�@L	�o�@M���#~j@Oճi�@PTG5]X@Q"ׄȋ'@Q��C�]@R���h�^@S����h-@T��;[ƚ@Uq`x�o)@V[����@WJx�UA@X=�?�@Y5��f�|@Z1���l@[2q�̔ @\7vù* @]@�j`�3@^N�>Q�@_`|���@`;]Pq5	@`Ȝ�%�h@aW�S��b@a�u$H+@b}Mk�&        ?gn�ծ��?�)o�2�6?��׳�?������+?����3��?� -6��'?Ҩ�O�T�?�jI��?�E�A�\?�꽮��?�(�=�?ﾡ^ŀ?��1H%�?�I�	��?��B��?��!˞![@ ����@4L�7��@�c\�8@(q	�@
���!P@pa%��@*Ӯ��@���ȵ@C�V�m@�,b��@�zE��@hib��D@A?���@*�����@%h4�5@ Png��@!&Ea��@"<�H7�@#[z��@$��R�^1@%�
5sF�@&�V72 @('�lp�@)oy���@*�BL݌�@,$,�R{@-wB�=�@.���@0'�M��@0�s��G�@1�Z���@2g.Ǻl@3.�v�)Y@3�����@4�X�u�@5�z@6�@6t�iX�@7O����#@8.��Y��@9cl��@9���#@:�@~�S�@;�i��"@<�d��U�@=�6F(��@>�޽��l@?�_�R��        ?d`�M�X�?����2�?�㴟�͜?���'��?��H��?�z�r)�?ө(Zv�k?۫<ԥ��?��<��?�lU���?�p9p�?�^g (�o?��h-��?��p�R�@ �y+�@�C|p@%&�|@
��s�@x(D�s�@H��צ�@{)v3�@��Ņ�o@S�H!�@�@��R@�^��Հ@ __c|@!���@#� ���}@%H0���@'�}L�@(�v���@*��g�e@,�U�j��@/}����@0���%�@1µ�a�3@2� 'W�@4'�rS;�@5iᓯ��@6�>-��e@8�P��@9m�����@:�`�Z{@<O"OFh�@=�B���@?Y��'�S@@wQ	��b@AF�B�W?@Bĳ��@B��^��8@C��zYu@D�b7�?#@E��D��R@F��dbI�@G�����v@H~�s��B@I}�A/9@J��k;B@K�3�.�@L��˾7f@M��)/:Z@N��ѣ�@O�B��9�        ?c�J�F�<?�Fdg��?�����np?�s �1$?�mL��6�?�Qx���?ӕx�
E�?ۛTo�$?�-���?�l�̰7m?�o���Z?�f7['D�?��)���?����]�@��Q@�l��W�@;���@
ż��t�@�>��@]�#@�J�t�@�+�=�@t ��\@��!��@�r��@ v�z:Q�@"�����@#�r��J�@%h�ස�@'7C�,�@)���@+Dm��*@-���7@/=��,�@0�єK�@1�G�L��@3�C�@4D�>���@5���:�@6ԧ�p@8+�:"�n@9��] ��@:��	A�*@<l�f�@=��?
��@?t��6��@@����P�@AQ��~0�@B$Pb��@B�2ʧv@CتB[{}@D���K+@E��n� i@F�f���F@Gy�.u��@Hm��e��@If*�%@JcV���@KeJo<@@LkxF�m%@Mvg�$[@N��@So@O���-G"        ?�?����v?�0ִ2ւ?�k��X?�E݌�_�?�Y�+	�%?��$��?��}�s4�@�ة�@"H+��@f�Xc�@:Q	�[@%�L�@v>�2@+6��}i@""_q|�!@$�X~da.@'�m�4i4@*�q�I�@.Jj�<�@0��0E@2ė�r��@4�[�!�w@6ƻ��t�@8����@;*�C���@=��L�D@?��dp�@A;�U�Z,@B��
Y@C�D�x��@ENm�@F��ɜ@HBA��@I�k����@Kd����@M��M1�@N�0OI��@P8AnA��@Q:"]N@R��W�@R��[cq@S�˸m}@T�W��@U�U�d�@V�ʨ9@W���o�(@Y �5@ZY��@[2�K��@\S�aj��@]zu��@^��X�]@_�8���K@`���ފ�@a%����D@a��p��^@bj��{�	@cX�@c�?�ȟ�@df"�A@e���P�@e��m@fz1���        ?j��߂ �?����3?��9�� �?�*�o�?�����?�җ�v�F?�'^�ƪ?�1R�8?����?���I?�o�?��F~?�g4�b?�RIe�?�� %h�@�j;f�@���ݓ@������@	E3�?@&?}Ѭ�@.y�@.9y�}@ؿξ��@����P@g��=��@K��L��@Ct���@N(-'f@k��{�@ Nk=��@!pU�'��@"����Ix@#�~y��@%�cly�@&VA�!S@'�1KW'@)y�N��@*ej=��@+��  @-HV�u��@.�����@0(�I�y@0��2�@1���W�	@2�h�NQ�@3i܂Y"Z@4F��Q�@5'�j[�@6ʶDzK@6�N�U�@7���@8ک���|@9ӄ��6�@:�+���T@;Ӟ�w�J@<���7"@=��Ү9@>�÷%�@@�Uhz@@��t{|@A#x�}F@A�i��~J@BI���O�        ?d�wI���?�b��%�?��_<BW�?��.�a3?���?��?�1��e��?��_�,)�?�g�
g9�?���<-?��IMX�Z?�t�9!��?�y��`��?�f-x6�?�Q-�=�@�A�v�@�A��o@\ʌ!,@3�5 �@o���@+�6�[#@y�q�Ҕ@��I��@�I�'�@X�'��@J��5�@!3�lα�@"ר���@$�d�ͻ@&`���@(E�[k�@*@,���@,Q{j�e$@.y2��@�@0[��_+9@1�@kMF;@2�4�WH�@3����r@5J�j�76@6�{�/�@8�Ї,�@9x?�j&@:�k^�λ@<|��U�d@>�ד@?��nk3@@��ͦ��@A���n@Bm��^@CU��ϨL@DD"�h��@E8�]�@F3��N@G4��M@H<I:�/@II޴�P)@J]�%$
w@Kw��a�j@L�?�@M��諾@N����[@P�y���@P��+��w@QL�n�&�        ?a�uo��W?����7	*?����?����?���ּ��?ȡ��W�?�kk`��?���l�?�bY(h�?�9�+\��?�������?��Jra?������?�u�I��@ Z'z(��@>Ӛ�c@j�^g�@	��SG�i@���
|@�Q=0�^@�R ؽ�@P!_Ue@�G���@jD�l�@3�����@ ���>#@!�qLp@#B����@$�G��4*@&����GA@(���d�@*�8��(8@,�Q��H�@.�9Ӻ+K@0��'�J@1� ��4�@2ޏ����@4D�P�p@5e-�~�@6�T��b�@8�,U�@9���ꡠ@:��1��@<{K6c�@>Q��/�@?��c�ȑ@@�n�Ө[@Az9���@BW�d�.�@C;0��dn@D$d� *B@ElO��@FJԭ�t@G�i�\@H��o"�@I
���@JVm~��@K(���,@L@�e��@M^�'}q@N�i[o�8@O�)*{��@Pm���s$        ?�G'#�<�?��W��?��7|AE0?�_ӭ��?�q�ly(�?���ؤ?�K�Qy��@��@��C@y��xp�@!`M��@N���@vU!*Е@��$ Q@ �&N��@#3/k�a@&G^@�$@)3���>@,�~�p5�@0����e@1��K
��@3�@�@5�-�*W�@8��!�@:M���MP@<��hb�@?�P��@@כ���@B,0j�@C�<y3�@D�C<�\@Fu{w~�@G�~|ֻZ@I�5�@K0,5�c5@L���
�9@N����� @P-̤�)@Q�I��@R(�l�@R��q���@S�wR�x�@T��N5rJ@VϨ�jf@Wi����@X%S>![�@Y@��4@Zb#�~�@[���
�@\�[�R@]�Ł��@_(gQ�f@`4���@`ةS�ͻ@a�G�v*@b*�6�H@bם�Z
e@c�T\+y�@d<:�6�u@d�NgN��@e��p�C@fj��"3@g+p���h@g�Ay��        ?c�cV8)�?�z��Q^?���-�:?���&!��?�`��u?������?І�l.̴?֢i[<��?��]���?��ρ7Z�?煃g�U�?옧ݥ!t?��v$&X?�ޚÎ?�g8���?��W���?��� ���@\�:��1@}��o�@�B�_ A@�3T�]@
�߈�}�@9�]�@�@���@h:����@�a#�c�@r��85@r�@�j"���@v	a�_@AR�a>�@Hp�u�@��i�@ ��k�b@!����*x@"�[�P��@#��R�E@$�V�4�@%炂�]@'vdm��@(G/��"@)���[z@*���(LD@,�+�z@@-c�ϛ�@.��_
{@0
��@0��{�+@1}�� �@2::�⃶@2��D���@3��c�}D@4��ٲ#�@5R�H�(@6"k���1@6��W-�*@7� �Rz�@8�"��@9����-�@:i[&m�R@;O�����@<9W�I;@=&����-        ?`{H���?�+!����?�k�9|z?�F��	[y?�`�:���?�=�����?������?��uV�u�?�L/P��?�.G��?���rK�?�Q�_|k|?�R5h�i�?��ut�?��I3.% @2��JH@>�c}�@���@-�����@	��)��@"���z@`�#(+�@ž�R@R �@_�$@�5��@ �p��@"�>ւh�@$5��z�@%��!��)@'�@kH=�@)���p3�@+�V,��>@-�o@ ��@/�73�@1�|�:�@2E��	*�@3{�栽G@4��F�y�@6ԇ�@7`��z�@8�X��p@:/�bg�@;����~@=,���=@>�R'� I@@+�0��j@@���۴@Aײe���@B�b�(L�@C��|>S�@D�(G���@EuH��5�@FkC�#�i@Gg��y-@Hh�����@Ip�!�!@J~"��^o@K����0@L�5�l2@Mʸ���@N�<�Y0 @P�Foq{        ?`�`�=��?��v5�?�:3�{ m?�އ�3�S?���#��?�:�`�V>?Дi�\�??�d��]�?ߡ�&�(�?�/b?�Q!7@$?�`�ھm?� :Y��[?���L �?��;�q/@ �ó��@b|���@H)���<@	gŘ�6Y@��|�{@+���@���/@H�\�e@>��l��@�|n6�@�DD��@b(b�8@   ���@!^u�	�@"��u�@$I(�l@%�I��@'p�p��@)��@*���5J@,�X�&́@.x~�p.@00̹�@1+�x���@2.�,D1@39ԟ{,R@4LQw>T�@5fh>�=@6��|�G@7�[_$��@8�4���(@:�)�O @;Z���9@<�,ܺ�@=�Hƈ�.@?G�U	�@@S����@A�bl@A��B�u�@Bv�1�@@C5!ekB@C�G�6+@D��j�=M@E��@@FS!A���@G#�l@G�f�#�@HЎA�x�        ?���H���?�f�W�>?ĪO&&!9?�%0<��?�[g��,�?�P��A?��l2{�f?��S��t�@�d�B0h@L�d�@��L���@=�U��@ٟh�
@�:`�Al@��m�@!TۛR8�@#�&Y��@&m�Q�V@)98b�o@,.�:	6�@/N��ͲN@1L���Y@3�AF�!@4Ա�ˏ@6�w�^�@8�RTҦ�@:�.!U;2@<��M@?M��@@��U���@A���)�@C )���^@DfJ���-@E�����L@G1�UL@Hw�B�Y@I�JH���@Kc&�7?�@L�zP��@NxwG��@P	tC�j@P�����@Q��N�,�@R��}�@Srӕ�.@TZCc��4@UF�HZ�[@V8��$��@W/���2@X,6���N@Y-���@Z4d���@[@=q�RB@\Q>[q�M@]gbbf)�@^�����@_���d�@`d5���0@`�q4��p@a�-�/:�@b+g��K@b�i�@cg;�e	>        ?\k*x.��?��B��??�ʔ��"J?����v��?��z�7��?��U���?�!aD���?��K�L?��V3�S�?��d=�7$?�8����?�	���?�:lDq�?�Kϒ�?��}:�?��9�Ү�?���Y��z?�8{���d@ s	�RS@e�m!x3@t����@�a�,S�@�@�L��@IAƐ�O@�w,H��@1����n@��+*�@�@b@pc�_ѓ@�}?�i@�벝 @/�J��@����#@�d�_�@n}��v@ %r�\@!˰��@"K;�g@#�mS�{@$%�N�&@%7�2�@&Pï}��@'q@�S�@(�g��ԅ@)��Zz�@*��%=)(@,9pml�@-}]{M�?@.�eC��@0Bv�'�@0���F@1j jJP�@2�9��J@2���O;d@3���b ,@4M��9i�@5iI�I�@5ԌW
��@6�"�S
�@7i)?�'@88��\�@9w��@9᷍ڰ        ?_+��9T?����q�?�2�D�@(?�Ef�;e?�� ��?�Q�?�U��}�?�Y�4���?����x?��:M-.?�e�G��?���@8��?�]{v�d?��@��/�?���ES@�g\�$y@ՉWw<@	�����@gw���@�|��4�@��n6@Zf�E)3@��|��@���D��@z(����@ C�,��@!�
OTH�@#�j��Y�@%Z_.���@':��M@)0�
��@+>ս3E�@-d*ԨGk@/���\0@0��-��[@21�g�h@3sG�7o@4����[?@6��|�@7��W%��@8��H���@:t�*qE@< R8��@=�Hv��@?<����@@v�E'�@AU~�TK@B:z�%�@C%�1��@DTΥ�'@E;j�!"@Fw4�UB@G&�$@H���E�@I.Eڭ@JE����@Kc�ƻ�-@L�k~�a@M�?�=��@N�{��0@P��=�@P���8@QOW�q�m        ?\�w��?�J�e�>?����?������<?�a���Y?ħZ��W�?�#a�?�-��F�?�@���g?�ﳉ��?�*���q?�/>��?�P��O?����Mu7?�]W�#�@ �y+���@w�.��@y���@	����@=�.Ɣ�@�T�)�@��>-K@�bRr��@�aE�'@Q���8@�G��P�@�x�$�K@ �P�LH@"j���@#��rՀ�@%@���v�@&�w��@(�m��2@*r�̎�@,P`�`@.>�Y�@0Fv��U@1'�a���@28i_\�@3Q�D��@4s���@5���ƹp@6Џ��:�@8�Ոo�@9Oi=b}�@:�{�˿�@;���M�@=LՖ���@>�yӄ�@@��G]+@@��f���@A���"@BM�4��@Cu[ƮQ@C���e�@D�s�Z�@E��_	@FZ���D@G6l ��@H$��9@H�ބ��@I�6�{�@J�D�Is�        ?�R"y*a�?�
tq>��?����!�c?Р�����?�Q�2���?�1����?�&�.�?��̴�\/?�d%���@0�����@	I�9P�@��L�0�@�o�_�@�]�O@��Wt�@�/D��B@!"G�A�@#vw�70W@%�(uƊ�@(�^RT�@+Z#+�_@.H�L���@0����[�@2L����@3�����@5�"̦@7�oh�Y@9�u��=�@;�!G�@=�sj�<?@?�x��D7@@�F��@B%R���@CVgp	o�@D�Yk�#�@E�'���C@G$ѩ��$@H}V>i@IߴLd�@KK� �@L���|�@NA�[hS@OːJ�w�@P���YQ9@Q~6��B@RQ�O�)@S*8qj�@T�Vj�@T�0�Y@U���gm�@V��3]\c@W�P�
�]@X���
ư@Y�>qI @Z����@[���\@\�P��K�@]�q��G�@^�82xn�@_ݝn/��@`|MV���@a�9�@a�!��|�        ?`�N*�?�l�yFm�?�~K�3cW?�muZJ�C?��?z�?�Ҫ�P4?�G}���?�ր���+?ۂ>����?�1���#?���R ��?꩘#�?��@c��?�԰����?�����?�F�F�-??��F0~��@ T�k��@Z��;@}"�ѽ@��Cs�@	�o8�@��4���@.�@r��@��
��@R΅�@ׅܘή@km˦�@�����@�,�z�:@y�h�f@D��44/@�+�]�@ �!�K�W@!|-8��@"|��Me�@#�g���@$�����%@%�2b� �@&�r~��@'�8L �@){ !@*;4g��@+p]��O�@,��=��@-��:��@/63��X7@0Bk����@0��jb,@1�}߳��@2K7��[x@2�>\@3��c�w�@4o�(�@5-���@5�9���J@6�iJ�?�@7v�N���@8?�MK��@9<�@9�Qo�p@:����F�        ?^��Ǫ��?���DB��?��k���?��I��w�?��N J?��5P�7�?Ћ���͗?׍A?����f?�&�X3 l?��@�
?��^���?����.B?�?Z0*�?�Z��I@���	�@��"�!�@�1��Ѭ@b���PZ@$�n�"Y@���@�@�<��I@U�.@��E?�@F��,�@�
��@ `��;��@!�����@#�?���S@%0�9�
�@&�} ���@(�n}e@*�ɸ��@,����/3@.�HT�X�@0y�����@1��8{v�@2¨v�@3���F��@55��z�@6A�Z�&@7�z��L@92s�hc�@:�5N��@<�|~�@=�5U@?�Hǐ@@W�jBn�@A'셷�a@A�w~�$@B�Ech!@C���	@D��i�+@E���b�@F{�E�t@GrY�9~G@Hn�a�@IpJ�~@Jw�B�`)@K���ی/@L�h�"�@M�.�v@N��1&�        ?^�]���W?��8}.jg?�N�@�?�8_�%�q?�Q��,%D?�)��'�?Ш��\ʼ?׮� �2?��拔o?�8�����?�,���s�?�j���{?������?�@�wEJ?�6.�G@�M����@�dڭ�@���;��@R�j}C�@?���@�J/�"[@��uI�;@����?�@g\�o6@��JH�;@�I�ӛ@ HհYG@!��D9,�@#`!�t�e@%v�ǳ�@&�M���@(��h&�@*u`:�_@,kD��@.t��ۥ@0H�܅ɫ@1ab�	nD@2��u���@3���N�@4�-�m��@6&\�`�@7p�0�X@8ľ�E�@:"���D@;�H�$t.@<���o�k@>z��@@ U�m�@@Ȫo�s@A��I�C@Bh����@C@O��Q@D���3�@D�0�\�d@E��8��@FИ���@G�`[?�@H�3O�h@I��@��@J��$`֌@K��ԩx@L�ڡ(و@M��ߦ        ?��fн?�Ffā<?�͠b	��?�oZz��?� �G|��?�:ϻy�?�t�	*�D?��@��ݫ@�a�Ѐ�@�<��:@NK�Q0@E}1���@��~�R@t�b�%@�\��01@ s ���@"�G���@%K_��2#@'�%�*;�@*�r:91�@-��]k�@0kty��9@2����@3Û�.{@5����{�@7h���;@9X@s��@;Z=�,��@=oA�I�K@?����#M@@订�4@B��}t@C>µ)@Dw��I@E�l�P��@GU�B=K@HX8���#@I�\�(@K�i�*@L�/���@N 1�塆@O�z�z�@P�)o3�@QL�Ф7�@RMM֓�@R�7�ļ�@S�V����@T��t�(5@Uv���@VW���8K@W={��5@X'Y�@`@YQe�t5@Z`zoY@Z���*1@[��H[�@\��Xh��@]�9��Tr@^���)x7@`f�,]@`���2V�@a���@a��>��        ?`^����5?�p�ߞM?����^?�̐Σ�?��u���?á|�Uif?��
��?Ӕ����?�χ���?�w%PX.�?�w�K��?�粤x4?�Ƃʢ�?�`�S�?�e�
�C?�w|*��n?��cskە?�9���ݠ@ ��vR@懁���@��f}�@ML���@	V!�yZ@�{����@ D+��@U���F�@�ڠ��@����@q��V�@�fJ�@mjh�	�@��,@�_�96@C2q�*�@�(f ��@�/�dU@ ���@!��ՒbD@"��ۛ:�@#�E�%��@$�g���@%�S��a@&��?�8�@'�V��f@(�T� �G@)���+��@+��@,*˘��p@-V ��.l@.��O��v@/�Ч+�@0|.۠�U@1��hm�@1�НQ�@2e��F�@3%,�|�@3�L]�@4g@5�uZJ@5ʗ���@6�F�M�@78����@7�~�]�        ?]`�G)�?�؉CHr?�ɿր�?����=?� ,+�i?�-0\���?��MJ].?���0Ej	?���0�?�A̿1y?�X��C�?�����E�?�YQZ%�?���u�g�?�p�6�=@^���R�@Hi��R@vO��6|@
��	C@�'Kȶ�@T\��A=@z��ڿ@���+m@8�9�@�7�	�[@�K�yq�@ ;Ia*Q�@!�5���@#]��@%�/�@&�Tڗ�m@(���M�.@*�# $~�@,��d�m.@.�s ���@0i�i��@1��}Cq@2��X[��@3�D@>��@5'r(ex�@6q2e- @7ň���@9${Ȭ�@:����@<<��@=�$�@?
~� ��@@OG�sf@A���S)@A�D)�v@B�6\~7)@C�t1s�@D��4Ck�@Ez��kl@Fi�:�Ge@G^@�b�@HW��ڪL@IV¿�e�@JZ����@KdE��}�@Lr�-�R\@M���c�1@N�ѕ��        ?^�G�,8�?�-_�xK=?�� ��x�?���1��,?��ks{�?ưE~���?��Ms�?�^�no��?࢞& ��?��^3�X?�-���Z?�1J	�?����:j?�_f奊�?��D�&�S@����h@�s�R7�@	"
��"�@�6���@l�[�I@�K�+@��5Rc�@_"h:��@�2s@�O_���@�]d�@!s����@#�����@$�`��#@&�u���i@(���@*�D��c�@,�jd߰@.٨���P@0��0p:d@1�	�8�@2�j45X�@4>���Y@5��λͿ@6�!!�@8Y����@9�"CVo@;SEI@<�:H)�@>}�l=�@@��=@@�=
U�@A�Ζr��@B����#@C���*#@D�s�L��@E�de�:@F����b�@G�~�-�r@H��I
��@I�]�>��@Jтj��y@K�&eW˴@MM��_�@NF��W��@O{7j3@P[ :� "@P��t�Y        ?�ΧuOw?����)?��i��?Ѧ,UAf?��Q��II?�=����?񩌞ӱ�?�\��-@ D��@�wd+��@	����%a@] �RkD@ˉ��p#@0���m�@� ���@�E�Ux@!�x�@#D��/��@%��'*A�@(+x'u�5@*�r�;�@-����Y�@0Cc�+-�@1��ܸv,@3azbg��@5	�1��W@6����'@8�9���@:g�!�I%@<R�H�$�@>N�,�@@-�Ծ�@A<��H�@BR��}�|@CqxX��@D�])B:@E�Tzk/x@F�S'9i@H=M5tW�@I�5n�W�@J��"o� @L)� �@M��3�W�@N�쿥=�@P-Ȇ�y@P�e5�|�@Q��C
@Rh��+��@S.ȍ(��@S�^�ÿ�@TŨ.Y�@U�����#@VkDvY��@WC��1�@X~�L{@X���f9@Y�;�7��@Z�M�+@[�c�R�@\�Yx��C@]��뜶J@^��tDE�@_����p;        ?f�����?�!�|I͛?��r��*?�R��`	�?����md�?�Ѹv�fh?қ�����?�nkGC�?�I����?�<)_��?�W~X�	�?��=���?�~�R�o?��>�Y ?�2�)2?�'�����@1��[_n@s�2%�@���(A@aZ�i�@%fP�@��*�j@gB`Y�@�ۗ�:@��J0(@:���V�@��{VD�@�t��Tz@����گ@��\�߾@��{N��@ Z,�(@!l�y�s@"���0�M@#����@$֔�Ӓ?@&
�p���@'F�!B@(�?����@)��j�>@+,�M�Ђ@,��ʇ�5@-�v��0]@/[k�9�k@0h-i���@1&���k@1��KZ��@2�K�o��@3y~8K��@4G�I%\�@5wmD��@5�.���L@6Ȯ?f]�@7���/�_@8�� =S@9k���Y@:S�٬��@;?�S�@</}�ϓ@="�;�m�@>v���~@?��\�e@@���e�        ?c��J�� ?�Yӈ��?��!�Pn?��~�d�?���^J%?ʯ� ':�?��b8O�A?�.�A�&�?�m8�O?�8�RvB?��
�_%?���'?�w�۶�]?��a���@�$��7@��m��q@
>Q:�=@��&~<:@��R�{@��o\F@PS�D]�@ǰ�_@h\^O-�@2�3�E@'�[R��@!#�OeӸ@"���Z�L@$���%:(@&U1XhƷ@(<�"/��@*:�Қ�@,Oe��͆@.{�x�?@0^�B3E�@1���_Y@2����@4	gɿ�Y@5Y���=@6�d%��@8��.؉@9�zm>��@;77��@<�(؞��@>:]Z@?�ଳ�@@��ݣ�@A��+(�@B�^�'�@Cx�Β��@Dj�x �@Eb�T*j@Fa]r��C@Gf�Yl @Hq!�CK@I���o@J�=�u�@K�U�-h�@L�π��%@N��f�]@O8���q�@P8U�e�@P�h�_x�@Qy��2�        ?bms��J�?����Q�?��� ��w?��!�_L�?�VXr�+�?�6��=�?������?ڛ@�Yl?��W6d5?�%w�Q�?�&qk���?��y��7?�{��K ?��)�7@ �O[W
@l�$e
�@��C~z|@
ګ�F�@����@�Lŧ�m@�h�@[����<@��RR�@i"!�E@*.�
@ 	�U޾@!�� 
�@#,X�:޿@$��S}@&�����k@(w�^0.@*c�\���@,di
{@.y����@0Q��1�:@1p��yK�@2�e�d�@3�VjYa�@5��}�%@6Uy5�B@7������@9fBv&�@:n�Nc[/@;�4M��@=^R��-@>��4�1=@@;�����@A
F3;��@A���|�@B��4� @C��Gcc�@Dw���oP@E` ����@FM���UW@G@�(���@H8�EMՙ@I5��{��@J8t�j{�@K@  yly@LL�ӕ��@M_8�;�@Nv=�&�~@O����|        ?��[�z��?�}����B?��圪�?�u^�j�?���&4+V?��7?Wc?��~	]�@ ٲ��!�@&`�>v@6!��|@�sY]�R@O3SUUv@{E�@�m�}@!z��9c.@$!��oA@&��1�x�@)����.h@-6U�3�@0NP��f@2/�Y��@3��ӕR@5��W�:@8?U�?2@:0Ċ[�@<p6��@>����@@��9��*@Aݛ~ S�@C+�l
!�@D�F��:@E�-I�r@GZf0c@H��x�2�@J\�V���@K�n���@M�].�r@O3PH=�@PsE��p@QR%8D�@R6UO�5-@S |>7>@TC	7w@U����d@U�:�E�%@V�3���@X io�Y)@Y	�@ZdA�@[,�W�@\D�7!��@]b��Bz@^���H�X@_�Kͮ>�@`m��u�@aҒ<:�@a�M��@b>���/�@b��q?x�@c�<��@d&
�=�^@d�1�"8@ev��P        ?ZWq&H_?����69?�?� q?���Z�>?����rx?�����?�%2l�N?б�^���?�"�cR�+?�f��Ҁ?ᾓ����?��^@?��h߮?����ʷ;?��Ul�1?�Ώ��$?��^�2
?�<Q�E?�j�V^ @����X@�!kJ@�l�R��@�މf�@	=K7��]@�fW��@�<O`ۦ@;�8<��@���(��@�����@L���M@�
�+=�@B@�`{@�1�kj@j�.��@.�1|�@�4MH�@��rm�@ �i��@!�HG��@"�N����@#���u@$���Y�@%�rƷ��@&���6�@'���Z�J@(��ٍ�@)�!WL[@+Sl~��@,,p_�ؖ@-\l��a@.�<�I@/���@0��'x��@1+��M�@1�o _	f@2z��lݔ@3&}���@3�([<�$@4��4X�@5:�w0HP@5�q={Rk@6���Y@7f�U^)        ?\H�{.��?���sF@?�t�r�{?�I ˩�?�͊t~"n?�<tK��?ΙlQ_��?�݈�/�v?���1�H)?�����z?�oS�OX�?��Bu�}�?�����?��ĹK??��i6���@ ��J��S@����'�@�5X5K�@
*�S��d@͛ �G�@�`�'��@��'�@/��F@��l�e�@��\��@��� ��@�rpĒ�@!Dt�1y�@"Һ��<@$t&�*�2@&(�+&)@'���@�8@)�?��@+�'vp�t@-��ݯm�@/ӧ��@0�����\@2]���@3E�|B@4xY�;��@5���[)0@6���V�@8K9Uj@9�9oz@;	�Wy@<w
�x��@=�� �j@?p�%Z�@@~@�-_4@AI��hE@B��Y+1@B���	N@C�zn�\@D�/��\K@E���QA�@Fro�"�@G_���@�@HRfI���@II�#<@JE�f�]S@KG]=�A@LMWZm@MW��=v�        ?[���P��?�y`��.�?�o���;?�_�5�/Z?��)C7�?� '��:y?ϵ"ke�x?֟�,!��?��S��b?�hucn�<?�5/5S*?�rNa*?�?�|:�?������?�K*xl��@H�LwH@,g����@S���@
�kȩ�@qީ+�@5=��0I@Uu�UL�@�x�i�@{�K �@�#F÷X@Fg��a�@ R>PkF@!��t��(@#$'��@$�)s9�@&������@(Tנ�]@*6d�m�@,,�GG�@.6�W1�@0*+԰G@1CA�"O=@2f���@3��ԛ@4���3 q@6���:-@7Z�%$�@8��^��@:�oU�R@;|�I�=;@<�7S@>r��TWN@?������@@�a�/d@A�;�[�@Bn\ձ�@CHǬ)�j@D(���t@E�+�Q�@E��l�@F�.���@Gܮ薶{@H�_�c,@I��h��@J�'��XX@K����0@L��	��@N5��}�        ?�ǳ��#G?�;�̪V?�W��U
?�o�"��?ڼ�Ec�?�4��ێ?��|��?�Zh��q�?�WG�Z�W@2M��>@�D�6�e@�VX�p@���K@���MCd@%y�@��tQէ@��!��@!^���@#���XT=@%�Ҭ���@(Xq�w�#@*�_ �d�@-��)QA�@0>�����@1��:�<�@3H�V�v�@4�m��gU@6�zd�3@8R�3�@:!���vC@< �����@=��n�]@?�k��@@������@BmC���@C'_��)_@DG[@c+M@EoZ��6@F�X=o�@G�K�|�@I)q�G@J^���@K�xݻ�@MΣ{�@Nd�::�@Oˌ�+��@P�냉C@QWՏr@@R}j�\@R����R@S��Y�l�@Th��M^@U5��1@V�;}�@V�n�5O.@W�~��7�@X��z�3@Yn#�E�)@ZP����Z@[6�"���@\  �]�@]�2���@]��?�a�        ?f���]�>?�!%&��?��|�e?�\|�z�?��Y�I�?���L^y?Ҷ`�ʕ�?ٗA�+r?���6���?�a�D�?��Bv3�?�N��?�A8��۠?��ߪ�c_?�]�s�z�?�WX�}�@K�@��@����@@�}���@��Kl}<@.KQ��@���I�z@ya��@��0	@��4t�@P!�>%�@�2�&"@�)م�p@ê�{@�a��1b@�8�	ܒ@ i
���@!|o3Z(�@"�;����@#�cH8�@$�٘M4�@&�	4 8@'Z��dG6@(��t5��@)���=W@+B>�Qe�@,��	k�@.{xZ�@/rp�@0s�#�t�@12tqr�@1��6��@2�Z�/�e@3��=dW\@4S���Gt@5%�9DS@5����o-@6�$C��@7����8�@8��:'O�@9x��+1@:aaYݐ�@;MںX��@<>�ǜ@=2�BH@>)����@?%�YV@@���        ?b8l3�k�?�,`b�?�6��R�?����I?��U�!?ȟX�	�i?�c��!��?�IG��-?�7+I.F?��-,��?톶�@��?�p-��7h?������?�Gt��<�@ <��q�d@��f(@?N&�:@	�����@a2^o)@��"�K1@��v��@#�D�Y`@�P��~@2�W��F@�?S�_�@�^��4�@!{Ķ��@#k[@$�XxLƅ@&��D��@(wp��0W@*k�Z�@,uzDI��@.�!]��_@0e^�:�@1�9�б@2�2�ԓT@3�Zg	/C@5?�����@6�p���@7�y&�ks@9Y��d�@:��>�w�@<O>�&@=����kj@?rb�Bk@@���sV@Ab �4G@B?"��c�@C"�Y�@D
�<�TM@D��d�jz@E�$�#(�@F��Vn@G��f_Q@H�|T�@I�(35��@K$V��@L%Z9�`@MB��q�@Nfwk��G@O��+Y�@P_� gir        ?e�+L�'?���P��S?�?gU7�?�� �� �?��C��B�?�L��?��i_�f�?�,�>%;x?�>���?�G��?�3;zꖜ?���?���6FGa?�hd뼻s@jC�n:k@d
h%�@���2�@'Ƶ���@��~\@�G dP0@�#��@�R��@�G\��@Fd��@�Q �h�@ g�1���@!��9���@#�7�z6�@%=!���m@' ����@(��%�!<@*����@,��͏�;@.Ԧ�v��@0}�$'�'@1�s��@2 zLZ@3�����@5/ma�˞@6t��J�@7ād�q�@9 ��@:��]jQ�@;�v=l�@=g0z�v@@>��G|4�@@:Z�&K@A=M~K3@A�\��c@B��Qb�m@C��e�A}@Db��e0�@EFp����@F/-i5
>@Gڅ? S@Hs�p�N@I��С�@JX	D@K����@L
��>kz@M�U�=@N%P.:��@O9�a��?        ?��5�?��{ݡ	�?ʠ>{�٧?�� ���?�T�A�b?�h���?�#��"[�@�Y@��՚c4@�� Ju�@���@Y@���B�@��z�@����,@"��8M9�@%f�ૢ)@(l�l֦�@+�A�.��@/��	ks@1Y]�7��@3B�I��@5E|�	�@7a���.�@9�����'@;����@>M)
{|�@@f����@A���~
@C�{)ma@Dr�%��@E�GB�@GaJ��bA@H��t���@J�p1�m�@L!�/bI3@Mο�X-@O�V���E@P���U�h@Q�ue��0@Rzڂ�T�@Sm���Ù@Tfg��@Udu����@Vg�@E8	@Wp��H�@X3�W	�@Y�҇�c{@Z���ʴ�@[���H�R@\�>䗔&@^��Pa@_C��*-�@`;.��'@`�)~�C@au���@b�>|_�@b�M�/��@c`_��F@d�D�@d��A��>@eay�:w�@fmv�/�@f��=��5        ?l5J��<�?�M��F�?�~���!B?�g���9D?���@?�/��Yߡ?�ܝ0�e�?�T���|?‑���?�p�{p4�?��2�'>?�2��"?����_?������?���<ׄ@ iw�R��@����q�@�~��@��c���@
iRw� @F�w�d�@$����r@�@n8�@_��dp�@��3-@��c�0@���}@���e@�l��/@ˡ�U��@ y�(�y�@!�a#��T@"�P�H�9@#�Y��b@%#~�Ae@&d�֩t.@'�
��G@)�T0� @*_���D@+ľ�B�@-3u��@.�;�u�@0ZB�}@0��iM��@1�l�k@2rb�� @3D�B-<@4�h��@4�8�ҥf@5���ʅ@6�gQv@7��Э@8�2C@9��4�@:xZ��@;r]F��@<p��Jl&@=s��s@>yŲ�hs@?��noY@@IЃ�s@@�b��1�@A_�!�        ?b������?�h��v�?�N�C�?�)	T��X?��[j�?ȴ#_�??�v]~z��?�!
�1R�?��Ҭ#�?�G�K�?��$�;�L?�/�q�?�Ў߻K?��n�ǱQ@ i[�
m@Q� ӁS@�7���@	��@��@�wG���@瓵]h@���&D@kS(�8N@�O�4�@�]Y.��@Z�aR� @ (��Z7@!��=R@#]�L�Pu@%�[��@&樓e@(�:'�$@*�]nWp�@,�:E�Y@.���oW@0�[����@1�O�3,@2�f�ef@47�O+P@5�9�H�@6�O���@89?V�@9��}6mf@;�+=��@<�@���@>0/m��@?ʟ�+@@�L[�H�@A�����@Bo�h"�c@CS�ŕ�{@D>���t@E-�_��@F#�gZ��@G�;nJ@H b��}�@I'xl �@J4\pH�P@KG�վ�@L_���EB@M}���:@N� �Lo@O�
A�^@P}�!��        ?e1;��ж?���~�7?�L?�O�v?�	��=�?��3� ��?��'Zo �?��}e���?��ޅ0�?��w�bi?��[�`?�o�;Z��?�/P�?���GH�?��n��lH@�h�CM@���i�@KC�iqf@
�[���@�#�uZ�@_e �ܢ@�3L�XP@�~��g�@n���)�@f6*+@��NSs�@ p=�5�*@" �c@#��kI�X@%_b:"��@'-����@)�6���@+�Rt@-h��i@/8�����@0�"�`
�@1޹�:@3��#o@4L<���@5�?���@6�#�� @8A��:��@9���l�|@;t4��@<�2brU�@>"�� T%@?���$�c@@��;��b@A�`f�@BZ`��
�@C:{��ݑ@D 'js��@Ee�	�@E�5�?W@F�|��@G�EM�U@H��ꟍ@I�<#9Ҽ@K�3D�@L2���@M.n��m@NKiԭ/�@OnZ���@PKk���        ?�`UT�Z?�;���o=?�cw��0�?�\���g0?���_�1?�>v���V?��X���F@��os��@����$D@D�aX�g@`�(��@�:�J�@t��"�@ ��Hx��@#CԆ�u�@&.D�
��@)NβB@,�4o⤑@0�{�@1�����]@3��Lo�w@6�2�@85f-��@:l���@<����@?c,8�@@�P��� @BXXky$�@C��Ui�'@E4S�8�@F����6�@HD��D�@I���;��@K�9>8@M@�
�f@O����@Pj����@QZ��#&@RO���J@SLT�@�@TO[z1�e@UX�
�m @Vi0�qg5@W�/�)�@X�S��C�@Y�:4��S@Z먝�N@\��ϭ�@]T����@^��Q��@_�5���@`�s2+a@a8��ث�@a��au@b�r,��@cE]��d&@c�a�7g�@d�z1<ˁ@em�s���@f+��F��@f�wŽ�@g�^��@hx�3L��        ?a�L�K�?�k���T�?��	��k?��:��V?����D�?ŗz/��j?�d���?՝]�oP?܎U���?�C��CË?��1LٮL?����F�?���}�r?����?��J��g�?��YF�ۅ?�M,�ވ@-W�D@T�T��@�;��n
@D�G�Y@
���Z�+@::�Sa�@�L*g@x|Z�u@��)Gȡ@�����)@9���@�R����@�	��@��xcI@p;���@e���w�@ ���m1�@!�#��,]@"ҷK��@#�?P_ѽ@%��Z@&:4��6�@'l��V�@(����@)�a�`�@+4��՚@,�����b@-�*���@/CƸ�e�@0W7v{�@1�- r@1���E�V@2�]	��@3T�N�@4DI�(U@4��w��@5�B|�W@6���V�+@7lL�P1Z@8I�3X�@9+T��@:�+B�@:�G�U&�@;糛��@<�H��o@=�a,\:        ?_�R���+?�v�=�0?��g��%?�̱�Xv8?�ƁI1?�|��@��?��bA};?���S�'?�M'��l]?�o���?�m*/h�C?�'.��v�?��\yl?�l�w	�*?�H�Y#°@ѳ��.�@��5���@�Z���@a�I�.�@�$~m@�˶~+@���@�Ѯ���@P���@�]>��,@�b�@ )�h:�(@!��p�l@#.y@�FI@$����a@&{ �sw@(<;�֝�@*v��@+������@-��Q{��@/�$�.&�@1-c��@2�}~g�@3>YHљ@4f�,��G@5�mK�@6��[;ٲ@8X|��@9b�.�I@:�v��@<3�_�@=}G9 �0@>�93�XF@@3�u+h@@���a�N@A�}'&�@B���ؾ5@CP��0ܾ@D"��D�@D��Ǵ�j@EԦ�UWO@F��D��@G��*/3@H����@Ikņ���@J\::+�%@KP�e�!@LI�� D\        ?`
�8dB1?�<�!-?� ��aV?�
*��Z�?�`���?ǐh�){-?ѻD�.U?�:�t� ?�1��!)�?��g?3t?�
9�<�?�/�~ ?�Z���{?�	���@  ��A0@ ��ہ�@(�n9�@	�����@Qb��@����@��>�O@!?E���@��r\��@2���*�@��T��@��f@!{��[ح@#�9�:@$̢��C@&��i4�@(o��N�p@*_�q��w@,d��?��@.~���ő@0V��S	@1x��pڻ@2��6�԰@3ۃ��҃@5�����@6hul��@7��q��@9g�+&@:���{��@< U��?@=���=>�@?+��X+@@P#%Ek@A���ȏ@A����@B�!:@C�z��|@D�\�<7@E|ؘ��;@Fk�$���@G_��@HYE"��
@IW�+��@J[il�'3@Kd9�~�@Lr1r���@M�O&L�!@N��/�45@O����;�        ?��k��f?�ؐ2��F?��c��Wu?�j:�Ț?��Հ��?��$�j�?�U�%��U?��lx͓@��mA�@��0�֊@�p�i�~@��Q1�@��)�Q@��<�@�᝺�@!C���P
@#��i��@&d�T�u@)5Qe�'�@,0���@/W{D�m�@1T] ��@3O����@4���-�@6����@8�i%m( @:��Jx̐@=7:Qn�@?AS���m@@��D�A@A�ӷ(�@C8满��@D�JUd�@E���t��@G-�K.#@H�G聫V@J�&x��@K��!�3@M�~r5�@N�z �@P*&PP@P�C����@Q����$@R� L�@S~��Nu@Tewd��@UQx��j@VB�
�-P@W9��1?@X4��eXa@Y5M1t~�@Z;2.��|@[F@��o�@\Vw!���@]k���k@^�M�t$@_��uա@`eM�M?�@`�2+.W�@a�����@b+�u��1@b��dj@cgvh�E        ?c����r?�-2wc?�Ef+�V?����?��.	X$?�3yy
?�q#�?�蘰֎9?�p>u<?�#�<y�?���)�D�?�"]#ok?����m�?�#�ґ��?������?�4u)e�6@ \�Y$�@�a��^@P��$�\@�J&��w@	�ea�v@�1#V�e@F����@����5(@�%H8�@}�$l�@�:��@�@�Y]@^@{��@�e8�@�`��T@�c�Hp�@��7�rs@ ҂B�}@!������@"�2���c@#���*Ǵ@%
���@&*��5؛@'Q�O�_�@(��=��@)�!��@*�Ks��@,5@=�l@-�c�H�@.�����@0�=�"@0�^����@1wtQU�.@2-�X���@2�ɛ���@3����<@4e���@5)ab��>@5���V[@6�����@7��|2@8Y��S�@9.Y�ټ@:)�J9@:�3[�W-@;��2<X�@<�R��j�        ?b���s&?�s�J�c&?�D�W6?�We?�?��x��y�?ʰDە,�?��O�Su?�_� 	y^?�H.+G�$?�W�Vk�??�5|uU�[?�F�� ��?����`?��t��@�|�V�@ľ��S@�,q�p�@m~@��	@H3V��B@��Ɣ�@�@@g�@{��a��@9ױ�F$@$�\4p@ D��@!�/q�
�@#{D�@%L�xE�@'5���>@)6��Jd�@+O|S��@-�nGbb@@/ɥ�I@1�
���@2R���6�@3� i�O�@4��.�@6T)u��@7��_�4�@9>0���@:� `��@<Z�E�9�@=��5��8@?���$�@@�[{�*�@A�.�}ϫ@B�r^�C@Cq+
� @Dh^5��@EfE�2s@Fj>�V�@Gt�(�NF@H�-H��@I����$@J�;�.�@K���ռ@MyU3�D@N>mecv!@Ov��	@P[{��V@P�ԴLE@Q��1�YK@RMQ�.��        ?^��}l��?��:��?��O�g�?�t��i?�{�ྐ?�`��ץ�?� �|�^Y?֨��'$[?޾��Z�?�*6$21?�I{�?�"+�S?�on3�?��裆��?�5��^c�@ �Y�T�@C��@@0��ڪt@	Y�
� @�ϑ�g�@/��.R @��pjr@,˧е@Yy�D4@���&��@M��H�@�|j!��@  ?����@!���g8'@"�qUs�n@$x���@&
�[�$@'��ԝ��@)Z��҈@+J�!�q@,��s�w@.Ʒv��]@0Y�a6֔@1X �6�|@2]�Ց'?@3k�^�@4�#�}@5�V����@6�Vc��G@7��p�BZ@9�D�p@:Y�6��@;���q6�@<���н@>6�	�@?�v��ڮ@@w#b�T@A*�u�%!@A�~(@B��p-|@C[���C�@D�����@D����@9@E�[��@Fz���@GKQف�)@H�*�c�@H���p"        ?�W���?�"Ɨ
��?�+K@�tD?��N��]�?�����{?�_q��?����bT?��C�� @`�"0�@	�9j&��@%���ZS@��.�ق@z=��	
@��ܺF @ �v�4@"~e���@%J��!v@'��@7^@*�mT�@-�X��`@0��(T@24jD���@3�G"Vֳ@5�S��@7�q���@9Ĉ�F@;�z�MB@>2{�P@@ ̩a�+@AIN�3�@B{�mY��@C���,�_@D�LM��0@FL��ܒ�@G�����@IN#��@Jt� �^=@K�=��W;@Mi~.���@N�7t�Ƞ@PB/7��s@Q�mm��@Q�a��^�@R�s=�@S� ��j	@Tua�@UZ.����@VC~�}y�@W1H�8�@X#��g��@Y'�QL�@Z.d��O@[�>�Z@\P��8�@] hV?@^,�>q@_=���
@`)kK��p@`�4?�@aE0��Q�@a�a�I�@bi�t�/�@b�XDA"x        ?g����?���QC�?�v�^"2?��J�h��?��rYʘ"?�!*���e?���k�''?٪�g�8?�� 9�5h?�hW�a��?�U�p�?� ̈́,�W?�C�
�G?���ts��?�a����!?�[� v�@N�^��@��>��:@����PG@�0� @1�
��@ڻ��@z��A�@�А�=@���%�@O��z/�@�t�� @�z�HZ@�Z~-��@��QT<O@�Ka��;@ g�7;�@!{�c�!@"�7�י@#�~�A�]@$�?��@&"�8]O�@'b���j5@(�3W�l@)��U#�g@+W�J�@,�5,��i@.&/�e�@/��g��@0�G�k�H@1Oy3��@2�U��@2��{R%@3�eJ�@4�#�Μ
@5aD��"�@6>��e@7 �,D1�@8����@8� %�@9���U@:�Rd�@;��ȝBQ@<�R%�@=Ƞ���@>͔rqN&@?���/@@rN*`uG        ?d�����?��}N?���zQ�?��ۖ<�?�qc��r?� �r��?��l9���?�y����?���~~\?�%�"���?���J�?�Џ�{e?��onɰ.?��3}[�@L��u�@��{�~�@	��a�@浪��@����$@ȣ��@3��@��sqg@�Eژ��@zd\�J�@ K��@��@!��/v�@#��7X�J@%�q���@'o
���@)s���h@+�`z��U@-ǧp�H@0�"g
�@1?ׂ��s@2���ø�@3����T@5)�҅�@6�U�mI@8bA:^�@9��B��B@; �尡@<�~'{�@>b�O3�|@@�vk�L@@����E@A����/N@B�q!�@C����@D���v@E�0|Fٕ@F�Wp�s�@Gꖊ-V�@I��b��@J(u����@KR ����@L��i�O@M��4,�@N�N<|E@P h⎵�@P�K�!$�@QqҊ��R@R�/w@�@R��C��        ?`	�*��?��g�}a�?�QW��2�?�����j?��U:���?�h��
�?��%�?�?��ٛ8�"?�!�]�w?�0s녚{?��HL�n?����p�?��+��?���Nu?���>��@�/��q�@x�F�jx@� 6�o@FP.��@�]r�7[@S�XC)@o���E@�!�[�y@h<��,@����r@F!Ҥ�@ �Maxe@!��9s��@#��'.@$�&z�l�@&jdf�<�@(1�؁�<@*�*F'�@+�H�`�@-�`�-�@0	�L�@1s�D}�@2=B�_�'@3f��{�@4��~R�f@5�� �K�@7����S@8n$ݸ�o@9Ʌ��rU@;/s�E�@<��-�A;@>�F�5a@?�;DB��@@���0��@AbN�7}@B3�em�$@C
�ءY@C�c��@D�]�Cj@E�|�;2 @F��Z�(@G�(��ff@H~�q�l�@Iyf���@Jy<Wy�@K~6�1�@L�S�R�a@M��Z�-        ?���T���?�����5?�	`yҼ�?�^�6��?��y�_�w?��V��?�l�D@ �P'��W@����@�"�|��@aB��@&T�x .@L��uF�@�xK��@!]d���a@$2�@&�j�&~@)�_����@-	���`�@05����Y@1��s��7@3����@5�`�)�@7����y�@:	�Tc�@<GrJf@>�_���@@�_`�g�@A�M�R�@C<�1@Dm�z�~r@E��#0�R@GD5�ȗ�@H�lMv��@JJ�8��c@K���ј�@M����@O.TQt�r@Ps���x�@QV���5@R?xV�@S.c��D�@T#fc@U���@V����@W&�Ii�w@X4c=m@YG��v��@Zav�\n3@[�$�(@\����@]�ǈ�T@_��FI@`bE��l@`�q��V@@a_���Z�@b����@b��ݺ/�@cX�aܔ@dP*GV@d���� @ek��c�@f#.$e��        ?gHiei?���\�m?�Mcb)i	?��?x��?���DEY?ˏ,� �?�ٚ��r?�q�0s�?��N%?�&?���]^u?�]�\�?���ޝ*?�PF����?��Bc?���y)O?����Y�+@8��}��@��s���@ 1���f@	�u�X��@��O��o@�4��;Y@T�d��H@�|j@V�@�^��	"@gG%�i�@<!|@"�8��@TMh;�@%�O�J@  ��?�!@!7R�?�q@"V�=W�@#~��
�@$��u��@%�՟q�>@'*�ke��@(uP�X�@)���1��@+#x��@,��M��@-���H�@/g�,[P@0q�l�T@14S�x�@1��B:�@2ŧ8�V8@3�~si��@4gpi��@5>z����@6�j��k@6�ͫ��@7���q@8�eT��&@9�ī�j�@:�-F�%-@;��ew�h@<���>�@=���/�6@>���-,@?�o��Y�@@GqU.@@�)�N��        ?e�vF�yJ?�6�n+��?��W�B��?�|E�)�C?���w6?��i"w��?�T��|��?�����4?�����j?�)%�r@�?�P)�-?����UH?��-S?�BJ�@����UE@�㋕I�@3i�K�:@͌�ӱ@�N�ݱh@�L<�H�@)��İ @�~9���@Ae#�$@�5�'�@�����@ ��#W�@"VkDON�@#��.��+@%�Jn�:L@'}�zG�.@)]"���@+P\Ԭ��@-W���Ei@/r�y&��@0��%V@1�0Q]@3�� �@4ThU@�Q@5�vCU.!@6ް
�C�@83铱@9����۱@:�����@<m�RPt�@=�'��J�@?r�{�(�@@�h��X@AP��2�o@B#��[@B�K#t��@C��-zl@D������@E��Y�ma@F��ϴ��@G��"~!@H{��Ij�@IxAO]��@Jz�y�h@K�*�@L�h�&��@M��p�}@N�~"lQ@O�X�կu        ?`�<�fK?�҉Q��?�|����?��Sd�C?���[�?�`�"jLP?�ZJ�!?�!%��L?��J"��E?�P��Z?�&Fv��?��G�qt�?�D���Ev?�-C����@ �=��C�@�E˞�H@-�кi;@
�L�OP�@���ގH@���g8I@�
�*j@B`Ɲs�@�Ћ��@��( ��@����`c@ ���srH@"���aJ�@$N�	%.�@&& A��@(�88[@*��H�@,8��y�z@.o �&�@0^��.Y�@1��\�@2�X��1�@4)��Ԋ@5u^�b}@6��T<�@8K7�N=@9���8��@;Sk^��'@<�!�>@>�q��q @@�B<Cq@@�[�ɹ@A�;]<p@B�N?�h�@C��@�<�@D�<��#�@E���C:@F�QǤ�X@G˸(NN@H޷�x*�@I�V�{@K�9��@L?�S5��@Mm ���@N�]�S�V@O�[�}�@P�
ѹ�@Q3H|5��@Q��Ȯ�        ?�2�,8�L?��ۗu�?�#��|6�?۝!#�a?��r�N�?�yy-��?����{I\@7��Xx3@�<�@0�@s�v��j@�.���.@���@�H@snZ��@@ *��$�%@"�4��Ȃ@%���Ǟ@(�;���@+�N��0 @/]��Fj@1��.i~@3iA� H@5k�8��l@7����D@9�(�$�@<�cҺ�@>i��G�@@r�,�@A����	@C�ͬ�Y@Dt$�d@E�^+���@GZ4���@HޒA�`@Jnd��X@L	��*�@M��/0�@Oa�>���@P�W	���@QsR�@R\�2y8R@SK��B��@T@7�� d@U:��@V9S��+m@W=�W�x�@XG�D��Q@YW>���@Zk�S���@[��ga�~@\������@]�A��rv@^��>Pj�@`��|_0@`�Ƀ�26@aGV��@a�t�j9y@b�!�w�@c,Y��]@c�����@d|h�N@e(;}vo @e֓�e�@f�o��%        ?Y>��z?ՎD��?��f�l�?�ﭧd�B?�1�nu}?�����=?�^�

?�0��t	?Ձ�r6�?ۢ����1?�J!��?�+L�[��?�t�(* �?�&U+?���Mb�?�`�-61?�Ub���?�}�l��q?��2�U��@ �(��@�Ύ�/@���:@���ץ�@�F�i�0@!�t��>@� �7eA@
�d�k@Lxc�H'@��75!�@	�Ȟ�@{�Z_Uo@����Ľ@�%�{�>@d�\B�@�U{�@t�M�.@3$�ZA_@ ~�A�}@!j�>�fU@"\���@#T�Q+VU@$S	Ճ�5@%W���o@&b6�'�'@'r�x�r�@(��S-%�@)���ͅ[@*ɿu�d�@+��^t�@-!��|�f@.V�M��@/�k|�+G@0i�ȳ(@1g<Y��@1���&p@2[�<ę�@3��%@3��H	h@4h����@5p�	O�@5��ph@6�lV�7@7L��fmE        ?[�[Ca�?��IF�uP?���!*?��3�yk�?�Y��hT?��y,
�?�węG�?�m�;�?�NR)�֔?�]'i��%?��TY�W?�CL ��?�B�I��?�Y���*Y?��m��i@ z�?b@A'j�@H�a��@	�f|c�@"/��@{3�_k�@������@�ΙB��@N��<S@���E�R@(�g,��@��\-{�@ �Lh���@"tǑ�O@$�[i_�@%��P�P@'�<���P@)X}��S@+B}�=�@-@V�u�@/R %��'@0�����@1��6�-@2��V��@41it��@5lh�EKB@6��'U�@8z�
��@9[J��5v@:�NV��@<-���o@=��6CS%@?(�~���@@Z��ύW@A&Sxd@A��̹�@B���m�@C��w�s�@D��m�@El���b�@FWuX��@GFu�!��@H:��M�@I4�#S�@J3=�fU�@K7�C�@L@�H@MN�z��        ?[�Ȳ��?�2��]�J?�7��,�?�H��[?��@%�?�36 b�?��&۪y9?��E����?�Q[l:P�?乀�М?�v$��?��5h�tJ?�����s?�T���b?�wEfe�@�bRiv@šk'�@-�F��@�oY-�e@�$��@�7�W;l@�й��@z��;ei@ea�2�@�|���@�t���@ ������@"o��j֭@$���Z'@%�k�P@'��V�@)���Q�@+�a\9@-�v��7�@0��M6�@1.�5�@2`��˭@3�(��(�@4�*�cdh@6;�,�!?@7�Fȱz@9z2e�Y@:���2��@<e�/�S@=�2��`@?/�`��@@k��9{�@AE����@B%��R_W@C{���@C�oR�m�@D�p�G�@E�K�op@Fߦ�w��@G�����@H�1�#�)@I�����"@K#6���@L1���(�@MT����@N}s���^@O�W�x�@Pp�z��        ?�I���-=?���tzZ?��.�D�?ʹih��?�/_q�t?�2lY��?�a5����?���lR�?�s^4�a@����C@���/�@�=5�@���k�*@�1ޣ-@"+LE=�@��# ��@����@!n�E�i@#�!@&'f@]@(��P��@+(�s�n}@-�(	�@0k%���@1�C��@3�{�u��@5/�����@6�5�Lu@8�3�@:�&���d@<}p�$�@>|����@@E��6@AVG�Ac@Bo7wY��@C���XT�@D��5��@E����f@G'��(�A@Hj܀� @I�_�@K
4��@LfQ?2��@Mʮ�?�@O7CW8�@PV��o@Qx��@Q���x5@R���~5@Sh c�aW@T6�X�r@U	Lh�B@U�۽�}s@V�a��YD@W�چ�,�@X{B�EI�@Ya�KT�@ZK�WZ�+@[9��")�@\+����&@]!ћf�@^����@_h��        ?d%%@)�?��\�E��?��YH�Y?�NH$?���q?�`�a�?�?��H�s�?�7�����?ޔS\�?�g.��+?�B��΄?�"�/g�?�٘�8?��b�׸h?�Q�B��?�	��!�@ 2��&�@#�cqOe@f�a��@�7��`�@	S�1��)@���c�@��F�n@�2�*��@d�/���@�����@�q�(J�@c�hD��@0u�`�R@�
@�Y��L@�����@ ����Y�@!��-F�@"��*Z(�@#��\�7@$��Y(@&-�&Q�%@'hc�X��@(���j��@)���X�X@+K�Ḻ�@,�|�G�@.�g\�@/{2�gD@0x��9>�@17�e_a�@1�5_Y�@2��xo�H@3���k@E@4^��Ъ@52��	E@6
��|U@6��~D�@7�z�f�@8��>��!@9�O�]��@:��+p�z@;q9&C��@<e�k@@6@=^(s���@>Z��t'�@?[bG        ?`��,�?���X��?��I�U
?�����?��,���?�\�1��?��agݲ?�Ǎ���?�(���.?�<A�`4j?�'���?��ڶ��?��2�פ?�&b�?�󖥨N@@�U�Y5@� ؚ@�*��!@����@�O��?p@Y�Ҳ�d@tM<�h�@������@?:v��@��f���@=)�jQw@ �7@!{cA�"@#���]U@$�9Np[@&M�	�8�@(�+�<R@)ߴ�ն�@+�O(@-�Ӿ�f�@/��Z�:@0��jr�@2�Ȏ`�@3'*��@4P�%�@5��2;�@6��T�r�@8�ʼ@9T��-��@:�W�r@<�D��@=z7�N@>�M�c@@6l��C�@@�7S��@A¾2�3V@B���T�@Cb
��g-@D8����@Eh��v�@E�Ħ��3@F��E��@G��q$:@H���x��@I�&��@g@J�~�ZO�@K��E���@L����K        ?_'�!:�!?�;8��?��N4b�Z?�wV*�X?�w�)��?�<��P?вd�jg?׶�=��?�#"Ŀ9?�<,�}��?�1/�ꩫ?��FlA?��p�4�	?�JE��?�)+���@�3�6.@��n��@�HU2��@my9��!@1i&��;@��)��@��JF@1���/@���Z�@'/cJH�@�ȳ�7@ g^�+�@!�K\�@#�Ŷ�Bt@%6�Ԋ`�@&���\��@(�ݺ#��@*��.r�l@,����@.�\ڍ��@0x��}�@1�����t@2�~�f��@3�rN�u@5,-��7�@6s:Ӗ�@7�i<���@9 1�Z-M@:�w	��@;�?��w�@=r��� @>�t�;)@@Dv�|./@A ��-@A�ڈ���@B��R��@C���Fb@D}\_"�@Ee��E��@FS���@GE�"@H>*�-s�@I;�dY�@J>��_�h@KG�WV�@LT��T2�@Mgč��o@N�3�fV�        ?�<p�"�?�KЮ?��?�H�+�~�?��a�%�?��p)�q?�}�x�G�?�bK� ?�b���ʜ@bjzi�@�TZ��w@����U=@����D@�	�'�5@��	�Ky@�V�/[@!��	��@$���݅@'?�B�\�@*+>J��I@-C��+	�@0D��A�@1��V��@3��?�@5�M���f@7�9:_|�@9ĮS���@;�����@>/,Q�QA@@C��`r@Ay�v#Z�@B���ն@D	�a�@Ea����:@F�S��C�@H4T��Q@I������@K4#ɹɧ@L�����@Nae)�$@P0f�(�@P�~�s@Q�ng��q@R���(��@S�+�H�w@Tz��m��@Up_���7@Vka�Q��@Wk�!�B@Xr*�M�q@Y}��h�@Z�/mKVG@[���c}@\�0�4�@]��� @_
�.&�@`�k�g@`�\A�.@aO�\��|@a��8\�U@b���z(r@c1�}
�@c�ֈ6� @d�ili�1        ?b��Gd�;?��A�'�?�_�⑿7?�Ӫ�-��?�C��e�?�ؽ�>�w?Ќqu�ś?ֲ��"��?�ވ�j��?�9�[i?�G;�?�wg��?�(�C��?�4b7��?�~�A�mK?�o��?��^��@i�����@����@ʅ)/ц@(��V�_@
�wX4��@@d���@�y1�Z�@hLIp4@��4@l>b�@�6Q@��D5T@a3q�@%x��t@�8|h�H@�W��3@ d]� W�@!c$Y]�@"h�e��@#u��n�@$�t3��@%����*@&Ń�g֠@'��݈�}@)ǝi'w@*R��j�`@+��6Ob@,���*�@.|�Ɔ@/k�s�@0a@#�@1�ykZ@1�5�A _@2v�9=�@3-���@3��Rg=@4����g�@5h|��@6,F���,@6�s��3@7������@8�ɭe��@9Z�x4�@:.̝�k@;r\ir@;�	�^8H        ?`�����?��Co��o?�Q;'3� ?�10y'W?� �M�(;?��3���?���E��?�J?D�*?��	q<4)?���M��?���]���?�sD�I?�r��=CV?�񇚳�?���u��@?Iv@I�I�}�@�^��@5�nkvP@UP�k�@%�nz��@d"|��@������@W5�uG@�(�'�@�>��>@ ���"@"�K����@$>�����@&UaD�@'�_����@)�WrS)@+�t�ؔ�@-���E�c@0	�<E�1@1,��M�@2Z�(���@3�C#��s@4�!�%�@6)w�ܿ�@7�W�]@8��te�@:_�\��@;��WV�p@=i�"��n@? ���
@@Q6`Gy�@A(br%:�@B�ܾ��@B�AUp�@C��	H�@D�9qX�@E��X�1_@F�j ��@G��!̠@H�Cx�T�@I��4�@J��k�@K�=���F@M�^��@N>!��3@Oj��|p@PN��.�|        ?^�h�?�F1��,�?���cL�?����T	?�T�j�?�����!?�%KC]�?�kI��G�?�n$Wi�?�� lg?�0����?�e��Gm?�Ã!>�f?�\Q'�X?�}.3/�@�U�0@��֕�1@	���F�@��T��@g�v�@�����@����@U���<>@�6 �M�@�`N�Α@����h�@!iͪ��@#����@$ɦ���@&�yL�V\@(��
��@*~��_@,��U�@.�����@0��xI@1������@2��W2�j@4'j�&�j@5v���6M@6Ѭ5O�@88|ZV��@9�'N�g@;)��E�@<�8�x@>J�h� h@?�/��@@�ܲh�@A�+���@B����@Cw�	�@Dg�����@E]$e��@FX�L��@GZ�_���@Hbׇ��@Iq�6�c@J�t�!N@K�a�@@L����"}@M��
��@O*��(�@P$X�޽�@P�=��6        ?�����'?��퉂��?ä�&��?�<%�j.?�R����?뢺�e��?��1�fK?��z(b��@<���@MЏ�r�@&���@�y��^;@.��+�C@��&1��@!�׎2�@ �;)�p>@#+�6��@%�� I��@(g�̳�@+@R=Ǯ�@.A����@0������@2\� �@4'Z�kJ@5�Y�]Q@7�hZ[�@9�p�:6�@;ġDrt-@=��D��@@���@A'�:C�@BQxb�V@C��`Z�.@D���@F�,D��@GUSN�q@H�bp�@J��Om�@Kw?2k��@L�כN�@Nd��3%�@O��<Q@P����U2@Q�,ʍg�@RS��Mv@S'+��V@S�K;�
@Tٲ�$?�@U�9���|@V��s�A�@W�y��@Xp��@Y_�����@ZS;am@[J�����@\E�LA@]EY��b@^G�K�;e@_N����@`,�L,@`��`�)@a<((�V@a�C���        ?f^��G"?�m����?����!�?�8dϫ��?���y��w?ț�R�?������?�l	ˣ�?���ys?�}�j��?�w�C�,?�� Ns�?�n��	?�ښa��?�r�vii?�Q?�G�@ �[Xv��@�v�(	�@J���@�æ�YJ@
g줳!@+d�c�R@	�^�@�u��@$�k�@��M�\@��	0��@Q�%۱E@.�B�E�@)�+�H@q��@ O��a@!(���y@"C7��x�@#fg��t@$�r5A��@%�\�F9�@',GH�@(K䢅�@)��f%I�@*�A\"�@,U�I�s@-���@/3 ^�)@0W�W���@1'<^�@1����@2�\��iu@3|�Y�@4PK$>@5(�����@6���p@6�= �C+@7�Yz�!@8�)��6@9����	n@:���2�=@;�ӡ9�@<�i�'@=�T���
@>��\��T@?�
���@@Rw[,@v        ?^6�9*=?�ė���?���|��?�Ν].�?�!�4έ.?�HSf�	?��[��P?���У��?�V)C��9?�c;�h?ꔤih�?�W��Nm?�9�{o�?��X�if?�������@��1]FJ@}���*@���]�@.�Z]Y�@�,��L@~���@�����@�>��=@k����@��k&�@ǁ���@ W���)�@!��y>s�@#y�m���@%(AF_@&��)}@(�5�4��@*�ĮMi@,��PxZ�@.���˝�@0rn!(��@1�NsFj@2�j�X��@3��!jE@5'pS7��@6ne�u�@7���@9M^���@:�H�Pq@;�Sr�@=lam�L�@>�%�@@@�%��&@A�
5b�@A����f@B�3�	��@C��\Ń@Du̇8�[@E\�qӆ@FI`Y�ep@G;YW��@H1�\���@I.("}(�@J/�;340@K6R
�@LBL���L@MS���b�@Nj�C3        ?g{�ǀ�?�c$y?�?�[�!{�?�6�oo�?��{+�h?̡�2?U�?�8�ۧ��?�ʧ��L�?���>�8?�#�m��?�]�j�"?��V��H�?��T�#�?�)�j�Z7@޶/Ae�@�Y-�$@E��38�@���8�.@��!s=@ �!<�@?�N�*@�1�G�@0�Zt>@�{(�p@����n@ ��1�VZ@"sS-��@$#�3G@%��s���@'��A��>@)���v�u@+����U@-���W9)@/�<d2֡@0��c��@2B7 ��@3D�@*@4}W�_�@5����@7�@j�@8c�����@9ĳ ok@;/�ǘ��@<������@>#��is�@?��>D��@@��rj@Anx�Se�@BA�
�@Ce�kr?@C��;{\�@D�'���@E�r��+^@F���yI@G���&@H��H�@I�����8@J���7@K�v��&�@L�I� �@M��c���@N��7x�@O���3        ?�Hh��U�?�Z]�:��?�e����?�߇r���?��_�M�?�%쩎��?�i}MVf@ ��^�I@7� q+@��]*�@��ᨧ@����	@������@+̏}�{@!��ަ@#����@&w�[2@){�/�*�@,����h�@05k�S@1�dBF�@3��!���@5�e���@7��/6�@:9>q+3@<I�/H�@>�u�u+@@�+e�B_@A���@C.��u�V@D���($@E��~r��@Gv ��	@H��6-h�@J�B�$@L*�Ti��@M�-ȋ�j@O���a@P��2E��@Q����e"@RyV�I� @Sl<5�L@Td�PŨ�@Uc<�OR�@Vg�O2�@Wq�H��@X�����@Y�����@Z��"q.�@[����d�@\�6� @^).Vk�@_[�����@`J)0bAm@`�="�K�@a�,5P�@b/�7Ϟ&@bז�};@c���@v@d/^<�gQ@d߀�-��@e�uPh*@fH:=�yL        ?`�H���?���]@�V?�U/�`~�?�-jT��?�v��?��͓Ԍ?�K5�-6?��M[�z?�dB� �?��.���S?��	l?频��S[?�q���?�#
<��?�%�m���?�cݪ���?�ݷ��*m?��!�L|I@�
�G)K@�E��l@>�:o@]����@
�Z�gUN@Zv��O@�#u@@f�)̹@��"�L@[��0�:@���g>@�s�t+�@;^�Q@��А��@�~t�~@�l��@ Eh��W`@!B���@"FN!p%9@#R>aȶ@$eA�]�B@%����G@&�O���@'�"�J*@(�}�[1@*6^���1@+v�,�K@,����@.j�Vh@/d�V�E}@0a��@��@1n�A�@1��PCu�@2�(�I{�@3C ��o(@4{#��@4ɒ��0�@5�B�;�@6^��#�@7.X�R�M@8��3E�@8؋�<��@9�ݡ�}!@:��U���@;qѮZE         ?]
�-�$?�T��߅�?���&e !?���bZ]�?�;���ڈ?ď��(y?��S��?�+}����?�PO�ұ�?��Jz~�?�[���?�*�!L��?��C�z�'?�'��ƀ?�� ^C��@�*T�@�q�A@>�ܽ}@
|-���0@-:�\��@]`!�@4��(�@{��QN@��c0�Y@|z~��@6�\^@ med�@!�QCS�@#*Z/i �@$׺�@@&��?�VE@(pD��Pn@*[��Z �@,\\��N@.r'��0�@0N����=@1o))�@2�2�n'@3�K\8(@5]���K@6]{��H�@7���?��@9�Յ@:����'�@;���9�@=��Ѓ5�@?��?�Q@@VlC��@A)Ɣ���@B�9�H:@B��C��.@CƵ�B�L@D�h��]@E��c�@F����3@G�x�y�@H��{�<�@I���l@J��3�,�@K�K��*@L�	�ʳ�@M��u���@O%�ڍ�8        ?a2~�P�?���=	�?�)I�yL?�٤��B?��ivG�?��0��p?�ޕmu�?�+z�Z�?�ZTv��?�eQ�:V?�@eD�a�?��F���?����l0�?���pL��?�� �@��@e�ͼ	r@47�A@@9t_v�@
�����@�ڄu@����T@��-��9@YM�{�@_��@0@�B���D@P�B@�O�ү@ ��1�@"Y��1�@#�͟7{@%z�=4��@'$�� X@(���1�@*���_@,���v�@.x���,@0<t�žR@1EJG��@2V�K���@3q �[[r@4�*�[w2@5����@6��J��@81���X@9x5h�@@:�Fum6=@<3@��@=�%野@>鮳¶x@@."�E8@@��a�?�@A�͈�@Bt�P��5@C@H��@D�q)��@D��� G�@E��F��@F��M5��@G{�i��@Ha��˷@IL�x(cK@J<e�)�@K0�	�m        ?��8[I9�?����i?�$9�{��?ұ�=U�,?�U�.+�#?�f��ps?�@�F3?�Ă�J�a@W��<�@�"4
@9�x
c�@�l/cSJ@�@G��@�-����@�m��@��ǳ�@"'�\@$��J9��@')�
@M@)�Ğ��@,�˿hV@/�!dk~�@1����U@3-�_"H�@4�����@6����[%@8�����@:�����@<��� �@>˜���e@@w|O��@A���H@BϾ���@DY��4@EF��H@F�z���(@G���ѷ@IA$c"�@J��:=�@LJԘo�@M�F{�V�@O�;[�y@PQ}��H@Q�r~�@Q��MT%�@R���9At@S�`���@Ty���Q@U\��ҷ�@VDTZ�0	@W0���2�@X!��JnG@Y!�μ@ZX� @[��G]@\���_@]:��s�@^&*��T@_6z���d@`%�<R�@`�E�.@a@�6. @a�5�b�        ?c_����{?�G�����?�_WPȩ?����?��2b�!?Ň�\6?�,�V��+?�e�u瞑?�3�~�L?�6��?�h��{˺?�P�6?}P?�\�x��?�P�5+�e?��n�[�
?���`��4?���`AMv@ �E]��6@�V[ʮ@�t���@u�����@	�SF�F@��(�0>@6�uA@��N_@}����/@Hx��L@�4���@ER �^@�HhdZ�@��O�@��7�]~@x[�:�@ 5O����@!5ہL��@"=ȟ��p@#M-<أ@$c���{�@%���"1@&��:}�
@'�zO��@)����@*Av�u�@+�b���@,�m�i?@.�-q"�@/s�Lx�_@0i6�r~@1�v���@1�О�5*@2�u�@3H�0���@4	.�t}�@4�?ĬK@5���G[@6_���Q@7.+�zr�@8 Ѐ�@8�P\�fL@9�A߭I@:�#_b�@;i��Y�$@<L�Q�O�        ?[�5{|�?���4#@?�㺧?�?��QghsI?�2��.0?Ôw���.?͎;�$?�x�%�?��Q��?�`5��2?��T^y?�����?�����6�?�*� �Q?���~�p�@ @�P�3@�X~.{@������@	=�Vٜ@���_��@D#ͮCs@J�$%J@t����@���u@1u���:@�"RQ�@+��W�@ �i�LXu@"/��@#�tC�l~@%i�`��@'"���y@(���ʶ@*ͦM�@,�Q�n@.��a��=@0m����@1�"�8�n@2�<W�@3�i�oT@4�]vN@67���b@7|�B<�@8�uHw�@:#���B@;�K R!@<�}3��y@>e5R�?@@?�q�p.�@@��[���@A~8#7c@BK�<�D@C��on�@C�M�	<@D�& $@E�w�{V@F��V�6@GF԰+@Hm���9�@I`��lE@JX̶Z �@KUY(P�2@LV���        ?c��L�U?�����+�?�6���e7?�(���3?�C�_2�?�1�t�d?Ӕ�o�k?۶�S�?����G��?课�l�?��AS�?�L( ]�?�2��4�*?�:kۓB)@i�+KRI@��".`'@�~�� @��x��@�ӃM�@���z��@N{f���@͆0L0@w����@MTϝ&k@OD���@!>�2��@"��s�&g@$�ĝ$��@&���K�@(��I��@*���i��@,���oN@.���^Y�@0�
�h@1�#?��@3WE�v@4`��Dߞ@5�G��+�@7 �K�@8�;Y]΅@:�2�LB@;�*�x�@=2��%@>�M��R�@@C+��z!@A!i�9&�@B���H@B��:�@C�o66�@Dؿ���@E�1L���@F�㍯a�@G�� ��&@H�	*L��@J
|��+�@K'0.ʢ�@LJ#9 ۋ@MsT��K�@N��|��@O�mc���@P�(�5�@Q+48��3@Q�Y�h�5        ?���m �?��^P�[?�}��L}?�dr��&�?ᦥ��"?낚ٕ�D?�������?�_Q�A�@����B@�x8F�@�uݽ�b@��X��c@��xo�5@�a�X�@�!���@ ��xA�@#
����@%�;"k�3@(FbnɆ^@+!wk��@.$^�+@0��L苌@2QAV�6@4�Y��@5�c����@7ſ�B��@9��5�@;˴O�ݺ@=�%�~"O@@���J@A3Ʋ �y@Ba+F�S�@C�1����@D��<��@F"�~�@Gv�+��@Hӭo�] @J:-���@K��~�W@M#<��@N����@P����@P� Z�v�@Q��,{@R����[�@S]����_@T:?� �L@UGk8�@V ����@V�~�@W�є�u@X��'�F@Y��\Z�@Z�����@[��6�}�@\��[��@]˟�o @^إ�P|@_����~�@`�r)J�@a�\at�@a�����@b-'�֮        ?b��r�O?�E��l�?��{��Fg?�J���.?�T녥��?�#"1o�?��0�?�	,�jW?�~�-�>?⒏^7;A?����?�$�F��P?������?�݃�]�?�"���'�?���Sg8?�l-ظ��@7��}%�@X���.�@��*��1@��cd�@
ud�l�@�k�Ő@̶0
�@R�+M@�u��i�@X�1�A�@�%ΡT@�=�<@P�c��@v�ш�@����K@�\WmK�@ ]�~�W@![��mjY@"a�G��@#n�A��@$��t�4�@%�`��	N@&���X0@'�a�&��@)��_�@*L�c)s8@+�l���@,��>�� @.5g��@/h(x�K@0_���-@1JT_@1�zը�(@2w;��7�@30Fѳ�@3옒<w@4�-G���@5ok�@65��`@6�U���\@7��I��@8�u�<p�@9mG48"�@:C>Mv<�@;U�~�s@;��j�,�        ?`�k�W?�b�p�?����ܤ?�ɬ|�?��H��?ƫ]afp?�x��?�]EE�b?��i���?��7�m>�?�1�Rq�i?�}pR�?�ɐ�=m�?�e��:�?����`�@�2Aҕ!@�NR��@	&��!i@ۻ��� @n���Þ@�����@�*)	0@\X���@�&���@����H@�����8@!j�;9@#x�nY@$�c�h�@&������@(y3�!{�@*s}��o!@,��Hv��@.��)n�@0s�ksO�@1��hG@�@2�T�'�@40[$1@5`�5[�@6��-	J�@8b lq@9����h[@;15�]@<�`W'�@>!{��{@?���*�@@�҅KK�@A�c�Ǣ�@Bs )�XR@CZ��}P�@DHj�VTc@E<@�|�L@F62�:f>@G6DB�º@H<y��	@IH�fAD/@J[b
�	�@Kt,�@L�f)��@M�=N�@N�kI�q@P
��m�@P��g��+        ?`�p��5�?�.�p�?��	���?��u�]�?��Oy,.?��,$�?�I���h}?�~Ŝ�L�?�`�8?��bJN��?�޷q��;?�f��q?�So(��?��w}�I�?���@/�@��Bl��@�vo/-�@m��l@������@E�i���@��U���@�I�0?@ v�9<.@dp%�!�@�����@�~���@ 0`߶�@!�����@#1� �@$ˇ��
�@&w�J�So@(5�5�2@*�1,-@+�[���B@-�2T���@/�s���P@0��8U�@2
�l}@3%��⺇@4J��@5w*"(@6��~ؽs@7����@91�)�f�@:� ���K@;�!��7n@=9����O@>��"��@@
Iw���@@�j̎N�@A��n�7@BNz��S@Ce�7�@C揥���@D������@E����y@FjpM&��@GI|��@H,��w�@I!����@I���wJ�@J�h�S��@K�>��ʓ        ?���Σ�S?��l�XM#?�-���<?Խ�mxS?�doF�?�MaOW��?��Z�F"?�S�w�Q�@��n��@�vo�bl@ЈM���@/I"�@ˀ���@��L�$@E�;@!N�攍@#��h)�@&e����@)/�{�'@,#_2!1�@/@g�@1B�"m�@2���o@4Ń1軆@6��p�@8�rt���@:����%.@<�� c�@>��(��W@@�G&Z�@A���,y@B��5c@D1ÓWK@Ew�& ([@F���A�@H!�ℐw@I�;8*�@J�6G�@Le9�1�@M�'J|.@Oj�V$g@P}���@QI�?�SS@R���.�@R��e��@S��W mu@T�:::�@U��L<{@VrK�K@W]{w�T@XMKYD��@YAq��۩@Z9�0C��@[6�����@\7�71��@]=�{�0@^F���k@_Tc����@`3.y�.�@`�AEzna@aKf�
��@aڛJY>f@bk�#�Y        ?h��2i�
?��ҵ���?�!t�J]?�gf1n~?��-�?VH?�6�HN�?ә��f�?�Ų�YD�?ᏐOӖ|?�R�I�?�@��{�?�ͻK�C�?����3?��#Ǥ�?�t�Z]>�?����F�*@�j�@\�V-�u@�Iͦ9�@	���T��@M6w.m@<���Y�@(�'ۗ*@�+�K�A@tM����@5��`V/@	�����@�{��M@�l��}@��5�R�@ 	Dbv�@!!T�s�W@"B��z\@#l��0c�@$��
uRc@%�O�C�@'#0Id� @(r5�p�@)�[�� �@++�p��@,�	;_�@.	�D[�@/�+z-c @0���E�m@1M]Z��@2T����@2�שrr�@3��۸͹@4�}���	@5v�CҴ�@6YE����@7@sQ�^@8,%��q�@9]A`@:��<H@;
^�E�Y@<+.�2m@=
��d�@>db@
@?��QJ�@@hy�@@��L��u@A-7�r*        ?c����l:?�ߌ���?�aH�>n�?�K�Td�>?�Y���m;?�F��>��?Ӛ��(�e?۲< g'U?��GD��5?蘧aĥ?�er���?��䂳?����9?��+gs�@BEN-m@N՚à@���*R�@K5�W@>:�wa�@��B���@
����@}��D@�h�e@��M �@�	>�@ ��U��@"�7�E@$W�T}�@&(�AZ��@(�Gؙ@*�l��@,"q�JUD@.N��C@0HW4��@1uH��k<@2�ꌋ�z@3�M���=@5B�U{R�@6�����@8�`��@9z�Ǝ+@:��԰}(@<�Yl^&@>�s]C@?�/;t��@@�����@A�$�l�~@B}�"��@Ch����@DZ���@EQdɧB;@FN�o��@GR�:�D�@H\�ʔ�@Im6< t}@J��cM@K��`��@L����@M�9�`2C@O��7@P)z�c=�@Pǣ�W\@Qh�e        ?f$�M��?�_�m��?��W��?���DG�?�p;����?���^_h%?ԘZ�8ȹ?����㯘?�v�R�ZK?�_�?��?��]r*?�tlk+?�m�*?�Y���mg@f�O�d@fB��{�@�t��@:�{1��@��K�[@��,��@ї���c@.�F@�'�B�@^R���(@1"Q���@ ������@"'\VF�0@#��7EM@%� ��@'U��	-�@)8��e:@+0��Z@-=���ge@/_c��z�@0���0�@1��&�@3!���Ǖ@4\����@5���,@6���@8O&r?��@9����=@;&���@<�ީ���@>)�`	8 @?����9@@�w��h�@A�w1���@BY�g�!�@C9 eN�@D��3o@E�����@E�B�7�b@F�l'9�@G� �.��@H�a��@I�.{�@J��H"�@L	iq8� @M�K�ym@N;�հa@O]E��M�@PB!��        ?��KX��?�y���Y?ˌ <.�?��k���4?�	�$¦u?�,!�N�?��D�k}@]����@���"-@��4X�@�@@@.��`9@�� 7�@ U�R�Vw@#T�7��@%�E孅�@)W��@,O�?�h�@/Ҵ|��.@1�p.?��@3����h@5��1�@7�G.��g@:=��
p�@<�~��
@?s�N�@@֒#�q#@B.+�Y@C����&*@EPm��G@F��;�@H���L�@I����@KM����Z@M u���@N�^;1L�@PF���˅@Q3��AH@R'>��@S!]}�@T!�S�٭@U(��H�@V6{_1.@WJJ?^@Xd�6[@Y��^� �@Z��Q���@[��3�H@]9J��@^J�3�L@_�Q���e@`i��4�c@a��w��@a��sF�E@bhkiv@c(kz+�@c�w�ߦ@d�Jn���@e>����@e�I�$��@f�'��Q@g�nJ��@hHQQi�        ?d3���?��p]]�x?���[Pɗ?��}��?�S��J+?�d]��?ѥ�\-�?�3Y:���?��q�6?�SQ:u��?�F���U<?��wگb2?�m��9?��
�-w?�U��?E�?�5<�0�@ � ����@�#��W/@@�W@��#խ�@
a�����@((~�@	bu��@��ֹ@* 1��@�M���c@��:\�I@a�Mf�@C�#�@64�$;@;I���9@ )&���@!=��[?@"[�/1@#�i� T�@$��Y�l@%�T��@'*C���Z@(tq13��@)ǎ�}�#@+#��'g�@,���'M@-��K1��@/mW<�q@0v�
I�@1:�h�I@2�+���@2��s8�@3��fP��@4y �x�@5S����K@62�(�@7�U���@7��*rʞ@8�M1m�I@9�ddu�@:���i��@;���@<ʉ��GE@=͎��,�@>�Q3\@?�^�Ba@@x���g�        ?f$���;?��N�N(?�	����d?���r?­���z�?��C���?�2�� ?�=��?�.dz�?�#7!BG?�|x���?��4~�L?��@qP@ ��� @F��ro@c�J�\@
:<2_@��y�ȯ@t��d�@k9VuV�@�A-��@��M@�@TE�"ז@Oc���S@ ����ݩ@"ff��@$(t��m@& ��dc�@'��TH�@)�����.@,r��@.O�z�g@0O���f@1��jg�:@2��!?�8@4fC�L�@5i_FX�l@6����@8@�3 �n@9�FP�	@;Jj)c�@<�8��.@>��Y��@@�C�@@�m�F@A��\j@B�p�5{f@C��9��q@D���O�@E�^�@F�� 4@GɃa�͛@H܏�F�@I�1��		@Km�� @L=G���>@Mj�e<�@N��ʦ3@OٯbY��@P��I��@Q1�����@Q��f:@R��?�:�        ?^�d���?�tՃϜi?�'*>?�$0S���?�+����?����Q�?�7s�\Z?؃I� m�?����j=?���NZ�?�H�`�$�?�&��;v?����v�?�p�"s��?��NJ��@��Z��@��ES��@	+Z��B�@��ϫ|@p���n@��H�k@�.Q��@`ng��@ ���_�@���@�=W2:�@!n�#K�4@#����@$��%5p�@&���@(�%�]a@*�{�=�@,�0+��@.�p� -A@0~3�j��@1����ʘ@2��I)Ѣ@4#[[��@5qC� f�@6�0�r[@80�{<�j@9��I4��@; y:@<���<�@>?BӮ@?�a+�@@�w�c6�@A���%%@B�ȻT�@Cq/�!sk@D`�=�GN@EV��~y�@FR�i�@GT��?�@H]�EO��@Ilt^��"@J����Z\@K�6w�(@L�H�z@M�\a'��@O�s��@P%~�G�@P�0�e�r        ?��׬}?���ȸv?�o�.`X?��K����?�FX��?���Ԑ�?�c����@ �����@2�ֲ@#�� ;@���^\@U��ö2@�*�R|�@*h<b�@!�V�@$Gv� �@'+�f7�@*A����j@-��Pb�@0���d@2X7�-U@4Gv�}��@6O�8@8q:$"��@:��PyI/@<�\��;@?l���@@���@BHLu"ke@C�9,i��@E���e�@F������@H2"�m@I�I!��U@K+�g���@L�-	v�W@N�����C@P#�=&@Q
1A,�@Q��DnE�@R���Z�@S�xU��@T�*'0�z@U�*|Ӫ�@V�y�#k�@X�bh7@Y!ç�@Z@GY���@[e�/L�V@\��c�sS@]��O�{@^�\э�R@`�#i)�@`���@ae����@b��c��@b�xk�C@ci� <R@d���S�@d�
��H�@e����R@fE��@g��2<z        ?dQfH�N?��oP��?���?��?��06��?�4����T?Ƶ����?�h��2f�?�z���&�?ݒ��x�?���"���?�kٽТR?�g��?�O|�"�?�Lx�9?�n;D���?�/l�CU?��>B��!@v���2e@���TM8@�mc���@`��K@
�׿Tr@�R�˞@:zG��@�Y���@>¦���@ٯ����@��T�@@�lhC�@P�,�S@�t�G�@�+J�z@ԣ@�_�@ �7g�@" C�[�@#tz���@$6ų^�E@%^46>�@&���'�[@'�Yo�l�@)	^��@*L��)!�@+��TLV�@,�l:��0@.TK.��B@/�/���b@0���*?@1Q�et��@2�J�J@2��[]�@3��O��_@4i��AL=@59zׁސ@6An
�p@6��JL��@7���=	&@8�/��Ǹ@9��<��@:k�ph@;Vj?�2@<E��^t�@=8����@>/ةA�q        ?c'4�uՠ?�=���4�?� �����?��N2�?�,�<�3?�"袑ι?ә|�>Q?�Л\<?���U|�E?��K�P$?�᭠�0+?��m��?����I�?���Bf�@�x�q_o@��*�h�@[%�-��@(:��Z@$��A�a@_��f@�fz�4T@Y��t@��`z@�� �@ $-ի�@!��oaGt@#u��@l�@%KJJ���@'9a���@)@[���@+_�P�Y@-�.�@/���޶@1*�z..�@2mt�F@3�{�ޝS@5�j�E"@6�F[oC�@7��W*�@9|��N{@;�Zk�@<�{w_f@>Wտo��@@���[�@@��iK�N@A�	"{@B���%�@C���'�9@D�KȌ@"@E��1��@F�^�̀@G�bpp#j@H��&��A@J�݆3�@KEщBP@Lt䭇��@M��`DQ�@N�V[ȳ@P	�I��@P����V@Qd� (�s@R1f�$�@R�E���n        ?b2��s?��2��E�?�}r'�!?���{���?��v�^h?�'�W��`?����Dc�?�dV��є?�,�a+��?�y��|�?�>y�r?���7q�?��l��#?�K�p��?�>��,#D@X���q:@S!�)��@��Z�@�˫' @�����@�P�K'@B 5�@a0$^S�@Ϲ�}@b#
,W@���R�@ yƙ�@!�z�H��@#��{���@%0��w�@&��7��E@(�uP���@*���� X@,{4���)@.|���_@0H>� �@1[��{�&@2x:���@3�<(�]�@4͗�@V�@6Mi�z@7H\����@8��77�@9艕[��@;F�J喣@<�ٍ�@>��N&@?��<�@@�E6���@AT����}@B���]�@B�{e2��@C���xF�@D��Tg]@Ez�`s�R@F\�R��@GC��9�@H/�.�@I�r�X�@J���CZ@Kh�]@L/8�ϸ@M�T���        ?���#��?��*G��?ƹF��i�?�!�%��?��s x(�?�&g�?�}�}��k?���đ�-@L� ��@	��״U@�{���@����@{�U-�W@��8�}�@ &���5@"�z8��[@%HM~j5�@(jKǾ�@+"�
���@.U�Ƴ�@0ۃ��@[@2�^ފ�W@4�n	œ@6x��D�@8��y\@:����͘@<�/9�7@?8� ��I@@�C ��@B���F@C]f-�s�@D���~�@FZ�X@G�w�@H��<�E�@J���Y@L �0@M���	1(@OV����D@P�f�c/Z@Qc���@RGp�_�@S1[�h~Y@T ٤��@U�G>��@V��f��@W�QI`@XK��?@Y!vپ@Z2"q��@[HK|���@\c���@]�
��D@^���;�@_כx�j�@`��irS�@a��p�I@a�_4�Z@b^�Pc��@cQFH�@c��-�e@dQ����,@d�Iȩ7�        ?`���|�?�\�H��?�G�+x1?�#���	?�I�ʼ�?Ęw�/�?��Kaj�?Ԟ��G?�:���P�?�gQ���?嬀�hx?�l�j��?�;��'`?����?��g��&?��z�S�?��2��"@ 1('�=@1[<rm�@N��pr@�q̚�H@��"gʙ@Q�z�٦@�In=�@F_��>o@����@�;D�@�X�Z8L@(����p@��[�Q@l�_�aq@"��+$@��)�$@�Y7�2C@ K�L��<@!A�\%�@">g��Q@#A�8n:�@$K����/@%[�LD��@&r����@'�5�v��@(� ��u@)�7��@+�Ϟ?K@,E��W�@-�&�)w@.��ŕ�]@0k���@0��gS�@1[�.)�,@2
Q���W@2���	;@3p�I��@4(Ld",@4�OJ��@5���W6@6a�����@7%��N@7�[���s@8��x��@9��l&̝@:R��U<        ?_<lg�E�?���+]j�?�T�/��?�A�=��?�eL\TŬ?�FD!�I�?��kS�?��p��G?�W�?z�??�d���h?�(��?�by1��?�h���w?��!�ġ�?����>7@L ox�@_!��'@��B�!�@`H5�@(��s΄@G��@���t׽@����s	@��u�=@PN|�%]@8c��Y@!%w�A�@"�&c��@$v�"�K@&?_}���@(��q��@*q�qO?@, �+Ń@.=̤�g�@0:���Q@1a_���@2����O�@3�?��}�@5cO0.@6o���,@7�gm��@9;hRP�@:�'�o@<6�X�@�@=�$Ǧ^@?asmU0�@@�_�L�@A^��u�@B=��%�l@C#y�_�M@DN?�=@E<G��3@E�I[Q �@F�z���@G����@I]1�}@J���@K."��7@LK2�,h@Mn����@N�D7��@O�1Q$�@P2�;rv        ?\�YU��?�&�Ե�?�is���?�m��T�?���
��?���,_�Q?�r����?�y/��H?�
�OK?�.�O�E?�3��Lh?��sqb�?��-�)*?�v��޹�?�j�
,�@�����@�L�f�@9��#�@����@�b�Bc@�1��@�;��o@o��c�s@� �G6@��� �@hG�@ �ys��+@">����@#�
��@_@%���sT@'ey}��@)E�nP#5@+:�-���@-D`�!�@/b���||@0�-���@1�\�\@3���@4W]u��@5�A����@6�ɬ�`@8B�����@9��[A�6@;v�S��@<���n@>�.���@?��P-2�@@��Gy�@Ao�-��@BG]���@C$P	��%@D��]`@D�[���n@E�s��S�@F��`�@G��6\y�@H���)� @IŇ&�d�@J�o�uD@Kگ~֬@L�Cz��N@N)i���@O"^�}��        ?����yǇ?�gWD��?� ��Us�?ұ�rC��?�V9���l?�Q��p*?�����?��U��@�uD�@����v@;����@�㿡�@���*�@�J4,«@{�=t�J@����@"R[Θ�@$�Y�N�@'�=C�@)��ȷ��@,����@/���M@1h��U@3	�}�@4ǻ`���@6��^�@8p���%@:`�[$�?@<b�*�@!@>wUҬ��@@N�ڡs�@AkNI�.g@B���>f�@C��?�4�@D����@F6/��j�@GKF�@H�����@J+:�TZ@K�b��F�@L�8��>@Nn�	�x@O���/�@P������@Q��G�@RKeU4?@S!ۡq�@S�%ٹ�}@T�pK�@U�����z@V��n�>@Wi�2���@XS.����@Y@�͇{G@Z2j@Bs@[(J��B@\"N9	p@] l��@^"���aa@_(�w��@`����@`���:@a)�h�&�        ?\B����Y?���,��?�qf��7?�[i��,�?�Ff�?����p#?ɭ�8�i?���J�?׎����v?�:܎d��?��Qi�#~?��0�F?�@�0�?�h(�+}?�(����j?� �#5?�Nֵzu?���qE@ &�6:�@�˯M�@���b�@/�[���@h�����@
����6�@)bڼN_@�eQ�c=@)���&S@�&l�@�9��w�@ke�� A@�{^F��@�k��@!$���@̖]���@���f�@IT䝠�@ �<q<^d@!|�(p@"p�N "�@#l m�(�@$m&�V2�@%t[���F@&��n�@'�ԣ[�@(�	�6R�@)�/��@*�<��τ@,'�n�@-M�Dj��@.�h���@/������@0�K��g@1%N���@1˧^���@2t��'��@3!n�qK@3�☊�@4�c��6�@55��-�j@5�jJ�(�@6��7[=@7a��
H@8 ���        ?^.*�|W�?�9�Go�U?�^�7P�?�dק��?�����?��t)`e?Љ;- ��?ץ�-� �?�/�BrN?�h���,?�&d���?�M��*�?�T�;�?��r,�?��y�%�?@@�VS�@R��z��@�<G6��@N�,}�v@ВC�@9�DzK@|>X�P@�AXL�g@uf؞�h@-w�$2@���^�@!
Q���e@"����^@$OW6�ΐ@&����\@'��lq��@)��>x-�@+��S!0@-�*t^�@0��M��@1(��%@2SU���@3��i�V�@4���
�@63��=@7jHG+� @8�RD�N@:7Z �l�@;�ft� �@=0}i�@>��t���@@*�	5�f@@����{@A��C6QM@B���N�;@C��j�@Dz�d��@EhV��[@F[ ��.@GS�����@HQ���3@IU2�[@J^\�aC@Km�lf@L�W4Q+�@M�$���@N�{S���@O�XҀ��        ?]�+;x)?�u�x���?��<�� ?���b5?�ߡ�\v?���v�C?ХEw�?׿a��?�9=	�?�k@���?�TA1�?�B�����?�@:�TI?�����.n?���N$	�@#[2�|@,��+h@|b����@A���@�t���=@����@LR���H@�o ;��@7rί�8@�� ĕ@��WVG@ �KAL;[@"t��$�@$���#
@%��ƱT�@'�q��]@)�S�Ь@+��W��@-�	0R,\@/̉�V�i@1�A�E�@2.�@3bF��{�@4�[�2@5�cJӃ@7@gLZLG@8�q[a.�@:���n�@;��0ˡ�@=���v@>��EI��@@���Ba@@�ʚ�|@A�!����@B��i��@C{4�D�S@Dc:"���@EP����(@FDF,,b@G=P�?@H<��3�@I@qb6�@JJ�G�U{@KZQ�+`�@Lo�.sh@M��3H@N�ϳk�@O�Z�A�.        ?�(#�0��?��t5��?�w��'x?�U]�w�e?ܷ�F�<?槞���?��umb?��L�8�?�q�R���@��f7��@m�jK`@�ꦌ3�@�\#$(@<�'���@����@��vH��@ b2�Pb�@"���AU@$�G�	�@'bh��i�@)�mz�`b@,���l�@/�	<^%c@1N����c@2��e�@4���S@681���(@7�'k�!<@9����}@;�Zw���@=�wyB}@?�)��݅@@�.
�@A�{�A��@C�h���@D=��h�1@Ej��ĩ@F�����'@G�4%'�@I�@b��@Jk�Y0w�@K�ʞ�i�@M�״]�@N~���@O����K@P�RH&��@Qkk����@R,C��@R�Ҽ݂@S�6o��@T��Hd@UT|4zwm@V'�5�^k@V�B�^�@W�tx�@�@X�%ar�@Y�N��w@Z{� vb@[c�x5X�@\O\�w��@]>)��S@^0N�QȚ@_%��2L�