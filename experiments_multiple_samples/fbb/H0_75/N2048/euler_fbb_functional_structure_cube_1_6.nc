CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            h/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_75/N2048       alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-030          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190901T142127        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080       ,alsvinn_report.cudaProperties.totalGlobalMem          
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              ?�d˘�Q?�T�$�m?��� �v.?إy��W?���ԡ�?ꃖ�%@?��0��?��7�B�.?�|�|�&@YS�Ev@�#�m�@X@( j�@7<���@)mZ�:�@T�J�@���:�@��"V%@|eu��@�6ە�@Ēh���@ ��>B߳@"7�º��@#��K�@%<	��iT@&�P�	�-@(m�ҹ�@*`�@+��E^@-���~�@/R�ӊq=@0�|��@1���K@2u�°��@3nX��B.@4k�;�T@5nj�$�7@6u��f$K@7�����@8�H�h�d@9����LS@:�z�V�v@;��U�1�@=� ,!�@>*pE��{@?Vb�Y�@@C^��g@@@ݺ��(@Az@_�hJ@B�G�@B��~��5@C\�dT�p@D�BV�8@D��0�[@EQ���ӂ@E�,ͳY$@F�t@���@GY�G��@H�F��@H�k[i9?@Is��R�@J+Ĥ�@J�D��We@K�q���        ?��ezN?���8{l3?�R��@X?ݨs�R�C?�����?��O�1��?�Y����?�yfa5�@%�w��@�	z��@�;�Gю@Y�~�u�@�/j�@�>H(@$��B<Z@�_��2@�@@b�@�2��@!΍%�@"���nV@$b@X}@&(�Y��@'�ǔUIU@)�,�\"�@+خ@�@-����@/�]i@1Pn�d4@2�ag�@3=�$#�@4bl&�$_@5���Ka�@6�~ Ln@7�x�@9;,�'@:�ͳ�s@;��=�y�@="Ff��@>{���Xi@?��F���@@��d�6[@AW�Ȇ)@B8H�@B�\�J@C�|K3�@DM�F{�@E�����@EڋH�ǿ@F�]���K@Gs
���@HC�nW�@I��[�@I��M�%�@JſuD\@K�K)9�@L��e-@M`|W���@ND��(5@O*^�1� @P	�0(�p@Pe��#�@P�s���@Qnˮ�B�        ?��)��?�RQJ7[�?�Aq�St?�P� ��	?���b��?���<�^?�����?�"<�C@3s�Wk@3!)9�@
�/u/fO@>�7}XQ@"��d��@φp��5@��v�@���Ň�@�g����@ ��l%75@"<Q��K�@$��V��@%�&g�4@'��C��@)Ǔx��@+�g�@-�-*�W@0�%oE@1/�Q�w�@2V�l։9@3�����@4��#��@5����@7?�ڟe@8���X��@9��`�86@;<W~j@<�O��c@>�`�]o@?y�&�@@x�ʦ�@A7��Ne@A�����'@B�؍C��@C�T���:@DW#��qJ@E'?��@E����A~@F�;rӛ�@G���Ec@H�X}��@Ih=u/!�@JK���ճ@K1��~g�@L���
@M!��@M��h�~@N�~#�	@O�4O��.@Plt��$�@P�LH�h�@Qi��[�@Q�j���@Rl��9k@R�c��F        ?�^�V?Μ+�F�?�#�>?�\m�?����g?����ބ@�D^U��@	���@i����@�JR@S�pg5?@k�9E@ʈtˍ�@"7"���@$�/���@'=PC9�/@)��.\%@,�����@/��"T$
@1[�Bu@2���a�@4�Hn���@6=��{E@7��䖜@9�N��m@;�L:`Y@=s�,�@?_�,�h_@@�m�e�@A���AE@B��r �@C�]���@D�v�nF@E�D��@GBo
3@H0�?5�Z@IY�E��@J���7@K�f����@L�	����@N1�s ��@Ot�oz�c@P^BT�Q@Q�6��$@Q������@RX�0M�a@S�9���@S��H?�|@Tiv��@UlS:@Uռ�N�@V�b�uN�@WKY5�`�@X	�z��f@X�%���@Y���@ZRp�O@[L^���@[��YXG�@\�={&�@]|\��j@^L`qo�@_���}�        ?���G"?��_�`"�?��� y?�νL��Y?�5�{��?��{�I?��hP�Q?��qZ��D?��C�z@%��2ec@�wqX(@	m��m �@r$�X@ٍp@y�@p����m@�՟q7@s5��@>ZEm�@پ/!H@!Xg�
�@"�e �b�@$Q��V�N@%ޅ&V�@'v���@)�f�u@*��lI�8@,y�j�:�@.9R����@0'���@0�Hv�[�@1�����@2�\L��@3�����@4�[�Qp@5�Tk��@6�l[0�@7ĒA�a]@8ϵ��$@9��-�U@:�H��F@<p���@="���)@>A ��-n@?b�o��@@D;���n@@�����@Ao	w�j�@B��w3@B�βG�9@C<A�]��@C�e�97@Dx7�.�@E��-@E��j��n@F^�`��@G
& @G�(����@HS�^���@H�\mjE@I���N=�@JWD��!�@K%=A        ?��Q��c?�#��6]?�����?޼�qն?�k�ezJ�?��g�?�q?�&�a7�?��((�@�Ȇ�R�@��.�m@	�"� �L@w��V�J@��[��@@=Z�y�@���34�@�cH9�^@��m�@ r$�@!�h�aU@#Z�PT�@%�?��h@&�F���@(؂�/w@*�9�|�@,ΰ�:��@.�E[�@0�����@1�:�s�0@2�u?���@3ڠ���r@5�q��@69^*̞�@7r��B��@8��~L�@9�ߖ@i@;Eҽ�b@<�����@=�$���7@?Q�O�N@@[~���@A2�.��@A�ءH��@B�e��@CC�|��@Dv�w�@D��9@E��R�.�@FYl��@@G%�C�s2@G�*ʙ�@H�m$^U@I�/e���@Jp�k�̥@KJ���F@L%���=;@M߳d4@M�me�v@N�[�J\@O���D&�@PJ8\S@P�U�$@Q5!P�W�@Q�R6W�        ?��G<c��?��0��?њ��|�?�3�Z�x?�����?�E���gr?�� ;�F�?��g*p�@�}�0�5@]8A��@	�~�8~.@r|�C@k�W�k�@���3@��cbO@�^��k�@��y�6�@��J�wY@!qdC�=U@#"��V��@$�+���@&���פO@(��J���@*�rL|1@,�Ks�@.��4g0@0Ye�m��@1o-���@2�~���@3���*3@4ڿ�ѡ}@6\R_}�@7D��9��@8��K4xT@9�N���@;o���.@<h`�U@=�VI��@? ���$�@@C3ç|�@@�EBc�@A�y؟@Bn�V���@C.0H/�@C�u�@D�(���~@E~�q�*6@FJ0GY}�@G�����@G� d�@H�y��u�@I��8�,�@Jo�Y��W@KMA�V~@L,�j�&�@M��,�@M�8�A��@N݉c��j@OȘ��@P[.-�<M@P�g+�l�@QL�]x@Q�Ь�3t        ?���`�u?��%~�C�?�!�q?�PБ/�?��7 ���?��[��>�@�����J@
��kY�m@�݀�W@6T:�oT@ 4U`@S�H�>�@ g7f�@"�<����@%E�1���@'�;�+��@*��	��@-z.�`�@07�\kd@1�UF�w@3Uo��L�@4����`S@6�H��x@8a��`@:'�=}�@;���2�J@=�%�q@?��)��n@@�UD�#r@A�+,��@B�*cB�@C�8(�@D�9���@F6
��@G����@H9�xT,v@IZڳcA�@J�7��@K���Ťe@L���n�@N
}����@OA��Ki@P=�
��@P�M�D�@Q~�=�!�@R"(��]�@RǏ4r��@Sn�p��@T1K���@T�`���@UprH
�M@V`�L�@V�'V��Z@W��g.!�@X713�x�@X�m����@Y�w�@Z_J\�3@[�_>v7@[�7��@\�H���,@]X(�-�@^�::        ?���P��*?���b�?�Y}r���?�%�nc�6?�(�ߐ�?�ס�?���[=?�K(4���?�^L�@��~�@#����A@օvL��@�@v�!�@|�i_�@��^�?�@GjH��@s�	�@��[�@�J��@]b�Go@!G��~�@"�6�hB@$���(L@%����� @'9�/���@(�OT��@*�n���x@,G*���@.S2��R@/ٿ#E��@0�"����@1�^��xm@2��j�:@3�s���J@4�(7!�@5�����@6Ȏ U@7��r��@8�/rN:@9���e�@;��\�@<8�*���@=\@eIs�@>��۠w!@?��8�l�@@o���_�@A	�q��7@A��UV&@BC�իg@B��p�J@C�}j@D)�<wq@Dϐni�n@Ew5���^@F �+G��@F��i�@Gy5� @H(,��#@H��C��@I�vN:��@J?Ĺ!;�@J��ap)�@K��|@r2        ?�f�.tm�?�o!�?�����b?��<���?�Šj��?�=C.}�?���3��?��0���l@ Λ�!�^@{�Bs��@zX��)�@��u1@��*з�@"d�@��8��5@p3���@Jfq6��@E���,�@ ���*�@"N�<�@#�or�q@%�5�t[V@'�(�Aw�@)[�����@+C��bS@-9_� 9@/=iB�W@0�(^KT@1�y�}�@2�b�-; @3��!���@5�\z��@64ǟ��H@7d1�K}@8�Ʀ�ݕ@9�r����@;#q#��@<^ɢO�]@=�W[�&�@>���rX@@,wzxS@@��%&�@A�7UM�@BCQf�9@B�5*�p@C��n �s@DsFȝ�@E3j+�@E�C���@F��d�l&@G��~:\@HN���v�@IyO�@I쪯��@J�~�H˼@K��ϽO�@Lm�^P)@MG��d9�@N$��|�@O���@O�l�Eb@Pe�{@Pٚ�L��        ?��BuEXF?��h�"g?џ(o���?�<��[/�?��D,m�?�JT��	�?���ص%r?����0@�[�!H@a|(�+�@	�"�k�H@s%�J�@na��J@��1��@��~eg�@�����z@������@�ZH��@!s$JK�@@#$[<=[@$��î�W@&�U��`p@(�vGPS�@*��'���@,��Y�3�@.��X�@0Y���@1o�ӿ��@2�9���@3�ܤ�4}@4�Zo�6@6�mџ�@7C��̙�@8�� �@9��a�@;�Wv��@<dr�]&@=�����@?�R��@@?�F��@@�Hˢ�O@A����'@Bi3��Hc@C'�B��@C����m@D�c�&�@Et����@F>���x@G����9@G�d��GG@H���� e@I�%�Ui@J[Y6n@K5�=_�T@L+�[*@L�m3@Mդ�^4�@N��=� @O��Q��@PF���3O@P�� 9D2@Q4����@Q���z�@        ?��~o���?�ި� ��?�A5R`��?������?�A�[?��ۨ.@��J��@	����@�@+)�&�i@�q�RP�@���}�:@���O�@ ��Q��@"c^���@$�w��W\@'u�p��@*.�����@-�����@/��/�@1����q@3�@@4�/�k?@6qty
�~@8/Ӏ�d*@9���jY�@;҃dM��@=�YiJ1�@?�8T�.a@@���R��@AԡV��@B��W�u@C�y�d*@E���@F�I@@G;�֪�@H_̐�%@I������@J�ψ��@K���H��@M&�(J^@Nd9�/@O�2���e@Pw~��PO@QŰ�@Q�g+�x<@Rq]-6��@S��̙p@S�-����@T����U@U4��m@U�;�N2�@V��"hI�@W]1�\@Xߨ �X@Xة{v$@Y���6�@Z\y��p�@[!vț��@[�|48��@\��@�>@]|�1���@^I�"�1�@_�"��        ?�HjQ[�?�8�qօ�?̫$��L?ؑ:Ћ��?���?�j���*?�DG�՘?���y��=?�P�PJtO@92j`@��;��@]�U@�ޡ�\@�J-�P@
�p�@@4~�	@���*�%@����@k:��,@����@ P㥯�@!�jR#5�@#9���@$��v��@%�f����@'�H*�u@)U\}@@*�|3q֒@,>\T
L�@-�v���@/��Xt�s@0��ӿ]�@1�a�2@2c��4j@3H���v@42�d��@5ဉ�@6��*�@7���c^@7����H�@8� ��@9���1��@:�o<GUk@;��l�;k@<��&d7@>;{ڒ@?���:x@@� x��@@��$��@A$�m�B@A��66@B>Fq���@B�,�-^C@C]p��ƅ@C�5���@D�����@E=16��@E����'@FB���~@Fڶ����@Gt�aw�@H����X@H���I��        ?�K�X�U�?�V°X�?���k#Qo?�թ~�i3?���7�r�?�=%"�9?��rWȢ�?���'~�k@ ����@P� 0�@D�<�@�vW��k@�zf�̉@�惐-E@�aN�]�@0�b���@�.��,@�e6� E@ �a?=�<@"��H�@#��QOl�@%t�ǧ�A@'8�n��@)
�r���@*�݌W@,�2H��@.�_X
cZ@0m�\�k@1x¢@4�@2�
xo�@3���Ɂ%@4����g�@5��	�Lr@7T���@8>��~^@9u-8���@:�|��\@;�c���@=;���Wz@>�ܑ�@?�S`�f@@����@AI����@A��7��,@B�)���@Cgh�_ F@D!J��{�@D��:nu2@E�ݠ�[�@F^�!<xI@G"�T"@G�Z�dC�@H���k��@I~#:�@JL1���@K��� �@K�mCt?@L���tB@M�US��1@Nv=��P@ORuj�2�@P{W�3�@P���@�        ?�����<�?��� ii�?г�3�]?ܤdP%O[?��d�oO�?����]�?���?Ho ?�����l�@ �Q���s@#T���@
E���@<��n�@[NΨ:@������@<'!�@��&yn�@�RS?1T@x��jg@ >�����@!�r�)ǅ@#hi*'�@%^&$g@&��t��@(�6����@*a�=��@,A\u@.-u�E2A@0=]+;�@1�A�{@2�}@3-��@ْ@4BЏ8'n@5]�ʠ(�@6~:>F�@7��8�x[@8�j�J�@:��@-{@;8�%�L@<t���!�@=�p[���@>�-C�Xn@@$�[Ӑ@@�b���@Ax1/�j@B%z�YO@B�f�?�@C��α��@D<��I@D�֠3@E� �E�(@Fh��� �@G'!�@J@G�P�@H�^�.�@Iog��i@J6��{�Q@K 2Y��v@K����@L��In�@Mi�\��H@N;�F�n[@O4'*@O����k        ?���'y?�Vv��f?߱r���
?�)�n�?��6�*�?�7�;@�d/&��@	 ��?E-@S�/��@\3�:e@�[��P@�;���@گ��p@!�XTh@#���v��@&i:��z4@(�����@+�*q��@.X���]�@0���H�@2��G�@3��3Q��@52���K@6�!D�"@8Xm?���@:��*�@;�
&���@=zמ�%w@?C��~�@@�vN�p@Ax��^�@Bj�����@C`��QT@D[�\K:@EYX\~H@F[���@Ga�FIс@Hk�w�3@Iy�r@J��$�@K����v@L�Ml}�@M�B1 ��@N���@P3b���@P�?s�4�@Q2�U~@Q�C�_�D@Ra3���B@R��Z:�@S��>�:@T2z�6��@TЦ���l@UpS]�\@V|�P�@V�]�g�@WX/x1I@W����+�@X�� �75@YL�J:�@Y��yLܟ@Z�Ӟ哸@[N^� X        ?�
MYζ?�Zv�0?�Ѭ�U�?ً���?�u~��?�y���b?�c|h4�?����z�:?���H`z@���`CG@z��t�@	=��8�@BK��	@��}�Z@2��ŵ@a��3=@ۡny�@q�����@#TW{�@�T���@!j-ʌp�@"�`�9ck@$t�J�yB@&A���@'�r�w�8@)^+���@+7��^T@,�c���B@.��n��@0D2��d�@16�J�[@2.�QI�@3,V��@4.AŶ?p@55r2���@6A���&i@7R���|@8hG+���@9�$��@:���aE@;ŪR�'@<��*�@>���=�@?K�X\V�@@@�����@@ݜX�@A|���,�@B�(ڐ@B���'�f@Cf�	p8@DGFi(�@D�v�!�@Ea���ϋ@F�mՖ�@F��ku@Gn��p+@H!N��c�@H���{�@I�MW!J@JD����R@J�|�%@K�8�� @Lw�w-С        ?��2H*�?�??3��?�E���?����h�?�g�!�?�(l�@}?�V5-�C?���Ļ�@����@�"
8�@
!�&�M�@�#�(�`@�%{TA�@n���6@2e��J�@r���j@)(���@ -U��iF@!ח���f@#�����E@%_(m���@';�3Wc~@)(���ٕ@+%.�8C�@-1^.9��@/L�	@0��L�@1؀�d0;@2���H��@4'�1�pR@5Ze��J@6��e��*@7�is���@9����@:j0�;�@;�u�D�@=�Qի@>|����@?��ߐZB@@���V�@AeR���w@B#L��@B�e�ٕ>@C��a�u�@Do���@E:"���@Fn���m@F׷x�S�@G��>�9@H�$BM�-@IZ;���@J64�ׇ7@KT�`@K��5��@L�E� @M�i��@N��{�6@O��F�@PD�+��@P��^#GZ@Q8l�o��@Q�T��@R1��u�        ?�*�e�Y?��a��?��k!M�?ޚά�?�U
m�t?�|A�?�7T��?�nۍ-$�@�����@����$@	�p�$��@qU��Ǒ@���db'@B�ܽ�@ �|@��(���@�@(lR@ ��m�-@!���H_@#n���@%8���T�@'ѥ9@(���z�@*��
Q5@- ���Z@/j���@0��BZ1�@1�ׅ�H�@2�]�π;@4���@58�UgE�@6p��|��@7�!v��@8�)�h@:@�79a@;�& ǝ#@<�<jM��@>K�K��3@?�v�E?}@@����^@AG�NB�@B�-�@B��@I/K@C���Ǒ�@DI�Ѯ@E�K鬰@E܄U\�@F�	�z�X@GzV~�N@HMbK��@I#"!`�w@I���:t@J֒-��8@K�/,��@L�Y�k�@Mw{��@N\2�v\=@OC�O-��@P�@�iw@P�,X�)�@Q���o@Q}.EpU�@Q��Y:�C        ?�Ш��*?��_��c�?��1w�?����R?��h��?��1��@�ٷ���@
�2����@�h�y@Bl�}@5�B@u%�@ ��y��@"��k�"�@%t��7��@("=44�@*�3J�@-ݿIR§@0t�^�0@2
9��F@3��sG�G@5_����q@7B����@8쒙�b�@:�0�8M@<��GU`�@>�UU���@@R4�T@AX�G��7@Be�7�X@Cx���>�@D�J�S��@E��\�*@F��-6�@G��a��O@I-u (�}@Jbi.�S@K��S�\�@L܄55F�@N!���2�@Ok��U@P]��^@Q��B֮@Q�u���@Rc��,[m@S/<v�@S�$v�@Ts攅@U8��@U�ň�@V�7!���@Wo�]�ݟ@X1S���1@X�0�4N�@Y�9�4�@Z�h���]@[M��+��@\�z�^@\藗�w�@]�8�b@^���t>�@_`3Ш,�@`\UV�	        ?�T�PԱ ?�1���2 ?̠�κ�?؉6E�87?ⳤ�ZXr?�kV���?�m�C�v?��m�,�U?�k�6nD@P��(Cy@��A�@Od��@-�c*@$}�pB@O@MzM@�-/�}@�Y��G�@t����h@A_@�����@ ��Q^@"0��^��@#���ry@%2�H�� @&�I�w�M@(`� �KU@*���5�@+�� ��@-uYig@/;'�a��@0�e�(�@1r�+u@2cr(	Ҍ@3Y�YN:�@4T%����@5SK3G�L@6Vߎ$�@7^�;�@8k
�+@9{"IYw@:�_<�@;�ԉ��@<Ŝ���@=�h����@?0�<�@@�MHY@@�A�,{�@AH{�f��@A�_��@B~��2��@C�k_)@C�;��@D]̬�}@E/�/�G@E�a�EyR@FM_1��@F�$�ۣ�@G�����@HL����@H�g���@I��jj3�@J\Su+@K�[�w�        ?�O|���?����r�I?н�@�r
?ܪ��?��?��$�5��?�Ҧ�Q��?��r}�6?��8:��@ �q��Q@*o�˺@rh=C@L��6�@f���T�@�@0]�,@PT9�m�@����6j@����P�@��4��@ Vb�5jr@!�^3�<q@#��D�Y�@%7�_�1@&��~|�@(��(�� @*��x���@,}2]�D�@.o�#F]!@07L��P@1=8��I@2Iծ��@3[�!a_@4s(�@5��DWsu@6�a°@7ݗ���@9]���_@:@��Ș~@;zB���s@<�4�+��@=�a��C@?F��M�@@J��?�^@@�K�ǩA@A��_�J@BO*�*��@C @R���@C���\3@Di��&�@E!���@E�=Ũ@�@F� g[�T@GX(�b�@H8�r�#@Hܟ��~@I�.��l@Ji߀��@K3��`H�@K���,�@L�yb�5@M�pr���@Noi��;@OC`�ٓi@P���v        ?��o��¢?�}7�'�7?�`\<?��D*T;�?���m��?����%�?����R�?���Y�@J6�-��@��t��@	2TG�7�@��4���@0���#g@����@b�׻o�@2X��t�@%��b8@;p@��6@!9�cE�@"���T@$�����@&oof{�@(K�:��T@*7����@,2�p��@.=	;O�@0*���@1>����@2Y��)�2@3{�$<&�@4�o���@5�)z_s@7
���b�@8G�h	�Y@9��e�*�@:�����@<&���	$@=}��w��@>�<%JK(@@ryK�y@@�Y���l@A�J�3�@BG>��n@C+	��r@C�	V1�@D��{��P@EPx�q�`@F�.k�<@F�MV�Y�@G�j���n@H�KpC�@I[����@J39bQ?�@K92/@K��ϻX�@L�.�3]�@M�^�C@N������@Ov�Y��V@P06��@P�P���@Q�s3\@Q�B���        ?�2�SJu?�Kt;�-?��Z�%<m?�Y�@�M?�����`\?�yakwJ�@���|@	k�IU�y@�kN��c@X2��@� ���@,\�Se&@��L�@"�!T�@$z�i�R�@'�	��@)����l@,}n�_�@/c��u�*@13K�B�@2�T��h@4^�$��@64��@7�oy]@9�'���@;P���@=+�'�@?�	��@@��D9�@A����(�@B��嵿@C��"c��@D��{Ԣ�@E�=s��@F��{���@G�mD��_@I���@J6����1@Kd�Փ�@L�E9��@M�-����@O��_b�@P$rv@P��a6}@Qkc��F@R4BGen@R�7#�
Y@Sff�!�@T���T@T�:.�Y@Utաg�@V(��&E>@V�[�Li^@W�=g2$�@XP-��|@Y)5Ù�@Y�+:߮�@Z�0S�a�@[L5W=�@\7��@\�2('��@]�#p��9@^hGj�        ?�DY�m��?���o�?ˀOWl�\?ה-r��$?��|/gp�?�d���Kl?� �'��U?��F6|/t?�Q��W��@ ��E�O�@�H�n�@^���k@��ht @�V��g@��O[�@�N�`��@0ɥ�@~��@�@�Ad���@��x�@ !H�$��@!��p�0@"�@�{��@$k}��@%��32p@'~f�0Q�@)�䵭t@*�K>�@,i��d�@. � �6@/�RlHa@0�ˠA�@1�8H��@2�^�vX�@3�0(�5?@4��iP��@5��z�b�@6�	�nZ@7��
��@8�5�t�@9��S��@:���q�W@;��p�4@<�n8o{G@>}�@?B�=s�c@@5~�.'�@@˓$���@Ac��YR�@A��3���@B���0�@C8O��HK@C؆X���@Dz�����@E�ӄ:@E� ��@Fm���@G�e�2@G����OC@Hp�"���@I Y�qSS@I���2�@J�R*<vm        ?�
�vl��?����?ЗhfA?�j�yM'?奙��y�?�P���y?�tX_QT�?�P�r^i�@ k2����@�z@QV@���	@�nW#�@C��D�@�@����@!$��S�@��L��?@��j���@`�!��@ .�n�:@!�ŝ�D?@#V�ι�s@$��@�@&��خ��@(zeg�j�@*KF�'f�@,(�b�a@.`�u@0�	L�@1�A�@21B���@3-%j4�@4,���)@5E)�3o@6b�~sx~@7�,?|�@8��6za@9�s^r�N@;U��*@<GE����@=�-r�l@>����	@@M��5C@@������@ATB��@A�k��>S@B���c�@CZ0|!@DD���@D��E�\l@Etl"|�>@F,TA�=�@F�q6�i2@G�����@Ha@څ�@I!u@I������@J������@Kp�d}@L:3�=^�@M����$@M�@陉@N��4T6@OtGa�        ?������?��Z]�'?�~�� �?��υ?��I����?�.7/��?��x�Q]-?��<o�@k�$�M@;�`?��@	`f
���@րG^��@M�t2�@�Q+X�@��C:,@UQ�`@I��jc@`��@!KǆB�r@"�ŝ�e?@$���B(@&@�)�@(Y��)�M@*C\���_@,;��^@.B����@0+͐�t�@1=P�Ÿ@2U�gK!R@3t�]�;�@4��eJ�V@5�$gp_@6����@83S:~q@9r�5���@:��\51%@<u�.'�@=VH���`@>���_�@@�b���@@�{$��T@Al�c��@B#cfc�z@Bݑ�fs@C��j�]�@DZDC=^�@E��H9�@E��{�@F��;P. @Gtc�>�6@HA��t�I@I{��(@I����@J�5��@K��^e�@Lk�v��@MG��]�@N'3Ț4�@O	���@O�|6Y��@Pj/Է�@P��6M�@QT��Z62        ?�s��c�?�*�(dW�?޽+�^X�?�^���?�$��n>?�n�$][�@S@��)s�@����W@���G@N����@9Ҵ��R@i��h�@!l�j&��@#�-�Ӝ@&;���@(�u�ՠM@+���@.N�g�:@0��/��2@2F��@3��^�˚@5F�àR@6�Ïw@8��|L�@:a���S@<,O� �@>�4~Z@?��-��@@���A�@A��Y@B��.l�@C�b�'��@D�x疝�@F
�o��@G!0A���@H<�V�M�@I].S��&@J���@K��2t@L�3ca N@N9^��@OI��6�@PCE��J�@P�aʬ��@Q�Ҍʄz@R-��@Rբ Q�I@S��oL�@T,�-�u@T�lal�H@U��E�$@V?�x�]#@V�F�/�@W��(� @Xf�a8�@Y"��ٌ@Y��x�]b@Z�	��H�@[cXաT@\'��q�@\�5�/�@]����#        ?�p��YV?��@�4�?�.a�k�i?۹y�&�	?���`?��6u��?���\��??��V0���@ +��@��-��@Y@r@�@t��9@ن�t|@B�[G�@�h��v�@U���s�@����@��k^z@�26_A@!e{��@#�PW��@$ļ_�*�@&},2�H@(C�C���@*�n�@+��(ݞ@-�Ns�@/�ْܣ�@0��vO�@2�=�h@3J���^@4+�"�6@5I���P@6m���0�@7��O�#@8Ǥl�X�@9�|�P@;9/��@<z��,/@=��~3@?�2�7�@@0i�@@�h���@A�gb�@B<O|@B�<�_��@C��)Ipb@D_����@E�<#H�@Eټ��@F�l�	g�@G]�\+��@H#0Q���@H�8�xl@I�����@J�x�y@KQ��p�J@L#+ܓ�~@L��!�j@M�,���@N��1:��@O�T∻q@P.��r��        ?��
>��?�h�R��?�S����?�jGf$^?��|����?��s�&&?��G�[?�(��%^>@5>�@2�%ٙ@
�Pw���@5��K@˽2�@û��z{@�4^=S@�*-�8@����P@ taK*]5@"&�=���@#�� �@%���7@'��/h@)�Sȏ�@@+���x&�@-���@�@/߽	f>@1
���bt@2,��$f�@3VĔ� 
@4���%2@5�$AR�G@6����BY@8Eݤ��h@9���Ş@:�\�O2@<A�V���@=���KI@?
�����@@<]��#�@@��i]�.@A��-G��@Bt@��u�@C7�&�b%@C�!�v<@Dǃ"�@E��\�H!@Fc&K{ �@G5S�?1@H
^��	�@H�@���3@I��a'�>@J�m<8,@Kz�ؼ�*@L]�`�[t@MCKLb0�@N+��X�@O�r@P2z�;�@Pz^J���@P��[Q(N@Qn���;�@Q꺣�x@Rh��        ?��S(�5?�@���\�?�ES���?��Xs��?�9�L�5�?�ӣ�Օ�?�≼���?�¾�$�;@6�7X(@n%Bx�f@d�s�@{FA��@ �jw&n@���$:@��:��@W ��@]�[�3@!h�����@#5���Q@%mK��@'�{���@)@���@+"�� gh@-J��@�H@/�5A��@0�E1c��@2�$
F@3J���zF@4���o�	@5�1YH˫@7^�=��@8slZ�@9�Bpm�@;6�를�@<���A0�@>�E3�=@?�܇��@@@�8n|pq@AQ��)@B��F�F@B�f�H�@C����j>@D�H�8�m@Ebp�yP�@F=4�d;@GoU#�@G�g����@H�!+E]�@I�,�d��@J��""L�@K�9��R@L�����@M���c�>@N�0�
��@O}��k��@P>	$ �@P��l���@QA6Fp��@Q�𾯬@RJ�f3�@R�{��z@SY��Ю@S���QY�        ?�I*��?�� 0<s�?����Q�R?���?�Y���i@ ��"�m@ .���@��vgT@��0|�@�9��@���?�@�v����@!��m��@$\�����@'!
��X�@*t�O@-�Ǻ!@0&Aӕ@1�T���@3�{[,�@5Y�4eJ@76��1Kp@9#��(�@; �M�P�@=-h-��1@?I(�t��@@�����@Aֿl�W@B�ЧP�i@D&�i�@EXgAO��@F��V��@G��nV�@I��s�@Jf�{�|�@K�����@M����@Nxg�[�@O��`��8@P���b��@Qa�/�*@R~���y@R���S@S��p.we@Tj5q�@U3����U@V �u�~@V�^E%kR@W�w?�@Xv]�ˑR@YN\���@Z(x��K'@[�j�>$@[�x���@\���b��@]�)Hq�@^��g��w@_Y���K@`6)y)�5@`��xJ�@a&�M*��@a�@� �@b�:R%�        ?��0R�R ?��=���5?��6�.�?��-tQ�?���o�?�{I��?��80L�O?��(b�?��l�3��@��	��y@���M"5@�1ܫP�@��	�@jo Gen@��Y .�@��64��@oOs�|@��Bv�@�s�V�D@t~���@!+ �*��@"��Z)p@$3X��kh@%�9G�@'l�>d�@)d;MN�@*�^���{@,����3�@.j��8@0"֒�;�@1�w�%@2yBU�W@3
r��S�@4f�$�0@5=�[9_@6�r�I@7/5��!?@8D* }�@9]���@:{�0L��@;����}@<Ğ(+F@=��r@?��^�@@(��n��@@Ħ�>K@AbX%x�@B�)�@B������@CGEy���@C����D{@D�2֠�q@E=C$��@E�w�8�@F��@^��@GD�0��@G�C��2�@H�ǯ�A>@I\���d@J35V]�@J�}�Lz@K���Oe�@L?R=�        ?�+��@?�T�~���?�-fp�hF?�`M|#�?綱�#)�?��h	 :�?�q"��F�?��m޻�@�5IB�@1�]@
W�}�@ f��
�@��u�m�@�����@v����@nJ�\y@���IU�@ gl2U�!@"9�o�@#��i"�@%�R�f@'�����`@)���l@+��6p�@-����@/��3f�@1�C�I�@28G�'<�@3e[N� �@4��S�@5�2��x@7�.-iZ@8d�6o%W@9�we���@;r��p@<o]�jQ�@=��ʰ�@?C����W@@[�V�J�@ABD���@A��T�B
@B��1�`i@Cd����@D.�%�}@D�5�Xח@E̘�r]@F�	uO��@Gv�WE$�@HO��ߪ�@I,hz%�@J� ���@J�L��@K�<xí�@L�@g:�@M�qʑS@N���S?�@O�(_�{�@P;��!�@P��X3�@Q2�r�!�@Q��&Ȉ@R/�EϷ�@R�+��        ?�(��r
�?��J��?�ڮ l�(?��1��c�?��G�?���׭?����
�h?����6*
@ �d�$�@esD- �@_���O�@�.'ݱr@�(�j�@��/�@��ȍv�@R�9;�@([�wr*@�@�)@ �o!�ֱ@"3KP*�@#ۓ,\�{@%�}���@'W|�:��@)*:S���@+
`��>@,��\~�P@.�D�	�@0|���@1�}���U@2���i��@3���Z@4�Z8��@5巜A��@7پ*+�@87f���@9hF����@:�a�@��@;٣D��@=����D@>_El���@?��Ŷ��@@|Jh�(0@A&7a�&@A�}"���@B�(\�~@C1�XE�k@C���z@D�e�b��@EQ�vFlz@F��U�@F�P%���@G�'uUE�@HE6�0[@I�L��}@I�ᐪ�2@J���4I@KX�����@L"W���A@L�����@M����@N��gi�@O\x�B@P��W��        ?�Y�K��?�~8J��?�
Ȼ2�e?끧�ӯ�?��b�Cԇ?��Ĳ�!�@�{)si@	����AH@X4���@�}�H�@[�5;S@|T��df@��\�y@"M�j�9@@$�#��;d@'hua<�d@*'����V@-����@0yD.�@1����E�@3-�ɻ��@4�R]���@6��ڂ��@8Z\@+�[@:/@�Jg�@<Q3�I@> A���@?��oÐ@A���vB@B�W�6v@C�TM�a@D1X�1�@EL���B�@Fm��g@G� W:m@H����ѝ@I��[0n�@K&���է@Lb:C���@M���g�S@N籯��@PܘR�@P�A��A@Qi�Y�\z@R
yH@R�\(O�R@St��@T'��-�@Tܦ[���@U��O��@VM k�V@WYMz,@W�ȋ���@X�H���@YFե��G@Z
jc�L@Z��� �@[���V(Z@\a1��n�@],��}�@]�A�]�P@^ɱSW�@_�	����        ?�
���~?�`"*�c,?��DK��?ٓ	��t?�{�E�1?�p�??�i��?��j�ǈ<?��j� �5@ Lh�4@~���I�@	@��K@Cz)��@����~@ =jT.@[C ���@�!�S�@c�J��D@�YT�@�+c:w�@!Y���R�@"Ԃ%ʌ\@$[#�83�@%�&���@'�DgG�@)27�"@*��3�v�@,���[P@.h�P�6@0�<)�@1
>IpR@1�kX >@2�M1�s@3���Ix@4��P��@5�gS��a@6�T��z@8	�)��9@9���L@:0�;`�@;J���]�@<ht/(R�@=�R5�`�@>��({�@?���{@@����5@A>~�'@A������@BR�kj@B�(��@C���<�@D2jH�I@Dմb�@Ez����@F!]J��@Fɱ�|l9@Gs����@HA��@H�ui�P@I{?l���@J+��3�H@J݂��Y�@K��a"J3        ?�����Q?�*I!���?���Y��?�ڥO"R?�E�1�?��&���?�9*�0H8?����k�t@�ɳm
?@�V��@
�)�R@�Y'��@�7�E�"@Z\D�@�"��n@�M'��@�c��@ S�PR�@!��
E=!@#����7U@%O� ��@'+컷^@)���x�@+��Z��@-"Z���@/>Ù��>@0�N=��N@1���S+�@2��.��@4$_Y7��@5X1�1n@6�F�Qb�@7ՆcX�@9��#^@:o+q�@;�d��,�@=$t,�+@>�F�@?��$��f@@�r���@Aoķ�	#@B/Q_n�@B��R�@C��"�}�@D��Wc@EL�M@��@F��v�@F��s�*@G��z�L�@H��3�@IuCՇ8�@JR�\H@K3��C�@L��@L��}���@M�_ǩܐ@Nω>iϩ@O�Xɠ�a@PV�2S�@P�d�%8Z@QK-7
�@Q�9E�I�@RD���        ?�C�n�?���L�H?���j���?���ޗ?�lTHD?�9�%Գ�?��Ә?��m@�y#@ ���`�a@m�3�	@e�wB=�@�ǃ�:�@�"k�@�ԝm�@����}@G.oJ15@/gr��@	/�9�@ ���-=@"$��)@#�V�.ua@%7��Ǿ@'Bh"��k@)�#�֒@*��Wg�@,�*��@.����w�@0o�Xﺹ@1y�����@2��&���@3�fU�Z�@4��3.��@5�zl�Ǫ@7��?�A@86J�2'@9j`!"+k@:��aZ�@;�p��,�@=(@D^��@>rzA��@?�^��@@�t/�@A8|�g8�@A�4y�@B�?�@CN�Nl^@D_���@D���u��@E{��h�@F:vW��@F�s��@G�ٕZ�N@H����=@IL��N�@JG>�7@J��^o�@K�>�yU�@L������@MXg3v�"@N.bS��@O�ܟ,�@O����@P^ֶi�        ?� m�_[�?ϣ=�u�?ढ़; �q?�
�C|�?���J;�?���vK��@�[��(�@
y�A@�=@�e�s@!A"@�@A8�@@s�X�l@ _ c��@"��4ڥ�@%D"��{�@'�ɉJg@*����vN@-��7�@0E:���A@1ҿ+���@3nѹ��@5��cz�@6���^�@8��d7Q@:^�:��9@<:sp�@>!�	b��@@
tQ�A�@A	�ґ`�@B�H�V@C�	Y�@D(��Fg5@E=�66��@FW���I@Gw3��7@H���YL�@I��%jSG@J���i@L&�^�8@M]�ۙ:@N�%#�\�@O�����@P�J�?�@Q5?_�_@Q�b�*UG@R��eht@S1#��@Sގ+E�V@T�s�� @U?��q(@U�*���@V����@W`�l�@Xs���@XԲ-�%@Y��em�@ZPƋ�@[����f@[�/;�=O@\��D��@]^��v�@^&���ɟ@^�Fx�6        ?�`�|,??�3��8�?Ύ���S�?�0s�,F?�����{?�.�m�b�?��@ًW�?�E�ǔ�7?�J]㬠�@rm��U@����b@	�s��q@�}뻁@,�Y+�@x̂0��@�zL�@h��t�u@
K!qr@Ɩ��xx@ Nb_K��@!���>@#JS�(�@$�����@&u����g@(�Ux�r@)θn<�@+���8�"@-S����@/%�Ia�@0�H�\Z�@1t����g@2l�w���@3i捤��@4k�^���@5r+�4O�@6}6w�Q�@7��V�LD@8��Ľs@@9�%����@:��=Q�@;��ʶ��@=	:YJ@>E�%�ӊ@?s!JpF�@@Riy���@@�JM��@A�-?/F\@B)��w@B�㴸]@Cl��A�@Df��Z`@D���+�@E`���w@F,!j@F�U©�@Ge��f@H�B�*�@H�V�i�@Iz����z@J0k�[T�@J�揰#@K�����@L[R�icC        ?��"˽�?�Q��Yҡ?�*U��=?�f?�B?�c�7��?�8��H�?�#1At&�?�.K�#@ �ak�d@��0!'@�>eC-�@�ҫ��@�s�g�@1cFAB@����6@u�Q?g@I����@<����@ ��(�y@"?�4xq�@#�>=H-h@%�5���@'^��,�@).���sK@+vz��@,�Q�� �@.��#G��@0y��kzn@1���W�k@2�"Yq�S@3�_���@4�qo��@5�<7� @7��>��@8.�)<�@9^�@ľ@:��i~ɺ@;τ)�/a@=�k�b�@>T�����@?��u\x"@@v��j[@A ��*�@A�"}��@B{��5��@C,�"�<@C���o�@D�mc�5�@EM8v���@F9�B)w@F�iVF8@G��P	�h@HB4�i@I���1X@I�^���@J��`>0@KX��0�@L#m���@L����@M��	�@N�j�O�C@Oa��@*�@P7���C        ?�x��j�?�J�+��?�Aפ��?�TjG�n+?���x�5N?���dL`�?��#4u{W?��P��@+)�_��@$�<L5�@
v���5�@�v��@�oV�@��ڵ��@|�'y|�@n�����@�h�ZS[@ `-i )C@"WYTP+@#�����@%�Va*�t@'����wz@)v-G���@+x�9o��@-��<Y-�@/�\�#@0��3��@2h��j�@38l��*�@4gٞe�-@5��Ԯ�5@6ܑ�e��@8!��G �@9m�)��%@:����@<S�|@={��d@>�Uǉ@@(�q�^�@@�Jc#@A��D�@Ba�&�X@C%܎�J�@C�a�.�@D�fD��^@E���S@FUS�w��@G(����=@G�j�o�1@H��0�@I�q��@J��f~ZJ@Kw7e���@L\s$+tI@MD���i@N/z�L�@O:#=�K@P����8@P��
6r�@P��1��@Qx'�`@Q�ζV��@Rt�&|Z�        ?�Q.
��?�$�[�?���D��?�$_8�a%?�6=��M;?�_�"y��@ �Yx�@�!A�@�sZ��"@��_�)D@����>I@�(�y�@ ��+�r�@#|��Db@%��g��!@([��Q$O@+*%�C�@.��� �@0��P��@2#�Q��@3�6��Q@5s�ͥ\�@7/����@8��|{2�@:����v@<��R�@>�`U���@@Kc��{@AM��v*@BU�k�>�@Cc�Uё@Dv�}�M�@E��g1�L@F�?����@G�̯<#�@H�[I/K�@J"հ�m�@KT(�3)@L�Cݺp�@M���f@O��>ʫ@P$T���@Pȧ�L��@Qo:æ�@R�l�@R��og�@Sp.ȋ�R@T~���T@T����@U�{��f�@V: ���$@V��X�.�@W���A@Xg~F��@Y%^�4Er@Y�B�r��@Z�&N�0�@[k�sE@\0�uu�0@\��d�0@]�G�߽y@^��_�5�@_[TZ���        ?����a��?�f�l�C?��n�m�?ڈ4U�?�8�cu?���,��?��Ty9�?���4	��?����A�@����w�@U��@]@
=�-Dߪ@h��w�i@jc�t��@�tyϙ@2�AUF@¸z�@o:rFk@6�N��1@ �^N+F@"
Y�j�i@#���b@%+μ{�<@&ζм��@(}e���@*7�wRk!@+�,���g@-��
W_�@/�|}�K@0��ϹB@1�t\���@2�0v,E1@3��:�@4�	4˗@5� �հe@6��y��@7�����@9C�z�@::����@;_�cn�p@<�c/�@=�/���^@>�͙�@@Jx�zq@@��G/�@AM�Bq�@A�gפ'�@B�F���[@C9.d�J�@C�%Ѣ@D� �z�Y@E6���\@E��џ=@F�n�y}A@GF^�m@G��2��@H��x��@IfFW$љ@JX��[(@J�9���E@K��O�U|@LUP\>l@M{Bu�t        ?�
x��9?���3�?�t@��?��	�
D�?���{
?���|�?����M�?��O���@IeɆ�P@qk�t@	(��,6_@�W�8@$zմ�K@�n��;@J�H,�#@^�M��@�cE��@
�l ��@!m�$B@"¿}+@$yn�_p@&>�Pe�z@(-S,@)��J��@+�$����@-�3�,@/��K0�@1
(��!@2&�>ܲ@3:�8Q�@4]B4̭2@5�4�>q@6��ۗ!`@7��w��@9'�6��@:j^H!�@;�'A�9�@= �-v@>V�t��@?��L	U@@�:�2�@A<l�w��@A�s#@B�C妭F@Cfշd}@D%��X@D�F��y@E��{���@Fo�}��@G8����@H,��t2@H����@I�"�[@Jub�u��@KJ��]��@L"�z�M@L��vck�@M�J§�e@N�?�,N�@O���!i.@P>� ��@P�����@Q%�0q,        ?�uR���?�$��?�����?����q*�?��`�C?��kTf?�Z�����?��mlcF�@�����@���ru@
-DX��@�ǭ�T�@�/�R
�@x/Գg�@<��[@&��3�@5��^�x@ 4���@!��g�I�@#���wWw@%gr<C=�@'D���*@)2#W�q�@+/�B)n@-<�pH?I@/Y"E�W@0�jP�?@1߾*%�@3rŲ�c@40n׀�@5c��6�\@6�� g��@7�"����@9'V �Kn@:vc�� '@;�7�U��@=(��.�3@>�����@?��09�z@@��sTo@An,��2B@B,��߸�@B�H9�h�@C�
P��@Dz���7�@EE��v�-@F�6cj@F��?��@G��vM�%@H��_+6@Ij"u�m@JGps�@K'�&׃@L	���{�@L���@M�?����@Nó�:S@O��]�%�@PQ�S�:J@P�tQg0@QF��V��@Q�q�-x�@RAzwQ�n        ?�zlp�ʫ?�<�����?����?�S�ʊ�
?�\�;��?��d���+@)�'��@=���&@!��@�ɉ�ry@�|��{$@����@ �v���k@#NW�n�@%��=�A�@(���>@+tpG�{@.k�:.#l@0�~ ���@2Y�E�M�@4��"@5�L����@7z���q�@9K5�.j�@;(��G�@=G���E@?
;j_��@@���z�@A�k�M�@B�Rc{@C�����@D�˦�q�@E�;֜�@GJ�v��@H6[Y�i�@Ie�j�'�@J��(�|�@K�Ճ��@M+A�S�@NX�M ��@O�Q{8@PxJݳ�@Q!�_�@Q��c@@R|z���@S-Cpbd�@S�Y�j�@T��V/,8@UMMƏ�@V'G\@V���@W�D/ 1@XA����@Y �d;M@YȈ�0}@Z�$y�@[W�6/�@\"}Qq��@\�.A�^�@]��缳�@^�y�(�)@_aҫl@`��&|        ?�)~���?��Ǒ�`�?�X\+���?�I��]�t?�,-�S?�#�9GBV?���,Y?����;8?��G��0@�#�R@t�:m@
�7��X@�m/�<�@�z(=>@�z-hu@_Ǿ�<a@�� %@4���Ժ@�%��D�@p�-�%@ ���o@@">�ݐ�@#�H2�U@%�5�3�@&�1�P�@(.�AuQ@)Ӭ%Z�@+�:���@-=�*z@/%�=�@0gq$�#i@1SB���g@2C����@39<�F��@43B���;@51�W@65���@7<����@8H��*�@9YQo�O�@:n
��@;�2�[�@<���(-@=��G��S@>��82@@
�6֑�@@����V@A:ir���@A�E�c)�@Br���j@Cܶ�e�@C����07@DT'q[W�@D��Rh�@E�*�/t@FGC3�"@F�Z"m�@G�G��5�@HKCH�@H����Y@I���R@J_7\
j@K����        ?�4c���?�8���?�Z)�x?�_?K='�?����Ҳ�?�`�n�?��F�E?�p��1@�X��6@4����@�jz[Xp@WY�eO=@��)e@����@�`�o��@��X-@2�ˊl�@!T���@#"�ֻf	@%�7!}@&�r�ͱc@)����@+�נ��@-L���?�@/�^�;��@0����<@2"l?L.�@3]��z�@4��_��@5�|��3F@7C�4}�;@8����)v@:s-��@;v�|d	@<��N�@>l�S\;@?�(O��Q@@��/p�\@A�]+}޹@B\�/Q @C0kkӹL@D�lF��@D��n+�@E��QOp@F���"i@G�u�r�@Hu���:@Ic�t���@JU�L#@KJ�a=;�@LCۡ\��@M@]�' @N@g��@OC����k@P%�.�Gj@P��_#��@Q1� c�@Q�wq\J@RD�[��@R��V ��@S^¬��@S�3�Zt'@TL�        ?��|~�$9?�\�?e?Ђ�{?R�?�L�\3�*?��7��?�u<��V?�c��'��?�=��-�@ `JU�@������@֗��@aS��w@>�T�aM@��uz�1@ ���ws@�̲��@�9A6�@mc|s�r@ 8>����@!��K�j@#h@S�uD@%�p�@&�Ѳ���@(�a���@*rgL�S*@,V�V�d@.G��2�@0"�w�@1'ܧ�a@23
�翖@3D1F'5�@4[5���@5w�1w=�@6�l[�m1@7�h �4�@8�ՌiH�@:"�W��8@;Z��i�@<�Đ�f�@=���C�@?!0���@@6�\C�0@@�OT�+@A����Qc@B71���@B�l��@C��I>��@DL�鞼�@E )al�@E�ĵճ�@Fv���@G3�s���@G��hl�1@H�R�F
�@Iwֽ@%@J=u
�@K(�R�@K��Ng�@L�����@Mh�9�.@N8M����@O
:���@O����1`        ?�1oM��?�O?��i�?�[�'9�?��؄8?�zb����@��؟�I@	l��b�@���/w@Yb�*��@�J�@0tp��*@�jʣ�@"�
���@$�q�YE�@'~��n@)�֖�/�@,��7r�@/z���@1Aj�@2�nG4MD@4sugx�@6 $3�v@7�8�(�@9�j,p@;tp�q�P@=T�h�@??���@@����D4@A�T�9�@@B��P�1@C����@D�V%�@E�m�X�@F��A�@H�0W��@ID�f�^@Jri5Ef�@K����dM@Lܮ`eC�@Ni;�Wb@O[ S�c�@PP�}�&l@P��L�@Q��'�4@RI\��pk@R�G&�:C@S��ȱ|�@TW x�@U
�Vu��@U�!�=��@Vy���/@W4/_�[�@W�{��@X�"xd�@Yqf��D�@Z4גS�@Z�p��_�@[�.��(�@\��o=@]X	~�3@^&����@^�G˻��        ?�f��P��?�O�=�{�?̽_�21?ؠ��O�2?�Ġ�,�?ꁽ�Z�?�+���,?��3�#u�?�|½
Q�@X�SwB@�tn�.�@TZK�@�@/̂�(P@# V�@J�$�bM@�pb��c@�r(�GT@`�CS��@�$��H@�@��@@ ����N@"]&��@#�����@%ƌ��@&��씩@('>~��/@)ŕ/��@+m��@-}k�g-@.ڱ���@0O�*��@16aJ�v�@2!�縙�@3S�?��@4S_-F<@4���G�@5���^��@6�����@7�����@9��ՍN@:1��@;$T�@+@<8o��@=PF�wh�@>k�6�@?��~8�@@@V����@@���<��@A~�oyO@B=���@B�h�ȑ�@CG5���x@C�!��?@D���m3@E+�`�@E�E>��@F_�7���@G (,�?@G���@��@HM��LO^@H���HF@I�	l(̂@JH[ �u        ?�&����?��9\R�?ЙE���?�k��{�?奎q;��?�cZ�?�s�=��?�OjQn}@ j\D��@�v���p@���gI�@�:ښ@B��u�@�����@!^�Q�@©%ng@�꾢@d?p�~@ 1jq��z@!�u�Ӽ@#[��	@%yd�|@&���j�@(����7�@*W� ���@,8>I-nP@.%\1/~�@0���@1�B��@2̼�5@3*��$�@4@�F^�@5Z��H�@6{�8���@7�� ��k@8�z�k�@9����{�@;5&~	�(@<p�*��`@=������@>�)�M��@@!��%�P@@��F��~@At�x���@B!����@B�?��u@C�AVJ��@D7�	p��@D�t�o@E��K2l2@FcA@G ��i@G���@H��� <�@IhB��@J/:k�k@J�l��@K�ս�@L�n$�y�@Ma0%,��@N32Hb@O%�K�@O�9E[�        ?�>	+K?�"a�W?��Wܳ?�*+Q�+�?�;c]��;?�g��*�?� P�*?�J	�U@ �wl�@�fo �@����Q@�q���-@�|��1@5eQ�@��}���@��=�F�@_w�H@Z�p@ �r�d�%@"Wn��w�@$�i_Y@%�����Q@'�ZM�b�@)`I5D`�@+F8:괖@-9�,�1�@/;�!��@0���-%�@1�u��%n@2Ɣ��L�@3��WH<�@5���\"@6(J�^RO@7T�U��@8��U-��@9��R���@:��@@<A�W$|�@=���D@>ٗ�\�@@���95@@�y��8'@Ar�c��@B$��.�@B��h��D@C�ѧ�N�@DI$�U��@E�`}@E��bUH@F����"_@GFSԓ�(@Ho}l�@H���e�@I�i�Pg�@Jh8b�+n@K61��M"@LO��xP@L؋��@M�߲���@N�EBw�@O[��<�@PL �@P�Q��,�        ?�(����?�:qoP�3?��V��T?�C>�X�&?��e`��a?�Y��/��@�!����@	H�_��@���b�;@7�+T@��`@�ր[@9�h� �@!����z@$C�����@&�����@)c1X��@,��D+@.�/8�K@0�}�-��@2v5�]f@4\��y@5��s���@7M��6��@9W*�Rf@:�C:�@<�>hf w@>cp#X7@@!�_J��@A=�ʈ@Bע�M�@C|u��*@DI��-@E��g�@F-Ҧ�`U@G@���4�@HX\�V�n@It{����@J�$��@K�Z ?'@L�k��@Nא\@OB�\u��@P<n���@P�uǕ@Qx~�>A�@R�K��@R�q���@SaJV<q@T jeUT@T����,@UZ��@VG)�@V��XͶK@Wdr�	4�@X��Y.6@XȪ�ь�@Y}B�@Z3x��pU@Z�H{�k@[��)���@\_�2���@]�{f^        ?�EnF_�.?�+=���?̝,�[�6?؆в��?�-�Y~?�f�~���?�n<�?����G+Q?�d��Nq@L=��ݠ@��?1y�@J�3 ��@*����@#�Y.$�@P'���r@�"<��@���J�@}�@f~K@I���@�_`˄�@ �͊(o�@"?�.�ׅ@#�����5@%I��A�u@&�Y�u�@(�����@*/`��@+��K�U�@-��y@/y/eN��@0��@A�N@1���r�@2�F�AR�@3�έ*}@4��F�@5����@6���+@7�0�
$�@84gz@9۹{8s@:���n��@<'�Y@=C%�6:@>n�J���@?���P��@@i�u2�h@AE�e$@A���a�@BE��=Ry@B��a�F�@C�����`@D58��X@Dޔf��c@E�;��@F7�MX�@F�7ak�@G��$�@HLB`+aJ@I�o��@I�h�T@Jr��e�@K.i�=��@K���q�s        ?����??�e�cd��?�?vS�?ݏ6�2?�T%F�?�Ӧhc,�?�PA��EB?�p��@g�@"�JK�@�t �@���F�`@_��9�@
#���@��s��@0���E�@�'ó
�@褣��4@���l�@!)a�@"�l.��-@$w��Ъw@&A,,��@(�b�u@*�3z�@+��w}K@-��	�a�@0	���
A@1����@23z��W@3R[��i�@4xo�j^�@5�D0Y�j@6��<���@8�62>�@9SW-ekK@:�C�Sh�@;�#�o@=:��@rz@>����@?�7(q�a@@���D�@Ab�fU�@Bj�-3�@B�2�� @C�����@DV�;|�@E�l3X@E��}��@F��Q6@Gx��1@HGDWk3�@I)$}1@I�����@J���Y-@K���"�@L{f��z@MZ�j���@N<=���@O �9LK1@P�8�
>@PxO���@P�5A���@QeVX֘�        ?�ʑ|`�?��ep��?Ѯ�Y~?�X����?�$s�X?�Y��e>�?���!Զ�?�0��l�@������@r#%9G@	��u���@!�!�B@yI�7C@M�Э�@�ϸ�:�@�����@�(�Q�@�R�2�@!x�scn!@#)�{ @$�z���@&�
�-�%@(���F�@*���F��@,����l�@.���,)�@0W��@1k*n�<@2��٥�@3�� ��@4Ͽ��E@5�M��Wl@731��@8nQ(��D@9��o�9�@:����@<D&_Jk)@=�M�&RZ@>�C��;�@@'{���@@٩r��@A��Hu�@BFgh(*@C 鴿ث@C�&_"�@D~G	��@E@�vVk�@F��\�c@F��z��@G�x�w�@He����R@I5bD�!@J��Na@Jܘ�W�q@K�.x@L����'@Mjl���{@NI]��{Z@O*ǉ䛢@PR��W@Pzy��@P���@Qd]d�V        ?�1�_�??�(�׭� ?�Ȟ�P�;?�C���]�?�˝�4}?�e3@[@��o�@	]	��L�@��j�
@PC�Uc@�Q;g�@&�BZ�@}�Ӕɝ@"\���@$|�'�@'M9���@)�?���@,��V��@/s;�Kh�@1=X�W�g@2��E�@4n���V�@6`?4��@7�V��tL@9�(��~@;o��t��@=O]��0x@?;Lb�>@@��@w�@A�]���@B��}o�X@C�v���@D��
F@E�)�I@F�����@H��@ID1�(@Jq���Z�@K�_X��@L� Aʚ@N�LC��@OZ�"M�@PP�%�	U@P�nE(��@Q��|
��@RI$*��@R�F���@S�K�rz�@TV��3@U
���Ɵ@U��ʗ��@VyI�Ҽ@W3�ue�`@W�˥o��@X����L@YqR���@Z4x0�U@Z���u�@[��/L�@\�P�S�@]W]G�$@^$�ʦ@^����x�        ?���H��?��97N��?�A�*�?�M��)�?�T��k?��U�>�?�Wg����?�R��9��?���.@ ��f�[@L�(�y@�#i")�@�U��x@�8�J5�@ev�r�@A�����@�R�.��@�y
�u@�F�3��@N4=�P@ �I���_@!��b�R^@#n�+�41@$�J���@&�3����@(/�b�@)��=l�@+t�»V@-/�KP1�@.�0��
�@0bs����@1OZȭш@2A<d��@38��k@43��5@54�a5@698YS��@7Cf��@8Qs�(��@9dljʴ@:{��r8h@;���?�@<�V��@=ܰ&=�@?�[�I�@@U���a@@���,�@AL��r�]@A�\��&@B�bͦ�@C(�	oT�@C�z��*^@Dp!"I�@E�.iwW@E�9=|@Fig~V�@G�lw�+@GÕ%�_@Hsh8�-�@I%w<-x@I�q��@J��Т8�@KD�6��p        ?�=�nv�?������~?ј���.�?�%t�Tm?��Y���?�:����?������?���B%c@{f�	�@Q*�Ҷ�@	}Q,u��@�2>q�9@g,�n�!@�>̓�(@��K�v@����'	@�D78g�@�v���@!z����@#/P�:��@$�����@&�)��\t@(����*4@*�"��h�@,�����e@.����Y@0pb�r�s@1�,�,��@2�5>��@3�a�!�@4��?Z�'@63�⎉@7o��,��@8���^�@9�����@;K���?�@<�f��Z&@=�M�b�'@?b���]@@fy4�@A�"��@A��w�A@B��y��3@CW���a@D���@D�޹Z��@E���r�$@Fy����@GI3y0��@H��i�@H��d�c@I�# r�@J�=�8�@K���sx@LbM�?�@ME'�٦k@N*�~�@Oa�A��@O�u�t�H@Pv�,2@P�6#M@Qg�u�k�@Q�R"$�        ?�-K,��?�����?��e�̮�?�e���Y?�13�Ks�?�[��EM?� {��J'?�
so��_@ ��	h�o@��i-�K@����=�@�V6�@�N�f��@A��QSq@�f �~@��A]�}@~�i�s@��>�L@ ��ba@"v櫠)@$)�G��@%�����@'��4�2@)�%LY��@+���'�@-�^9��@/�sTpC�@0��B���@1쯬Bu�@3d�	��@4(���=Q@5P���m�@6C�p�@7�1�]!d@8�z#Ş@:1�.�~@;x��U�h@<Ʋ���)@>�J��@?t�S0�@@jZD-k@AQ����@A�9�� �@B�z@CG�	�@�@DR.���@DǺ%��a@E���:]�@FR���@Gʮ��@G�]٥~@H���8ѐ@I��q�@J_o�e3�@K6Ֆ�7E@L���A@L햞@�&@M��^+j@N��rU��@O�TRKoU@P=1Qx@P����a@Q(ˢ��        ?����D-�?��A���A?ߖ��},�?�k��G?��\%9�?�3#%�r�@�:�D��@	2^�jN@zK��@0�\�h@�Sc�*�@�([f�@N����M@!�#��"�@$`q��@&�'���@)�M+F�-@,f�����@/PVC?t�@1+P���7@2����:@4[�i���@6 DoO@7�׍ n]@9�~e#Q,@;[�HY��@=;�ջ@?'�"t�@@��`7=@A�����p@B���G%�@C��:�w
@D���f"�@E��\��@F�W/d��@HT
+�@I?��m'*@Jnx,N�A@K�"b��@L۾j	L@N%�*t@O]�#���@PSaghc@P��3��@Q�	��i�@RN�F�@R���EQ�@S�o=/�@T_�?/n$@U�k��=@U�-o��P@V�ʱ"�o@WA�\��b@W���r�@X����2@Y����@ZG/�sP@[�����@[��ű@@\�ܜo!;@]n�Y0@^>��@_>���        ?���]�k?�R� �?˲�-u�?׺�~j?�>��?�䇄��?�ʘ�l?����d�?�_���@ ���B�	@ߓ��*P@Sz���@ �K�@�<R�T@-I�)@�����@⓮j	"@7D�@�sT2ݬ@$�m&m�@�x����@!3G!�s!@"���r��@#���w�@%n�	a�@&����@(p��ѳ@)��K�@+��i��@-3���=1@.�oN�o%@0E�}�Ϝ@1!U�x�@2�t@2䜝�@3��{7S@4�� e�j@5�����J@6��&��@7�����@8��Y��@9���d��@:����b@;�H��i@<��>E�@=���/��@>����@?�+�FE@@d?Tu5@@�q���P@A|(o�C�@B
_�4a\@B��r@C+>��Ny@C��40�@DQ��2	n@D�d��@E~H�kQ�@F���F�@F�E��g�@GK[��@G��OklT@H��U`3        ?����w�?���4`��?�ION��!?��wEJ�?�>A�_�0?���~qu�?���D�?��:z�@ ���d^@�S>S<@isK�@�&��)@߻�{��@AY�H��@���>S�@FR�9,�@���u@�C��h�@���u�@!^�056i@"�
��2�@$� }��^@&>%��E�@'�*qv�_@)�����@+���"�a@-p����K@/[)i�GP@0����N@1�m�z��@2���݉F@3�w+��b@4̈��;�@5�֘p�@6�F�?�|@8��2Z}@9D'���@:nf�`4@;�e��D�@<���p@>	P�#�@?F�_b�@@C��Q>H@@�t�%��@A�m���@B2��u��@B��D �j@C�EƇ@D4i�Vu@D�̷�N1@E�1~I@FH��$r�@F����@G�(��@HnWx9�@@I)k�	�>@I�b>�l@J�78��@Ke��$g@L(mS�9@L���v]�@M�����@Nz�<��        ?�	��X\�?�~b�'?��Ӕ�2?�M�֒?�4���g?�`���2?����<�?��F"@ ��=�1@�:G`�@�9���`@�1�=� @�7m�^�@:��(�@��'��@��_#,�@j>O-�@g�L�y@ �\��@"`���F?@$�-7@%�;f�=]@'���'�@)n"%2Ӫ@+U.c�Qx@-I�vz
}@/L1.�K�@0�؂�]@1�H�@2�̪ŭm@3��\�?�@5*紗@64z�3�R@7a� :��@8��?�@9� �}.@;e_J�b@<S��B�@=��)DhD@>�v4(x�@@"���hC@@������@A��<�e@B5Z=� �@B�V���@C���@D`:���7@E���@E�r��X�@F��)���@Gi�T�@H1ɢ��@H�Tl:@I��[!�|@J��h�@Km����]@LB��E�@M���֬@M���V@N��q�*"@O���X�@PH_ 5�(@P�o�̟        ?����v�?�I:Fu^?��O<�_?�h�Q�%?����WD?�g��J@��h��@qv�"�@|bV�@����-�@#�D�@�5��W�@��{�@!7@#��϶l@%�!���@(ec᫔�@*���P��@-�M�;@0?��b-@1�gig� @3.�-Ca@4�(4::k@6J��_�h@7�� ��@9� �ߌ0@;C��e; @=  T�@>�_/v�@@K��@A7���@B(�+(?S@CG�#��@DAo{fS@E����@F��@G��k+Y@H*�H��@I9j����@JL=�r@Kb�N3��@L}�дN@M����@N�%�}C�@O����%3@P��Y,L�@QI�F/�@Q��Ϊ�f@RO��h�v@R듩 �@S�+���N@T({���@T�|��d@Ul+�x�@V���57@V��y�n�@W^-����@Xu�u^�@X�[���@Y^ہ.�$@Z��f @Z���%�@[mނ��]        ?��̶�H?��b��&U?� E�8��?�	�M��?�T���I�?�ݎ��?�L���`?�?+:2�?���,�\@ �=�`�@+�uڴL@�NI���@u�)�}�@s찇)r@�j���@C�|W�@]�V�@ȯ9�
@L�"J6�@���xX^@ Nv q�@!���y@#$���D@$��j�~�@&'S$^ }@'����>L@)TB~f_�@*�"�/�1@,�1oR�@.c��p�@0�I4��@0� ԃ}�@1���Y@2�¹��#@3��E�@4��{ á@5�j� @6����LT@7���}��@8�|E��@9�-M��@:��3/O@<;z��s@=�eM	B@>:�8��@?[)0��v@@@,*��@@�UX#m7@Ajy���R@Bo���@B�0�G@C7�z���@C� 7Z�B@Dt��x�@E��8�@E�.{�@F[H�)%@Gb�@G�t��@HQ{3�@H�d'J�@I�R�8�@JV(���        ?�
\p~r?�����t^?�jf�_�w?��B�Bb?滺�6�k?��*+o?��ry^$&?����P�@L�'�9�@v���@	9�0�}^@��p��@9|�@��T�@r�.Z��@Gx�N�@@w�'V�@\ݸ��@!M�Uʍh@"�o.[�\@$��'�ސ@&������@(ru	3�	@*c�Skh@,dU`�h�@.t;�$5�@0I�qs@1`k�X�@2~��E!@3���_�@4�X�@�@6�@�@7>�%s@80�lkl@9� vTQ�@;o3�_b@<jh*��L@=���?�@?'��($@@G޴f�%@@��(�8@A�?L�LO@Bv$oD@C6�Ӿ��@C��&j�@D�+��@E��SFE@FT�Y��@G#P���@G����!@Hȯ��p@I�i���@Jx�c�@KT�m�V4@L3O���x@Md[��T@M��^i�x@N�K��@Oƃ��@PX���G@P�Vs�kd@QG$�(��@Q�2��        ?�����?�m���?�R�����?ݷ��ض�?�tߕ?��x�8C?�u�=��G?��>$���@D��+��@����@	1%��@�d&<�(@50�3�@��|M��@n�8.�@Df$wn@=��5�@Z�g��	@!ML���K@"�G��h@$���?b@&�g���@(tn�W�/@*f�൙@,h���@.z+�5�C@0Md��@1ezєx@2�� M�@@3���^�w@4����K@6S_��@7Ku�S@8�ˣ �@9��BF�@;*g�z�@<�߭�}\@=�R��]�@?EYk�P�@@Xnn$��@Ab�[��@A�~r�J@B��S���@CN��@DM����@Dܗ�H!E@E��/���@Fu�S�@GG  �%�@H��])p@H�Ξ�@I��"Y��@J�!��@K����!@Lg�}�\�@MK�%��@N2\��@O��*#W@P�e�@Pz�5��|@P�:d�@Ql���@Q��0�        ?���o|iT?�m�SD�?����A|?�~|	�?�<rjW�Z?��]�
��@%�n @��:��@�w*��5@�s�V�A@k^{��@[Q�M�>@�u_�s@!��6��@#�ā8k�@&Z}���@(�)���@+��'��@.z�C{��@0� S���@27��M�@3�
�m@5f���g8@7�?(@8ǐˣ~@:�g/r�@<X,mz�@>1٧w3@@if&�Z@Aq~���@B �����@C��]1;@Dճ{@E��g+@F+h�	�o@GB�=S@H^�i
?@I����@J��@�i@K�+��+j@L�3�jW�@N2�����@Oj�D��@PS�~�n@P��^b�@Q�~�~Y�@R;"� %�@R��Dy�@S���@T5�$��@T�`{AsC@U�=�-�y@VBz�f�@V��er(I@W��:�*�@X`9IC�{@Y���@�@Y��9�:@Z�UP�h�@[M^Ey
@\3�C�@\�Φ�<2@]�,/T3"        ?����/G?�NnfX�?���d5�?َX�jzM?�zt%���?���Z�?�l>�f�?���Ru�?����~�@�-� �@��߹��@	SQ��,+@\�G���@��܏*o@AX��?@w<`�e�@����	}@��vf�(@C����y@ 	o��>�@!~ 
'�.@"�+YK�(@$��?��@&&;*�M�@'ˢ�?2,@)|�4�'@+9-o�E�@- ��1�@.����V@0Y �[��@1M{�Rq@2G_5��@3F�(ϴ}@4K$gA��@5T�pO�N@6c�ALn�@7w����@8�C�,;@9�Kީ.O@:�mKG��@;�s�{��@='N�"�@>X�j�8�@?�8� ̫@@e]��@A˨!a�@A���X�@BJ�Е"�@B�=%�+@C���T�@DD:�<z$@D�՗9�@E�zP��V@FP"͊�9@G��c @G�ks_[@Hn1E=@I&�M:@I�����'@J�M�]>1@K[���>H@L����@L�u�C�        ?�����x&?�)+z~@�?�Nt�wV?���%iL?��"��?�&P �O?�P$|�?���
<<�@�fb�@��?U@
*7�i�@�B���@��>2Y�@~:z�`@G��0w@6z���F@K��]�?@ B�HX�@!���۩�@#��l49t@%��\�'@'h�q�@)\
���3@+`�P�?@-ui�<8o@/�G9{�-@0�yUv�@2	��]�@33jF�Zc@4d�� t�@5����S@6�	l&�@8%����D@9t�.���@:ʊ_�0�@<'��+*1@=�����@>��ߣ@@4Ml�p@@�A)�@A�T�v�b@Bs]�0�$@C9�*�d�@DZ�.�@D�?��@E�aW5?@Fs��\d�@GJ?�ӇJ@H#��rH@I �]���@I୎�%�@Jì���@K����+�@L��ȣ�@M~�r�1@Nm۵�^�@O_�QXJz@P*]{�=n@P�CؿZ@Q#���<�@Q�d4{�@R"�r�@R�<��?�        ?��ᒾ�A?�z��/4?�`^��ɭ?��ơ�=�?渪��c?��Q�m?�~��q?���1��@F��9��@(U�@	)���[@�Y����@(���2�@�Y~5�@Tۚ���@!@͏]@�iĦ{@"�~E@!*x�OE@"�5�f��@$���>��@&WRq�^@(0�S�c@* �Q.F@,�x�L�@.�p�@0�d���@1$��=@2<�.lW@3[~69��@4����G@5�%Dy@6��C��$@8	���@9X�Gza|@:�{�a@;�o-{�@=<�Ě��@>���W@?�_3}�@@���Ւ@A`̨���@B�-dk�@B�|NkA�@C��a(�@DQv5w�@E���@E�n�Vq@F���Ts@Gn'8/�`@H;�<��_@Ii;%&x@I�n�
��@J�,�@K�+�[N"@Lg�� -�@ME����@N$��F��@O���@O�fj*�@Pit��
�@P�E�vNy@QTO\gm        ?��#��?ϝ*L��?৅��?쐷��Q�?��:�Z��?�ȅ� ��@���_z�@
��w�8c@����C@4�(�8@%��n�@c�'�R@ uܟVT�@"ݟO��V@%g㘹��@(�/�Ƕ@*߀ƂE*@-����@0jZ)�@�@1�!� �@3�c�ۧ@5P�{M�@7��S�@8���A@:��q�Q�@<�Q�]�@>�`[�@@Ff*% �@AL��4��@BX�I�l�@Ck0�G�@D���fv@E� �*@F�g��1@G�"L�@I �uH�=@JVV���9@K�����'@L��(n��@NR��@OeZ~�Z�@P[d��@Q�=@�@Q����%4@ReU��?�@Sq��>�@S��>�@T�T�@@U@�>��@U�nzE�R@V������@W~1b�@XA��;��@Y�¸�@Y��eΣ@Z�t��b@[g���Q@\5��$\�@]��P�@@]ـ�p@^����@_���g�@`/K~�G        ?���\�X�?���N�U?�m�gڦ�?�8�ҹH?�8�r�ݮ?�'���L�?�.�1_�/?�h�9��2?�:�S��@�_��g@JT�@	�3�*�@	jT{d�@��U ��@�9p�A2@A/�@���/:E@RؙKw�@w	c?8@�/�QlM@!]�g�a�@"��8�J@$l�t�H@&��@'���)�@)`{,�)�@+&H\?@,�b�E�@.��3�]<@0Px��E�@1F�#�	@2B�ѳF�@3C���z�@4J�y��@5V��'	�@6g�Ϭ�9@7~U��δ@8��rwQ�@9�sWC��@:�;R8�@<
�L��:@=9��] �@>n�)��@?�j�A2@@rj�nqS@A�䓎@A�#���@B\���I@C/Pt�@C�g~
�@D[����@E
�OD@�@E����u�@Fn�"�]'@G$0�uW@Gے�H@H�
c��@IP�p)ҕ@J"{���@J͸?m~m@K�M�.�{@LRݣ���@Mc�)�        ?������?�vs�M?��+S7j?޹��<�w?�g�m�O*?���Pvk?�!l�P�?�|P��yH@Ȑ_��w@����Z@	�oE�D@u��R��@�����@A_㼴@�%���@��?{��@�F�h@ �n�Ȗ@!��2Җ@#a�"U��@%'�4���@&���gH@(�5n� @*��by��@,�c��Z@.�8�U2@0��k�T@1�J�g[�@2�y�x�E@3�n���@5]X}�@6?4��B�@7w�(S�=@8���E@9��҇�@;G<C��@<���6��@=���jZ@?M'ٗ�`@@Xl��@Al � �@AÔ"�CV@B}��}��@C:'��W�@C�~U҈@D�z0'��@E��M�-@FG;U��@G�>�ܖ@G�#���@H��� @I|�Mky @JP��^y@K&��9-I@K��+�0@Lٚf3T�@M��b�q@N��Qk�v@Ow�2-;�@P-�*mW�@P��X��@QvML[@Q�K��L        ?���fв?��-_,�?�����P?ެ^e��s?�c�g�z?��U=�x?�"X~"��?�K��J�@�Vd�>@�����@	��E���@pg�@����@I�G=�|@	{Y���@�yƻ��@��B��@ ����y@!�x)�|�@#si��Z�@%=�`�@'�#\��@) �@�eh@*������@-���@/|_ @0���Lo~@1�x ���@2ލ)tK�@4�{��@57�p�SE@6n�Y,��@7���&NE@8�'v[��@:<1���@;���m�@<���!@>C�ukgV@?�^�%��@@��ў@AA�":�@A�s��@B���Z�@C}w<��@DA��X@E	h�_�@E�̞$x@F��|�\@GqGv��@HDL9>_�@I~�@@I�Q:i@J�.5�s@K�����@L�Ԡ6x�@Mp9ɧ*�@NVBCRj�@O>��D/@P��!@P�����@Q,Y�~@Q}�эK@Q�Q��S;        ?���j�!�?���?��?�V/�_`�?�s����?�^�?�4T4�]@=�ե�@
�͐g@IB��@܅JS@�ʤ'kK@�Dе�@ 5�B��@"�>p7��@%��h�@'�_�;@*�UaM�@-p�\a��@0;�ъ !@1�Mn��@3o`���&@5Uh�"�@6ݖɛ_5@8������@:����@<k��V\�@>`�Rd @@1M��@A8��ݹ�@BF�?g@CZ�Q�@Du��h@E�g�|��@F���L8�@G�����@I
�f��@JQ�%ŐT@K�b�f�@L҄���@N5a��@Oibs��@P^}�۱g@Q
�%�W�@Q����#@Rk����@S "����@S�&�ib@T�n>��@ULZ�#K@V
��>�@Vˠ�=P@W��ʈ�@XT�NoO@Y�3�n@Y�54�6t@Z�O�n$@[�%q�t�@\T�|���@](E�X1�@]�94�g.@^�h�ؼ@_�̑:{�@`F���}        ?��{P-�?��D�tݛ?�~J���?�z��8?�\Y���?��;�^/�?�Y����^?�P�1��?��p7�n@ �����@7D�@�@�1�R�@y���>@p�#��@���8��@�Fj72�@E1ާ��@��>�!@�L�pi@��"p�~@ $'��,�@!�z�@"��ͭ�@$R��X�@%�zA �g@'K��3%,@(՚A���@*hT�l}@,�A� �@-��HVZ@/R��0p@0�0 ��-@1`��+��@2Bf�L@3'��-�@4�(��@4��Q�m@5��S�@6�c�3@7�(�Q2@8�?ũF@9Ιy�H�@:�,�(��@;��=�i@<���?��@=��W��@>�����@@ ���@@��Lq@A'���%@A���TQ@B/���dv@B�%�(��@CP	���@C�Yᇇ@Dv���@E+/� 9@E����V�@F9��p�Z@Fҹǋ�@GmG'#Ͼ@H	*���@H�_cY�        ?��pٝM?�r�f�O�?�F�)y��?ݕcD��n?���!�?�ѳ�q:?�L1	�49?�g��XY!@^���@�Y��Y�@�+���@Bcr�@�@�[���@p�w�}@��K��@�9��D�@����7�@���k�@ ���)�h@"�'���@$=���-�@%��@�H@'��GY|;@)�c
�@+�W@ܚ�@-�i_���@/��g�j@0��n0G#@1���0@2�Y�~?@4-\e�@57�l@6`)��D&@7�K��,@8�\��^Y@9�F��\�@;?�2jy@<�L:Q��@=�?mU�$@?#��Σ@@=U��	+@@난�y@A�[x��S@BO��Kν@C�Ju��@C��
�h_@Dy��v@E7�1�O@E�)Vs��@F�C/�@G�yz�\�@HH]S���@I�f��@I߉?���@J�ȹn��@K�p�>L�@LTz4(Y�@M*���hM@N��m�@N޳!��@O��u�l@PM���x�@P�ۺ��        ?�{���?��.��?��Ӑ?��ǻ� ?�+2����?�S�"�M?��_��.?����T@ ��f���@�$�v�D@�
"g��@�� ���@Ƙ����@=]�'q�@ش�тP@��� �o@yf��/@}����@ � �ʳo@"s�	fkQ@$&jv�8�@%��n��@'�o�7"T@)�9L�;x@+��>���@-�y�x@/����ж@0�=ZS��@1�����@3�OUm^@4)�U�6@5R��T8�@6��`��@7��%�@8��:�,@:7^c���@;�����@<� ��d@>%��%�0@?�t{���@@q�
4�R@A%���	@A܋�?9D@B�o��T�@CSC�l�@DE��@DգZ@E�#�B͡@Fc|s���@G.�����@G��vS�@H�]R@I��n?�b@JwQ�N*@KP>�&�@L+�V�E�@M
M�@M��^�@NΤ"�#@O���+#�@PN�'[�@Pċ�q�e@Q;����        ?��|??Ͱ��W?�D<�6�i?��r3^�?�l��tD�?�����g@N�B�@��i��u@�#�)0B@۟�u��@�����@l
O  +@��W@!���{#[@#��xϤ�@&CC�_@(�(���@+s%��k@.1���_�@0�G崘@1�����*@3~Y�X�u@58��"@6��)�~M@8H �&;@9�R%��@;��k^�3@=m��F`@?7�C�\@@��@��@At(�/�v@Bf�v��_@C^��}@DYjV٤
@EX�3�ؾ@F\}1�K�@Gd�#<r@Hor} a@I~�N�̻@J��ZF��@K�A��*}@L*&�d@M�T2tF�@O�ecQ^@P?���/@P�`u��@Q=43J۝@QԶ+u�g@Rm�2�2@S�:-�@S�,�MG@TCF�5�@T���^�@U�M�[�N@V'4��c@Vˬ�5�@Wq��ǁ�@X?\m	�@X�Q�#��@Yl�K��@Z��i��@ZƂ���@[u�FhM�        ?�.8���?������K?���`��?��0bV�?��P�L?뷒�e7?���}u�?�ثoQ?���4�K�@5�h�@�*z8$@	bSyK@h��;�@�;��@���KZ@r�؞�u@�%B��@c�N�@-�/�s@�$qY��@!j�Q�%�@"��w�@$o<���@&�P��f@'��Pѻ@)K�4�ۮ@+  [Zʒ@,�;% Ҋ@.��~�@0.N�#@1�+�^�@2`�l��@3��Kd@4���v�@5�x
�<@6�$F�@7�>O��@8'�R�w@9;� 9�@:S�����@;o��߀�@<�b�sp@=�}�@>�����@@Z7a��@@��@ӭ�@A86Ӡ�@AԚx���@Br�� Bb@C2&N%�@C�\MV
�@DYh�T�@D�Ri��]@E� �d@FP��D@F���@G�1&&��@HX u�@I�۔��@I�9Q\q@Jo[G9��@K%07���@Kܳ�S2�        ?�=�/X�u?���*!�:?ї�+��X?�" ��&�?��ɢ'ٖ?�5���5?�����?��e�@o~�F��@?1�Ė�@	cR&�c�@���4@N��]O�@��A9y@�R"��@U�����@I���t�@_�\�^�@!K���>�@"������@$�j��b@&~�֧1�@(Y�\�#@*CE~�K:@,;�ݑ��@.B�ǳvn@0,+�� W@1=�X�O'@2V��F!l@3vO��M@4��>�w@5ɸ\}�g@6�Xfl��@87y0�Q@9x��$`@:��؊�@<СO�@=_dtS��@>��W�@@*�?�@@��7!o@At����@B-5�?,@B�mU��@C�Į�@DhD`UL�@E,?��Ͼ@E��Z{�'@F�{�K�@G����2�@HW�� y@I)!�C
@I�VS_��@J�*j�U@K���Ǔv@L����@MhÄ%@NI,��hW@O,�L%��@P	]fq�@P}��?w@P��QO@Qi���:�        ?�y��1�u?�4���Ѝ?�%���.�?�!�h��?�ŔC��?��x
�?�w5�th�?����'@���-@���ؚ@
Q����@�z��0�@��;ގ�@�`�^��@`�D��m@PM���@d(n� �@ NTm�>@!����H�@#�]�M!�@%��ق�\@'i�}��@)Z(��@+ZFְ̦@-j	���@/�3�&y�@0�ĝ؉@1�h����@3 ip�O@4M����@5�1R00@6���z��@7���?/J@9IU/y@:�x�$��@;�Sz4/&@=M�&ɸ	@>���B۽@@0!�1�@@ƦO_��@A�F���@BA�=.9@C�Ek�N@C������@D��-�G:@EZ�E�
,@F(j�^u@F�+i|��@G�����@H�P3�Ba@I|��	r�@JX�����@K7�Q��J@L��h� @L���7@M�]�A�@N�_Q�Z�@O��,�/@PU���I�@P����@QI2�}%�@Q��R�{/@RA���        ?�鄘�9?ς+��U-?��ź��~?�k#��!�?���p��?��'h@w�!~��@
U\k��@m�a�H�@���J�@㍅,�1@�� @ A����u@"��^�0~@%`L���@'����}@*t��b�@-O2޾�@0#�P�@1���r��@3D��_@4�o�8@6�M��@8X�����@:#I��Y�@;�R�-@=ܪ�e�@?����:b@@�3pƱ�@A���G@B�SA'�@C�xb��;@E��/K�@F#wfMi@G@';��@Ha����@I��APe5@J�o5��@K�f�F+�@M}�D�?@NSDR�H@O��x�1�@PjP���@Qn��n@Q�Wv��@R\2Zlpt@S�P9�9@S���-@Ta�sZ��@U|݄�@U�TCn�7@Vz;��a�@W1+����@W���bR@X��׆L@Ya��)[@Z ��<�@Z�}�@[�$��H�@\h����@]/Cut�@]�_@o��@^�zGz�        ?��Y��#�?�U�� zM?��l��z?�r& �Ũ?�%�vƓ?�q.��8E?�〵BU?�}���7�?����(@�e���@=�,��@
${(��X@Otҟ|@^J�o@��Ǽ=@*r�\�V@�($��&@o*(v�0@<���@@@ ��O�C@"R�#��@#���q@%Ai�I��@&�p��@(�Q�V�#@*b,ܽ��@,/�6K�@.	�i�_@/�*��@0�5���@1�G<���@2���T�@3�9�&�/@5;M�D�@6z� $@72⨍J�@8P]� a7@9r�xno)@:�B�ĳ�@;Ƈ���K@<��L1�@>-\�Ǻ:@?g�򬐰@@Sg��3@@�.���@A�1��^�@B?i2��d@B�͌��@C�W��p�@D?��Y@D�Æ��@E������@FQu��@GXd�>P@G�:x��@HvB�@I0�����@I�gp�	@J�CP���@Kl�Ɍ%v@L/9���@L����@M�����B        ?�� jz��?�a*=�?�D��H?�J�
���?���x/?��u��?��W�
Ԯ?�5��y@ ��t[�@��?��@
ii���|@���`@��J?@��Fs��@u���W@h-��u@�y�@ ]�4��@"#�6b�@#���e+�@%��ʺ��@'�<ʋ�@)t��[@+w�/�Lh@-�%LlB*@/��a)�@0�P�@2g�b�@35ρ�=F@4d\I�!@5���	@6����@8�Cx0@9e9x=@:��
�@<����k@=m��2@>Ӈ|�һ@@��ۿ=@@�f��@A��,���@BUP���.@C&]��@C��[M@D�$PR*@Es>�T��@FBdP,�S@G�0�m�@G�L!l@H��zjqS@I��t��@Jzڑ͖n@K[����@L?t�Ld(@M&tv_h@Nu�
P @N���Fb@O���)�@Pn;f�6V@P�}_��@Qd�<@Q��l�@R_caWC�        ?�X{V� ?�Z͗?��)��?���X�
?�g��?�}p�0�?�L$;}uD?��=�~�/@�m__�@�^/
�@
Uj���@��ۿ@�0Ǔ@a�q��<@ ����@�� =�@�����@ ��|τ@!��o@#u�x&8@%;?�;�@'T[�@(��B���@*稗�Ұ@,�F�@.�%�`)�@0���k;@1�Y����@2���5;�@3�K���@54��F@6;��u�:@7rk���@8��E�ь@9��PA�@;<Zzm�
@<��.1��@=�R#�d9@?<�צ@@N�~�5�@A9���@A�c��!2@BqN]s @C,�Waj�@C�<��W{@D�-!��@Eo�0ʧ�@F5�4�I@F�sif�@Gɗ�y��@H�7�}�"@IgK-���@J9�i�';@K�j��@K���1p^@L�m�R*�@M�B�L�@NyW�J�@OY�:�]O@P�d�@P�g����@Q�j{�@QxA�XU;        ?�Li��?�.��Y?����Or,?��mA>?�0p�h?�\��l[�@�K��?@���Τ@���FB�@����oM@����@��{�"@ �Q�O�@#@�i�,�@%�����7@(��a���@+s-6�y�@.q�E@0�e:q�@2e�]'?K@4
�	��@5��rI/@7���y{@9r��%]@;Xi�$*g@=L/�կ@?M,���@@����2@A��G�o�@B·]�u\@C�J@|1Y@E ��p@F-�db�o@GY{e1t@H��}�e@I��kZ�@J�y���@L@��j��@M���G@N���(�@P_v��@P��aLQ@Qm|b@R�aXA"@Rа)�/�@S�+��G�@T>xO�@T�GN�,�@U���Mj�@Vs�����@W4�z�OI@W�2bG��@X��G�O7@Y����)@ZO��x>�@[�;w��@[�ѝ9x�@\�Dd�J@]��T��@^`��O@_7hٲ2�@`�bP�k@`u2�%�        ?��? ���?��+
X3?��_��~{?�ꋝR5�?�;!��?���P�t�?�?yD�3�?�4��|`�?���nO@ �Մ�@3�@¡q�@��_q@� 
$�@�i��h@1��o��@���@��x�@��~�#@Dbw���@ ����@!��ĦN@#p+&_��@$���vK@&�Q��@(*h�O�X@)��@�1�@+��m@-K�`�4�@/zr��@0w=��;@1g�_vw�@2]��q@3Y)���|@4Y�%�#@5_D��$@6i��[O@7y�Az�,@8�j8y|f@9��%H�@:Ɵ�S��@;�
s�ԕ@=F�_N@>?Ig �j@?q	/yi�@@S���{@@�L�&��@A�,�(l@B3Z�K��@B������@C~���S�@D'�%`e�@D����{	@E�Q)R[@F0����@F��ض(�@G�`�h@HLSO�Q�@I�p��@I�P��t�@J| *yhC@K:�=*�)@K��4�        ?�}!	�[�?��/tj�?�ޯ^n�9?��\@%d�?�T��s?���"t?��̴�&�?��2&'@ ��U�-@e���[@aw5,��@��0~�@�qv�@��u�n@�8��%@]x|}؟@6�C]�@1&� -�@ � ��<F@"CI�7H@#�:��b@%���T)@'v�x��@)PqBl��@+8*]{�@--ߘ�@/1J@���@0��\�+@1��BZ"@2Š��r@3��>��@5�Z��@6,�iy@7Z{��*7@8�����@9�4�9AC@;	UC�Vx@<O0Ј�@=���U�+@>���ƈc@@!./t@@�.�|b�@A�7�@)@B3/]���@B���@C����� @D\�YU�@EC`�q@E�Y�(�:@F����>�@Ga�@I�L@H)p�4�@H�U�_0@I���2{k@J�FV�@K_B�y�@L2��
8.@M�w�n@M��}X��@N��RX@O�#��ɀ@P:Ep�`X@P�����        ?���`�v�?�7^.~L?�'���?�'�����?�ĀDƝ?�͗"Oؐ?��A{��?�=�~y@#��YR�@"2c�@
{E$c�@,��[��@ڵ�͠@��eW@��t�@;@�k,"0\@��7�n$@ �NAV5�@";Ӥ�>@$}FƳ@%������@'��5�(`@)����@+��I��@-��Lu"7@0@�m�@15L��@2]T����@3�A^N�@4��^>�2@6rP�C@7K�;���@8�B�W��@9�t��@;NR�l@<�I��J@><�jV�@?��E�@@����~@AGT5ƽ�@B�D��z@B�=�n��@C�P�U0�@Dl��&�@E>�5��@F���y�@F��`e��@G�{��@H�@k;�@I�2����@JmK%��@KU���@L@Ԇ)�@M/8*�w@N �f�@OwX�%@PA�"/G@P�q@�O�@Q�7�^@Q�/�,�7@R�ƶ0�@R��c���@S��k�        ?����5�A?�~���?�	��?�����?�U��b<�?��`���@FhDr@�{.VY0@e�E�@��� �@�ۭ*�@�JaKI]@���0�@!�U����@$)�cK	@&��]~o@)]]��x@,&)�>�@/,��ze@1�/͞�@2���$T@48I���.@5���g�@7�'�8�@9f����@;;:�2>�@=��]�@?
��͚�@@�܇��@A�m��A@B���U@C�ՠY�@D�� �ߙ@E�+����@F�X��@H�J��@IF�����@Jy��.g@K����s/@Lﺕ
�`@N3��Z�@O{��;�@Pe~��@Q�Ȓ�r@Q�6���@RjIװa�@S��!p@S�KX8�@T�/��*�@U@��(%@U��%���@V�9����@W|Ni�(k@X?��@@Y���2�@Y΅XrBl@Z��vY�@[f����@\6���@]	����@]��1.J�@^��.g�p@_�4w�        ?�3����?��!��?̄�9�6?�p�d��1?�j�$�?�L����?�}_�W?���VW%�?�H!T?@;j����@��[iKh@6'�]ȴ@|i{i@)86@E�%�ו@��Dв+@��U�@x��A9@�\�h@�q�@ �`�,@"C>M��@#�Y���Z@%Qp܃�l@&�F;Ɇx@(��aı@*>Gs�~0@+�p^�/@-���4�@/�6�(@0�!f�[@1��w �V@2��6Cf@3��]c�@4��Nل@5���'�@6�@��n�@7�����@8��洲�@9��~�'�@;T8$@<2V��1@=Yӽ��.@>���o��@?�˺Ӎ@@uTpf��@A��D�@A�`BT�.@BQ�5"�@B����@C����;�@D?� N*k@D���3�@E����G@F@��u�@F�͙G�@G��!��@HS��uY(@I�F�14@I�k��!@JxG����@K3�F>�@K�ez^        ?���ъ��?�|V�?�Q���I�?ݪ���?����;f?���t%d?�a��7f?��:1�ٽ@.�W��Z@�4�@	��n?�@n��̝@F�0v�@�����@8��u��@:��@�VX0��@�����@!��>�@"��W}]�@$u�M'=l@&=M��h!@(]
:�@)��̠�@+�A,ֿ>@-�3r譅@01��yq@1��@2'J`��@3D��W�c@4h���l�@5�."�U�@6�PK"�k@7��e�@99㦈|@:~3�!��@;��em��@=�0/��@>p|�y�3@?�w�M��@@�7�m$!@AL��)�@B
�30@B�P�^p�@C{v��$@D;s6 �@D�=x�d�@E�͓�e�@F��s�@GWs�Az@H$�D3^�@H�'M�5�@I�#=��@J���^��@Ku�Tm�@LP��?��@M.we��@N�3���@N�?R	{ @O�191]@P^9��t�@P��~@QI9��;'        ?����)?��m=�߷?��N��Q�?��^���x?�
��mb?�ʀ�?���em?�։K7k�@ �T"BEC@p�K�@p���/@�	��R�@�kI�>f@$
jI�@�_�MN�@z}Y�6�@Z�:���@\�do�@ �ݴ�D@"b3���@$Pv��@%�"ON�b@'�`�L�?@)�ǥ�n@+w/�{3@-uqy�h@/�v���@0�R�Q@1�^e<�@2��h�#�@4�����@5HJ�Md@6w���I�@7�[�y�.@8�R��k@:+�,O�u@;t�6�M�@<�W��Wk@>yqk\@?r�WOlh@@i����5@A���@A��}�Y@B��F�I@CG��[�@D5�c�@D�F1~�@E�6�N\@FQ���NA@G�ʧ@G�����@H�i�cl�@I�f��'X@JY�7?b�@K/܁ ��@LDGq�}@L�488N@M�D!���@N�̚�D&@O�����%@P2����@P���@Qc�47        ?���=�n?Ϳ��PV2?�\��tb�?�����e�?��4[�F?�.ء��@u> l�@	ׇ���@T;ou�@b�rX@�"�-@�hߠC@5zB�A@!�S���@$S��<��@&�Py��@)��f�@,^s��g@/J��}�@1)��!�@2���j�e@4]z�$�@6%(�H@7�?���@9��F�o@;g��b/X@=J�H:�@?9��V��@@��ǁ�@A���>X@B�N����@C���?6@D�@��@E�C.�L�@G�qщ�@H.�K%G@IZg	�!�@J�7b��@K�H��1)@L��X�
�@N<噊 @O�Pp
ۤ@Pf\�7��@Q	٩@Q�&[�@Rd��v��@S��*v@S��a@Tx�'��@U.��!<@U��`��/@V����6-@W^d_�3i@X���d�@X���@Y��B���@Zho�R��@[0~q��R@[��B�@\�'M��V@]�����@^fk�an{@_9;��f        ?��?w��>?��{��NL?�e��H?��#<n?�`Q{7?���l�y�?�d4Vɷ�?�c�:�g?��G�8�@	g��@[��k^�@�}���@�����@�R~�] @
o���@JF�M�K@�F��M@����E@���@QE���@ ��l�O�@!�p���@#kɟGp�@$�jf�@&|�o��@(�����@)�����@+e-�fQ�@-�SPt@.��l�`@0UARD�@1@N�MS@2/�b��'@3#�8�u@4��a�@5L��$@6�	 S@7#=A��K@8.B��m@9=�ٵ)�@:QHd7��@;i*����@<�9��|�@=�jB��@>ɰZ��@?��6`�@@�*�2��@A'PՙJ�@A�n�>(�@B]~�Y`�@B�|��|�@C�dV|Z!@D=1:�X�@D�޹�v�@E�h�@�@F-��Z��@F����@G��?ї�@H.ˢB��@H�]R��F@I��љ�@J?��C1?@J󉈡�h        ?����Wn ?�E�o�� ?����Q?�GSi�?�N&/�C�?�aH��?��!uR�?�$`Iz�@ �";,�@�Eқ�@���L��@�Y��;�@��'3@ELk1=�@�+֟��@����2l@v�S�@tg9�@ �����@@"gEyMJy@$��d�F@%���y9@'��=��@)t�z�mB@+[[˓��@-O���Ϥ@/Q��	K�@0�E~�lA@1�2����@2�wI)ұ@3���}@5��Y�H@64R~*@�@7`����U@8�|�J<�@9�çuC@;	��y��@<M?�
�/@=�I����@>��z�G�@@H�j@@���s�@Aw�lS;W@B)��@B���<}�@C�~�D�6@DM�M�R@E	�4��@E��hWLK@F�/z�/9@GI�:���@HwRy�@H�z):Z@I����"@Jj]<��@K7��ч @La�%ń@L�6 `�8@M�#Nk�I@N�#���@O[2�7�@P�~�o@P��|        ?���z�d?�bNPk�?�F��(��?ݣF^�+:?�9P��?��崝�?�f>�%?���[�u�@5��?S*@��T�@	w�+!e@��St��@���Њ@�ϯ^&@K�S��@DL;
�@	�#;P�@�C=_k@!(�@B�?@"�[���@$�2@&X��H@(2~q|r�@*��0�$@,d6�u�@.�n�U�@0N�|�"@1(�ѐB�@2A�U@3`Q��.�@4�A�Ș�@5�Ԭ�I@6���(�X@8� aC�@9_p*\E@:���J��@;���*@=De���@>��`2�*@?� �k�@@�����6@Ad��v�3@BL4 �I@B�Տ��@C����@DT!�i@E�ű��@E�,'_U@F�!��,%@Gn����@H;�'_G�@I[���+@I�o�X<�@J���V��@K��r�@Lb7ja�@M=�S��@N�}@N�02���@O�����a@Pa�Ze��@P�Mz�m�@QI�e��e        ?��)���R?͊V�L�G?� Y��?겖�{`f?�\�9��?��QV�b;@H:���\@�wF~@�;܈+@�9�>9@��J��@���ǚS@�q�xڏ@!��/9��@$��Q@&��s���@) �C�ϛ@+��߃�@.�X�k��@0ў}��@2W�zު@3�V��qo@5�y�@78�N�c@8�ܸm{i@:����	@<�	s�d@>a���@@$�嚀�@A���]�@BL��@C DI�a@D)�_��@E8 �Őr@FK�v�GS@GdR�ٛ�@H�@�I�@I��I��@J�q3�(@K�L�k�@M)9�m�@N^Ȼ:�@O����@Pk�o��@Q]K(�@Q�'6b@RW#߫`�@R�M�S��@S���mw{@TV��@U���V)@U�Yuce�@Vh��a@W��ˉ�@W����*@X���k�@YG�H5��@Z��c@ZÆCl�
@[�^K�_%@\G%+��`@]�H�Z@]�m��O	        ?����R�?��e����?�4����?��w6��?��y�]�?��=9C �?��b�(�?� Z��J?���z���@��H��@�]Am}@�ӷ3��@w�q�5�@I�'��A@tMOYq0@������@NOo*@�:L�H@#O�Y�U@�9e$�I@ ���%q@"1B��_@#�\v�R�@%(!;uz�@&�S!hb5@(H��y��@)���$@+�G$v�@-D��Z@/ +,��@0b�B��V@1I���@25����@3%��!@4�t�� @5g�q�@6�̉@7�;I��@8� ^&b@9�aCb�@:*o�\�@;;C½y@<OzX`-�@=g���X@>�l��@?��f�q=@@b�]Ďi@@� A�R�@A�.�@@B!�L�~@B�'���@CT	�!I@C8/<@D�Ρ��+@E+�/�wb@E��eV��@Fm��C�p@G�u*#@G���P)@H[�T��_@Ir�D2@I�u���/@JV��Ӛi        ?�49�ٽI?����܋�?т���	?��<��[�?�׍y�x,?� ����?���>��?��0�#��@XzgGUa@"����@	@��þ�@��yEac@6�� =@���.jO@c��J��@0�ޞ�T@܇~�@0��I @!1�����@"��zv�j@$�
.�%@&\�J�A@(4�:4�@*�9�Er@,�3�@.x^L�@0�>~��@1%=�r}]@2<��Q�@3[+�@`@4�Z�7$Y@5�:yU)p@6޴�T.�@8��sr�@9W'� N�@:���@Χ@;��U>@=;|�;�@>�	-D@?�	<[@@���&�@Aa�u��@BP��^@BԆ��
�@C��F�@DS�ѧ��@E]�?�t@E��zJ��@F�S��G�@Gsu@�yU@HBTA\M@I��VC@I�7���h@J�2_�7@K�ׯ]��@Lu%T�Y�@MT���@N5��-��@O�$HA9@P Hp�@PtY�@P����Q@Qb
k/��        ?���J�c?�uЁ�5?�W���C�?ݽw���?�YS%?�O���?�s�V`��?���oʾ�@?�P��@�/5/@	!�G��@���"s�@$�h��m@��gT��@Q���Oh@�l��@��@!�V|Sz@!*�����@"��3��@$�I�6��@&Y5�o�]@(2{��@*δm��@,�F�S@.�x��@0���u�@1&��T3|@2>n�%��@3\���YB@4�4,��1@5��uO�@6�!��0@8�}���@9Wc�i��@:�C-#�@;�)��PM@=8 W���@>��Қ�z@?�"7y��@@���N�k@AZ},��@B(֕�@B�tނ�S@C�~U���@DE/H �]@E~5��N@E�a�e�>@F���@GY��]�n@H%++��@H�����@I�H{��2@J��Jל�@Kj��Aw@LB+nZ�5@M�Ӣ�@M�wa-�@N�hu��"@O��`��6@PK�X��@P��\A@Q1/e?>        ?�w�l?��X�A�?�-�4�,?븶}F}?��RC��?��F��@�x�z$�@	��i�G`@	V��@|�q���@B]ъ�g@O(*�;�@�"����@"4�0�*@$��f�@'@Idg�@)�׼kQ~@,kr�N@/F%�D+@1���HF@2��>�*@48nL��@5�%�M��@7��{���@9:�&S�;@:����P�@<�,�aj�@>�>��o@@BpؚR�@A8�[h�@B4��}��@C5�p2@D:��A6�@ED˓��l@FS�
"A_@Gg}��٬@H��«@I����#
@J����S@K�X��@M��q5@N;�iF��@On,��a@PRY��?@P��K@Q��	;�@R0(���X@R�VR�E@Sxk��&q@T`�a�@T�,z��@Ur�(m$g@V&��S�@V�F!�_�@W}q�	'@X.��-�.@X��e��@Y��	syA@ZL��6G@[񰳕�@[�y(Y�8@\y�J�@]6��h        ?�fM6L�?�Y�����?���%� j?س��D?��׼ҽ�?�s2iq�?���,��?� ��F��?����<�@�C����@ %��_G@��#�sF@����:@}��d��@�K�LV�@ ��g�@��/79�@?�����@�T���@�$cz��@!fSmW��@"�Aq�@$�����@&+��t��@'�#d3yi@)��ug�@+jj2���@-D-*�?@/*[L䷝@0��8�4�@1�Vn���@2�+��F@3��{�8@4��b��@5�ѥ�@3@6�>�^�@8�[h@94x�x�:@:c�YE�E@;�S?Jav@<Ҽ�MQ@>��k�@?XS�z��@@Q�|��=@@� �J��@A�V"G�@BR��U;^@C%/p��@C�9L�X�@Dk��x�@E$S��.F@E�SF�)=@F��m�0�@G]$�]��@H���@H�I��:(@I�3���[@Jw��>�@KD��P?�@L'	�G�@L�)�ʯ'@M��Hh�/@N����        ?�*^�3\�?���S|�(?ъ��'�?� �Ѥ�?�������?�.L'�6�?����M�]?��6_S9@n�b��@Aϙ�m@	j���r@�+�U@Z�L�q@�x�F�@�w�p@v��G�@t� �|@��ϐ��@!m���Yw@#!q<��@$�G/��@&��,���@(���	@*���d�P@,�R����@.�Wm�BV@0g��<�@1��(��@2�X���r@3�[�k@4��'Վ@6-�}���@7j���[�@8�_Fuԓ@9����~3@;I����S@<�c_O�@=��B�y1@?b��5�u@@f�6~�@A�5c�@A��=�m�@B���@CX��h�@D�MSp�@D㖮��B@E� �y�@Fyr��$@GH�k�a�@HK���@H��r�@I��aQl�@J��}d�_@K{�Z��
@LZ��n��@M<��t�@N�:�`@OD�<��@O�R��@Pm�|	@P�Ү!��@Q[�����@Q���-        ?�6t���]?� �?��?��H?��?�̅[Y�o?�~�$�?�\6�?�C,�)�k?��=ئ�@��MzԞ@���+@
+Lߏ,�@�1cr0@�5��c�@�j�w�g@Y<��[@O��.@m#��S@ XHZ;�U@"���.@#�Wa~l@%����@'�m��a@)�Aߧa�@+�@��{@-�(o�,�@/봉�My@1P[c|@2<��z�@3lJ���@4��Kn�@5�ܧ!9@7)5�vc@8wW�
B@9��k��@;)�̈ib@<��oUu@=�5��@?k��{D'@@r�OP<�@A2��r��@A�f>nM @B�x���L@C����@DU��˾@E&����@E�,h�-@F��\8�@G��9d|@H�� F�@Il�{�Ɏ@JQ3�h�@K8��7�@L#<n���@M���N@N�Î3@N�U���@O���,j@Pr��+�@P�B����@Qq�Lj-@Q�N5��@Rt���3.@R���k�        ?�i
�U͌?ζ��_c\?�.�*�F�?��{�k�?�3w;�?���U�*@w��@	���l@:��Z�@���:��@�g��@�z��m@ >�T[y�@"� ���@%8w׫\�@'��` Q@*�����@-���J��@0l
$r�9@2
q��3@3�,AJ�v@5w�tP`>@7Fwk�+@9$�F�V_@;وբ@=?��i�@?��m�@@��91@A��R�~@B�<�h�@C�(?*m@E�6qe'@FE2� i@G|;���@H������@I�i��Y
@KImvA�@L���ުG@M��A��P@OQo>�6�@P[e][@Q����@Q�^�B{E@R�+Wa7o@SD��t@T��rC@T��Ѹ��@U��/��M@V]��6o@@W+��Ѹ<@W��ad2@X��[N�x@Y���|��@Z�JCB�I@[]�,G�k@\=N�-`Z@]����\@^���/<@^�A���@_�\t}J@`bn�x~@`ڑ@)�@aT4��        ?����*��?����E��?�9�ɫ�w?���E�j?�q4B��?��V�?�
��$?�4���1?��TE�t@�@���I@
�L�MG@�����@�!H��b@a����@��,�P@�[�}I�@@1K$-@��ʟּ@U����c@k���@ �@��Wl@"S�⦹L@#��#��@%P�%�[�@&�a�<�L@(xw��@*�#��1@+�N��=@-}h��D2@/<�Y��Z@0�Հl�@1k�"��@2Y#�6@3J��z�@4AG[bZ@5;qq�F@6:��(�@7<�VN6�@8C�5D�@9N��u:@:]V�g��@;p����@<��4��@=�/���@>�!�i�@?��@v�@@�4��a@A�)}�2@A��N�@@BF+�Gɍ@B� �	@C{����@D破,|@D���+@EX�^q�@E��x�o�@F��n\��@GDv>�@G멎z2$@H�uC�@I>�GG�[@I��bJ�@J�IJʪ        ?�~�y �a?���'d�?��H��RH?އtH?�C��=[?�m�`�D?� �R�?�QՓ,@�Bǖ�@�Љ8@	��4�?2@Ixx>@�W%j}@$bk�3�@ݭ����@��z�Y�@����@�$�S�@!�Ftg�@#I��:*@%��-��@&�w{�x�@(�#�wZ@*�Jz��@,���sN�@.��E8�@0yy�K�W@1�3�5�x@2�	F��@3��<J]@5�����@66!êS@7p*��\@8��[S�j@9���M{Q@;E~���@<�A����@=�3�Q�f@?S>_�U@@\�xw@@A��?#@A˚���+@B�vJt��@CF3x��@D����z@D�9O��@E�u��z�@F]z��q@G*B����@G��=�pd@H�����k@I��%��A@JxsM�?�@KR�~���@L/k���@MȵBX@M𲕘��@N�#iJ�@O���Q@PR��pyQ@PȮ@�&@Q?��<I
@Q�'+k�~        ?���noA�?�w�= W�?�[-��Y�?��O3��E?汹��
@?�q}���?�y��mt�?���ґ�\@CqSa��@!;��@	'����@�B�B��@(!��;n@�L�@U����@"�� @3&�
@%���h�@!,�VR@"�\֏��@$��wl7$@&\�9_z@(5����k@*<��j@,��S�@.�-��@0�#�i@1)½��@2A&�@3_�8�ޤ@4�j���@5��xq�@6�$�:�z@8-���@9\�G�J�@:�"D&<>@;��rBs@=?����k@>�y��}�@?�2�+x@@�b}�#@Aazĥ�@B��/�@B���W�{@C�&�I�@DP�@E�)K�<@E�$��dP@F�/�D��@Gj�Y��@H8)��'@I�2g@I�}�,}F@J�y����@K��rT@L`���I�@M=v�f��@NhP�'�@N�ʭ�@O�~u��@Pc�wv&@P�1�[@QM����        ?���7A/�?��k�:?�\uG�J�?�g�u��?�cB�<�w?�6�l�^�@:,a�@
��i��@=J�z��@��eZ��@��&�G�@�z�PE^@ �ͱFE@"c�UT��@$�5�@j�@'i���@*�ֻ>�@,�4q�n�@/�lB�4`@1h���{@2�.���$@4�L�(n@69��Y0#@7� 9<�{@9�?xVX�@;v�C�4@=L�ڮb�@?-N�@@�a�َ/@A�^���@B��*��@C��ߋ(�@D�����@E� ��+@F����@Gҫ?Ú�@H��n��@J� �0�@K8c���s@LcG[w�n@M����g�@N�$8���@O����c@P�w5[@Q=%HnL@Q�P�ic@R��B�9@S)��BB�@S��8/�@T|�yX@U(C�s@U�YG��y@V�[0�	�@W8D*�,�@W�i���@X��p��@YY1�y@Z~�Dy�@Z͗=��@[�u�
��@\I��@]	p߬@]˄��s�        ?��!�0�?�w����?��ZӘ$?���L��?�5cT�֋?��1�61?�:J�ca?�-.k`�?���3DR@ �M�=x}@&���Z�@��g��@s���Q@sj}��5@՜�qI	@�W�x@]��~�@�j\��2@K��7��@�p��Qd@ LG@�&@!���%�@# ��((@$�$�4=c@&�t@'���nM,@)F����@*��z9��@,��Mr�}@.M0����@0���@0�>�j-�@1Ԍ�D�@2�ovl[�@3���p�,@4��)��h@5���3�@6���f��@7�����@8�
N V�@9��X�l�@:�D��@;�����@<����@> |7~@?<i�F�@@0����@@�����@A[b�*�y@A����@B������@C*��@C��+��@Dg����@E	�KzW�@E�'�+�}@FRt��v@F��]GtA@G�]��<@HL��;@H�7n<]1@I�2�rS@JV�jĔ�        ?��ḋ��?���`IB?��y[q+?�t͉��R?�4���,?�câ	L�?��H�Mu?�Bq7MFc@�b�T-�@� ���@	��KM@>ރ;�7@��h8�@�A5@���
	@�o �@�\k|��@��b�@!��w��'@#M����@%zZ�c1@&�V2�@(��nx�@*��ِ�@,�q��V�@.�=a�@@0���+a@1�Z�)B~@2�y�`�@3�ɀ�a@53�nb%@6N��u��@7���U��@8�5S&5�@:1c�!�@;l��<�@<�/���@>$�/�@?�vP"$@@z��[T;@A3ǒ��[@A��hfF@B��@Eb�@Cr�@D7���7�@E S`�H�@E��D]@F��6W�(@Gli�H��@HAqҜ@I���,@I�G��A@J�snm�@K��{0��@L���V<�@My�)�@Nb�~�@ON4�l�)@PR]�@P��P!�@Q��[X@Q�T��gv@R	P�Y�        ?�e�H�Z?�ÿϳ?�2F�S9?��6t\Z�?�$�J�(�?���^Q?��I��#?��1}E@ ���@�jwH�C@Ij���@Z%?Y"�@���yU�@%uyݰ�@� Յ�L@�I���@�8=�,@���k=@y _J>@!=�C�@"�����@$f�h,�@&��8-v@'�@���*@)���:�@+O\h�@-'
D�`�@/
OWݵ`@0|Tf�q@1x����@2z��:��@3��9Yw�@4�"�U4�@5�P�B��@6�_�H�@7�6�+�@@8�s�@:�t
A@;<|��1@<i�UEu@=��O�'@>Е�7@@81H��@@�4�C��@AE6���q@A�4O*�@B�$����@C3���@Cܻ��@D�R���l@E3���r�@E���n�_@F��W�@GC�T��R@G���P@H�FմE�@Ictw	Q@J�P:�@Jծ.�J�@K�b��$s@LN�C�+@M���!@M����a�        ?���)/�S?�m:�͑�?����+(|?����?�@�@��?��C��J@*���@�� �v�@�e-�}@Ń=@Fy@m%��]2@[m�@X�@�{��c
@!�Q���$@#�6q�{@&PIT��!@(��ȱ�@+��ve��@.`�WitL@0�k��O@2#p���@3�	��f�@5H��?�@6����@8�w<�`@:Z�jQ�l@<"'O 2\@=�¤��@?�J�Ͽ4@@�J�U}@Aֿ�j!�@B�r�8�@C�S��3@D�Q&V(@E�]��	@Gg��Y�@Hb�Q��@I8?�RH@JY�0��{@K�f~�)�@L������@M�p�i�@O�?���@P${U��@P�BU�e'@QdD���@Rz�� $@R��F�@STp}Q@S�#�!��@T����.@UW��@V��Xs/@V����+�@Wnf�8@X$"X<�@X�<ƉM�@Y�P#%�@ZRV��
;@[Kp�Z&@[�(ϲ�<@\��9�7@]U�0R        ?�+|�?�S�1��E?��0JD.?وü�2}?�s��;ao?�v$��#?�_�E��?���4ˊ�?�y��c�@��j��@i�dT�@	$`��W@�F��@�+�mM@�WEw��@6|��B@�����n@.��M"@�O��`@�F�Ñ@!/�v{y�@"��Qê�@$$�nRq�@%�".|��@'FB=5~@(���͂[@*�����@,G4y'�@.H_��@/�֎���@0ЌDX��@1�[U���@2���A��@3���u�@4���d�@5���Ƶ@6��1�Ra@7�Q��@8�g:!�@9��R�hA@:�Aؚ��@;�����>@=�D�D@>4�'�q�@?X��I�@@@2�/�@@ժ8��@Amp�=�@B'��j�@B�ngb�@C=�z��@C��n�@D{��Ԍ�@E�X�nA@E��o]S�@Fe�]p͹@GB毪@G�Nj~i@H]�{8�Q@I� �@I��nGϊ@Jc�H��,@K-ju��        ?�� �O*�?��'��C?���L��?ޘ��M|?�M�,�!�?�s�$Cd?��:��
?�U���A�@���OuK@��ak
�@	��\��@?@��+'@�j R�@�T?gh@���#�@��o�*@�mK���@��n��~@!�~�;��@#3��s�@$��[3�@&���ݳ@(��!a��@*��thO@,�n"F @.��!ʉ@0_�ce@1t�?1�d@2�߃\Q@3�BN#�@4�7p��S@6�1*@7F'�zmm@8���:Z@9�"�M��@;��ꚲ@<cq!�;@=�ee�r@?t�Ǩ*@@=F�J�@@��R��@A�LM!�@Bc��9�q@C!�7�A@C�8;_2@D�@K�X@Ej́�0@F2�	��@F��$�G@G�/o2�a@H���;Й@Ipd.z@JFs���-@KZ%�@K�WT�K�@L�rT@M�om�t@N�@���@O���Ue�@P4(W�@P�A���@Q�\��C@Q��f�        ?�=*S -?�"����w?�?X�[?�'�}G?�6�@�w?�^�gğ�?���]���?����ģ@ �|AU�@�CPw|@��
��V@�$[D\@�x���@��)�@�(�H�}@d>aE?�@81����@,&xv��@ ��O1W@"8xsQ�8@#�.qO#;@%�z.���@'[R~�T@)-��b�@+����@,�Ͼ'��@.��2�x�@0�o��@1��z��&@2����@3���=C�@4�ȷ�κ@5�ٛ� }@7�"S#<@8I���Y�@9~!C7I�@:�G��0�@;������@==,�a��@>��L�E@?״ɢ��@@�u{�{�@AC�_�@A�xJ�%�@B��y9�@CZ�]*�@D��j@D� �Y��@E�]�ܮY@FG/�o�p@Gp���@G�T�Sq@H�%9���@IZ��F[�@J%M��Y@J�^ZS8f@K�����,@L�^O� @MgDvе�@N=hp��~@O�Ň�@O�X%ۉ�@Pf���Q�        ?��oas'?�Y�w��
?�~R$1�=?�C�$��?��z��?�h��xs/@Y����N@
,�Bt6@S�+�.@�r&��@����@�ɉO�@ !� ���@"wuJ�@$�/�^��@'��t��P@*4��f׀@- t4�@/�|��!8@1{�/[*@3}@Z|M@4����l@6R�
���@8�� ��@9�fpL�@;��E@=p���h@?T�a�?�@@��(���@A�١��@B��^�w�@C�4��dS@D��A�4@E��ɷS@F� φ9	@G���?<c@I�X��P@J:����@Kc�9�֩@L�� ��@M±1g�
@N�����@PlbG@@P���V�@QY��ne(@Q�fd8�@R�M���@SI~�))�@S�1?c�@T��S/��@UJ��W�I@U�P��I�@V��ĚN�@W\L�=��@Xx����@X�e���@Y~L���@Z7h���@Z�q�<�Z@[�"��@\muy�Xm@]-d��Zm@]��I��        ?��I�?�?���9C��?�9���?�,�`^(?�hQ+[?��  T0?�]�gy�=?�Qv:Ō�?��s�0_M@ ����kX@*�<W�@�&��@\d�>@G��OK@�'����@�zG}Q@sz8��@pcYѰ3@��>�_Z@\v�77Y@��dft@!L��r��@"�1�GQ�@$�.0.=@%���{��@&��@��s@(y�D�2@*̅�I�@+���Q��@-,�dT�@.�IXC��@0:����@1J�ᇛ@1�j��f@2�6�
+@3�S�i�@4��0��@5|{�tl�@6hb�C��@7Wl"���@8I�p���@9>��\�@:6���'@;1��!R�@</�#�+�@=0;�N�~@>3�d>�@?9�K¨�@@!H�E��@@�����@A.���U@A�Y�#O@B?��)�@B��Y�i;@CVߧ���@C�/�vo�@Dr�ڒ(�@En"���@E�U�~��@F%jm"��@F��7�@GM��@G�-�I�        ?�R|pw�?��"<GR?�^k����?ݾ���v?��q/�#?���븂�?�kJc�ި?��AG*�@3�Bg�@�D��/@@		�590e@m�tcAL@77�r�@���c�@@.��}�J@�+^��@��z��@�S}q*@!�V�h�@"��Fs2@$[ț�G'@&�W0^@'�L���'@)��Bu@+�2���@-�v� �@/é�`�v@0���"�/@2 �����@3�wB�@49�o���@5`n�g[@6�C�c�@7�^i��@8���+�@:9p���@;~j��V@<ɵD�?�@>�.�'@?q��-�)@@gg���@A)�Y@A���{�o@B��3���@C;�p`�@C���o��@D�=*���@Ewj/K�@F;1uw��@G�ԋ9�@G�z����@H��A@��@Ic�I�@J4tp�1�@Kpc���@K���/�@L�Ɖ�)@M��y�@Nk�K���@OJ�FP@P*}V!@P��#��@P�R̉F        ?�󽧶n?��b�h?м�0d�?ܱ���s�?��� 4?��2ay+}?������?��ϫ��@ ����@4����Q@!��?�@Yt��fA@mp:� @�i!g4�@W}�Xw@��4ԕ@�ϰ[a�@�7���@ X���)$@!�e@#�p��@%7Q�@�@&�1��@(�~fu?�@*�H���@,w7�?�@.h�~�@02�{��D@17�`	��@2C��ը@3TR�}��@4k��#@5��F���@6���w�@7ԇp3-�@9�O�x@:6����@;p�PL�@<�x�y�4@=������@?=h����@@Fsǜ�@@�/��@A������@BK���08@B�m��@C����QU@DgG�,�G@E�R9V@E��O9��@F�I|���@GW����@H�*��5@H���~q6@I�9?���@Jl��80@K7u��Y,@LS�.i@L�V�[�*@M�{�yu@Nw�,._@OMϾ�M@PG�@%        ?��'���a?��=�<��?�O�6U�?����ۜ?�l�)���?��^�؀�@E�:�e@�,�q�u@�4��^@�5�\C�@b�ԗ�Q@A�S�v@_yH"@=@!\�;):�@#� ���@&
��p�8@(����z@+!m�|�@-�@b0@0L|�F)@1��mA�r@34@_V+�@4�4A�Y�@6FTl�J@7�W>CW�@9��+��@;*��V�G@<�i��`@>��g[�@@0�$���@A�ny�@B(]��@B�i��1@C� w��@DܯP�e@Eׇo7�@F�jTm/@G�:���@H��%���@I�#>���@J�Î��?@L�_�K�@M(/c@N-�6Tܵ@OGF��1@P2���X@P��M<�k@QSnec�A@Q�\eR>@@Rz�g,/�@S�:�n�@S�ցS�E@T@�/��F@Tڍ�6�@Uu�y/֥@V��MM@V��sG �@WP\�kv@W�%�@�@X�?lJd�@Y6�F�h@Y�a��ـ@Z�f�m�c