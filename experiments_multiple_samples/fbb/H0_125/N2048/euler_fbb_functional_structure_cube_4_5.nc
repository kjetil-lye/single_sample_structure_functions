CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T112234        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?^�ע`�?���.�I?�O]Bl1�?�+9}?�@�9��R?���"�?�խZ|�?��$�g&�?�J^���2?�o׿�WO?��a��m�?�ѭV�uO?�x���@��D�?C@l��݂3@
Qm�86�@���9K@���!@-�j!�Y@��Y�@�\Z�@�q��@ ?1`--�@"edoF@#�q8�X@&�́��@(6�-�7O@*��>��@,�Gھ�@/u|�[��@1�����@2w.P!8�@3��w�@5x]�[�L@7~Z�<@8���@D�@:�f=�n�@<R��Q�@>7��Š@@��Χ@A��D�'@B,���s�@CE���|�@Dg�x-J]@E�MC
X�@F�Vd��@H�0�,$@INq4J@J�e;�w@K��iA%�@M\آ�4@N�N6%�@Pv�sV@P���K�1@Q���	t@Rkr�� @S8����P@T
Z���@T�߯��@U��vk� @V��c�@WJْM@Xg��'3        ?`Kʂ^X?�R���?���Z,�?���H��E?�/:h�?��9|��d?�R���P?�6�����?�]JC�@���&$b@�0tw�A@*p�r@9w�4@"X�[iK�@'��\M@-�fd�]@2t:��//@6��
E�@;k��Y�@@m.�m�@C|�'7X�@F�"f� \@J�N���-@N����<@Q�ڰ|��@T@��ֽA@V���H`1@Y�&�d*@]X��>@`<Ֆ|W�@b�.[�@c��R�	@f���C@h3���8�@j�ӄ7@l����@ov|���)@q�
�A<@rx��.��@s�"1�@uyu�5��@w�s(@x��UR�s@z|����@|J�EY��@~+�, �	@�0x�8z@��i��b@��^>��@�2�8r�@�Q��ɕ|@�zo
��l@����{@����T@�0�P�@@���s<�_@����z�j@�Hru�Wb@���R��@���?N@�����@��̦��1@��F�&
k        ?Q� YU�?���Q��[?�es�p?�v�u�x?���'�?�pˇB��?�6�$ �;?��l��?��e�wn@8����@daq���@��.D@��<$�@�`�۝X@#��e )@(&�>��@.��q@2��j�P@6~���S,@;�8�@@3���@B�\f��#@FQq��@I|���J@MGN��1@P�׷�@W@R�J�3��@UY��P��@W�#���@Z�z 0�k@]�Pk�jO@`k�vG��@bz|�ˬ@c��uQxf@e�x~5�A@g����L�@i�E�%@lƘ=�,@nRܘ�Z�@p_���o�@q���F��@r��?44u@t\�4b	t@uЯ0�a�@wT�ި@x�?`�R8@z��W��@|E^J�P�@~����@��<��@���s8�@�铝F��@��⽅@��
�t@�!k�
�q@�G�?���@�x-O:5�@�����@��#a�R@�G��dS@���Y�,@����u@�x�_l��        ?�]�|�U?�Jˡ6@}��\�@-Qӌ�v�@;V�7q��@Fd��DL�@P�i`�kr@WΜ`D�@`�v�@e�v�hf@j�<��&n@p���c�U@tw��9�@x�a��u�@}r�3��@�]ob�ß@�J�(d��@��S@,�@����@�脑�3\@��c>Vb�@�̙ߵ��@�8,G� @��H:�;@���.�@�z��@���v?�@�j��ΑG@�"� 	"@��|��+@��l�U��@���$#�@��u��VE@�a���@�/�v�q�@�_�+ �$@��<9�W@���?�@�<G�-|@������c@����/@��f���G@����@��
J*
@�S^���@�\�o�~@��\�ɻ@��1$�@³B��*�@å��d�@Ğc��v�@ŝR�d��@ƢlV`U�@ǭ� �*l@Ⱦ�
	.h@��1�Og@��t��^@��%Ǐ@�?�T>}�@�o4�؆�@Ϥ�،7�@�p;�]1@�\O��        ?v돣��1?���an��?�ḅ��o?�
T<�b?ۆ���'�?��6�J�?��]t��(?�$ ���?�?�b�@ c��cW.@�?�&�@7?�uq@��w�<@��N}<@m`�<V@D�]}��@PW�c2@���c�Y@ ��5@!�����@#�o����@%�-Z$"@((?�|@*S�!S��@,���8�@/8�^	z@0�Ty��@2H	��d@3��|�@5-�ӯGs@6���g@8Lё���@9��WG��@;�4~0@=f+^�QW@?59�� @@��44�@A~_7@@Bz�J\��@C}�����@D�X��F@E��Le�@F�:�ն{@G�K��@H��M<�@J�����@KO�>��@L�^|��@MǦ�3�Q@Oz��9�@P,ꪖ��@P�X���@Q��= �@R2�Ў�@R�-�.�@S�����@TV�.?|�@U����@U�>v��@V�'�ҫ�@W_r�M�Z@X*V9>�@X�-d��        ?G�C�t?x�a�?�E��	wf?�!�[��?�3n�?����C�?ظ����g?��.e��?�0�V��S?�o����@Å��Y�@	yU��e@��>R�@�+��@��
i]@#'Ϩ�@(&���w2@-���tFQ@2_�D�9�@6=6,q\@:�����d@?��HɭT@B���@��@E��~��@H�&!7�@L���S�E@PT�J�Q�@R�j�a��@T�-�@�@Ws���g9@Z4zu���@](F��@`(P��@a׀R�@c�n���@e������@g�q 0@i��⮺=@k�/��XN@nR����@pi�R�2@q���<��@sCq�_@t� +I�d@v�Cb9�@w��o�{�@yRâ�@{E�?r@|��t.�@~���te@�Z���,�@�_�|��x@�o
s�@�����@�����ޜ@��$�K@���4��@�]JO�@��N6��?@�
�[�/
@�s	ٿ�
@��F�)&@�g%�b��        ?}�ƴ9E�?�zjF{H?��'�pFq?�Rݔ�ǧ?��U����?��b�Ry?��l�G�R?�½�Xr0@K���@r��c��@�]i�@�6=�_@G���@ |����@$n��@c�@)1A�m@.V�3qT@21ޝ�@5���K(@9s���@=�8��:�@A7|��@C���u�Q@F�RG �@I�M�\�.@M�W5j@PLݼ���@R8�����@TG��i@Vx�b��@X�M0�jV@[H��6s0@]���w��@`W��dܻ@aΚ��@cY��o4�@d�V[��@f�,��i�@hx�Oׅ`@jYz� �@lQ�}@n_䲴�@pCI��s@qb�"��@r���)�@s�K���@uw�O@v^2�h�@w��x�ح@y(�6�T@z�7g1S�@|(�)�P@}��%IA�@^�x���@��3��|s@�f"U��@�L��#@�9V1Zӝ@�-���2�@�*#���=@�-�?4C@�9n����@�L�@&y        ?�ʊc�\B@��w��+@-L���,@=�!��^@I,�B6݇@R�#����@Z�}(D�`@a�&���@fj�P�@k�hph4@p�S�DP@t1�t؞@w�5�@{z��`��@����E@��}<��@�;�ߦ��@���>�!�@�G�#���@��BN��@��V`�0T@���V�R@���g5�@�D���9�@��@�@��$�,�@����
@������@�ыȭ6@����v,�@��~So�@�>h$wm@�o�K�@���kl�@��a� l>@�=@�5@���0-:{@�����y@�e��d@��1�J	K@�^Ó��+@�꙰�/-@��ZJ�v@����&[�@�e�C��f@�@9=���@����Ŷ@�AӢ�O@���M��@�ܬ@���@�Мl��{@����|q@��@ZG��@��#-�Ҝ@�Տc���@��_��@�����z@�c;�l�@��[pg�@��%�E>@�D�6���@�ބ��b@�{ok�>�        ?o�b�5cV?�џTB�?��W����?�2_����?��!���?�'f$��?�p�^��?�O���T?�����5m?�f:�?�+<�L@�ou�a@a:G��@
����@d��|d�@J�b�@��P/�@0>g##y@�"N ��@P���@!o[pq]@#w�3� �@%���.�@'��N`Y@*X���t�@,�Zx<8@/���ϰ@18���]�@2����1�@4E{_��y@5�Π��@7��iK^9@9e gTY@;@I����@=.}���@?/����V@@��R{��@A�z?���@B�eP���@C��O���@E(*n�RS@F`�.}KH@G��whֈ@H�v�H�@JAJ�y�@K��n�iN@M ��A�@Np�&��@O�鿔L�@P���<'�@Qv��%K@R=��x@S	�v�@Sغ��L�@T�r��Z@U�H�A�@V`B��y@W@f�@�N@X$�nP=�@YF]�&o@Y�8�q�@Z�*����@[��;VϞ        ?`�H�{�?��c8��'?��M>A�k?��nAgِ?�n@)0j?��kj_K?�]�T��?�XR���?�?���?���N�3@4m���"@x�.~��@G�9���@��3	@��Ws��@#^C.�O�@($��ci�@-�^P�M@2N���@5���3@9��;fs4@>�PHTg{@A�;��@D߸�s)@H��4�@K��/\m@O�X6�L@Q�B
��@T(��?��@V��O�z%@YH�!Ā�@\"J��%?@_.W���@a7#��@@b�N�r@d� |��@f�dU�%u@h��9�@j�j(ѿ=@m8bz+�@o�|��{�@q�*QV@rcՈY��@s�pL��@u8�8��!@v�R��@xP��c��@y�щ���@{��0t^@}yG���@VX�\@��8#��@��� +t@��z[��@���F��@��2�)j@�e��GK@�C�F�v�@��&,��u@��H'�l�@��#'�@�}u��E�@��=|�R        ?Q<�ۢ�?田ci?�:�Q?��Tf��?à^E�(�?�����|?ޡ���?�]ޯ3��?�}��Ws?�X?P�@$���;@
g��_�\@�;��A@{̏h�Z@o���f@#fg(B)�@(]��Y�@.0���]@2y�ے�a@6[ѨZ'@:�����)@?ƚ?���@B�
��@E�f�Om@IA7���@M��	$@P�E�U�@Rݪ?*�@UR*����@W�B�հ;@Z�_�߮�@]��J�su@`���xn@bUƠ8��@d2)�q�@f+�<[K�@hC��SKD@jz�A�@lϷ�1o�@oEe����@p�����e@rI��Բ�@s���P�(@u5�i@v�*�k�@xg��*�@zz?��)@{�v(�v?@}�焨I@�AVY�I@��}���@��Ŕ#=�@����s�@��v���@�K���ex@���DX�@���Y��@����\�@�s���@��0��I@�Qxl۶@��ە���@�0�s���        ?�2�-�@�@%)�Ed@!%�i@2d��@@b���8@I�w�\,@R�Y��@Z?�d���@ao���P�@fq��f�@l.c��/@qV�	b`�@t�Ӗh&�@y��@}�~�o:@�Bn�~ @���οD@��t��@�0?���@����D�@������@������@��o<�@�[J�BA@��L��g@����rK;@�v�Dv@�B����R@��O�]}@������"@�k���p@�W'�@�\i�# 4@�|�7��S@��ɮef�@��Yu@���{+��@���1�@�^�b�&�@��a���@�6Oޠ��@��D-g @�Id�cA@����zV�@��s��1@�U(�,��@���0��@�~�Y�@�tl�u�@�q�L�gn@�vc��Ē@ł�иP&@Ɨc�<��@ǳ����U@��*���@����<@�9���̈@�v�O��@ͼ�~���@�
�o� @�1�ih�@��	*�^@ѕ�U���        ?SN��Ş5?���j�T?����� ?�����?���PP?�����D�?�߲/�?۷���"g?�
v�XE?��ǀ�?�#k���?��L��?��\�qI�?�6�Zc�?��煣!5@�矇 P@�D�KT�@�(�'�@�9Yإ@-?�Ώ�@B�s�P@�^y�@�H"29@�;�l��@Nu���@F�d���@!8����M@"���@$���/@&�����1@(�A��@*���!I@,�\	�%b@/<5�Q��@0�P���@2� �9@3v�;�@4�¯^t�@6T� F,@7�	��^�@9o��k�@;Lt8ՙ@<ʿ�+]s@>�#J�L@@2�4��`@A%n��@B %5�@C"��i�@D-�~G@E@���4�@F[�z�L@G ���@H�V�~��@I��9���@K���5@L]o)�C�@M�� ��@N�ܴ�j�@P-?c���@P߾�	�@Q�u3�@RQi��\@S�Q�<>        ?Yz7n��?����a�??��n�G�?�e�g��?˦T���V?����-?���u�j?��a�g�?�j�j�p?��LP�@H��]@*�+$n@�6��t@�JU�U@��('@"����@&@	�l@+�Vm�@0S<|��J@3z�-1��@7���z@;��o@?qR+!uf@B+D�4J@D�s�S��@G�νwz�@K�$B��@N�6)�@Q#$!��@S+K���?@UZOΥ!=@W�k*^|@Z1���2@\��k�/�@_�����@a[�W���@b�H%@d��p�@fm�xciY@hO�1��'@jJsd��@l_< T�@n�`$�+�@pl-�J,�@q���K&@r�X9�Bf@t-�gs�@u�� :
@v�B.�b@xpWi�@y�K��z@{�L���F@}8��E�@~�'�\�-@�Z�]%~@�E�Q3�H@�8�kL9@�3kh6�@�6g����@�A��v�@�T�����@�p�t���@����        ?6�����_?i�4��s?�8?��\?�j'��1K?���X�?�;}O�$?�sӖ��P?����t�?�r��?􂗧���?�C��A+�@��?�@�~ï��@.9RO�r@����$@!@2Ϩ��@%�r��R@+�bM��B@0� ��q�@4�]���@9��ϭ�@=��j>&5@A��b��@D͎F�1@H<bp�<@L�@�A/@Pl�D�@ReJ-�mZ@T��Ph	I@W��d��@Z�4�ORj@]�L����@`���.@bW��se@dFa��b3@fU���s@h�<g�:b@jԘ�C@mF��~�@o�i �?�@qI�@<ID@r�L�	��@t73�?u�@uɗ0���@wnő���@y'%�L�@z�Ns@|��r@~�d���b@�f}PtW@�t�:r=L@��	���`@���?��@��׼pP@�wE_��@�Z��@������@�
�E@�h��T�@��ٶ��@�VӨ�E�@�ߵ�i @��P���.        ?�.��s�b?�=�\�v@-U�H3@"7ut�=u@0|E���E@:'&]v��@C�r;�@J(�Ey�@Q7�W
�@U���?�@[I �W@`��y���@c��&�@g�6ᇹ5@k�{7���@p�g��@rc���u@t�]ҳō@w�F���*@z�:��8@}��<#�@����;��@���j�/@�~�f�>@��O���@��D�:� @�bS@��U��@�ebĢ�@�w5��@���Rw�P@�j��u�U@� ��Z@��7���@�e+%��2@�4�(��y@�=ga@��X���@���
,�X@��aR���@��T��2@��[m�a�@�	n��=@�A��=@����^5@�τ���2@�%U�x.@����F'd@��?:�@�a&��I�@�݊�o�u@�����&�@�y*�@�EBh
�L@���Q@�����@�Ě�-��@����=.N@��"��ȡ@�l,@�Wo�<��@�G=ǘ�@�;z��(        ?Su#��'O?�p��G�?�H�p�X�?��iH�r�?�~��|?��l�?�^���?�_�nN�?��hrȊ?�+�"��?�C��?� @�ť?�aO�w�2?�'�v��t@ �[�Ƈw@�T�Dh�@�p)�WP@
sd�,n�@M�I�W$@=�]%�a@�>���@��`�p@���#@U.7��@P��p)@ ���;�@"o))�@$9�
|@&\NC �@( ��?�;@*>�u!#�@,y:A�,Y@.��y�'F@0�~t@1� WW@3EeB�c@4����X[@6%�,mT@7�YG��@9G� ���@:�~z@<�[���@>}��m�@@/�QJ��@A)���(/@B-A��C@C9�ީf@DO�U*@Eo�p�V@F���aN�@Gɻg�<@I ���@JI����9@K���b�s@L��0>m@NO�mJ�U@O����@P��7�O@QU8`omG@R�x��@R������@S�hq�>2@T<�O>        ?N��߳�?v.]�Jv?��J*�^�?��0��'�?�ޢ�`�?�!�H��?�Q�7�?�{�l�?��%��@`��.�z@
l��w5@lP߽þ@� �@ �B`ZU�@%�TT��@+~Z\@� @1>�g��@5OG/X�@9�G�ɩ�@?G[�y��@B��*;Y@E�vK�@I��}e@M�혮�J@QeV���@SfW32@U��7^%L@X�Ձ���@[���G�&@^��a��@aRP=u@b�^�� @d�4�0�@fŪ�!��@h�횚�m@k�С�@mt��^��@o�[��B|@qC��8@r�uƸ^r@tfS��@u�����@w(^��o@xЏ��j�@z�46��@|^�Y�'7@~E<��A@� �ܫ�@�*ZۮQL@�?N��Y�@�`�	,@���c��@�Ų.m��@�5tu۔@�]�����@���C)�J@�)�vJbn@���wC�@�,r`�@��K;<,�@��za�[@��#���@�nDa�h-        ?B�-�^NY?u�����?�Do�OI�?�	�mX_?��~{�?�h�S1�}?��N@�ֆ?�
e�?��'�[Y@����9@��}L@/@w�lmz@8�ڂ@"� �Ic�@(�bW��k@/r�ގ=@3�I��(@8i�x=��@=���Y��@Aۅ8&��@E2�7F�@H���^�@L��65b@P�l�g�@S�:,@U��üAL@X^����`@[Jeڵ$O@^c$g��@`�K�9(@b�&�6��@d[@I@f@w��hh@h:�� W@jJ}Exc�@lp�N0i@n��E�@p~�s�=R@q�s1g�@r��Xoq�@t>����@u�lK(�@v���Ԥ�@xk�^��3@y��Z�0@{u����@}[�
4@~�Z�:K@�7�X/+@�5��d@��_�@����0j@���:BJ@���ܥ�@�Sb#F@�݅��@�7�thi@�_�;I`�@���9���@�͙0�#,@���'T@�c����M@�����m�        ?�{����?�G�]�A@FP}��@ �y�݉@0�R|��@:��o�n�@DwJ�%�@Mj�hK�@T34�G�@Zʗ����@aH�z3/@e��4�@kf\�V�@pvz��^�@s����@w�'/̠:@{����@�!k9#@���N5`@�UI��)�@�J.�_\@�|�(��@�쁮���@�N��֚�@�G�����@�bE�W��@��t�A��@�����@����K'�@�.�Iwk@�����@�y�8���@�]k!d/@���N]­@�a:m�@�,3���p@����|@�q��@�yĜ?@��:�܅�@������@��J�PM�@����@�_qH��@��G6W�@��@�}6���@������@��i�� @�u
�q@��Bn�-�@���6l�@����>��@�|�����@�k;��x@�`��aă@�]�I�&�@�b_/�6�@�n#�P�z@ȁS��r@ɛ�x�@ʾ!_��'@����Cw�        ?hx(ݯ��?�℆OP�?��7,��?��F��#?�(9ֹ��?�
LR���?�Y�4YG�?�E~"�?󦙆
g?�@�5D�?�����8�@i�p�G@m%�1@�OFDXI@d�,�L�@���@�L"6�^@(W3edy@�ɯ��@ Tt�H�@"fo	-@$#�'b�]@&Yd���H@(�&�-ҩ@++\��W5@-ȢJ��@0D��E�@1����s�@3=+U�m�@4��1H`�@6����]@8C`�;�u@:�C��@<�L�@>��>�@@���@A#l@:�@BD�e�"�@Cq��h�@D�#��@E�}�-4*@G>̃i�%@H�9�/�@J�On��@Ky�j��@L��P�F;@N�bP�r�@Pv��g�@P��p��@Q���U@R���j4@S��9���@T|d���@Us5�%;@Vq*rO��@Wv^�l<q@X��4�o�@Y���!�@Z��#�u@[�ʨ��@] �M��@^35��>@_m�8���        ?5λ��J?hVѿ��?��&yx�:?�'&��2l?���Ni�?Ì�#
?��"���?�K�5�F?�T�lzW�?�� �?���]*�@�s�]@.崣,r@\�����@C�z�f@p�+vC@$���y�@)�B:>@/T��_y@2��T���@6��Dj!@;ID���@@$��%��@B��a�h@F���@Iy�GńE@M>�˱�@P��e��=@R����@U[%��Ӥ@W�H�=I�@Zλ��3@]���kLn@`��*lE�@bE�4��F@dT�Ɵz@f%@BR@h$���@jVU��f@l�#X�{@ohL��@p���Ad�@r.kv���@s�W��@u$lt�K@v�����d@xB�jI@y�:�.�=@{�U�N>�@}��/�@~6��4|@����[X@�Ȫ��NV@��l�@��Of^8@�$����@�X��@����� @���d�@�7���g@���V���@�*�K4�@�c��        ?`ԕA�c.?��ɂ�oc?����_?�
�-��?��h^�I�?�}���׫?��z�B�?�@�KXU?���� 9@�'���@
Y/H���@��&��@��]�@��t��@#���8i~@(��A%�*@.���a��@2�{��l�@7�B�<P@;��{+�@@�˨�#8@C��{��@F�zq�n@J����5^@Nߜ�O��@Q��*�8�@T=I�\�W@V��z�@Y�^''=@](v@{F@`N����@b*!�]_'@d&�p�<@fD��~�H@h����<�@j�b5�e�@mrȇ��@p�SZ@qy�lT�@r�Pe�ʰ@t����x@v(���@w�H�*�@y��t��@{�AZD@}��Ą՜@��]�I@��6�AV@��O�@����kn@�J����@��� H@�����p@�(�Aё@��"S�90@��� )�0@�ury���@���9�s�@��P	G�@��	�V�@�s)K�L�@�R ��@�8	}_4�        ?�_�H��@�Z!�b@�O+��u@0�h�&�@>YK�gɲ@HA7f�?@Q�*LzMj@X�&�bw�@`JլnnR@d��@j��u��@o�٣>�@s4�u��@v��/X�-@z��(W�@��e.@���6w��@�j�,�"B@�'�����@����@�?Q~��@�N_�#�@�K6T��@�4��@�@��iu5@�+D{)�b@�oBW�v@��Rz�Y4@�X� K��@� Y}^V@�e����d@��S�u�@�g&�x�@��� �@��5��p@�v��bH@�L�]�@�78���@��B�@�$��k]6@�8�H�@�W��*cn@��ą�@�����ذ@�����@�?�c)@��-ܬ�@����@�ejJFw@���c��@�dM�a��@�z����@�I�)�@�"���F@�����mE@��m���@�ĶC�B@ų�Aw^e@Ʃ� v�@ǥ,�c�@Ȩ�U"�@ɱ�VZ@��u����        ?uY��X#?���8�?��N���N?�D�/�?�A.�*�?�Z��p#?�n�P�S?�&|E!&�@ s� �,@٬-0Qq@	� �.�x@7!���@�L�}@�>e�X�@^�>�A;@)ҜR�@ �=��@"ȭ���@%r�2
 @'��OC�@* �S2�@,��* �@/�^�#@1_����C@2�f�_!�@4�j�A@}@6[p��d@8+P�C�@:m6�~<@<m��F@>rVġ@@�l<��@A4%c3�@BX���@C���6@D���+Y�@F�ѩ��@GV8߱V�@H��dX�@JAW~��@K��0�e�@M&|f��@N��;���@P��� f@P�1�F��@Q���g@R��K��@Sf��H:F@TKq�9*@U5���E@V$�՟ @W�I4Ch@Xκ�hK@Y����a@ZP��{@[(㈇�,@\;b����@]S�EQ�@^r0/�ב@_�}Nؚ�@``Zq��@`�i_��w@a�j�o        ?nBHj'�?�J��v
�?�7��|&�?�̑-���?���U��?����?�q0��,!?����J`@-�(��@���K�@��a�@@$9��@q���@"���J�@&�����@+ޠ���@0�L���e@4{��?��@8q����@<�+H~�N@@��v�@C��v�#@F�q�ph@J�b2~@M��J���@P���@R�J˧�C@U=�ߘ@W��)+@Z�����@\ؾ�'5 @_����@ahْ}�@c�tb�a@d�>F�ڪ@f�fr]��@hi]g�@jb��� �@lsO��@n�"��@7@pn�-�f�@q�В��@rՕMf�@t;矦8@uo� �m@v�:�b�@x?�GS��@y��G��@{E��a�@|��ul�n@~��ts��@�1ԁ�@���C��@��Bt�9�@��=./��@�͙M�g�@��f�x?@�Ҷ�)��@������y@��"�ey�@�d��$@�8r�e-f@�e^s"��        ?a@��_�?��$��39?��Ҭ��2?���´��?������?�����?� ��B�?��R���?�����?�@�&�`��@�Y��@�0����@iC|��G@!�ܡH�@&�T���@,�Mb@1�����@6
�v��1@:����V@@�#b�@C,K.��-@F��w>q@J�!���@N�N]�0�@Q����@Tb2ˤOK@W=�ɝ�!@ZZ�y5X�@]��f�@`�Gk���@b�P��Y@d�sT��x@g��*�@i�<">�N@l�օ��@n�*���@p���HE|@rw�P��W@t
qż�@u����{@w�*�j�8@y�0�a=@{�ƞ���@}᜖��N@�-��@�C�c�`@��9��@��)��%b@�.n���@��$���@���6�8@���7��{@�@��%�N@�햄�i�@��\�\7@�=E��@�-�@�%��;[@�'E��jf@�1�r��@�E|7�kz@�bg o;@���k�{�        ?������@s�K�C@3$�G�@E$*��@R��٣Q/@]����qY@ewIL�@mD���S�@sp*��@x2zX�jv@}ۘi��{@��9"v@�y��0�@�1��¦6@�6��S�@��c�^H�@�wE�U�@���^AT�@�*�"O�9@��̦�/�@��@U�T�@�|��WG5@��B (P@��z��q�@����@�@�+�:ik@�u�|T�)@��D+�B,@��U�e��@��"�y�2@��Z��@�Lb�!N@���o ?�@���?��@�/�l?@��3[Q�@�%C�A@����qQ@�s���@���L�2@�I���"@�}��'z@�]�Q�sm@�C�C]�
@�0���W@�$o�a�@��/E~�@����n�@�'R(W1�@�5�qKuz@�J�z���@�g
v6�@ˊ��^h@̳���_\@���I$J@���Ӗ�@�-�A�	f@��H
@@�w�q���@�!��&@��})��+@Ӏ�l;@�5ujK5S        ?`~Í�
	?���9�c?���%�8�?���)��\?�D��?֓�qT�'?൛+	�?�O��G�?�#2�b�&?� '|bx�?�Z���O�?�H���M�@��0"[@�}Ɵ��@
�d[�t@I���U[@P{���@�7�5�?@��9 ��@�L����@ �_ X@ ��Z/�@"ŷ�V�j@$����C�@&�K���@)K�È>L@+�)i�A@.O!�l�@0�<A���@1�����@3j��@4��)��}@6�Ad�č@8F�ȥʾ@:X�@f@;��_�G�@=���i�R@?���V�@@�m"��e@A���&@B���օ=@D�Y��@E<�0p�E@FkX�#��@G�џL�:@H��4�q@J,=�T�2@K~0�)SI@L���� 9@N<�Oz@O�n�u��@P�����@QO<����@R�k-r�@R� �S@S���瓶@T}���p�@UV+���e@V3vX��@W�}��J@W����Qh@Xꌵ!�@Y�����*        ?C��<.�?u8��s݇?�Jojrm5?��DQZ��?��Y3��&?�<�{��?׻S���\?�fZmh�k?�'��N+?�z݂���@ -�'2��@�̠��@�c3�me@m"ˇ�@��JF��@!�.�L�@%o����@*��Hza@0M�d��_@3�i>;�@7��
�ۥ@<>�kg@@�W�7Q@CJɚj��@FY���{�@I�?"�f"@Mh���@P����Ã@R����]@UDC:��@WЬ���@Z��Y8?�@]|R1Lsw@`O"��:@a��ۯ�@c�~��@e�=k�T�@g��h&56@i����DH@k�,/��@n>M��V@pW��ҍ(@q�����Q@r�b={R;@t_^X�@u��d�S@w_�����@x�i�a3�@z�oYg@|a!�6_~@~/�{��@�o�MNh@�JmQY1@��G�M~@��c�"7@�)}�<�@�JRM]ӝ@�uOɕ�!@���~�i@��u�ηx@�4��Ɨ�@��W9��@���� �        ?Z����d�?���0pz?�ӗ⅔�?��,>�� ?����Rc�?����
?�`�kY��?oI6�?�i�V*�.@ �K�L�@Z��\��@��� �@���@}gT-��@!�A�(@&<��[#�@+�=)���@1v���@4���N��@8��v��G@=����5@Ak}D�`3@D_�dH�@G��xC��@K>��+<@O/� ��@Q�b#p�_@T⌨	a@V�u�a@YF4���@\)a�FM@_>A��b�@aB����@b������@d�(�R�@f�}).4!@h������@j�̀�I�@m5s��&@o�u���@q���"�@rI�^)@s�g��cx@u�]%,�@vs����@w��\]�@y���!�@{}��@|įb(u
@~|Ą&z�@�!�:.cf@��M&�+@���2��@���
�ђ@���}��@�&�@��b2W@�/�_e[@�R8S^�o@�}>#�@������@�����C@�4,�zqF        ?��pe�/@���aK�@[�פ\%@0��*l�{@>_�;���@H^Eb5R@Q�]�F@X�'��Á@`��|��S@eTRa]��@j�� h�@po����@sۙ��@w�;���.@{�s_roV@�6�~j��@��c�(�2@�o��p��@�a���¦@��~W��@��mQٷ�@�P~^��@�D�<�@�Y�7�{@��y���@����	�@�c���P�@�rGQ�@��)�/a@�S[����@��t��m^@�m���B@���W��@�ЫV�@�� �(7@�~3�$0@�q�оO@�<0�\�@�I��٫�@�`����@���La�7@����ȍD@��j[��@�&�`�\@�sB�K�z@�ʱj�@�-VX٥	@��[��[�@���� B@��?���@����R{@�dv�y�@�9_!�u@��L�=@��F;f@�ށ�&H�@��jƓm�@��@�s@ǿ��mh@��L���=@����@������E@��8�(��        ?fhWȴo�?�\���q]?�p��-��?����՘?�Ѻ%�2�?׳�B�?�a�_L&�?���)��?����T
?���Fܮ�?�š�'G?��4�e�@!Q.K�@��@�z@
��ā�@�ݏ!os@��ȽB?@Z����@gy-B�@���Ӧ@x(�J@ )�"��@!�b�A�@#�;��67@%�C���L@'��=�9@)������@+��ڎd�@.E�E��z@0WG���@1�
鲃{@2�gɏ4�@4E���%�@5��ʺp�@7)�G|��@8�IO1Tv@:G7	L�{@;���72�@=��-Vz�@?b��j?@@��|yx�@A��U��@B���Kp@C�����@D�/@\ҡ@E�Qe~c@F�z�q��@Gڣt��@I�!|VS@J4�����@Km�d(�8@L����}@M�Y��^�@OH1=�V@PP�"\�@Q"X��Y@Q�Ф�{�@Rn��=��@S+��Z��@S��|l@T���@U{J���	@VH�ba��        ?F���d�?x���H��?�����4?��t6
�?�f�^��?�Γ:�vm?ڒlvy?���"�?�?�^?���x �@�q�3��@ε �nV@��0�+@�EQ��@{>�<�_@"�]�x]?@'�w��@-�q@��@2e?�z?�@6a��`�@:�����@@r��@B����ױ@F9;�Q�d@I׊]��W@M� :���@Q=�6@S�T���@V#8;(�@X����@\
O�2�@_WG
a@ap��U��@cUt��@eZ��k��@g�Ǣ{�<@iȼ�bR�@l3����@n�y��@p��+���@r#M>�o@s�9��#�@u/�Aʔ:@v�-��#@x��Rk|�@zP�����@|-j�Ґt@~�g�@�s���z@��2��@�5)�'�T@�V��̙�@��ӈ��R@����PVf@��Z��@�G�İ�R@���N҄@�WKN��@�pL<���@�鋛ե@�n*7֕�@�[�=z@�L��<pK        ?:aف��'?l��8��?�Z��$�?��Ď��?�[̫�J?�Q��U��?�Ge[)X?�'_��?�j6Z��n?����PY?���4�`�@��C�&@��N�@�4���@qE�O&M@!� ��@%��~��.@*��r�0@0��抸�@4V���Z@8|+׬@<����Z@@��tQG@C���/�k@F�=��s@I���~��@M�ܐ�@P���@R�Ջ�@U ���@W�;�6��@Z/��,�n@\�����q@_�vA��e@a�;��,@c4 e��@d����@fи�Dz�@hĢ����@j�_�2�:@l��u!l>@o=�.�!m@p�\q5p�@r�諲a@sX�[�@t��WP@v�9���@w��%9�@y�d%s@z��#Ϥ�@|`H栔�@~L1@��CY (@��s���!@���"�$ @�����>�@��Z�R�@��s�,�@��7Y�+@����x@�H��q,@�{!d�}@��/8�^4        ?�4�:%�?��ٗ�W�@Ms_,�@$^�jm��@2x���rB@=�����@Eʋ��@NL�҅Cs@T-���2@Z3��g�@`URL���@d6�*5�@hJ�� ?V@l�C�a�@q
����@s�ΒW�@v�K��@z9�\45L@}��{��@��J3�B@���>���@���@�f�W��]@����b�@�}Ca��@�?b=~,@�[�=�@��ݽ��y@�3z睍@�����5@��<dě�@�u���(Y@�_��@�\����)@�o�^��@��>u�@���5 �@�f�E@�G���1@@��p�m�@�ҽ�n�(@�)����N@��1�-3@���U��|@�t��>�@���J&@��&�"�@���-A�@�j�L�@�FJ�{�@�'��[f	@�P{n�@���!��@��B��@��c�^�@����q?@����OE�@� P�?@��u��@�.Bq3�@�N�?}�@�u�Y䗮@��y�ry�        ?d&�>��?���ѳ��?��9�o��?���m-?�։�x?�oαQ�?��\: ?�?����?���HD��?�����T�?��$�U��@\�ѫyq@�p�H�@��Qp�Y@�����@�0� ��@��P��g@�hڽ@QF[�v@R��=��@��!��@ �w�Nsc@"֝aA{@$�\��p@&�{"	�8@)LGt��@+g��3��@-���ͫ�@08T��f@1�.L��_@2����G@4{[:�6@6f����@7��� ��@9V�x�d@;A�wM@<�j�T��@>����(@@d����@Ai����)@By@f�z@C�܊��I@D��loN@EႯ���@G��EL�@HZ!4��7@I�0gf��@J���(�]@L^�p�g�@M˜m��@OCϬ�X�@Pc�p�h�@Q+Z�S�@Q��3fH@R�"�Bę@S�]��(>@T���{]@Ui���X�@VT�f�](@WE�)���@X==$��@Y:��a��@Z>
	O�        ?J���?�Z�^�?�SW�U� ?���ƭ�?�\oA?ш�a�?�Yq�3��?�8[_�k�?�wpi?��U�d�@9��3�@	-Mǀe@����R�@z>x�\�@1ˎ��@"��E�z�@'x���S"@-&��!@1�01�x6@5����"@:î��@?�N��@BK1
��@Ei��@H���xp@L����[@Pyn
�@R�l#Q�@UO���@X~�%H@[)a���@^8ryڣ�@`ԑM��@b�u�ׇ@d��|r�7@f�}Ї@h�U�su�@kW1{��9@m�a�ow@p>ͧ���@q�ǈAj�@su�bj@t�+:��@vD<~%s@w��XO��@y��V�@�@{����Ї@}���|�@�J��@���|�`�@��" vf@��,W9@�4��c��@�k�Q7�:@������@��`mWS�@�U�$�<@��&.�U@�*RW·@��(��t@�-�Q�Ī@�`�=�C�@�0`��"        ?\-�/�y?���n���?�H��OҐ?��Oi��?ɏD4�?ք00͎?�NI=�[?�"T"_?��:l;Y�?��Lny�@�fK�@à�=�l@i J�6@����o@���#@#P��~G@'���vd7@-p�`��q@1؍�i�@5g�-���@9k�+��@=��S�@Aup�9@D8�U[�@G?�`�P3@J�0�n��@N%r
Z��@Q�QT@S��K�T@UXy+pV@W��V��@ZL#�L�@]U�6�$@_�Y����@aw�̩:@c>Q�P�@d�v�|8�@f��m�o@hi�U�F�@j^�q��4@lk�{!@n��bӄ�@pecd��%@q����@r�˶��@t	?t �@uYG�~��@v�e�N�2@x ՠ@�@y��J�L_@{���
U@|��4ɖ�@~T��Sr�@����[@��)�Zy@���~��_@����E@����@��_�(p@��*�g�@��%w\ǿ@��n䘒�@��&�k��        ?�ؐ�~ق@ �TH�@���=+H@-��|}��@;<�1��@E��� �@O�-�C�	@Uܸ��@\��V�o�@bf�T�{@f�<��c@k����3@p��d�u@s�#\@w-g��@z���5�F@~�PAjpt@�����+r@�����@�hdtB�@����Y�@��dw^�^@��m�$ @�/�0�Ѣ@��.A�Q2@��L�뙦@��n�Œ�@����л�@�
R-���@�X���@����1�@�'T$;�#@�{m��OV@���X�IV@�R	:��A@�����^@�hZ^6|@��
�a(@�������@��r�J[�@�ZP���@���Q���@�������@�����@����S�@��&��x7@��F�R�@��{���@�C�@�~�F�@��:{N�t@�����q@�kU 4@����U�{@�ӎY@�֓����@���Q���@�Z]���@�#����[@��&�ĥ@�ů�q��@Şd��@�|S����        ?M�0�CO?|��Iʚ?�-�Rz�?���?m?�C-�5�?ř��~�?�D(q���?����\Z?��\?�G�O��?�(�J?����d?�mr�c�?�K&���?��j�X��@ "7D��@�]J���@��[A��@�L=IJ�@�$�ƨ@d�r�y@��F�8@�r��@���9~�@0Û��@����@QZ&�d#@ t�!@!�w�A	@#��K�@$�"�q�@&nAQ�@(:��C@*^tĠ�@,F��X@.%�|0Ӊ@0&h�7U�@1E�)j�:@2p�Y�,@3��A"T@4��o@6;�t��.@7�]iS�@9�3?@:x?�)D�@;��Ǆ� @=������@?*����@@k$
�)�@AG�gji�@B+�Y"'@C�j��@D�;�k@D�>���j@E�E���t@F��3�"|@H >���@I�_ф@J4���@KS�A�I@Lx�KE�@M��<��@N����        ?6}4�;+?k�l E"?�����:�?��xw��?�R�}@�?�7c�2�9?�G��5��?�Z[�@?�U#�X�.?�<��Wp�@�1]��O@��bhB�@�U @�����@"09�4�W@'q��2@-�25��`@2{@ޗA!@6��7J�@;��oX�@@|���e�@C�q1,~]@F�a��@J�7cm@N��Ed @Q���=�@T8��N@V��ӝ�@Y�t���l@\�w0���@`%NAKf@a�ȃ@c�>7���@e�Ҿ���@h���(�@jNjZU;@l������@o@�9��P@p���~�@r^�rZ�=@sؾP��;@ue)J�U5@wk1@x�삀��@z}�b��@|WP(�`@~F�Wp@�$�#�@�1>�2��@�H�+�1�@�j�S��@������@�ѝp�R]@�\fۢ�@�f�2,@�Ø�Q�@�,t��@���O�\@�#��)@��-��ݨ@���O��@�{)Q�(@�V��        ?R�f��)�?�K/R �?�U�`�O�?������?Ǣa��?լ�@��?�'���(?쀾Oډ?�Jj�2�?�� ޏ�H@@:f�r�@��F��@�Qt��@�!Yhi�@7z����@#�����@(u3\Z�@-N�@��@1�CVF�@5�!uY@8�ﰕ��@=�纯@@�����@Cj[ ��C@F;����@IM�Hȟ�@L���aG@Pj�j�@RƂe�@T#^�Ih@V]QX	G@X���	�@[B�%Ux@]��V�@`c:7�ey@a⪨�)�@cv��0{U@e ]���@f�K{ʐ�@h���ε@j���FY�@l�L��@n�n�j�@ps��(V�@q��w�@r�.���@t3V�a�@uHFQL��@v��+��@@w�ȇ&�@yf�$�9@z�Omr��@|dC*�� @}��Ž�@�Bt�G]@�����@�{����@�^oF ��@�G��3��@�7XA�G�@�-���@�*�	�@�.n�j�w        ?�e���Q?�*̴�@ƕ
5C�@�i%8@)�2��%B@5`,M�f@@3�u4�@G
�J1?�@OE�G)@~@T{� ^*�@Z����@`C��mJ�@c�0�@g���5A@l��X��@pȝ\*@s��]�@v�ۿ��@y����'@}|NE���@��)s%@��m�@���a�}@�w�C'#@���!%�@�����?@�ƙF;��@�t7���@�}!M;@������@���R|�v@����:5@�Ē�x��@��v�Ӿ@�<�%:y@��F�>��@��e�Q>@�f�":@���v�@�8|G{�@����z�@�Iu��ܨ@��4�3y�@��p�<�G@�]h���W@�,��a @�
>|-G�@�i�z�@�����@��h��@�*e���@�H����@�pK {&$@���5�@���ٱo�@�ԚI9%@�j*F�/�@���_�@��<nQ�@�CQ|F��@���w ��@�� 1�1@�z�����        ?��s�iU&?���*��?�7��}�?�dn��?�mm�?���^�%�?�W��n�u?�е�ʶ@���"�@|��}�x@�z���@P���F�@yV?��@�Ʋ�@��{갆@a��~��@!�Ҿ��h@#�W�@&/kj���@(���om�@+�1�B@-��yO�@06�$�h@1��"���@3��"�6@4�/���@68�v7�@7�Gm�6�@9��
��
@;L�%�5@=9��Vc@>�{#�L@@m��Cp@Ah�y��@Bj4�P�@Cr�D��@D�uZ��s@E�ٵ�@F������@G�Xa�)@I��#L@J9kJ|)@Kr��K`@L�%.+^@M�h�f�@OH����@PO���@P�I�m̴@Q�0��l@Rd���@S"��b@S�*.Ɓ@T��4�@U`M�Ҝ@V(�g�[�@V�k���@W�?�o�w@X����?^@Yn�7L�@ZIY�NT@['��z�K@\	�����@\�I���        ?]�����}?�>�A�y?�")���]?�trj�?��oT��*?Ӕ�+��?�OĻjy�?�ڶ���?����b?��4��y@A"��p@[WI8��@�(���@%I!I�@�4�6·@ ;TL�ݲ@$)�BX\�@(�X���.@-�0���K@1�g����@5^��C&@9*���h>@=f����0@A�6��t@C�8pɻ@Fx�>^3�@I��C�ݸ@L�K|gj@PM�'x�@RH�v�@Tj�[e'@V�R�Y@�@Y,���G�@[�*��}z@^��k'+�@`�3����@biB�g�@d��>@e�xJ���@gҋB)/�@i�A�yL�@k���MS�@n=���@pO�k�QE@q����2$@r�#z��@tF�m@�@u�#5��@wC�L��@x޺Z��d@z��b��|@|N���[@~%T��u@�W���@��w��P@�!	�Z�@�*Ȃ7EE@�L��q0(@�{.�~�@��(�t"�@����Ձ@�N��P�@��2S�hM        ?m��!�x�?��7��)�?��(Aw?�I��f��?��&e�v�?���c&Q?���<Mj?�B�1tvL?�Z���h�@ K/q���@-S��,�@� /��>@E\�g�z@��L/�t@%+�̓�@#V��� F@'�
BY�@,����=@1'�`:@4U6���@7����(f@;�׻;�:@@�e=RU@BjIqa@E��6��@G�\�E��@K0T��@Ng���x�@P���Ȕ@R�Cl�@�@T��5*�@W+�� D@Y�Łq�@[����@^��4:�@`���$�@b�Y�x@c��z!�@eD1�@f��o�Y�@h��;�6�@j�'n�@l����J@n���T�@pW]�*M@qr��{�T@r��� @s͟�J=�@u���qx@vZj�q�w@w��q�N@y��w�#@z�H[��K@|L�B3E@}�J�-P@?��C�6@�v%3���@�S�w_�@�9=�K��@�&<2��w@��md7@��J_w�@��]O�        ?����+@�@�d/å@42�d��+@EB�3X@R\��@\"�O$*�@c��5��@j�����@q=�R���@u��Kbnf@zIl#�"@p��K@�@��n�5 @�y�����@��f�6@� ��%�@���C��A@���`q�@���	2�U@��ww<�@��M$��@�p�XX�@�V�.�Z@���U��L@�����f@��?�N�@�E1����@���ޚ>@��1��@������@���.��@���;���@�I�[�x�@���'E@��o[�z@����F�$@������@���YS�@�|���@�u�Sb-@�u2�A��@�z�9��N@��o��a@��ps�#�@����9�@�ϧ��5@���L<@�!J�g`+@�TL��@��/��~�@�g�z2"@�l�.�@����s$8@�]�rrBB@�D�!��@þE+�v^@�s�T���@�,ҔQ��@��\ľ@Ʃd���f@�l��$:@�3�+�@��j��o        ?���a�gz?�OA�p^Y?ɠ (��?��B?�[��k��?�.X�^V;?����lu�@ ��� @Ã�!f @��'��\@����q@�#y���@�b_J�v@0��;�Q@!�L�@#��P���@&��?1@)�aE�@-:%��@0w����@2sd�j�@4�Ds�֏@6ε��?@9/s��!�@;�8dt��@>Z�r�S@@��/=�i@B
����@C����@E/C��2�@F�����@H�>�W��@Ji�U�^t@LK�2�?@N=����n@P ��P;@Q+>x7�@R>&���C@SYZ��@T|�ٟ�)@U�]�j�T@V�&��5�@X2Y��-@Y\�����@Z��X��0@[�C����@]]�u�,@^Ť@`D�Ʉb@`�G����@a��Cs@b_�&���@c*b�I�@c�g��;�@d�자l@e��/${@f�rX�95@gbkMc�5@hG�-�@[@i1�y8�N@j�(X�3@kq�?��@l	SଉY        ?q�<+�2?�3�ZGmH?��,�5O�?Θ��hXP?ܑv��?��#ȏ?�S�V�?��ke@W@���@
Iy+�)@����@Z�t-z�@K3�kR�@#X��k�>@(_j2�-�@.T�)��0@2��Y@6��-��@;_���_#@@R��M@CG�ξ@F�0f���@J5��X��@N5'��?�@QI�<���@S��+��@V;�f�C@Y�����@[�1����@_,����@aJEe�۲@cYH���@e(����@g9	
^@i9!b>@k~����b@m���@p3��@q�#H�b�@r�߽��@tXJ�@u�]c�پ@wm�D��@y����@z�*8��@|�����{@~b52؈@�%����I@�"ߎ��\@�)8N4�l@�8�*b��@�QT�&�@�sL�/�@����0|�@�ә���@�('�N@�Zz���@���f�Ƒ@���@�o\����@���
��@�����Pp@�pz��1V        ?\}�HqXU?�^C*?��d(e?�M��j�?��ʼ�
?׻5���?�WJ��?�ꝙ��?��Y����@	���o@	����[�@���n"@��g�B@i���76@$E��֐�@)���C�H@0
L�}�@3�ԝ��#@7�ܺ#7@<�o��9@AsU#*�@DB�@Gb��ucD@K��T"�@O �?��@Q�'1�1�@S��4��@V���_�e@Y2�����@\^P���@_#��O�@a2Ʃ�(@b��%��@d����^@f�tX���@h��uaj@jɋ�M�`@m_>��,@oSn����@p��P'�@r#��� �@st��w�@t���:@v@��T�@w�/0�\~@yC���9@z�kՕ�@|���� @~4�V�"�@�0scoI@��@�.��@�� 앦@�νư��@��SP�Q@������@��նQ�e@�����@�#�x\P�@�M�U(L�@�����@���J<	@�����@�O��*�        ?�΄� �@e�Z�gB@7 �-
�@G���Ƌ[@T�P^���@_ޯa��@f�"����@n�?hA�@s�;K��@y>��\A�@!�ڹ�<@��x��-@�s`N%;�@�lat��@���5���@�̒䩗~@�tI��_�@�_߰Ecj@���Ze|@����M��@����\��@��=����@��mê��@�u ��%@�Zg��^@��<��@�O�o�'|@�{Nq1�@��!u��@�M�|��@�ʳ�7�G@�U��<#Y@��k��K�@��8�Ր@�G+�Jġ@�:�p@�����1�@�VlG��@�I
(�D\@�A�ݗQ@�@	�l$	@�DG@�#u@�NR��V&@�^0A��@�s�n�@ȏ����+@ɱAP�Tk@��j~��@���a&J@�:�� �@�u6TU�P@ϵ��9@�~���j@�$yE g4@���
�j�@�z��]�@�*^����@��A��:@ԓI5ǠP@�Ly�Ɲ&@���X@��f�J�@׋,O�13        ?bp� ]�S?�	���,?���A���?�f�⧜�?Ɋ�GEM?�D۵�i?ݝiRAl�?�i��6�F?���I��b?�<V��1h?�y�`�1?�4��Xk�?�pTd\2@�����@����@	�`ڌ@�e0�=1@Z�1fG�@vD	N��@�}���@�ř�w@�Ρڱ�@W�����@/��X�@!@�A\�@"�A�M@$P�
`/@&n���@'ٵ8���@)��s��i@+���Op@-�I�v�@/��~���@1�����@2*�=��+@3YAy�ŗ@4��?u@5�q��	d@7#T�t��@8{�az.�@9����@;Lr���@<ĸ��Ȳ@>G�ݰ��@?�8]1��@@���C�@A�,�D��@B^���0~@C;���@D� �O�@E���U�@E�ݞh�8@F�AY^R@G؉�DM@H���5_#@Iֆ���@J�{X9��@K齋\}@L�M�y^@N.&օ@O.e7��@P'�B���@P��^(��        ?7�U@A?h��.�?�o� aZ?�q���?��A�%�t?�ϻ��-?��%�2?��b�zH?�i�<�6?�T�� �?�L�|"��@R�@��c�q@��y=@�ܤ�@�$om@$"i��S�@)8%�a@/*�GSƔ@3Y4C	y@6����@;u��5�*@@B�ɃӍ@Ci8��@FA{e8�@I�&G©@M������@P�����o@S4����@U��O�b�@Xe���$S@[O�݊q@^o֚�Y*@`��^��@b�Ḿ5@d�Ւl�@f�9T���@h�)�*�y@kP(��@muO!ޘc@o���ՆE@qUj��X@r�&���@t4���c-@u�$�ZW�@w[�����@y
b"M�M@z˶���@|��g�b@~����N@�@˄�S�@�G�FJ�@�X�}��~@�s�J�}�@��X�	xr@���G@�}Q�u^@�H�@�����{@������c@�Z��@�̹�[̡@�J����c        ?i�>�׺P?���ⲁ�?�����?��P[�?���(�g�?ߌ��N�?�:>#��?�@m�@�?�.��Ï@ }�D@�8�Ll@Ss��A4@L����i@V�͎'�@!J�����@%���>�@*�L{�z@08��wP�@3�Xzk@7f�S;[@;�d�n��@@J���~w@C�
�i@F��&�@IU�;Ѱ@L��+� �@P{D��=�@R��ah�3@T�"�*�@W�����x@Z>>K@]'�
2�@`"��@a��qY��@c���Y�@eh�����@g`l�E@is����m@k���Ə�@m�����@p*��}��@qm�[�@r�&�3�A@tt��2@u�3���@w��U��@x���Rl@z78���@{���R@}����!P@q	�6�@���77*@���0DB@��`�n��@���e!�O@��l��=�@��9*���@��ֆy@�&�B���@�]nGI@��g���@��5�l�l@�7��>        ?��ǐI�@ 2��qo*@�!ڻ@,��9��@@9�����;@DJ"؈��@M�߫V`@T\,�˟0@Z�	m��@a'zSڞ�@e]7�2@jhN�$�@oJ���c�@r��N���@u��q\@y����$@|�h���@�d��-�@������@��<��a�@�M�RD�{@�줾,�X@��6x��@��`"�Z�@�ccU�!@�w�V��@�ß(�!m@�������@�|�M�7@�z��)�m@��Ft��h@��Vb�z@�~c��@��2���M@��ʚ%^�@�$�%'>@�sV���@��X\d�G@�2��:W�@���'OT�@� q�w;x@�����X@�<v+@��)6� 3@���<@����;w�@�~���la@�eP���P@�Q�5�b@�DĒ�@�<C�~?�@�:`�|$�@�>gB��@�HU���@�X&�S�/@�m���@��c���@����F��@�����@���r@���}w��@�5��@��8�        ?s}�<֏(?��1�c�?��!��|�?ȱ($��?��qWn#�?�^�0���?�T����P?�v��4?�68gp�?��@�\��@��/e�\@����/@T󣰇@<���@���c�@$k�d��@|f�i:f@��@ }P��> @"��h�I�@$��Y�!@')�@)���xo@,W-]K+]@/(Bi�Q�@1?��}�@2�l��M@4C­�yw@5�gi�[@7�%!ŝ@9�&�e��@;��2]Y@=������@?���A�g@@�+��}�@B��c��@CN�r3ư@D�8�jt�@Eη�AE+@G�6
@H|����@I�A�5`@KXfK��@Lؠ	��@Ne��X3@O��b2�@Pс��@Q�V�dC�@R�s:>@Snܐ(�I@TZ�ӝ��@UL��e�@VE!U��k@WC�-b��@XIH�u�@YU E+�@Zg����@[���DK@\����T@]�:>?�@^�m�	�@`#�@V�@`�hFu��        ?i쬡��7?�Jt��-?���½��?Ū�=xN.?՛���f?�/�`��?��V��?�y4�{"�@/��%�@
|���@)���;:@�A2��@ `@��@%UmE���@+Pd���@17��H@5ea�a�@:Ah��@?�O���@C� P�=@F����@J�~)i@O:���@R0�^@T֌��*x@W�5~�t�@[EOi"]@^��@qF�@a:Jb,&@cHÂ;@e~zu��@g�!w���@jabq���@m+�$�@o��;��I@q|��f�
@s;�_l�@t�*�6�@v�5��y2@x�1�z.�@z���q�q@|�n�j;@~�y�_��@����ri�@��Ir�[@�#ZS�1�@�~�O��~@��S���W@�i��JK@��٩C�	@���D�@�PuWُ�@�l��}@�����Y�@��#?�ø@����[��@��L[��@�c���@�C�^���@�s� �@�@���� ��@���Y��M@�K��9.s        ?cP�Kd?��6�bB?���_?�����R?��&M��?�R^���?�BUF�?�-�����?��)0f�2@�?�y>@
���i؄@��,�Z@4��!�@ʟ-r��@"ӽj�H�@'v�Xog�@,�bl
��@1��3�l�@5!sɄ�@9-�&�B]@=�C��E@Ai��۽@D<כ���@GZ�enZ@J�pKcא@N��C�&@QFR:n�@Sv�v`�`@UѤ���q@XX[q�P$@[d��K@]�Y���@`|_�rnZ@bUb��@c���ٗ@e������@g~���*@iy�w'-�@k�iNp0@m���0@o�@�
^@q+H���@re�P��@s� �@t�$���@v[����@w�!�a?�@y=,��@z�7��6�@|O�,�$@}녟1?@���Z��@��oݹ�@��}7���@�k�@�@�W�)�/�@�K%iB�@�D��綷@�DN�Z�@�J
�@�W#r���@�jGd��@�����P        ?�%r���U@:�dR:@)Myy�@;�,��w{@H����&@S���e�@\��D�@dҐ���@j�����@q$%����@u��7N�@zv�-�}�@�I��{�@�(*��@������<@�U��V2@�{�k��@��Wc���@��4A�@��� �x�@��w��J�@��3F�x�@���`��`@��cv;+C@����O@��t���@�ݡ���8@�*�,>@���F�@�/����@����g��@�d���5@�����@��A�@��@�,u�Wԯ@��3M�@��-I��@���t	Q#@��K�m�@�fnu�+@�~�����@£fE��@��/��d@���1`@�\�q�
@ǳ�-<�@�2 ��x@ʌ�E`�@��MV@͟��@�>�*�-@�v�a�ɜ@�U�	6�k@�<@U�[�@�*��W@� ��^/@�ql@�%(ՄK@�3��{@�I���@@�g5����@ڍ��/�@ۼ\�m��        ?]��Ϛ44?��}���`?��4=<D7?�#�9N;?���J�Y`?ј94���?���ѾF?� D4�+*?���/{�?��/T�1j?�I�K�e+?���ۯw?���/΀@ �M㭑@��u5L@7�z党@
�qXm�v@��;=u@b\��b0@�d�S@9��d@�=���D@]I�I��@L�D��@@ ��
�:u@"]�VUb@$��hx�@%�HX�?�@'�j��@)��?}�,@,*YP�@.r_q�O@0k�u�Zd@1��,)�@2�6q;F�@4\�\�f�@5�psZ��@7I���f@8ײ���@:u�O�@<#qy��q@=�~`5@?�U�]�@@��F�e@A�(�aD@B�{>@Cʡ@o��@D�_&�@E���L�@GԈn@HJ�e@I�)�Ay@J�(��|�@L�gkh@Mc�l
@N�f�mV�@P����@P�?�M�@Q��}-6�@RT�7^�@SPWY�@S�|07@T�s�a�        ?Z�{0��$?�1
��Yl?����e1�?����7Z?����I{?�`ʮ�
�?�V�a~�?�.��w�?�I�3`��@��ѪU�@�D���@�9����@�c@�K@we*xj@"1R�b�@&����ӭ@, B�^��@1a�"�@4�͘A�[@8�ﳱ.�@=Жm5$@A�ZdV�@C��0�@F��/��@J[�h�@N;U��s@QD�FC@SCu�;+@U���ex@X6v�|��@Z��H��@]�5���@`�p�!�y@b@&C)@d6��@e���e�8@hm���k@j,_���@lut
�V#@nߕ���4@p������@rQi`�#@sv��k�P@t�[��{�@v��tx�@x"{h�Rs@y��5ya@{�L'CZ@}]���!@r��H��@���?�@����h~@�禇C.�@������@�?���۫@�}�AAY@��!��!t@��0Q�@������^@��W�1@�p��Ns@��0{�@�J����        ?HP�mf�?y���5P?�����(?��w���?�ae�"�|?҇�"H�?�T��?�'k����?� tv�0?��r(�	@#+|�hv@6?���@�_�J:@��ʪd(@ ��YL'/@%,����@*jB^�&�@0>:㼥j@3��Z9n@7����ė@<Z$�@@��K'h@CM=�ρ@FX��h�@I���|��@MX�M��@P�� w'�@R��I�n�@U&�@J��@W�5FB�1@Z[�Xm�@]=�o�,C@`)8�u�*@a�ng���@c�8)ڷ�@ef`�?K�@g\�L�r@ip.�4�A@k����&�@m���X�@p1I�
��@qz3�b�@r��Cޥc@t?����@u�Y��Ω@wM���!�@x��_)@z�#�+o�@|v�r_�Y@~X���r@�(-�m�{@�/2aݽ,@�A��1P @�_��V�@��U���@������@�i
�@�T�mf��@��/uV�@�&L>_@���l�I�@��(��M@���f���        ?�Q��~?��~��rt@$*S���@&%��@4�BJ�@@�(�G@IAhʡ@Qǳ��eX@W�� I\�@_KT ~�@c�N:��@hj<�JS9@m��1�@q֜���@u$*Π�U@x�6�BJ6@|��JUCJ@���B�@���4�g@��F�s��@�bqXj�@�hIQ]��@��|�%��@��O(.@��I!ȅ�@����%
@�M1k�@�<ha� @���k��@�_��X@�\G�ѕ+@���]�3@�2�J�Lw@��I���@�RV���@��0�K�@��'z��e@�����g�@�u��R�@�p�u�@��t%~��@��L8x�@���j���@��iYa@�GM���@����G�@�ͣ�}@�"1$��@��Y����@�ˌ~@�g5k�_@���x>n@�>���5@�,�b/z@���f�@���L�3@äB����@Ď���m�@ŀ7�g9�@�x��q#@�x��s>�@Ȁo7^#@ɏ�����        ?\�i�tB?�9�o���?�o|��d�?��Mr��?�ʁd�z�?д�i^�?ر��[�?�4̚<��?��i�QW�?����l?�I�əR?�ۖv�p9?��/�Ǽ@ o�M��@S-��Y�@z�7k|
@	�7�s@��Y
��@�B.�hv@�"S�%@Aȹ�G*@�!j�;�@S(ixgb@��[��@ �{`�(@!��բ�@#9���/�@$�Od
M�@&ʋ`�]�@(�ŋ/R@*�C8�s@,�[׍[�@/o�O%@0��Y�>�@1�M���$@3&m��>�@4tC�1��@5��1 @76�e��7@8�jR�6�@:/�<�e�@;��l��@=_����o@?�$[?@@dA!�Z�@AIf�B�@B5��� @C)��s@D$��s��@E'5��)@F0���w�@GAz'��o@HY9�F�@Iw���e@J��j�+@K�0J���@L����l@N7��?t>@Oy�gd�@P`vaU"'@Q�$<�2@Q����հ@R`��k^�        ?41xy)A?h���zU�?�ڮ{@��?����?�d�6��?�+6q/?��@��>?�J1S�nf?�2&&��?�Bl�E��?�������@�U��@
�9bj�@��J�@/j�#@�]�DZ@"��0�F�@'�(�o�@-G�?
�`@1�Eˡގ@5�D�:�I@9�����@>����T�@A�L#D*�@D�Ί9�@H7�3�I{@K��v��@O�-h$@R!���4@T�Mݡ�@W�(�V@Y�3��g�@\�M�xj@`b-�/=@a�=� P�@c�&����@e�pG�@gӵL���@j�ACU@lv�!�@n�.j�@pӺ��V�@r;F��_�@s�����q@uC۪7�@v��d��@x��Ƌ@zaL��"@|>vih��@~0Wl�P�@��Sw��@�)��C�n@�B�Y�Ѕ@�fy����@��j! @�ϕ[���@�N�m'@�f*�. �@��ن�@�+LSB�@������,@�����@��p��q�        ?<���|��?lK��?�0W��_h?�~��?��d��f�?�l��ӱ?�nֱ>M?�N	�-?����;��?��v80?��|f��@ʻ9��7@]($Ov @sƘ0��@X�x���@�#��@$TC�*�@)2�9t}@.�$�H@2����HP@6���rP�@;# *�q@@�[�
�@B���.��@EϘ����@I'�!���@Lў|�"@Pg�9���@R���Aj@T�/Ap?�@Wp!���@Z%��"O�@]q�t|@`N ��@a�/���G@cx@�9�@eS
.�;�@gIuu�@iZ��~P@k���K�W@m��V+@pJ4��~@q_��j�@r�Zw��@t���0�@u�f�p�@w � B�U@x�˟��@z.�S�9E@{��B_��@}�����@m�Qx��@��g���@��v�e�@��/#&�}@����g+@��X6�_@�܃��5@�p%�5@�1 Nd*�@�iW�Oc@��FTy�O@����T��        ?�d�N?�fg6�@	El.x�@�m�ʠ�@*-ܮ�i�@5m�>��@??x�?�Q@E���e#@M	e�û@R�a��u�@W�;��M@\�np��e@as��3e@dȊ�uZ@hs�m� �@lxcI��S@pm	�S#�@r�#���@ua= 5�k@x(�;-@{$B�U�@~W����U@������@��T�_Z@���5O�Q@���
��X@��oL��@�:7UvM@���u/X�@�"�yȔ@�~ݟ�+�@�����ϓ@�n�]��.@�!*#t~@��GL+E,@�auʲ�@�.��#&@���7x�@�Hp�@��d;`��@���,O�0@���"t'@�Ե�gL�@��Y�M�@�@!'�@���imp@���kd�@�6�ie�/@���y
c1@����g@����1'�@�ԃȬr@�ܢ��x@��$���>@��O,j=�@�b�<��@�Dy�K@�,g�(9�@��&'�@���Bf�@�5�`a�@��8�<@�(.���        ?a���W�?��@)��?�)F��G�?�C�R�?�X�Ɔ(G?�I3�՜?����ֻ�?�_]B6?��=�T�?�b���?�t���)�?�ΏB��{@�a�>"@�0n@�'.�Y�@w��hW@K�i0�@�0�b@�@�4)s�@i���Cb@O��e@�//8�@��~�~�@!��h��@#A��\�$@%N�_?�@&�c��s@(�%h���@*�ҿ���@,���Ih|@/,����@0���-�@1��eo{�@30g�@4|�_F@5�ʀP�@7<��o@8��G��o@:1j�X��@;��R���@=^i�d�7@?
991�@@b1O>6T@AF}�F`5@B2&��J@C$�K
�@D$5\�@E ��=e@F*�I.�@G:��Wc�@HS�v���@Is����T@J�f��j/@K��d�G�@MA�]7@NE��L�@O��v� @Po�Oğ@Q��Qn@Qͺ��<q@R�=��@S<�L`�@S��Ija        ?H�`��A�?|ID���?�JH��K%?����n��?�,Y
_�1?�q**b�r?ڍ��}�?�%`��,?�HYBXG?���o^�@ �2�/@� �/@`�>&�@z7�`L)@yiow��@ ���Ae@%
<*��p@)�^)�ޒ@/��I#�@3Ё���@6��x�Z@:�K%%@??ۇy|�@B 8C&כ@D���"!�@G��=���@K%��}ؕ@N��z�@QBe�5�]@SQ��!I@U�H����@W�1�JX@Zj��o}�@]g�T�V@_�"���'@a}��%T@c�4Uw�@d����@�@f�ȫ�H�@hr��=_;@jlչ�5�@l�6��s�@n������@pz��"�@q�%����@r�Wy�\�@t8�Á�Z@u���o��@v��;+@xv����@y���a@{��r/��@}:�����@~��C��(@�[6���@�Fߦ�j@�9"8V)�@�4w��^@�87k�@�D��W�@�Ys?{%�@�w.���Q@�����	        ?M�ܷ��?~��B[�7?�-V�.��?�mс��?�Cj���A?ԍ�'��?�4U���?�*�����?��1�F��@̒�<C�@	�4�.�@	���{�@�8H���@ P�M
��@%5�g~nr@+?�3�@0���:�:@4�`�_;@9�K{��@>����J+@BJ1<�*@E��3��2@I8�|�s�@MA��0@Pط�@SF9r�@U����@X��� 8$@[暊��@_@ã�~~@am��lP@c\�:q&P@en�����@g�L	�B�@i�Ҕ�&@l�}�i^@o(~I�1@p��U��3@ry���= @t4��v@u�#�t�]@wr ˑ_@yFf��@{0��GOo@}1�_.?�@I���9@����jX@�ߓ	G�[@�,���@�HV�]_�@��ԤBu@��j�'h`@�<Y=@��@���R�@���ɔ�@���z�pS@�#���e @����k@��i��@��N�	��@�a�F�¹@�DX��v�@�,yv"�        ?�w�洶@+�7��@i���@/��/��@<�~��U�@F�"V�C/@Pr�-a�-@V�rw�@]�(ْ�@b�'־�@gu�A���@l�����@q�;���@t"{1PH�@wx(dd\@{�z�Q@~�+��@@��Vg�y@��(>�@�)��w�@���C4��@�XWG�@�)�-K�F@���d���@� ����#@��жi�D@�|���mF@�Iu�5@�*���rp@� R��
�@�*��̃@�JqtXƪ@���A0��@��zm��@�)��,�@�N�����@��8.�h@��؝t��@�@�@���@���7��"@�����H@�������@�"y��*@���p[8�@��f��:�@����g;�@�^�����@�A.O���@�)bHM�J@��C
��@�-�7��@���͉@���i�@�k̑I�@�C�+ݹ@�1�,���@�Lr����@�m��ec@��.}�@��C�s@�}�d�@�;���y@��i�>�%        ?UsC��6?���^�. ?�A����?������?��8 :�?΀�a��?֎�Ԣ��?�qv�ڡ�?��&'�Y?�w�Q+?�	b��PP?��Q� ?�h�Ӏo�?�S���O @�-}���@�B�<DB@ Ύ���@��%�}�@�2�Z@�ι��w@��6>7@�����@�{nC�@�읈@��:��@!���+@"��-�b@$�F[�@&l��rN�@(u��uo�@*��>��@,�t�=U@/M�8�87@0��l�\@2B��	@3��5�P�@5"ǩ{�@6�!��z@8K�l��@9�t=+�@;�����@=�+��Y�@?�����@@�S�h. @A��S;1@B�{���l@C��?�*5@E$q�?@FWG�\s%@G�6��ϟ@H���7�@J1���"~@K��$�5�@L�gO��@Np�>���@O��x}[�@P�p��q@Q�¬���@R]��E�@S6R��$@T0x���@T�>r(�@U�U.vU�        ?8�4��(?m����wm?�R�-��*?�Mt�I�?������s?ɍm����?�0ɜ�?��C�N�?�<�.���?���²g�@i���r@�jx��+@�&��@˄9�2@�ù��@#Jd~���@(nMAU.�@.w�@2�ʜ5�@6Ì�r�@;X�ɥ{@@AY���,@C%�e2��@F\}/bo@I�6�F-@M���Nq�@Q3Z��N@SX,�7�@Uؕ���y@X��e�uq@[oQ���@^�F�ak@`����@b����u@d�>��@f��H�@h��GF�@j�L�D]"@m�����@o{X�9F@q��]�I@rUz��@s�iHO��@u+n���@v���m��@x@^�o��@y�Ҟ�2@{���8p�@}\oG��{@2���z@��jkҜ@�����k@��>4��@���p�@���(�Q @���̈�I@�[�2Xi@�5ea���@�sAAr�@��p�ٗ�@����f@�f�
�@���ϩ�Z        ?N���ԙ�?�4����j?�*X��+�?�C�d��*?���W�� ?�\z���?�~���Ņ?�i=�{2?�7��?���1�S�@��uB0
@
5/B
�@�2��@fu�+��@U8���@#Q��\* @(8ôJ��@-�#�@2C>̗`�@6���@:C-�#�@?0�19@B&�P�G@E_3@HG4� H@Kǜs�
�@O���w��@Q��p�@T�T� �@Vs�.��@Y  ���@[�zlټ1@^����&�@`�f��@bx��L�1@d0���
@fY ���@g�W�h(�@i�Tu8wQ@l��y�@n<���@pF;�!�;@q{Y%F�@r��F#@t�����@umco�E�@vڒ#5�@xV�2D�@yᖵ ^�@{|�<�@}&{�Oa�@~�W��@�Vw\ҩ@�D* �g@�:�n�=I@�:�{xP�@�C-u�=W@�U���@�p����@������@�Ą����@���/���@�@�-�        ?�|�i��?�>h�(�@�p��/-@!i���?�@/�{�Y�@9ÀW$�4@C
�3��@J���ЄM@Q���+j�@V��'t�#@\�)���@a����@e\��G�p@i�nw�/�@n��c|i@q���+ 1@tSs���G@wUn�lۨ@z�!7!m@~!
���@���g�0)@��* v@�8"c�R@��ugY��@�g� �&@������@��R�;�m@�`� j��@�u����@�����\O@��j��@���m@��a�~�b@��R�[jR@��c��}@���8i@��O��z2@�7U�ڨ@��Qg[R@������n@�y2�M��@����=�@��wJ+@�H�o��@�;Y��@��t�ep=@���O��@��pt�&�@���B�@��{�_�8@��X:��@�����@�-z�&.@�]pND@��dw�@�٥�
��@�&��N�@�~�$�@��e+��@�%d���)@��(��@��D)�@�d��;-�        ?S�/y2��?��P�bW?�Lo=?�?����8?����[�e?�̟�'�?��Q��?��ż*J�?���u�?��� �<�?��C
j;?�w��"?�I8�8C�?��h�y�g?� �4
�@�%V�@�'W�@�@̓@��6@����@s����@'Q�Lt@ƾ��@+�S��@lV�䙳@Ҙ�f�)@^݅���@�A@ ���0��@"xmߴ�@$�P@%���d@'|�;��@)T.%@q6@+B?�k�@-G2�Ă�@/cr���@0˰���@1�w&t@3#�Ȧ�@4b[��@5�`���L@7�
�e@8i�[W��@9��&ҧ@;YS2���@<��?j�*@>}i|�!�@@�V�@@�,���`@A�s�y�@B���~��@C�r8�D*@D�M��I�@E�%���@F����5@G��6���@H�FJi@I�7q���@J�zP��@LF��@M:���}A@No�̋ �@O��~ȋL        ?`yukQ ?�Ϯ�l;?�q%1�0?�^���}�?�0k�?���Uų�?��!f?�H^�X�?���U�Ht@�}���d@	߻���k@hC�
�8@�#d~&S@����@#�U�[�@( M��0�@-ڬ!Լ�@2YT����@6O�H8��@:�8�/�@@��[�@B�@�l~@F6�G �@I�����@M�ˋ��@Q1 ӥ�@S����4�@VRM.-�@Y<�P'�@\e���i�@_���i@a��N�n@c�XB)@e�,����@h�� �@j~O&oGj@mnJ�@o�8��j�@qO5M�q�@r�<��+l@tjW�(@v�f8@wمdj�"@y��!:��@{�<ь�Z@}�Ґ�*@����@���4��`@�[<�Ļ@�N�� �@��QV^�@�Ӱ(�,�@�($��b@���ӐS�@��ʇ���@�o:ő�@��?��I@�����@��)�G!@����.@����CU@���w��h@����$�        ?L�Z_{~�?|A��k�?�4qnz?��f���?�hܒ4��?ϩ V�40?�^p����?�ٓ��a?��\�ߪV?��Eר)?���x�P@��@�F99@��q(@⎯#x@$�|6�@!�=��[@&՘α@*���ԯ&@/�����@2�܀��@69Xy��@9�&N���@=�� �Q/@A>7�n@C��3�N!@F_�/�&@IG/�L@Lj��@O����n�@Q��kՐ@S�ۍ��@U��I�4@W�Fg>li@ZI�he?@\�����@_h8���W@a"���@b��ų@d���e@e�]�j�D@gn�cU(w@i8�L+@k)Q1@mZ�s�@oN��@p�o���@q����S@r�q�tR@t�"?܏@uZEǙ��@v�`�Y V@xDI��L@yk$��G�@z�5&Z;@|b�Z��@}�T1x&@�z#�0?@�����m@�{
�w�@�_6�Lo@�Jh�;R�@�<���        ?�I� �|?�o��2@bv��@$����9�@3��A�@>Ҫ�qmd@F�*��(@O��o�,@T�k=_�@Z��Q��@`��$��@dcl�,W@h}�}8�+@mѺ�[�@p�\�;@s�\q��'@v����8x@y�׼��+@}/�cĉ@�n��w
@�fx�E�%@��,��@��HLbmU@�'�٥�@��Ċ��@�f۵�iI@���Ř�@�"�[�B@��0[�\m@�d�i�x�@�%�}.M�@��j�^�)@��f�xFv@���T���@��n��@���4��p@��b�M��@���S�A�@�.�p��4@�w\xX�@��b^y	%@�-ˍ��M@���lR�-@�?㘯�@���d�(@�1��X@�Ҙ�[�@��S���@�����F@��;/��@�m>!��[@�_?�@�W�W'(@�WE 7L+@�]��5��@�kQ�ib�@��_��@������@��U��2@��J���@�v-�6@�Q�Om�@�H�i�:        ?^aju���?�p��p?�dwH"^j?���U��?�vS<L��?���J�O?�J3���?�r���
Q?�T$E'�?�S@�?�<zoAx'?�i �d@ �����@���d�l@dQs\9@O��q�!@����@#9+l�p@��\@lb)us=@c����}@��S��@ ���o�@"X��F��@$P�Y%]@&k���b@(���0�;@+Zp%@-�J��a�@0&����R@1�_�9��@3@�n�0@4��J�ϝ@6]�`k|�@8"H��xX@9�t���@;��	O�@=��FwT=@@�����@A+T��M�@BU6��pS@C��څZ�@Dϥ��X|@F ��v'@G钼J-@H�20�q�@Ji��[@K������@M���P�@O7��J�@Px^*ܿ>@Q\��P��@RI
&h��@S=Kx��@T9���h5@U>%��߅@VK��0@W`a��;�@X~[ǂD@Y�,CL�@ZԆ���@\���@]N$���        ?SC�A~y?�'�	"f?�v����x?�F4Ud�?Ǒ�l��?�>�5�!?ᤃP�(?�e�%?��H��T�?�ڗ���(@��3P�t@��&1&@_��z!@ٹH��n@炰!X�@$'��`�W@)��w@.�Ŝ�]�@2�=�v��@6��$X�X@:կ4�@?���7k@B��@��E@E�]w�$3@H�M�!^�@L�����@PJBI�B�@R})���@T���8d@Wz )���@ZG�GO��@]Mr)�r�@`F5�Ӷ0@bW�m8�@c���(@e����,@g�i�I�@j1�^SQ�@l�H;�@oa$�@p��fo @r?gj��@s��3�@u?��c9�@v܊&�C�@x� �01�@zQ�H�i@|*��L�$@~|%ڛ]@���a@�ӡfj@�0�7=�@�R����@��Y?���@��$��@��a��p�@�M`�ӧ!@��;�g&�@��!��@��&r3@���qP�@��f�6e�@���󞣢        ?Q]c�L8?��v��
u?�,��{_�?����2�E?��*䩖?�9g�8��?�I�18?���[r?�7�<�?���lxd@r/Q�N@+s%Y @���29�@�U�A@ +�{�n@$pwۇ�@)� ��a�@/���x�@34zJ�L@7#ۈ``@;�=��z�@@P7�΍2@C����@F?�$[�]@I�ɦ��@M�*E�\�@P׃Lf]0@S=���@U��j�@XF�W��@[+*�
�@^H�P��@`Ж�>��@b��=n|�@d�y���@f��!�@h����"v@kމ(�7@ms�&l�@p4ZJ�@q^6(��g@r������@tL7eQ�@u�v����@w�&�l�@y@ŕh8@{��J�'@|�ޅ�n�@~�r���@�yF:��\@��,�܂�@����O @��XӨ7�@�����/@�1˅���@�v�x��h@�������@� )��@��)���@���A��@�o����~@��.~k�;@��̀Ͼ        ?�j�E�?��#��=�@�.b|Z@'}XWnq@5��j]d=@AG�:�
@Iy��`�@Q�d;DW�@W����T@^N��s�@cY���@gd����1@lK�p��@p��/(�@s�"�~��@w<�����@z�=�7E@~�$>$�@��/`�@������a@��ܽ�I@@�PvbR�*@�J��O��@�~�N�!�@�w���XS@�O_�?9�@�H���*@�b��o==@��Ӫ�+}@��78�@����$@��*$@2T@�����,@����V��@�)�$O�@����Zq�@�o�WtV�@�=\z7#@��󳟅@�ϔ�ZP@��g��2@�$z��� @�ApGE�@�i�8���@��y�[��@���jpP�@�(s���@����*@��%=�J@�Qg~�?@����p�@�U�s[�@���U#@�ŇS�
U@������1@�z^�<#�@�^�7��@�I�m"ϭ@�;J�:�@�3�$?�g@�3!�,�@�9h`�x5@�F����r        ?mC��c)?�B*��_?��6܂;�?�zRBk.�?���R���?�=,���?���}���?�k����?��cRJ�?�j��@ r�֘-
@�G�@���m�@����4�@�p�7�@`n"
�@A��1re@^�����@�M�xk�@ +=�Dm@"ט�&�@$/��'�R@&gR�e@(���Z��@+D�Z�;@-��_��@0]`����@1�Q��/�@3j-ckք@5_�kF�@6�<�[0@@8���w@:�Ύ&Q@<�z�Q@>���%�@@c,�Y��@A�;�Lܭ@B�?dʳ�@C�d�c�@E3�� E�@F���<@G��k�Hr@IS�6]@J�[_P�,@LV��^�V@M�e� @O����O�@P�W�W��@Q�aeU-@Rh�eO!5@SV��2�@TL��#c�@UItM�	@VM��f�@WX���yi@Xk�\늭@Y�2�BKC@Z��͂�@[ʹe勭@\�q���@^2�6��@_n�U1��@`Yc��        ?IY-�?|;���?���a�'?�s�ax
�?�%,t��?��]Ը�=?�/o/�^�?��ZsL?��b�=:q?��5y7Ͱ@��I��@�9��@�����j@m�_�@)��T�@"��$�!@'g׺�^7@,�����@1�[���@5e�nՈ�@9�D�E��@>@Q�_"�@A���\^�@D�I���@GӪC/�@KTwq���@O(���@Q�	���@S����@V[W��~�@X�/�R4�@[�6:#|�@^�>$�@a	�v`!�@b�ߊ'�@@d� ���|@f��w�j@h�����@j�1(�[@m+�N
�@o��>a.@q��@r|<f�zu@s�z�oL�@uqڨ��@w	�i'@x�7�ʒ�@zwW��)�@|M�E�q@~:u���@���7�@�,&㣪@�Er��~�@�kHq�1@��t���"@��۔˗�@�)��/�T@��/�a0<@���9��R@�c�J��@��ʔ�F@�~ٶ5 y@��W��o        ?Poc��?��`#�
?�)�Y��?���ojxE?Ö��G?��,	j?�I��YJ?�"��DF?�^24���?���)f�@&�k��@
K=-�}@�{�R@9��l�@�k�!@"�w؆*@'�3�	�@,�q���!@1���̔�@5����J@8�~�[%>@=W��|�B@A���1�@C�(d~|@F�j��#@I��m�\@MVg@$_b@P�����`@R�[3��+@T�s�D�@WV}��@Y�Wm6�L@\D�+U@_��F�@a�x4ܥ@b��>�@da��vq@f.���3�@hI��u@jFr/��@l2W{�Ϥ@nj(��*3@p_3|Z��@q�މ��@r�kN��@t6/�<@@u������@w���4�@x�,��B@z06��+@{�+s���@}�b�'0@\0
�.L@��r��\;@����
��@���j��.@���
�t�@��jۄ�l@���A4:�@��� ]^@�'�US0@�b��9�Y@��.:ܯr        ?�U�()�@_�ا��@Ž|�f�@0p�2�@=�q�|�	@G\x�b'�@Q��݂O@Wl�S(q�@^�ʓ0L
@c��Y��@h����t�@n
Ѫ�9@rId�@uU�ۜ�@x�h�-��@|�%G�@���u��@�����4�@�l�Zh�@�T�Dǔ@��ʖ�f@@�	�F_�@��<һ5@�b5;�J@�9<��_@�,�/�@�;�Ro��@�h��c�,@���0�d�@�&���@�����@�(҃׎�@�����N�@���n�{@��9r2u�@�!��l�@��ֲXS�@��k��Z�@�Q��;B=@�0j�`�@����Nվ@����u@��0��F_@���K��4@��6�Y@����(@�0�;M@�n�z�@���8tyO@�RJuw�@�i�@=2�@��F�Co@�GS�%V@�cZ�Y|.@�(�.�Q@��bĮ�o@�ú<�3N@Ù���m�@�u�q�@�U�F�D�@�<q?��y@�(f�:�@�խRh�        ?T�1�p(�?������?��JT��A?�e�#eL?�8�R_?˼�x[˛?ԣ�IZ�?����	L?�Xm�zD�?��JG�?��(���?��|H�j?����`��?�Jń*��@ ��g�{@���[�@���Ð"@	�-E���@���q�@�"{���@� �	ܾ@�n@f����q@��1�H�@�����F@k�Vy��@!2��2�@"±��D�@$fN0�@&_�DU�@'������@)�*��b@+�'N~�)@-�(�k2@/�z�S�@1���@2%��ym@3R�<1�@4���pb~@5�H�g�@7xV��@8x�tN�@9���P��@;S�V��z@<Ӥ���I@>`^<���@?��_w8O@@����@A�C��u@B��� 1�@Cn�@��j@D[*Ѝ�@EM��'ڀ@FF��k�M@GE�yz�@HK#��>@IV�C�1@Ji�A�#@K��h�I�@L���3h@M�*��[x@N�=��@Px�+�        ?@�ym��?r�S}a�?���W&��?���A��?�e�ŭ?ʑ��>�?מ1I�"?㩈�U{?�!Aa�?��(gs�V@%��.n@:3��;�@������@W��2l@X�jB@"穔�AW@'����@-�_����@2aƇ��@6W.��f�@:�$o�a@?� �M��@B��c�m�@E��k�@I�^���@MZ���7@P�"F���@S���@U������@X?����:@["�d@^9)JfF{@`�����@b��R�c@db�0(@f]k��@htE<���@j��,���@l��\R�@ol���[�@p�m\vi9@rV:fp0@s�
B��a@u6!V7��@v�Į
0z@xX9��f�@z�Hq��@{�����@}�;�
=#@k�A��@���#��Q@����!@����\@���@��j�@���#�i@�I��� @������@�����@�o�u(_@�w;^~mj@�܅Ѕ4�@�Lq�C�%        ?>�ϔK�?m�z�ߔB?����6?��]B��?�����?�����?Ҩ=Eg^?������>?�],���?�X-�N��?����@�/�d�@	��^\�@�(�*@[�,l�R@�&`��n@"Z=���@&����u@+����@0����u�@4�.â�@7�O��3H@<
��X�@@[t�xW@B��,�@E�"��W�@H��Q�@LCh(�%�@O�/��@Q�Tk�%@T�����@V^�9h>*@X�}_��~@[pEĀ5�@^9>��U@`�'���@b('d�U@c���p�7@e�	$�D@ge��UH�@iS悫�@kZA�"@mx���y@o���6̵@p�Ï�4@r3�h��@st�c5��@t����U?@v4Fp��@w�W�(a�@x��wu�@zstAJ�@{���:��@}�Z=C�v@> ��U@�xF��˔@�Xut��@�>\U��@�+Gzgd@��4$30@�7 R�Y@�e;� �@�"��D��        ?���Wug�?��)���@
�O���*@kR9;j@,��]ʴ@6��k�r@@�>��p�@G,p(R��@N�h���@S�:X��@X�I{��@^|�gKs�@bd���}�@e�6��NR@i�i^5A�@m������@q:�8C2i@s�U�3-4@v[�Q��7@y7�`K��@|H �@�ʎ���@����X�V@�^qqU�H@�S�4|#@�e���R@�����_�@���.�@�F���t!@�eڟ��@��a��E@�*-1�@��U��^@��!�d�@����ׅ@�0�ޞ��@�ދ$��@��)�4x�@�l�J�+�@�'��@� �!5Op@�#o{g@�/�7��@�E+�-��@�dq���@����l�y@��z�w�@��k��#V@�Ded��@��o�5��@����N@�U�%��@��-����@��Xe�@�a/��U�@�(#��4�@��:�:@��{0�@���}���@�w��C��@�X�_� @�?
���@�*����        ?��m���2?�`L�/g�?ѧ�be^�?��y���?��ܣrw?��9��@���#�|@	f�ytݦ@�����@�:艾@�=f��@Tc�@"���@%՘�̟�@)I���M@,��E��@0u��p�@2�B���J@4�Í0^l@7��M@9}ҥH�a@<��l�@>��΄@:@@�߈���@B+�虜�@C�LΫ��@E9ur��%@F�X^u��@H�%�6@J<Q�6�@L	�O��@M��#@#�@Oƾ�	�M@P޲�Xq"@Q�3����@R갼�k�@S���A-�@U X�D�@V/��"�@WS�̤q@X~Z����@Y�f���@Z����d@\$�@��.@]ih�^>M@^���P�,@`S�@o�@`��2(�@a_�A�d@b��s�R@b���Á@c�=bh@dE,��u�@e���O@e�$8 @f� ��f@ge�u�@h7.��S@i|z�r�@i��>@j��H
�@k�.E>}@l�T,N<        ?u��"�v?��r��S?��"��9?̳�2�3?�˵�I)�?��ײ7@?�ἣ�?�}�9z4@!��v	�@
�&�]�@W�s۟�@�*�h��@ ���A@$�yxO�y@*Jf	��@0m�u�Az@4C��|"g@8���=��@=�����@A��.9�t@D��O�:c@H��̂?�@L�$ʫZg@P�H���@R��u)�@U���ٱ-@X{Ehp�@[�o��f@^��B�@aA2��@c)�/7��@e1x�n�@gWו3Qi@i��k8r�@l A_��u@n���)@p�ߦ�0�@q��"�C�@s]���@t�c�g��@vf/�uY@x��@y�]�x�@{e:�e�D@}/ߐZ�@	!O�Z8@�y���Kb@�w�8��1@�~��*Z@�����R�@����=�G@��,�x�q@��dz�`@�,q�h@�lzA��@����R\)@��n@�ì�DI@��	M��#@�#h�=D@��-�N@���Y,�@�p�_X��        ?�|����?�G�@+*R?�����?�UL��`?@�#r�]@
�SÁ�o@(]p�rE@�u�U@!��|�B@%�a�J�@+���
@0���a�@3��cB��@7�@⦡^@<�^@O@@o����^@C; \@E�᷏��@I3}x�&C@L�Gڮ2@PEc�@RZڊK��@T������@W���m@Y�y�B]S@\���@_�l3���@an��O�@c.vE��@eج]�@g��aB@i#k@k^f�^`'@m�rG�-Q@p�C#�@qk����@r�<��n�@t@~V/$>@u� �nc�@w^' �_@y	YX5�@z� �p��@|�����O@~�g�nSW@�>�&�@�F�t��/@�Z:(�u@�x��3e�@��>�D��@��s����@�p��
@@�er����@�������@�$�z��@���s��@��\�4]@����g�8@���<�2�@�s
��z@�NS���@�09���N@����"@�
7]8�        @@�
��@4o��`�H@O��m}@`�=��6�@m3S9ۋ�@v�>��]�@�/���8�@��i{�U
@�Y�[�@��Gl���@���NM%�@�<c��@��֯%@�o$�@��� r��@��Ǘ���@��	d�n@�8�f�(�@��T6��9@��&C���@������@��j�㪄@��g@[�@��p���@�
{]}�@�\��Ł-@����G�@����zl@�hz�*@ĺ�I�%	@�Xj��7@ǀ��.�@@�� j���@�r#ٵ"N@��}�{pK@͌�=t@�):E�q@�g��l[�@�?�qjR@�:FM�@����eș@������@����e�V@վ�=,�@ֲ菦��@׫�~��@ة�q�'�@٬F���@ڳ�*�{�@ۿ���J�@��^ۖY@��u�S@� v�A�@��Q�@��ݘx@�6e�^�@��O�W�p@�f����@���ܖ@�
\E��@�A��wk�@��a)�@�;���*        ?Wu���q�?�A�\<�?�DV�0=?�>�`� o?�G@��N�?�����c?ڔ΢�&�?��+�Ӻ?�D�+�j?��C�5z?��7���?���с/7?��z�@����W@hG@���m�@���V@d,��@�,`gs@.�G�R @�HKm�A@��X�@����.�@ ��2ez@"[�ħ��@$>n@�aA@&?��a7@(^��u�u@*��_� �@,����>@/}���p@1%��@2r�O� �@3�n���@5n��yC@7'u�B�@8���u�@:q���@<C�+J<�@>)^뫃@@
�c@An��@B'��*@CBL*�V@@Dg��7@E�(_.n�@F��K��?@H:dO#W@Ic�YY(�@J��H��@L#�!���@M�����@O�f�.�@PM)��v@Q��l�@Q�&��@R���DV�@S�4�
�3@T��_=@Uj;:��+@V[@\�o�@WSA�X�@XQ��U7y        ?A!�z��?t5)l'g�?���3�i`?����ס?�Q1!P�?�B:?[k
?��o�� 7?�f޳��?�6@S=?�b����@�cXH@ۗx�V�@ ~˒��@��q���@��
��@#�r�5@(�)仓@-��^5 @2d$�a��@6Pp{�@:Ƚ�PF@?�Fp��@B�
���@E�}E��@Ik�'�@MI��v�@P�35?��@S�W�@U�m�I@XR�%\@[D���QU@^o����@`����~@b�s!�LL@d�0��%i@f�	-�/@h����@kCr��@m���;�@p)�Uo�@q�у	��@r���7�@tNв�R@v�� �@w���JV�@y��~�]�@{Z��.�*@}E�{�i=@G*�I�:@����0��@���Y@��I��ii@���*��@�U��B� @��4�7@���3���@�V�P��@�����q8@�F��w�@���;=@�p l�@����ٓ�@�k x*�q        ?:/�F��?l��KX"
?�a�^���?���s١)?���O�U�?�t ��m?�'�H��G?�xK$B?�<[*
=?�;�w��?��w´:@�.���@����@��C��N@�����@ o��@\@$�X�&�@)��*�7@/K՛�@2�38�@6��"e�@:��}a+D@?LNb��D@B2d�`�@E �2�@H9�`Iu@Kl��/3m@Ojc�M�@Q~��˲/@S��䨓@U�
?�z@XQ�W��f@Z����_@]����C�@`PV�}�R@a߾�K@c��bP�z@eEn7��m@g���@i��q;`@k��,�N@m<�sԾ�@o|0u+�d@p냄c�@r&Ԋ���@spG?�h@t���T@v.s�*e@w��7�U�@y(��]@z���%��@|^�sX��@~���@����F@��3h[�@��3��]@�����2@�à�@��R4���@�����:�@�^hҤ!@�( �ι�@�W���        ?�Wϯ��u?�Т���@2v0x �@"�	@�`�@1� ��@;���|�=@Dd;��u�@LbO猴�@R�/�P�@X^HI��u@^��v���@b���K@f�\3%y�@k/���s�@p6bRPs@r��y@u���3�P@xʋ�bx@|;B`$*�@���J9�@��FXn��@��>ޚ_@�g�����@�٦E�6p@�s�Ű�@�7[�#5@��c`QZg@��;��@@�����5�@�yZy�V@�I���s@�0b	Ki�@�/�x�I@�G�#�@�y#*F�@���2j�@�=���@�S�L/-@���{�i�@����M�!@�b�}�Ĥ@��|(��(@�\1���Q@��P��#@��9j��@�<�羇0@�}1��E�@�ci�_�N@�Q=�U^�@�F�(��T@�D3h#'d@�I����@�WڃF�@�l��߲\@���
܈�@���{��@�����K@�ȁ0=�@�XGm��@�����c+@��Z�|.@��҅<��@�Z/{���        ?Q�Ś�?|zk-s�T?�p��v?��f1=�?�"�V?Č���4?��׬]+r?ըel���?�"�)���?��M�	?���De�?������)?�$ߜ�>)?��;X�?��,k��?��D��S@�<WA�\@�8XF5e@��>S @UUFR6@8�~	@�pm��@���Yζ@,�o�@���y@Ngm��@-��u�@ ��`f��@"<�%B
Z@#󝥬SS@%�ft�}�@'�<>��@)�w�b@+�nTR��@. z����@0({ ���@1^� �@2�V�?��@3�U��@5QP�k*@6�~>o�"@8:���l@9�*5��@;\��qSQ@=y��lM@>��|S�!@@@*ș@A*��� @B��jj@C�C�O�@DI��e.@E��
�@F-t�Q��@GE�+�@Hdc�8��@I�^�=��@J���<��@K��;�C@M-�o���@Nrz`u�@O��!H�@P��2��@Q5���M        ?E�Zj�;?xE�h۾�?��C �O�?�w�ca�f?����Q?�,pة�?�����Ԫ?��9�r�?��ZT�~�?�K��(�?�Y�3�3@{�9j�@�|X���@�	�/X@��א�4@�Ǵt��@$� ��@(�7:l0@.���z��@2�>���@6tj �
-@:�&�
@?�c`��@B��ui��@E��z>k@H�+�w�-@L��+%H@P?�6B��@Rm��@T��nH�@WW�+��@Z����@]�̤\�@`p s�@a�>��`�@c�s�\��@e���}�@g�w��@i��βտ@k��XV�@n^�o�@pr侮�@q����tb@s,:&%�@t��&��5@v*�m��@w���ev�@yq�Eܱv@{0���5�@}�U���@~�"�=F�@�p~J�@�v��ۋ@��(��7@���NjZ@��v!'��@����y@�/o��@�s�/>�3@���L-@�CT�e@��wu(#�@�������        ?B�e��?p�6�,ͭ?���4���?�]*�-�e?��Cɔ#�?��҆�In?�|��G�?��h�=��?��eG��?�P�`��?�ۼ��B@{_Ξ\@
��yHZ�@�PQ0�@\���@p�|��@"��]�@&����@,���i@0���搃@4IkD�!@8�L��@<*�N�Y�@@c����_@B�4��R@E�fZ��@H�r��D�@L �1�9@O��v/)�@Q�a�х�@S��V�n@V@Z�N�%@X���EI|@[Yl�@��@^,�Y7�N@`��
��F@b4�`&�@c�D���@e��t2�@g���yښ@i�h=��V@k�ҩ'�@n5�=@�^@pQ��n7G@q�x��2@r��0:�,@t^I=,�!@u�L~��S@wmf�v��@yA�tF@z���Jw@|�^��2@~z�4|�^@�9�o��@�@�	�@�SIhd�6@�qf��K@��]w'� @��o�u�I@��#�,�@�b덳ݡ@���(�w@�'�Y_�g        ?��n�2T?��1��?@tmM��d@⨵�c@)�8�^�@4f��]�@>V^rrU�@E1i)�a
@LKEK3�>@R@a;Ed�@V������@\9�tl9�@a�ٵ�@di�ꐂZ@hf���\@l<�\���@pdC-@r��SH�@u��(Ѝ:@x��ѾD@{���:�%@V5p�Q[@��t����@���ן�*@��s��V@�.3${Z@�{!���@�U��@���Cl�@�c/��W8@��v�ꑙ@���f��@�EF%!V@�Wp�@��y��O�@���i�@����C�H@�/�R@�.V�|�@�W�8��@������d@��x{��@��/c�~@�r0�c�@��㤕�Z@�En�7A@������@�G[��ǡ@�٘'��@�;���@���@�@��9��G�@������@��`	"@���`
�P@��ɲ�*�@��ߙ@�y�T��@�yW+kڒ@�~R:�@��ʊQZQ@��g9*�+@����|'        ?f܆��3?�����y�?�d�����?��+Ƴ�?��A��o?���Q��?���U�?���V��A?�Mn���?���g�b�?��[М�?�Nm�)~�@�'�'��@X3���@	��t��@���\�@�ϑ�T@1��@3q@�g��@.ݸl2�@�Ÿ��@��<K0K@ n	gi>�@"
�Ԣר@#�&�,hi@%�����@'e�2��z@)\��hw�@+k��P�@-�a��k}@/�|TXg@1��(M@2M5�KT@3��3�@4��4`@6D.	��@7��j�$�@9+���@:��';�7@<HV�Y|�@=����".@?��s�.@@��b�zh@A�m��@B��'��@Cz��O�@Dx�+��_@E~��0@F�E}�q�@G�d�e]@H��7�x>@I�J�G@K�`V@LE�<%�@M�1!�70@N��U�V@P�]���@P������@Qf/���>@R� ��@R�"�c�O@S��`f�@TLh���        ?B_��ګM?t&F���?���F%?�����>?�	��?ν��m�?��N��K?�]`��>?�{�p?�9T��@�Kz���@W��@
@�5��i�@�u<il�@!�]Ѳ!@&��.��@,�Ѫ��@1æO�o@5�f"Tz@:���J�@?��G\�@B�)E��2@FX���,�@J$|��@N[�,�@Q�=��	 @TXdK@V�9?X�@Y�I!<�B@]A���4	@`mC��Q\@b]�d�o�@ds�L���@f��eS@i"���'@k��c;�S@nS>&�jc@p��`�\@r:[m@s�G����@ugE�b,^@w-�U���@y
H�!!@z��<��@}�+��@*�UbV@��]�ZO@��N=_��@�_��x@�Q�'�5=@��]�5@���ޓ]�@�`D���@�ӷ,��*@�S�($@��"�~7/@�{Q ��@�Oh�@��%�m@�̀�y��@��%���Y@�����ڏ@������        ?E䕞@>?t���ğ�?�:�!��?��>
W7�?�G3|`�?ȸ0k���?�V-v�J�?�B��V|g?��&�1?�t跍?��̡�ik@.e�%��@	�Kb:�@�r��2@ًj�ާ@��<k�o@!>}��Դ@%2��8�@)������@.�� �v@2\X�/"2@5�%���*@9?����*@=C>�Q��@@֖C�Ɨ@C@�Mag�@E�|W��@H��l�- @K���I�(@O'1|C�@Q\��xP(@SF83��@UP�
�؀@W}Ƣ��@Y̓Tron@\@��Q��@^���v@`� P��@b<��gy�@c�f�vX�@eY�[��@g85��@h�Ƈ��@j����[@l�v^�@n����@pK���0@q`jG;��@r����@s��N"8@t���IG�@v/%�;�@wj�-�@x��X�@z#+�$F@{�l�d5j@}	V�r�@~���o@�!�f@��tdJ�@���`��@��d��=@�j���7�        ?�IDIx�?��쀯"@�icV$I@&�&H��@4sZ\���@@/R9��@G�n@��n@P@��{6@Uv�׍@[tk�!�@a��sӢ@d�%r��@i*�0��@m�����@q{-��t@tFb5�ƿ@wN��]�m@z��8�R�@~�Z1Th@��3�	@������@�%����=@�s��M�w@��#�@�3�(�@�>?���@�R3iR@�����G@�5A�v�@��L*(d@��&����@�����-@�vd�U\]@�|����@��ǚ&t-@��w����@�	�C�'K@�8����`@�r�͈��@��m�w��@�5H0[�@�a��$R@�ǧօ�N@�8xlŐ�@��t)3s�@�;�d��@��:�
�@��W��$@���b�k@�eH�1��@�E�!�@�+��b�@����A�@�	��?m@�3;���@������@���%@�:E��@�'-i�!@�.�4�WQ@�I=���@�idi�2@��M,"        ?��ՍK�?�S�,z?�B��γ�?ᴢ<��?�Y�f��?�H5B��/@ �o5{@i����@!���m�@^x�$�8@��@O�.~�@ 9��O4@#C���@&	��@)HTg��0@,��+��@09y�8Š@2/����@4C8W�+@6s���E@8��Q.z^@;-A
@=��8ʲV@@.57�^@A�e���@C�$���@D��H��(@F�4e�j@G������@I[e�v�@K���C!@L�6iŁ�@N�:�׽@PP�I�@QL9���@RNѵ��d@SX��X@Ti�[���@U�k	��@V�b�@W��:�K@X����F�@Z+U ��@[g�f�@\�؍gs�@]�t�f�@_C�}�@`M�W�}{@`���U�@a���$@bd����@c��䢪@c���׻�@d��z��t@e\{�DO8@f"�er��@f�݀9�4@g�VڬB�@h���8�@iZ�s�/�@j0��%�{@k
4 h��        ?v���??��W3��?����jV9?Ӎ�Ӵv}?��Y�?�:F��q�?��qa�?����u<�@
�2�K@
suAb)@�\Z�$@��3�@����b@ ���H@$<�L�D�@(a Ԃ��@-̘H��@15�|.@43�v�)@7�JA1$�@;A-]_d�@?Z�v�L�@A�U�2��@Df�C�@G�O�0@J��/�i@M,y��H@PJ����@R k���@T���:�@V1��u`@Xo��I�\@Z��t�7@]Y�N:@`��J��@am�%m-@b�⺢@d}s�ϖN@f#�}�@g�G�"_@i�Sb�@k��N�@m��;���@o���&@p�����&@r>�.��@s.�P@l@teK���@u�`�H�)@v�\ h�@xOc�t�C@y��Z;,G@{(1C�\�@|�A�tD�@~2�0cM@�jG�L"@��cw��d@������@�qW��Ê@�W��� [@�D΂CS"@�8���z�@�3:Z	p        ?`�*@h�?���:q��?����mBU?��/��I�?�xmU�G�?׃i_�?�b}��?�?� �?���/��@ K4m�X�@�x1��@,�*!@��zp�a@���*]@!O�/��@%Ԁ,u��@+";�v�s@0�����@4,�1�:�@82ƦU @<�E�sv�@@�>�q�@C���u�"@F��0�g@JY�����@N%a�B@Q$��i/�@SeHJ�p�@Uպ��6@Xwǟȟ�@[M�L��@^We
��k@`�19��@b��wF�@db�X��@fZփey@hq���B@j�3�`m_@m�����@o|I��b�@q#ϕ�G@rnX���@s�ORl�a@ui��V��@w�;��@x�����@zxmG��O@|R1MzG@~A���@�#�C�w@�2*hr.@�L:>�P�@�r7�2�@��d�%��@��Ơ��@�.S���@���B��@����^�@�^�nΎ@�߉����@�m�L?��@�Db�j@�ڮ<�	�        ?����@#�H鷈�@=M��N�@N�ht���@Z��]�"�@d�ɕ/iW@m�IxC�@t@D��@zq��t��@��b(��@��Ke ��@�.7cw�@�ק�d��@���H�Y�@�]+!aT@�i\w�Ҽ@���Kj@�+�I`�@��v�@��BWW�@��W���@�0{�c�@@��%.[@��^>h_@�vQo��f@��ר��@��5�j@�b/�7@��9��M@�on��n/@�_~��`@��II���@�m�{�@�2g?��@�T�X��@�r԰O�:@�i�a�NT@�f��wt�@�j�M"A~@�t����@Ņzy�-6@Ɯ)�}г@Ǹ���+Z@����2m@�����@�3���@�gibf�R@͡da���@���Q�| @���	�R@и4lC@�`��@�
�����@ҷ��(��@�g8�c34@�X��Y�@����-@Յy [U@�>�(â@��ⵉ�[@׹��r|@�z��e<�@�>�|��&        ?t��ˇ��?�)By�4?�+=���?�(A"��W?�r�9�R�?���A	?툷���+?�f?�+���@ �A宰@j�0S{�@�@��@m)aMN)@J!n�4@���9�@"���@X �ĕX@�?WD@ ��$WD�@"��S�Q�@$�&���Q@'���@)T\�\`�@+��L���@.V�R]��@0���<7@1��@3d�a�֠@4����@6���7@83ZӥD@9�E��xa@;��_[
�@=�cI�E�@?��#S
H@@ƢB��k@A�V�/B�@B��H�y�@C��;7�@E#{�.� @FQ�=��P@G�U�5�@Hʹ��~�@Jd')@Kkq6UJ@L�2f5��@N5�Ϊq�@O���ߟ�@P�eq~�@Q[׻��@R&���j�@R�̾lb�@S��
o��@T�"l4��@U�\�^�@Vx�R��6@WhOj���@X^4�Zr�@YZ�yudM@Z]H��@[f�e_C@\v���l)@]�}g7o�        ?aEv���?�Z)�굓?�t<JXu�?�x��PI?Ӑ8˾�b?�QK�'��?�5$ǹ]#?���U;\B?��u���@�@4]�p@9�w�hO@	�����@���W+�@!���|�@&���M�k@,�2{@1��tV��@5�8/�>�@:8ʹ��@?$�_z@Bg�[��L@E�����@I�2NF@@L�V�� �@P��i:;�@R�N��I�@UIW}��@W��Uv@Z���C�Q@]���FK@`�b��\O@bQ�Kx�@d+�p;@f"���x�@h66c^�@jg��%��@l��L�/@o&���@pںE�.�@r2�H
��@s�,�~S@u	��E@v��JC�@x>l:���@y�����@{��KZ��@}�`h�@vT��Q@�����7�@���Q�=�@����A�{@�����=@�+�Q��@�d�jMq,@��2��U@����-w@�[����@��-�֢@�BB�Ͱ}@��X�/1@�0cɋ��@���Q@��	?+!        ?l�Hj�-?�b߰��H?���a�O?�m
�W��?�; ���z?�n"���?� db?�SJ%բ?���(�;N@�e5*��@���>�@P���@��u��@ ��ls1.@%0 h���@*�{�9\4@0�y׆N@4HS�1 P@8�x���@=gW�@Al#���@Ds�*wV @G�,�7�@Kw���4@Own�w@Q房�:`@T<��.@�@V�WK��@Yn��g�@\KRG
�@_U��~�4@aGfc>T�@b���/�@d�!r���@f��}�u@h���@j�flK�@l����>@o?�c�@p�WM@r���@sdYӘ��@t�j��@v/��"��@w�F_�a@y8����2@z��F��@|� �L��@~@)�A�@�� ��@��V?��@����wg�@���J��@� ��v�,@��/f�@�62���e@�_�!��@��⬚��@��i�X��@�C�6y�@�j��ن�@�ǁ��1@�/%�=Q+        ?�hp[�7@c�kg�@/�O�ޙ�@A(X��A@N0v�o��@W�і�>@`�@-SW@f�EԼ%"@m����9@r��tE@wSV[tS@|:V��@�ϛ�s)}@��ؤ��@������#@�hoe� �@�����@�
N�N@�&���94@�dn��P6@��v�`�:@�D�RG�@�槮7_�@��v��-+@�I|��9�@���eG�
@�f#)�@y@��I(��@�˻�wc@���Bl�@�}��*+@�r��-@�|� �i@�͉�&�H@�����]@�4�,�2@�:1�bmH@�tEJ &w@����N^\@�
��\�@�g�,_@�С�h��@�F'��H@��x��@�W�K�,@�zj�:n�@�O�6��@�,>/��3@���Ց@��!oB�@����@�@��tp�sG@���lߝu@��z?=qb@�:����@�#R�	@�F��p�@�s�C�p@ͧ���8h@����3�@�G`@о;��?z@�jг�i;        ?f��ϧ?�?�4����#?��kR�G?�	%=�\�?�ꤊ�0�?�=�4��?�dW/�?�X�ll�?�?yd�jO@ �,��^�@2��'@

��Z�@s�ǃ[4@���&��@ 2UT��@�$D�:g@lu��>�@ Ʋ��-�@"���}+�@%Nq�Տ<@'�ՃB%�@*\�*���@-���|@/�V����@1x=�1A�@3�,�p�@4��#^�<@6^i���)@8$��E�@9���O�@;倥fr@=��� L�@?��U=��@A	��h�@B$cHӳ@CI>���@DxQ����@E������@F��;F@HE(p-��@I�X�4�/@K���f@Lut<�^@M�u��@Ox����b@P��`%�@QU]��,@R)�r��@S�m-�@S� y5��@T�"���@U����@V�k�@W�|I���@X��0@Y�O\_b�@Z�����@[�T��%T@\�+R2r@]ގ��S@^�z�o�@`�p�@`�Y�Q�}        ?m���S��?���S��?����\n?�Ҩ&?ⳅ�E�?��^�u+�?����?�@�d�&O@��#Fh0@��q���@��1Q�8@�wa�@!'��K�@%z�x�C@*�C�^�@0A1��@3�Cr]@7�t��
@</��� @@��d�@C�S��@F���#�@Jj�|�v�@Nk��m4B@Qj���8@S�sW�\r@V{�P��@Y]��s@\~F�|��@_�I*�@a��K�@c�F�F@e���r�@h��?�@jz�c� m@m	?�k��@o��@�y@qQ���@r�Z8$�X@ts��;�c@v&��We@w�����@y��R��@{�xD�vY@}�e��X�@�=g��@�&9?v�$@�U>Q' @��g���f@���;r#@�2em��@���ʳW�@�	����@���0
L@���O��@���~M[@�fGժ�@��!����@�vԑ'��@�d<�2T@�Ym��@�V}�z�8@�[~�j1�        ?\NG��?�� �2�?��N�X�?�'��?��>�)H?���)x?��*p�?��E_6H:?�� �؛�@*�Ѯ�@
�c��z�@M��j�@fTl���@�E�cN@$hs�|Y@)���k@/��oX��@3~ �!h@7�.��@<ߗvL�@@�e��U@Cl��z�@F�ĸ,��@I�Z�0�C@M��r���@PЦ9A@R�L�ن�@UE,�(�@W��J>�@ZWo�iw�@]!�hч@`^�R-@a���� f@c-B�6�@d�"=�@f��')zn@h��Kս@jt��=>#@l{�$;�@n�W��@pe@���@q��ܹ�@r���_��@s��Mc~@u<RK8��@v�yyU��@w����@yZ!�F�@z��y���@|V��P@}���y��@�]�h@���Y0�@�rK�#�@�S��OX}@�;�C��@�*_���@�'�DQ�@�O}S�#@�����@�#�~��@�1�v���@�F~�r�        ?ߏ��V��@_�F(�@/�TE�(@BˁF�N@Pf��]�;@Z ǁnk.@c�7-K�@jKH�@qX=��Y�@v'G���i@{�����@��h�dl�@�-�Ei�@��J��
p@�א��}@��ú�@�\�l��6@���H���@�]V�4�D@��M6@��K��Z@�ԍ�y;@�rl,�4@�	jF�V�@���r�@�b�hf_�@�%M�)��@��ݡ�-�@�Ԫ"NC@���W�	@��*7ZC@��bƝ@����_��@��[B��@�� ��@�CA�1@�o 9�6@���܇�@�ߗ�_�@�$�ͅ��@�r��~��@��� _�T@�*2�$��@���ͥP@��+z�@�A3�k��@��:{MN@��`M�^@×�fH�b@�hn����@�>����@�C+덵@��w�+T@�ڊ>W�@��xgҔT@ɮ���@ʟ�+	;)@˔��5_@̎"�x�@͋�"��@΍boy�@ϓ�1@�NT�n$P        ?Vx�0�?������h?����
��?�/X����?�W�`��<?�$��b?�)u��?��rR�?�z�Q?���S�$?�}���8?��`��֥?��"��6�?����1@�E��l@6W����@	ҝ��y@�
a��@G~
�@[)P��g@��:���@������@p��vi�@�)b�j�@ �,ђp@"���ޢ@$t�m��@&aAT� @(g}i�Gl@*�_5iu@,�Oəb:@/����@0����~@2��L@3W0cH�@4�����@6$�P*~@7����a�@9*SW$�@:��B��@<gj�3O�@>ʖ��)@?�OMA�@@՝�2��@A�*&YrJ@B��<5��@C�>� �@D��8�� @Eğ_��@F֘�+��@G����!@I{��
%@J8�]j:t@Kg��yn@L��{���@M�~b�x�@O#�����@P8�Y(@P� ��@Q�^.}b�@RE0�$)�@R���X�@S�1�`�        ?E���V)?v����3�?�h4��?��T�x��?��t>�?�|��>�|?�DC�J�L?�C�%�P?��i��?�����@���a~@
w�@�����@`�t�@!3�*�#@&��-]@+�n[�d@15�(��9@5̔�	(@9�ѵ]&@>�8�%��@Bw;�]l@EC�켉�@H�O)���@L������@Pt���)�@R��U��@UL����@X�|x/@Z��Ϗ��@^T�E`@`���w[�@b��T���@dp����@fu1�[8�@h���O�@j��	��@m2��o�@o��->|@q"��5�@r}��a��@s�Z��@ub#��X@v�a�l�@x�97'��@z,�_J�@{�`�+�@}�u��@�$�M� @��l�ԟ@���i��@���R�p�@��OH�D�@���ݯRH@����`�@�,��s�@�`�:��@��)Y�M"@�� ���?@�5$ƛ�/@��hR��@��X��@�3<���        ?@#�7�%�?p��IL?�Usu�Bj?��m)ZL�?�# c�?�e�lvi?���q@c�?�I�Կ`�?�A�^^�?��U���?���0�<@�u6 ]@��jt�t@9�q�
�@ �f�,�@ s�Jj.@$Ou�C�@)7��>9�@.��Gw\�@2�)��U�@6[PW=@:{fF�@?�����@B�?p�@D��x�n@G�r>��@KNa�\�@N�0���@Qk��(@S�Ԭ�@Uƛ�Ź@X.x�1D@Z�,���@]t^<]5@`*Y��u@a��I&�@cG��#�Q@d�A)XB@f��"M�(@h���fG�@j�H0{@l���6d@n��גKD@pg��9��@q�#�"��@r���@s����n@u8�Ȱ;@v�b�Zc�@w�5N?�g@yK���`z@z������@|=�_��^@}�8�*�@^�ߘ@����E�:@�Xw���;@�6B�{̨@�[ʷ_�@��Ղ�5@���s��f@��O/f�q@��vוr        ?��#W	�?��Ht��@�Hא�-@ �G&u@.��/�3E@8�S���@B{0��v,@I�� W�@QU��]u@V����<�@\�5�r @a�MǣV�@e�a�,��@i�n��@n�$Q�Q*@r,�C�=�@u3w���K@x����\@|/F�kw3@�kz�X%@�?|�Q@��s,�@�CB+2	@��{sF��@��G�E@��x�m @��v?υ@�<�Q�Q�@�WSx@��U�J@���ru�@����:"@�/u�A}@�p#�~�@��S|�@�X#K`:@�Y��M�,@��n�@����i��@�ZbEc�@��v^��@�8�&ao@��Ȁ�[�@�AHV��@�Պ��_�@�:]ANX@�}��~)@��9��YS@�ʠN��@����m�@���4$�@��oVT' @����{@���[|��@��3rA�@���O�%@��oC^^�@��?F{Iw@��JVqHS@����Uuv@�y�ʰ�@�&lC�/�@��o<���        ?L��\��?xҗ��,?�vd��)�?�K�&�[?�������?��F��Q?�}�"[)?�[hݤ�?ش����?���_ �?�gȷ�d?�Y�e�U?���K�?�}8���?���M�g?��T��è?�=,t��:@t��6@�{��@�'Q���@	� 3�4l@�净@I�u�wG@-<Ɠ (@3:�b��@\����@��w�@���:�@���@ =����@!�)�u@#>O��[@$���^��@&�F�� d@(d2�zo�@*H�V/�q@,D}�˪�@.W#+�u�@0@w-��@1aҜ�@2�Y����@3Ť0��u@5
[Hz\@6Z�Q)�@7���Y�@9!�`#�@:��{]�@<�[�&�@=��DEN@?F~��@@wu�eX�@ARE�yo@B3�� E�@C;����@D	~P�.@D�X~�@E��FF	@F�
�H��@H���@IŌ�O@J+q�]�@KI��g�@Lm�י�q        ?2�\�y�o?e���n�?�y��Ld�?�����?�=u\ <�?�o�xB�?��;
��?���^r��?�l~7c�?��0�OHO@��c@	������@��@�Ydr:h@���S&@#�H�?0@))é�&@/I綩@3.�=�@r@7:�>z�@;�x��h!@@{���n@C\��?�@F��d��@J�M�=@M��aK��@Q�S�Q�@S\ۛ L�@U��ń��@X��9��@[l ^A�D@^�|I�}�@`쪑��@b�(^@d������@f��`m��@h�ɠu��@k?����@mf�^�@o��a�s@qK�B�lU@r��#H��@t+��i�@u�z��@wW^���@y
gC�g�@zэm�r@|�A���@~����{�@�R
W~�v@�`){u}@�y%��-T@����R��@�͑��P�@�	@)�b@�P�OD�+@��ti��T@�Pĩ��@�p�\�\@��U�sd@�n�+@�@� �d3Q�@���ef        ?,�z.O�~?aG�p�?�y����?���˲B^?�W��.Ɲ?�[�eY�?�W��F?�q�w�G?�-�:�G?�N��%?�(�)F2@�֚K�W@��|�@/.F8��@����C@!)�l��@%���܎@+����v@0��a0@49D�t�@8BB$���@<̃e�ْ@@�J�QRb@C�\I˾v@F�n��@J@Tdb��@M���>-�@P����8@S.6��	�@U�F�4�@X���4@ZÅC�	�@]����\;@`]30��#@a�sI��!@c����|�@e����3_@g~k?`n�@i��pv'�@k���,JV@m�s�n=@p#Z~	2�@q_!�٦@r�Ԣ��@tn�b­@uh�$æ@v�|��X�@xc��6J�@y����h@{����_@}Ob�(��@�ܴ@�sv ���@�e��]��@�`NL��@�c~[Ff�@�of^�+@��/���@���5��@�����?@��� �5V@�3���8$@�wUIl!T        ?�3�=?ڭ��1P�?�cذqc@	�k�R9a@.�a�l@#�P�6@-�>G:�@5<#��W�@<ډ�YQ@B�Ϲ�F�@HHనt�@Np�n��@R��x
��@V�XT���@[3�i��R@`6�	�@b��ʍ2_@e�"���@i;��]�L@l��/ww@pl.UrB@r��i.�u@t��R�@wg)�j[;@z��쬀@|��JG.V@�͉ѻ�@��ԀW�>@�i��9��@�D��~D@�;,�-�S@�P��@���R �d@��Zs"�@�%*X@�o��@�Ɇ�M�@�4��k:�@��-00G@�>����F@���m�@��$�fÒ@�T?F�I@�+Ϻ'@�
��K<@�	H��'@�a�Ht�@�#|#�ͦ@�?wp�ڎ@�eci�2n@��Nu8,�@��GGi��@�^��@�a��#-:@��?q�+4@�9kr��@���~%.�@�f1���@�������@����>�c@�V&���@�(:�KG�@� . ��