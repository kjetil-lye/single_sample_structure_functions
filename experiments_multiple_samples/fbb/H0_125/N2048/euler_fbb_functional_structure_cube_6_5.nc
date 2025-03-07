CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T112443        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?g߬ǧ��?�����_?�_�Dt�?�r����?ع�Hb��?�u��?��r�W�?���{�i�?�'@��3@Mڗ(z@<W�i�'@�s�8�@�l��̾@����J�@ݡZy�@�8�"��@"-�*k�@%P�7�Sg@(ՙ��W@,���U�@0��M�@2�D:�~@5��X�݂@8Y�<��%@;f��x@>�{.-�@Al&�V,@B����T�@D�;ޯ�@G
��7�@IA���n@K���V@N}�%�@PK�2.6�@Q��aoT@S�����@T{]��;�@U�}��K@W��{5��@Y7�DY�q@Z�}C݈@\�Y{�]t@^�H��@`/! ���@a$�;��@b ɖs�R@c"����S@d)�uՆ}@e6���b�@fH�έ��@g_��Y�z@h|GC�;X@i�K
}=@j��'���@k�q�Rq@m&�YNS@n_�2�d@o������@pqS�0�@q�ġ�@q�
�Fm�@rf��Cb/@s`��l;        ?}Z��w�.?�����.0?�my��h?��1t�<�?��h:���?��My\�@��8�7@���0~y@%�E��@&y��n:@0_l�0�@7YO�]W@@PD��@F[�x�@N�\{�
@S�C����@Y�
�z�u@`�<�ESL@dՍO��@i�Jp@oٳ;�@sZb,+��@wG�`&)�@{�;@�aΝ�#@�.B����@�G�zΆ@��./2s@�d�B��>@��	�tw@���@\��@�,d��@��� Sz@�?�m� @�8�'�@��u�KV�@�H�?�@�l�ͨG@��Y���@��M,�U@�g���^@�T[�\��@�V,w��@�l�k7x�@�LO}y4@�l��i*�@��V-�@�ͽc���@��T'�@�X�2� �@���ܣ�@��j�q@�z�c:$�@���]�@�t�@ѳ@��E�U�@�Q$���h@�'�ɛU@����#�@��}e�tq@�����a@��o)��~@�Ѥ�Ν4        ?Q1�K,�)?����i?��TQ��?�s���._?�X�l�C�?� �K.?�@��~?��
�q�@�Ǔ�+�@͒�E�@!�I��@$$�L@-,�̇�E@4��5�@<��W2@CY�Uh�@I�N�r�@P��X��@U{�an9�@[,ci��@`ԇ�]'�@d�L��©@h��v'�@m�"�Z"@q�Gf^y	@t���uh}@w�Q�Y�@{aɴKf@1��?��@��S-�@��JXZr�@�&�ps@���l��@�:꼩zL@���
Ҝ�@�wu��@�F8�@����i�|@�c�6���@�9��l@�(wT�i�@�37�*��@�Zk��C�@��2/̙4@�WG��=@�C���@��C�\|@������@�m�ȭ��@��k\��q@���2�@�>o��2@� #�q�@���F"{�@�a{���@�bu"�@�n���@���[) A@��I���]@��?����@��s�Ix@�`	0��@��s����        @��1:y?@OPF��@@l[��g;�@���] �@�#/&~pR@��h|QE�@�k3��M�@�7-AކC@��.j1)�@�v���l�@�ޚ�W@ţ��W�_@�����jm@Р���ѩ@�H�{�@؆A�a�@�oF��"@�B�j(�@��p����@�s2�s@�B�<�{@�7f��!@�f*�ې@��`)m!@��>X4$@�����]�@�L� �%DAm �d�AL ��AC'��	AQ�s��A	v�X�kA�F�˙AF�1��A4� �6�Aq�Io�A�Z��NA
�CĲ�Ae"��	A��~4�A4�@/JA�D�D��A%A���-A���� �A2�J�}�A�f_��A �'A�M�A!{w�/w�A"L`�Hf%A#���8�A#��ԇ0A$�M�?�!A%�pY��A&�F����A'\�Mv�'A(:��ehA)(�Ur3A)�"Y��A*ݱ�zz�A+���A,�^i�#[A-��aA.|�CS�H        ?�Ocj.T-?��@my�?�8�m�?����*�3@����@]Ӎ3=@΁�M@f�����@"���Jk@'\z���@,Qx���@0�}���I@3���n/@6ʐ���@:��7�@=�E��x4@@��ޜ��@B���1ɓ@D�"RO]�@F�LN�U>@I:냫��@K��ʆF@NP�Ww\@P��UB<>@Q����VI@St�w)��@U�Q��@V�����@XP	�bE@Za��[@[َ��V@]��.��%@_��5
��@`����'@aǟ�Z�@b̕���U@c�3�C��@d��r�G�@e�S�#L
@g	�hT��@h!��o-@i:���r@jVS�)X|@ks��F@�@l�k��P�@m�T����@n�ĺ�@o�;7�9@p��cVK�@qt�3�@q��c���@r<V����@r�s�
\s@s\V���S@s��~R}@t{�ULJ@uHR���@u���@v*�KI	m@v�7��@wK�!�+�@w�x��v@xn�$�j        ?O�*�Xx?� ��͊?��8��W?�?:~Mb?¹�!N\ ?�4W�E_?�.7.���?��v�H�?��!)@ďC�@���,&@�|Y��@ D�Ո�c@'u��I�@0v�h���@6��X`�O@><x[��1@C�TE�@I���&@PM�
 �@Tk-ֳS�@Y;��|@^Γ1��:@b��*�ƃ@f9��ˮ�@jQL��]@n�5 -2@q��uhA@tҗ�H�@w��%A��@{XVM�@�AD�@���j�@��|@�"��Ղl@���~k�@�rN���;@�eH�F�@��n�o�)@�u��s@�@�1��@�)�K��r@�1��@�XcЉ�@���O�@�
n��O@��-H"��@�%��C��@��OƐ�?@���R�@��G�(@@�S�V�@�/��O?@��RBЋ@��K��w@���;A�@�x�� @�!�>A�.@�M=W#�@���.��@�Ϊ�)@)@�%G���k@��Y9        ?�����N?�����Q?� �W
@=�K��@ډ����@!O
7J��@']J�(d:@.�]3@2�3>�n@6�a����@;���=@@l���:s@C�ۦ�s�@G5�g@K^�
ZM@P.�34�M@SȽ���@Vzb-��@ZX�bʵ�@^��x�Y@a�y��Pi@d��+WЧ@g�8ad�}@k{R'��@n�j0���@qxY�E~Y@s�nSE�C@v�:B@x��Q�@@{��G
-@~�K�?��@��gQ`�v@��`��*x@�|~ڑn�@�r�Xt��@���9��;@��11�4@��Ƅ�@����@���-@��"��)�@��,��@���*z��@�1H��{i@���-NK@�ċ�[�
@��d�O�@���C�7�@�k�ذ�@��in�u@��Ol��K@��y�F@�#��j��@�p�m�k�@�ʃPܮ_@�1�W��@��:�o^@�&�5�j@���t~ @�U��<@��xX�)@�a��"�@�H̘V�        @D���c]@x�l�R`@����@��bB�@�wK���_@�لvr@���P�cY@����A^@̦�@�`q@�Zb?�@Ԋwg�@�ݏ��@�R�5>@��4��i@�R?J���@�B�eNf@�F��%P�@�^��E�@鋵��R�@�Ξ�[+&@�(q�j�@�L���3�@�ړ���@���G}�>@�9�ms@��ef��@�	���m@������i@�fg�y@����h�^@�#g�Y�@��v�A 5�F�P?A%)r6A���d%�A�I����A���k��A�{a�[�A�ހ���Az�Z�g_Aoc��HSAg=vA	a��+�1A
_��S�A^�
��A`Rc>IFAcȎ��Ah�(�_�Aoh��8�A;�S�	UA���m�tAF[�OA�(׶:�AU6솒�A�ɲf;�Aj-}�W,A����,�A��O(�DA4��A����AH.}z#A��}�DiA��L�        ?�������?��e#U:?�>�*�y?�+
�h�?�O0.�?�'!�J@ͮ�dJ�@�}����@�A���@�A�C�?@ ���f�@$��YE��@)5��@.!��ݽ@1���$%�@4���3��@7�Fh�@;t�l��@?9l���@A���ƃ�@C�.%09@FfR��@Hv�����@K���@M��(���@PC5���@Q��3*u�@SN��L�&@T�*Ǔ9@V��ǒ��@Xt ,� �@ZTj��@\I�	��c@^T�vϟu@`:k�+��@aU��n@bzl'[	@c�I�ͬ@d䢓i�/@f)^��v�@gxb�as@hэ��L@j4���'@k��M� �@m&n,s&@n���6@p_ũ�t@p�#?|�@q�N�	�@rw=�l�@sL�&@t$����j@u	�n��@u����@v�Τ���@w�@�l��@x�lC�=@y�N����@zx�JeM@{o!�`�@|iM
\@}f��8�z@~gҊ#w        ?v�T����?�=T�>�?�c�KS6?��1w1�?竉H�??�<#�b?��E
)�@��F���@mo�c�O@�*Yr�@O���Y@"��mK@)�C	�@0d?��og@5H��m��@;dc�с7@Ax�e��@F1Nnu<@K��N�@Q2��}k@U/&oN'&@Yߩ'ia�@_W����@b�	�64�@fu2�z8�@j���Ag@o?����@r>M��#�@u*\�rі@xhT���@{�Q�9��@�VC+jB@�&���g@�r
\��Z@�����@��F�2�@������)@����@Z@����;�@�v��&�w@�j1P}��@�~�ˎ�@��	���@�s&4�@���D�@��e,yi@�2z��$@��<�@��@�}��@���S��@���݄�@�cgб@�X����%@�hl5~�@�I�63@�l����@���x��@����l@�*�x�uK@�����@��(V�g@�m���G@��R�$S�        ?P��g?����.!(?����GL?�PR㥘�?���R�?���('@?�S>�?�Q��`�?���m?��@�0���0@,���>H@�!ӛ�@���n�@%����A9@-�u�f��@4����@:�y���z@A��y�Z�@F��=��e@M&>�}�@Rd�:|�@V�^�u@\CS;�@a:�8@d��^� x@h�a��@mw��@��@qQ�K�C�@t3�m:�*@webCJ��@z���̔@~��ĜX�@�~�a:VJ@����j�9@�C��g�@��أ�65@��;�f?9@�駥ݥ@�~�U2�@��-���@�Ù��Ώ@��s�+@��r��G@�)B~��k@��F���@�r�l�e@�b=C@��;�L��@�J6g	��@����o�@������@�D�+��@�eMK]�@�
̓�8#@��r���@����F�@������e@��5#�*�@�'�Ƌ��@�tЩ<Q�@��*6w��@�@M�R@���Uv��        @*�PJ�R�@Z��&�+@w6��"O@�die�4�@��\ƿ@�3�啕c@�5%:�0@��j����@��O�N@����ޔ�@����n�@��M��5'@�9�����@Ҡ�A~�@�����@٥���|�@ݯ|ƭ��@��n�cQ@�t�%b.@��_rl�@��Գ�o@����3I@�K�w��@�pt�7@�^�P�BW@�s>����@��-P^@��)
�w@���R�G0@�c��q�A(�m�F-A���2�A`���sA"�)��A �q˾?A	���\��A}iSyAFNA~�AL��܍A�d�&jA���C�A)��%�A�3���A\��A�b.��A8P�f��A�&v
�A���j5AtR���\A �IN8��A!��;u
A"��A��A#�Uu�F	A$��`:a�A%ڃ�A&�a�`��A(+;�ڃA)a(Q���A*�?TE*A+�Ɨ��A-:fe�qiA.���}�A/��Kcz�        ?Z��m��?�+�G��?����ƚ?�V���T?����	�?���\�I?��f'�[?��Á��?��~�ꏣ?�j]��'@�$��C6@��0��U@���@���D�@�B��h�@�.;�@���J�@`E�$�%@ h	���@"&+��>�@$bT0D��@&��z��8@)kQ�x@,=�{x��@/G��FK@1F�Q	�@3'k��@4��R@6�zyM��@9<�6f�@;B!�v�W@=� +�mW@@��	Z@Ais�@B��䩪�@DKml7��@E�=��@Gz��L��@I/Q���J@J���@L��'o�@N�rz���@Pc@w�&@QnW�_!d@R��Xt�j@S�����@@Tǽ5��j@U�7u���@W2+|I@Xu�QQ�@Y��� �@[�����@\z:"�+@]�=�Ţ�@_W���؃@`j>?���@a->��]�@a�㎇Ӯ@b�E[��@c��yB|@dhƪR�6@eD2�}@f$�G��d        ?t��ӹ^?����1?�A��1�:?�ˀQ]��?��/&G��@A�]&R�@�/t��@�A�<ٿ@f�q�U�@"J"��+.@'�_�`1@.�aQ�A@3JP�.FE@8��4@=�nQ2V@B/&��^@F��j$�@J�)�kC@O�~m��@R�F�@�@Vs�����@Zd�Vʚ@^�l{[Mm@a�ر��@d���z@gĐ�P7@k)_�z@n�5�A�@q{�^��@s�pV/�@v ���_W@x�&��$@{��ykUh@~��` �z@����c�@��?��A@��[��@�������@��#�z.@�AͧK5�@�����+@�4���@��]qjP�@�@�K�@��j-�S@�c�I�[@�*XXm96@�
9�#��@��-���@��;v�K@�#���M@�I:���@�}"+(�@���ǡ�@�3fu	�@�r!�Xhg@���;��@�c��InQ@���Y���@��
���@�Jw�vwV@��F��+@��Y�U�        ?,�xĤ0�?c��p�B�?�_gF��?����er?��5���M?���0�b�?��3]�u?�D����?�ci���?�Ɇ�^"@ݖL�@gW�@	��5@!��}�@(�uq��@1O\y�"{@7�'ŶGE@?�_�z�@E!o:@KZ���Y@Q�/���@V����@[����H�@a ~s/��@d��<Q�@iW�F*=@nu��@q�*��̢@u��D@x����?g@|�����@�����cc@���/
�@��z��=n@�v����@��hZ��@��tcjp@�F�@k�@�4�kaL@�CM�L�@�sc��j@��kB)�@�:���A@����"�@���nbv@�7`�6��@����@�Q�^�9@��50� �@��{a�@@��V��@�t?[u�
@�q���5�@�B����@�W�e;��@�xK:p@�����@�ݚ"��@�"�	K�@�u0Z��|@�ԻJ�Uj@�A��.@��턎        @�3x��@E����@eݳ
�@zs^�d @�uɏ�t�@�Uh��k�@���֏�@���vZ�@�ꭱ�n�@��`�h~T@��͗�|�@�b���@��rhv"@���V�u+@��7Xd�@¸9����@��b,��@ǆ>Tl2�@�#6����@���$���@���Ijv�@�q��NW�@������@�����^@֒M��$@�v�_��@�s
��'�@܈+P�L@޶L߈�@�~��o��@�υ!��@��._%@�:�S\[@�Ö�o+@� 3���@�zixZ� @���Q,@�;�B�i@�I�`�;Y@�m�@�g3Q���@�S�7�yP@�GL��1�@�A�����@�C��@�J�,�*@�X���@�l���+@��Lpޘ�@��yף��@������@����B|@� ��2Ѝ@�R�kԈ@��Luy�A `�khB�A �����A��U��A?�� �A��֠��A�Gl��A-^���nA�,���/        ?Q49�*�9?���ש�r?��|��?�O�u��?�yo���5?ұ|�A5?�G���?���;/�?�'�Iw�?����3�L?��w��#K?�)�[u�@:���j	@�QkJ�K@�����@���P@�*@���@pސ˨m@���#o@�����@ T�-�� @"R�t�P@$x�}� �@&��![?(@)Da���M@+�;��@.�]f�
c@0��w�9@2�*א2@4K�y��F@6'����m@8!w�%�@:9�u�BK@<q0��BA@>�1�v�@@��-�PP@A�����u@CK��{@D���V�@FB�d��@G�줢�@I��ٍ�@KXb��@M8�o�߻@O0���Mf@P�A���@Q��/2&@R�p�v@S��7d�@U1Ǯ�y@Vr�]+�@W�*ϳ��@Y!vL�@Zs�W���@[�G�1�~@]UX9�v@^��齃@`0�Tz�m@`���-�@a��L�^@b��6�_"@c|��>�c        ?N��2�& ?��B��?��|�E�?��+�3?�@���?�#{���?���(�?���(F�@(���@��NY��@���^�@&��J)�`@0�z�m@8�Ә��@@�M,��	@G]0��@Ot�cl�@T�]A�M@ZٙTO�M@a��x4\@eVT�2�@jD�.��+@o���eI~@sc�Ik@v�����/@zi�v��@~�`��{S@���p	�$@��XF��@�|p�M�@�.͉���@��I�@� D�z�@�Q�D��@���>"��@�e����@�.��i3@��,��(@�d�j;@����[�@�@��]@�E����s@�|����@��=��@�^�9x>@��Ppt�@�-�6qg@��=�H׻@�g�mU�O@�6ꩮA�@� �82�@��'�A�@�%*���@�F~��m@�vĈl��@����۔�@�
B)��a@�nM��A�@�伏��@�n.�3�@�B���1@����f��@�����Hr        ?0E�$0-?i��0�T?�=m>1fT?�5G���?�i�(?��?�v�qy�?�7*��'@ O��Lb�@E7�)��@�'��[@'�vbo�@3@��w<�@=�T�5?�@F��@1�@O�~��$@V
>ʪ@]Ϧ�5'C@c�8gL��@i^����@p	� �^U@s�*·�4@xPx/�@}@	�ҹ@�[9l2�@�W���p@��7�T�@�XT�@���n45@�Gb\"B@�LO='�@�eM��@���GY=M@��8�/U�@�OX��@�`EV���@�]]>I�@���3p��@����-�@����r�@�9���V�@�zo��@���ɡs�@��;E@�U���@����d@�#��W6@�h]x3@����7@����{j�@�e��i�@�-3G?!�@���G��Y@�ҹ1/�:@��i(Y��@���P���@���_���@�����;@���9@��Kt!�@��~o���@�	�W�O@�L;�Y��@��2<{��        ?��[ O��@(�T��A@Ix��Lu�@`{S�Y@p����@|][�,@�vM�@�η_~�@�P�˃U�@��[L��@���π@�	�F�'b@�uc9�D@�ury>p@��R�]�@������@�w!vU�@�(�3q@ǖ�u�/@�`�(��@ϊXQ�K@�#\�P@Ԅ�	V3@�1�Jt3@��͋<@�3���@�E��:@�]F��c@��
�+9�@���GBN@�4��H�@�"��@��I�T��@���x[@�'�H�l�@��?i�@� 8c0ץ@��EL\�4@�lB�c	"@�4a5�q@��g�3@��>�$@�%�K�E�A �`��\AԶ�ޥ9A=��hAS%��O�A��Y�OA�<�A�R
��A

޵�8,A�V�#�fAE���A���H�A`�2nְAK�t���A?U�/2A:����~A>�Gt�AKdJ��A_��/^A|�gA�0A��!�>�        ?u|e
�?����]��?�o�C��|?��5�v�S?��v��?��3e�%@8�g��@	d��a>1@��6��@����@(�Iy@ �c��@#���֭�@'� z^!�@+����N2@0�E�v@2n�e��@4�e/�@7���E}@:��Q?��@=���;@"@@n\#��@B!���Ӿ@C�Py0T@E�n |q8@G���z�@I�z��O1@K��� �|@N3����e@PFu�B.�@Q�+)���@RʞR�@T#iq��x@U��̩^@WM]�e@X���{1�@Z+G���i@[�/ � 0@]�Є4�@_m��j@`��"M�5@a�j�PGJ@b��\d�B@c�7k�w0@d�e��P@f�yݿ�@gL�H�~@h����e�@i�J����@kH_"��@l�S)ZVL@n7qH���@oŮ�&�@p��'%g�@q�]�+gk@rg9+%>�@sN�QP�@t>�^L�@u7Ê��@v:ЦZA@wE��p�@xZ��c�@yyX!�	z        ?&��F�\�?`<�	%?�������?�[t?���?�g y ��?���x�Q�?�Š��J$?��;�ΰ�?��4L�t^?���<���@�r��(@��6���@V��T@ �:f~�C@(�y�ϴg@1i��FgN@8���:@@F~�%[�@E��".r@L #���@Q��Q!@V��5�c@\\g���@a/֪#��@d�I�%N�@i
]}��@m�"4���@q���O@t����@w��:O{1@{�0}�Z`@�*��x�@��>w ��@�UǾO��@��U�%̵@���I�7�@���7M>@��$�{�@���ԕ�@��AɁ
@�z����@����={�@����@���A�@��(�h��@���Tū�@��q�ql@�`_eV@��0�n�@�v�G�@��U��@��Q�]�B@��C_�-b@���Ћ�@��L�>=�@������a@��T�d�E@������	@�*�K��@�b�Qv2�@��(s#@����os@�XE���d        ?nr��˻�?�j��.��?����n0?ڟϤ�]�?�@Y�^�?�\�N_�@u��h�@	�vˑP�@��l���@�OGh�@!��I�@(f�XF�@0w4L�X@5�����]@=�J�@C����@H��?"�@O�(�O��@T ��/v�@YP�r�|@_�3��A�@cq��4�{@gÿ3O!:@l�sӯi�@qI��W�@t�[~���@xS]��Ѝ@|�n����@���t�+@�2o_��@���^@�+ׯ�9@������@���@�}�`�@�9ш�N@�}�X��@��dk�/%@�y`sm�@�0W�-�l@��R�7�N@�
@i���@��<���&@�L�=j�M@��$�~	@���n���@�̿��@�͡C�$�@���C��@���G���@������@��2��@����0X@�`Wp&@����[qF@���8nV@����('@�X9��x@�����z�@�1����@�����x@����9�@��HHX%        @[*��n@OqW$=�K@n㿾��@��X��q@���3�@����{��@�Q���l@�z���6v@�s][�~�@�Ⱥ�@���.6�E@§��|��@�A�p�V�@�-�|��*@�m7�R�U@рr|��@��	5��@֔�f2@�`���P@�ZB`L�@߁n��;�@�l_��y^@�0�3��-@�oPCL�@�	�w��@�(e���@�S	�-@��V����@�}��L@�Y��� @�[I�=�@�*ѹ3��@����H�@�M�}kb:@����̳�@���%Z�Y@���{.�@��t-6�RA X�k;Am>|lA�����-A�RfA��P^�qAL5�O�A�]'m�A	��OڿA
���h�A q{np|A�|�KApC�z�.A����A�au�_(Ax�*�׼Av���'�A~�6��A�I"�*A��{H�,A��z���Aw�zAK1&M�A�����A�:Ċ5eAW�HWs�        ?���8}�f?�FX2���?�?��voZ?���G�@g��+�@�<�̌e@�� �@"W�w�e@'��g�W@.E���q@2��}��p@6�FQw@:�O�`h@?>�L��@B���v�@D�@QfE@Gtܸ��@Jg�rK@M�4,��@Pd��vנ@R��G�@S�I��Ő@U�U��@W��MiK@Y�S��m>@[�/,��@^$��|@`9~�:��@ak�����@b�f(��@c��h�@eBN�P$�@f�@�^��@h����@iyxl[;y@j��q��@lN����@nu��/@o�-	[#@p���8@q��ן+@rb�5�D�@sD߾}��@t+�߯t@u�K��"@v��8��@v�Z���@w�����@x�6��@y�:7�0@z���w-@{����@|����>@~�2 B.@��Ky}@�'|�2[@��٨���@�1�ҧ��@��3����@�T�B�8D@��co})@��DR�@�T׽�        ?�m�w�(?�T��|H?�sw�]E?����.?�ڳ.xQl@	7f��*�@v����@����@!m�5�i�@'� �w�@.B]�:�F@3��'c�@9 P����@?��4��@D �/�4�@I$[Wf6@O"�vi8�@S�I	�@WF�lP��@\[/".�@`�|��x"@d�'T�@g�����@k�����g@p#��7�@r�a���@u=5��D@x2�˂��@{g����@~� ���@�Ir��SZ@�D��m��@�`��F��@��~�g@��ZD��@�z��3�@�����@��v�f��@�bw���X@��*�	5@�}��04@�'J��@�����@����|�@�����o@��hu\�@�P(��{@�b�|D�(@�����m@��e�/[�@���~�t�@�!��ͬ�@�o�L�b�@��l�&@�1�w�j@��O���@�'�˹�!@���Ҟ@�)�Bi��@��'k�P�@�ۢzm�@��f:LM@����j]?        ?rLFl�!�?����pϯ?��Nل?�էB|<�?�.T?��.x��@����8@��kt�J@;��_l�@"�o����@*QO�떂@27�g��@8�`�}�@@��=�4@FR��{��@MT�{�1�@S�GA_`@Xa�XO�@^ޛ�'p�@cR�6�@g�!��@mK�h�ǂ@q���+8b@uU]8�_�@yf�^^�@}�B��;�@����&�@�uB��@����.3@�3n���@���e�@������@���;?�@�� X*��@�T��Ѧ�@�S��,�-@��OY@��
H�(�@�j2d�-@�p�ow&@��"ߙj�@���k
�@�to�@�!�{�*@��'D��@���<@X@�&iB�2�@���T�@����*;�@��u���@��?>��@��qA�@��X,@�X�&�4�@¢����@���
w�@�lPkϺ�@���LS|J@Ȁ�x���@�(�`JY�@��NM�"@ͷ���+*@ϟr���.        @?)7�@u�.�9@��nk��c@�B�n@�V�xdk�@��{&�q�@�̒#k�@ёy`?�@��a
��m@�ǐ��K[@ᤛ<֕}@�0k`�@�k�Ui@�&c��@��px(��@� K�-�@�����!@�?��@��X�v�@���~�e�A ~�����Aӄ/�
A��	A�au�2xAO�Ǻ�A	1H��A$�䮱�A*僬�AAʟ~�A���PQA��Ϡ�A�� `A+A��a�Ad�b��A�o�k��A�ɢ>AI&oˇ�A�j���As�lA�B$�N7A ��oN;A Cfd̌A!�A!�X����A"��O�	�A#|�~��NA$U���ӆA%3 Df�A&g�4��A&�ңK�zA'�oA�`rA(�N�� -A)Â&���A*�<���A+�$rvA,��r�XA-�����A.��*�A/���]FA0oz�7jA0��U�+A1��G�HA2T�ǲs        ?h�(w�QJ?���:�?���ڠ�?�L���f]?�h,���?�0���*�?���$��?��N�
J�@�L�@	3J���>@t��c@=j� @@$�l�r@ub_~��@ e}	�$@"������@%�~�,I@(�R�l_@@+߇���@/o�t��@1�炗�~@3�p�cݝ@5�'<�r@8G����@:�����@=�4�4�@@2���@A���ߏ�@CW%b���@E
�RnU:@F�[�`@H��ꟷ�@J�3��OA@L�`o8�@N�@v�2u@P~�zl�D@Q�'�t�@R�Nk�$�@T	��C�@UM�^l@V�����V@W��~��@Y_a�V[�@Z�WxȬ+@\N��=�@]����&�@_jX�4@`�� |�S@aX��{@b1k�'�@c�A�Jb@c�b�@d�܍���@e�d�ڇ@f�xN�P,@g�6	���@h��r��O@i���@j�O�G��@kڜz���@l���J @n��"U@o4uIĢ        ?>��0okr?wC�JI�?�L?D��x?�
��v��?��u�d��?��%�ah?���.'X?���K,�?��-J�?���D�3@@�Z��a@��޼H@���%@#˶1"�@+�Y���@2�8����@9��h�@@���s@E��U�H�@K��|D@Q�Ȋ֝@U�q�21@[|�K�@`x[Pp�r@c�}�2� @g��@l,S<�a�@p�5fq�@sZ��o�@vq��a�V@yݎ,�1!@}��m�E@��M�T�c@�Cߋ�@���o"y@�*-�Kw�@��֧L]�@�Aֺ$@�����@�U���^�@�)y�"
@�:�Y@�(Sd��@�U]ﾯ0@��Sx��@�g���@��l��G=@�*y�e@���gewq@���A.@���_�N@�Q����@��e��@��:�]�@���be�O@�ɔ��~�@��O}��@��1c>�@�+��h�@�\��:D@��e��	�@���.��9@�;�f�        ?fQ�"��T?����ͷx?����6��?����i�?���Bȸ�?��Eٴf?����Wp5@ħR,z�@���G@銾3��@-)�e,I@#���C��@*��h��@2C^ռ�\@8e�)�o_@@*n���@D��}
�@Jԫ��@Qs7�-�@UL�W��@Z_�����@`&�Ҫ�o@c��j^8@g��E��@k�l�ҿ@p~1xP8�@sK��_�@vgRٍQ.@y�4|�&�@}�QM0 �@�ы���L@��$��@�b��X�@��-~�@��z��	~@�|Sa7�@�B3���@��#Ut�{@���)6,@�J���*@� g���x@�	�tu�@��	$@�"'�μ@�8S�K�@��jkn�&@�ٶH�ç@���l�@�;��@�y ��!�@��
;\=@��A=�@�h��Py@��@��@�76�0��@��-4��@�-�;��@�\�~�X@�'��%��@������3@���4�@�����V�@��-orsK        @t�jrIi@N���p4k@m�f���@���x�@��}��Ɖ@�|��f25@�@/���@�b��5d@���+Y^j@���>@�t���ۋ@����G�@ň�vn�@�uX/s�@ͽ�����@�2��a�j@Ӹ94L�2@�p�0��D@�_E��p�@܅-u���@���.��@����r�@�}�%�=@�w6���@������@�1܊ol@�m�k;@�0���y0@�����@�\;%Э@���g��@�e��@��X\��@��o6L��@�u�1@�H�/�O�@�.r�/�jA ��څA��XA)�� bADx�-Ai���A���_sA�{����A?r�ihA	ng�1�3A
�
A��BA5Bo_6A�4��pA+���A\��%A(�����A����'�A�E���A��c�A�����A�ۍ���A�MX�"�A},�"�A��ٶ�A���!�A�U�ы�A���'��        ?q�����Q?�����O�?�N�o�k?����V"�?����}�S?�5����A?��U��?�?�eUy@&���gp@	�HWm�@ ��z(@�����@�a+�'@�D1��X@ O���-�@"�����)@%�#�� G@(��ta"@+��k��&@/Zt}��@1y��m�\@3\����%@5Vz}@7d���\@9�}��,�@;�f^�@>&�@@<��d�@A}=��)@B�9���@D'�����@E���p�@G�jԣ,@H�}�� �@J={Vt��@K�FZ(#�@M����E@O�"��%�@P�q�m��@Q�?�e�\@Rù���@S�Ҙ��@T�0
q@V$?���@WZ,ֳ~y@X��8�n�@Y�l��e�@[<�"�@\�����@^�(��F@_|5"���@`}qО@aA֪��P@bae{Q*@b�,��N@c�S$�z�@d��,̏@ef�?19@fKY�N�<@g5'�hX�@h$E0��@i�M�]@j!L|5�        ?A2�vK�;?{�O�UB?�e$��y?��䶘�T?ǻYO@?�Ueق�?�f����?�r�/$?�ηzE(�@9�2���@I�~�@Iv��]0@!zDZy@(�����@1[�<��0@7����ń@@C`���D@E�ĉ��@L`�a6�b@RL�B��@WCE��A�@].��D�!@b�a^	H@f*��� A@j�Z8:f@p(�3��@s?��@v�4Vx��@z��@6@D�o/�@��mt�W�@����&�@��Q�W�@��;�c}@�K�Y���@��B�X@�����@�Mb!-�2@��%,���@�2�3�A�@��y�^@��Τ��u@�gW�2r@�s�?@���<@��R��+@�c�sry�@�^���%@�rw�q�[@��X
l��@�r���@��5e},@�ഗ T@�+��Ia�@����h?@��e��@�^�8�V�@���*�I�@�q��Xc@���~��@��򒛁@�=}�r@�"�;�I        ?%ˑ�w�`?]lL�?�2<F��V?�=�t��?���6*�?���4Lп?�iM9\�?� `'>�?�l75��?��^����@$��?D]@��O<R�@¨Hդ(@%z�>�.@/�-N'�@5�H����@=���R1�@D(7�d@JQ����/@P�z�֯�@U\��OE@Z�xa���@`@m�*�#@c�̬)"d@gp�(TO�@k�m�o|@p.5á��@r�p���H@u��l��@x��t�7@{�ϯ��1@uE���=@������@��S�Ⱥ�@����K��@�,�:al�@����v�@�?��&�@��a牛@�x�C�0@�����I@��A��D@�ap茰�@�4T���
@�!�`{@�(џ�P@�L����@�F�n*i@�v��pU�@���G��j@�;V�P�@�d�g�@��VX���@�VȢNz	@�鈫n;�@���4C��@�C��q��@��]��G@�r�j�,�@�hؘt:�@�g���$@�pB�>ٸ@����\C        @l՘?1@:��<;@X��@L/<@l��"�@z�cᯀt@�U���P@�Wa���@��n���@��@�=�@�d���[@����nf@�+�nCz@��g�)�+@��*���@���FBYD@�P����j@�h��8�@��m�^@�E�l)�@�ʠ�q @�x �?B@�M�����@�K�b��Y@�9��A�@���OE(@Ԟ򣖷8@�q�A�@�Z,]*@�Y��38k@�p�(^�@ޠ�%��@�u���T'@ᨑ�7��@�鞤}�`@�9:V}�&@��֧�k@�ko^6�@腋���@�f�rN@��<�z@�m�F.��@�5����@��}m,@��-Z�@�'���@�p����@��j�i�@���4@��l��F@�nQ��@�Os�D�@��{���@�ᦧl�@�9���kt@����}�A ��.��A �5���^A��޷�AEW�ܔA�Lt�A�J׬�VA���x�A��mК�        ?q���pJ�?��w<�?�(�jX�?�Sٖ��?�rS/�?���P�@ ܐӍ�@-ǫ?n�@jsE�G@FXh�"�@���Tjm@��\M?@!��A�m@#��|J�@&��O�/@*M���@-�(�O@0�l���@2���"o@5۳�q@7f ~���@9���1��@<�p�.@?�C�j@AOW�ȕ�@B�RfRb@D�]��@F����@H���L�@J��x�]k@L�h
��@N���� @P�=᎕�@Q�Æ�?@S.M�@@T�8FO��@U�����|@WW,o*�t@X�LK�@Zf�
Ԙ�@\��j��@]�F��@_y.�}��@`�~�J�@a�� �m	@b�	�4R�@c�!���@d�/�$�@eƝ��a@f���V{�@h_�t�	@iXg��0�@j�,%�j@k��)еn@mS<��+@n��`���@p��@p�4`w-�@q���3�@rp�	ut�@sD5ܼ��@t��#�@t��D^        ?NE�w��q?��S��?��'v�?����Oc=?�F�םċ?���%P	?�QOA�Ւ?�[z?&~&?� ~
5�@Ƕ�u�@��Y��@a��8tf@��I��@$Rб�Z@+��70�@2���$Ty@8�ѦA�@@n��b�@E[7O���@Kf��h@Q]B_��@U�K\�s�@Z�v��u@`����@d���L�@h!%x�p�@l����,�@q����@s�=�m�@wQ�:���@{YU"@��B�Z@��+�z0�@�E��q�H@��jH��@��}��@��q���@�:S�,F�@�`��R@�!է�@��T��@�\���@��9٢�@�G�S<%�@���E��@�g3�'Y�@��u����@�|��4�@�'G�l�@��q���@��b���@���m�@��!���@����W�j@���T�V@�%��9@�W�:4#	@����ri@�����2@�9ל��@����^�	@���[8p@���iR�&        ?h�l���9?��t�Z�?��|-*>?���rU�5?���l�K~?���ꏣ?��G<�@x��of@������@?�f���@�j���@ 6h޹�T@%��qy�@-����"@3��7/Y@9ࡗ�@@�s��]@E����bT@K�K�/,@QF<4v��@Un�t�rj@ZJp��M@_�|��W@c'l`�h@f��Č�@j����U�@oM&�[�!@r8LKU�@tХ���$@w��$��@z�gx���@~S�~~�@��� ��@�����@�X_Rc@�6�k�@��S�%�b@����X��@���i9��@�����!}@��D�@����E�@�Y���S@���LL@�O�2ꊬ@�"��o@��#�7@������@��5�z@��꤁^@���px�%@��ɠ�`@�����@�C ^�@�y�Ig9@����'�@�^�� @�a� `�d@����U�T@�;el��@��H���w@�%� eJ@���F��        @����Oy@H�w�@@hv�*6E�@~�bNc@�vӀm��@�cF?\�@����t>.@�G��_8T@�p�T��@�6��z=]@�������@�s�|�@��A;��.@ò��a"@����m@�T��#@ͧ��q@н����)@��	l��/@��|؆@�e
+S)w@��ښ���@ܶ�F��@߭1����@�mw,�s�@� �y>@��)���@�݈�fAr@��~�V9@�UMd�@�Q�5l�n@���Gy}@�1Ĺ� @�c�A�,@��O\@�)���@��=x�g0@�+8��e@������1@�m�)@�'ԃ��@��@N��A g�f	�=A^�)R�A_��]��Ai�$�A|�{$8	A��6��OA��EW��A� ��pA	+t*�D�A
o�'���A��mv�qAಠ��Aw�O:rA�1�xֱA�K4x�3Am��õ�A3=��A�(��A΄���A�o�;@:A�
�Y�D        ?Q-�Y0�?�HAU�˒?��b"n�?��!T�?Ʀ���ӫ?Ҷ�i��?��匏g?��<�օ?���/�?�'5���?���9��?��衖�x?��roǆ�@��~Z��@E�;�[�@	�w���@���=�@�%<M�@3�6�
@���U�@G6>��@�$<7@/��7M@ ��Fuz{@"��ԩ$�@$g���h@&l���T@(�]jS#@*�T�߾@-A3E�6@/ʯ6D�@1;��u��@2��;@4�<���@5�l.Hg�@7Tl���@9��K�@:�-��u@<��O�'�@>��(�B^@@w9&�@A��?�r�@B�่�^@C�d�ɬ@E6�ޞ�@F�)+��@G�&��@IZ��]�@J�r�.*�@Lh�R�U�@N�����@O��t�~@P��=F��@Q�H�<��@R�gߓ�@S�T�@T�8�O�@U�����3@V���d��@W���he@Xȳ6j�@Y���md@[ms�        ?!���v�?cT ,�}?����b�h?�"��<��?��m	R�?�_y
��t?�Gx�?�u��?�� �j<@�2��V�@�AE�@����)@&�V6@0W��Y<�@7m�BŬ�@@R�*��m@F.Ź0�@Mw�]��@S/G��@X��ف�z@^܁�u.@c!3ig�m@gg��-@lI���@p���m@t@�|N�@wz���:@{P���$@��^@�r��@��.����@�T�s+�@�Hg���n@�v̓�(@�o�+	B.@�B���`@�4��0��@�GQu�1c@�z���e�@��U�u�w@�H��#�@��hɹ�@�S���t�@���ż�J@�O��\]m@��ɥ��@�����6�@�c͆*4@�@�W�	@�5=M�@�A?���@���Ò)�@�Ѳ0���@��u�ݸ�@�6�����@�}4�H\b@���`�@�5�?Y\@���+E�N@�(����@���;�U@�Yy�X��@�>��.        ?Y#e���V?�r�&��?�����m?˰�Ғ�D?�3�nO�x?�Gz-��?����@=$U�@\�&qv@��j�@�@�\Xm��@%^�~~��@,���e�	@3#�覿�@8ԇ�z��@?��Lj �@C�sO�M�@H�zsd?@NDȋ@R9�?�@Uݱ�F�V@ZTl��@^�ވ�|�@b %6	��@d��R���@hC�L ��@k��4fhA@o��� x@r3���u@t�0#�@wF��0
�@z&��^@}C�%u�@�PF���&@� 6���@�u����@�)�/4�@�e&Cя!@��JG�Ϡ@�S�!��$@����L�@�u,�M�w@��@��u@�������@�O�)I��@�j5Q��@�3���@�h|Y�@����e@�)���c;@�Q+���j@��i-9U�@��f���a@�HlWN0@�y/�s�;@��9�H��@�a�p~�@��"�c5@��+ܭ�@�)��q�Q@�ު�:��@���'��@���Ir�        ?��:�ߟ	@*i�g�+@K�^V���@a��5s�@q��S�?�@~m�]i�@�M9���@���L��A@��-��5�@�a��%��@���(UM�@��S0@��^ @���|ԇ�@�����#`@�N��l5@��X�M�@��;�^"@��$��k>@����@ƨ�j�2�@�lo��<�@�e˹%�x@ϗ2S9��@с����@�U�E@�J0�2ƾ@�_�����@ٗ�����@���*�&�@�vH��?�@������@��G�O�@�{��0>�@�;k�$@��;�L��@�\�f�@�p/^�e@�mj),�h@��@�\�����@�k�'*@���|G@�������@�S��繯@���g\�1@�+��H�@��{����@�F���/�@��B���@��nኔ�A <|T�fA-�����A)7p��A/!)��A?�����AZ�w-NA�m�L��A���/�A��l%�A
/����A~
�`��A�ՙ%4        ?�g|���?њ6�c�?�l��N=@K���(@�����@Y6X �@!|OqS�2@'���4�@.��EO�@38!;\N@7x����@<Κ�c�@@|��lK@CFH�@EӢ7/G�@H�a@K���K�+@Nќ\��@QS�fX�@R�w��@Toê�@V8�z�-@X���@Y��ڬ�,@[�F�a��@]�Zjڦ@_◸��@`��
	c@b,[�n@ceZ��
@d0)����@eKT���@fj�g�|�@g��B�)�@h���4q@i�6h�"@k�4��@lIW�K[@m�3�9�7@n����%�@px����@p���1�\@qM@��@q�A�o�@r���( �@sP��@tEXB'�@t�NQ�o@ulC�Xd�@v&0}w8@v�!�G��@w�.R��M@xfi��C@y,�K��@y�����D@zÏ&O�@{��:(@|g*��K@}=ʪb�W@~��E��@~���ҎG@��ߵ@�\Xˌ�N        ?l�k;�?�0����?��W��'?�ꌺ0ʝ?�e��X�?�K�{2�?���Y�?�Vy���@���ȷ�@��<^n@cYO֘�@�hڼ@�b���@#�Yg�7&@)�>��Ƿ@0�G"�=@5��-�8@;�66�I�@Afd�4�@E��=��@J��|���@P?�W�A@S��@�@W|���@[�)p�(@`m*v0Ҁ@c7�o9@fV��>#�@i� b�E@m�4��{�@p�L��@sH�u��@u�%��@x��� �@{�	VE�x@�_z��@�Oۯ.@�D�|��@�cl��t@��۵�v@�'�l��%@��@�7�@��՞5��@�fVE��@��e�@��6ߝ�@���[@��؎E�@�D��l@�^�3~@������@�D���+�@��][G{@�2����d@�̛͝O:@�=�-J@�LSX�@�4>��@�8y!���@�ZN۪ƞ@�͌��@��!y�~'@�?���]        ?�ұ�q9Y?��hkJ�m?�d�޿�"?�)VҧJW?�X�\��L@M�H׵�@��`wK@Q�F�Z@0�VO@#<&���@)��zi_9@1:]|���@6��>��@=5�_%@B�\��}�@G)ϒ4@Lh�E�z@Q'�����@Tt@Z{�C@X$��_@\E9�r��@`p�T�7@b���C@eսEzH�@h�7_b�=@ld��/�z@p�'D��@rXq{t�@tO��.�@v��o��p@y;�m�@{�	Ѥ�@~�/u��@��?vh�@����?e]@�N�	pq�@�����@��pB�@��*(H@�!�w�B@�W� ��@�U���F�@�����Aw@��N;V�@�0	n%@��� hW@�Z��+�@��&=��@�@3Hp~@��Y���I@�� Ib@��34���@����W@��'���L@��H�d�@��/�C@��{�@�C�E�#@����%�_@�ѵ,�� @�.%Z�@��;!F@���J        @K�'��-2@|������@�ķ���~@�컶�S�@��Av��{@�^���dT@ˏq���@�w�h���@ײ���k@�l�;rI@����-u�@��=�S=@蛾D�G8@�J�GD�J@�լ�؈@�K.]�x@�+Զ��z@�U�,�#�@�����6>@�ᡣa�.@�B����@���ɶ*A/t0��Af4�8��A�W��^�AY��'As����A���u/A	M'ʑK�A
�9�8��AA�8��A�I-@�AQ ��Aq31���A=,����A�ߠlA�Xo�A���,3A��}ޤAm`�_�qAN�w{A�A4`Cd��A���٨A��1�A���.��A�CA�7�)�A�#����A��ng�)A����A 2�BbA ����aA!W�NA!�!�c��A"<dޚ�A"��o�A#f??���A#�Ӎ�JA$��'��'A%7U�R��A%�P����A&y�/��@A'�g��        ?�`-(�?��C���?��ɍ,"�@	�6��	�@��M�O�@ ��Z�u�@'ųxY @/����G0@4��mZ�@9��R�;@?�'&�@C#_$&Y�@F��c�@J�]�a�+@N����!�@Q�3䄈@TVX[{�@W=���p�@Zq*� 7�@]��	8N@`�Z��@b���䞳@d�o��@gT	�@ir��/�@k�� @&�@nr�qAg�@p�RU�S�@q�\��H@sd9�_+@t�Po�@vmO�t@x�G�@y�1ߜq@{Z���uq@}�*�[t@~�Q E�@�]փ4�@�M���@�D4��9�@�?���r1@�@��
%@�G�SH��@�T$���@�f����@�����V@��}��r�@��V����@��h~�&_@�)�oɿ@�e�V,#@�����4+@�x�
�>�@� �O��@�˛���@�y�V
&2@�*���@����3��@�����@�O����F@�j�q^&@���a�@��^�X@�        ?���Eu��?ӝ0+�J�?�8��6�@&&φD�@�E��~@049��@!��!OT9@'N�F�@.!����@3*ǉ�E@7�x]b�C@=͂�F�@B��/-@G6C2��@M"�}@RB���f�@W����@]g�]�@b7�0~׮@f�ʣ(9@k|@��q�@p�0��JA@s����@wE��:�@{4�$2B@��
!�@�)^|')z@��ś�E@��I$6�@������I@�H=	3�@�Ռ^oO�@��K�d�W@�ݑ�$�@�[��?�@�{w����@��@=�@��U��σ@��<���w@�He���@�ޒࣕ@��.*��@�K��uG6@�#MUߓo@���<Ѥ@��Ԙ�@�2���%@��Q*���@������@�
�"�v@�H�0Mj�@����lx�@�铑�&@�L�x�G�@����&�@�:'pҰx@�Ĳ���U@�\�R3��@����Y@��4��E@��L�t�g@¨@�Tb�@Úd)��        ?q�c�Jea?���s7�]?�5s���?���U��?���?;?��//k?��� +�@���=�$@��swK@��,��&@�H���J@&QQ�8u�@/�vW���@6N'�*��@>��;`�@D|&�3a@J�7�&�4@Qu���E@V:4���@[ޕ>�@a9�鬐�@e�U�`�@iU�G�b�@n6���v@q�4��@t��'��@x5�t�)i@{�姤�K@��4��@��?��|@�rs��@��\�N�8@��<}'�@���F���@��Lb���@�v�����@�3CTl@�ա���@���ս<k@�
JϢ?@�$2���@�a��%��@����r��@��� @�\ȡPp�@���\Uf�@��4��D@��':��@��+oB�@���1v/h@�$����@��.S�9@����'��@�%�ϔ�@�9/T�@���ɫ�@� �.i�@�����N@�> 4��@�*ZXt�@�J^��9@�tdư^.@��rN�~�        @W;�5��T@��d�l @�x���gn@��`N��@�>��y�@Ȋ�	�
�@�H�-{@�z���J�@�x�M��@�g �Q|@�'tL#K@���2�1@�%�h
+=@��S�y[N@�c�t�@�Nz�� @���e��@�푢�cAY�]�?cA�e��A�o1�*A	���*�(A�|�A*~�r��A�V܉�kA�P}�A�s��24A�?��2.A|	��]aA�x缝�A�d6�_A�I�;A �+�-��A"
B�A7�A#)��7GA$OeM��A%yg�Z&A&�V��\�A'�K`��:A)��4��A*K;��%A+��P��kA,Ǝ_8�xA.<��O-A/L����A0I��~PuA0���r��A1�;�c�A2=3��\dA2��,�A3�����sA4>�s�.#A4�f�a�A5����[A6O��wA7L�ZA7�/���_A8rn	jA9,�5�V�A9�љ/A:��y��PA;l�5G
A<2����        ?z=�Olw?�W����?�(loغ�?�G��!?�?�aZ� g?�b? p3E@ %K�>'�@���U�@qzb@��s�;f@�Nࠨ�@#��I!@ĉKC�F@!����@$x-%���@'<C�@*%�/%��@-4��.�`@05>�v�E@1�J��o@3���hr@5z��5@7d���@9c̯�D�@;x�c�lk@=��`y}@?�3U�@A,򟁈@BU)��L$@C�W�C�k@D�����\@F=q��#@G�t��C�@IǠ9�@J�U��s@L���Mz@M�E�KQ�@O;���zR@PpQ�"�p@QGk�tLo@R#[�K�@S7��N}@S�#�l�@T�@<[�!@U����@V�*���@W����qj@X�����@Y�Ȟ�;@Z��|�o=@[�}���@\��cN@�@]�7!.�H@^�dȤ�@`�����@`�iQ��@a+b��:@a��'5~@b\�>��g@b�WG
�@c�-K��@d:zo~C�@d߀V��        ?"�����?YFref�?|����?��G/��?��z~#5�?�j�;��?��y��1*?���0$҈?攱Ry°?���P%?����p	�@緋�ۨ@�����@�KB.+q@#)�����@*�2.
�L@2{�#�@8���@@}��׈@E{�㥕�@K�aH��@Qr&���@U�%^4��@Z���V<@`r�nE�w@c䊮'��@g�Daޓ�@lQ�q$�@p�7�+�Q@s�b^�-�@v�Kf��@z2�P��t@~�0p�@�+z�*/E@��*��v�@�M���@��RV��A@�Ҡl���@���)I�@�G5C%��@�'4�[i�@�)X�\�%@�N��?�4@��%��J7@���#R@��g���o@�������@�:J��@��S)���@�>A���Q@��~��z�@������@���#�,@�� }F/N@������@�X�t�N�@�v�y���@��W�M-:@��;
E�@������@�r���ht@��;U:X�@�G:��        ?���6l�?��K�cy?������?�u�?�cs~�ކ@�Q 	@��+�@�<�"N@��~@"���⡅@($�znE@.��ľ�Q@34K�?�@7����\L@=�v�;��@Bm�����@F�G���@K�k�D��@P�$�@Tu�R��@X���ζ�@]x��Y(h@a���v�@d�G�d��@ha����@l��v8`�@p�'�&>D@s(�� �k@v	h��@y6O!�3�@|��7P!�@�B�XhF@�V�.c�l@��s|@�Ik���@��zmB�@�o�E��@�m�3ic�@�N����@� �o'�@��,��(�@��smD��@�����@�ц�[��@��^�p�@�cH��S�@��V寐@�6�s@H�@�����8@��*Hk$�@�u���+@����0@����"��@�MD^��~@��ˤz�@������@�c՟�f@�_;,�6N@�el�#@�t¾��a@��n�
��@��FDV�!@��y�@�0        @%rwƻ�@Y�ۤ�@v.*�@��ܛ_�"@�x��nC�@�m�Y%�@�/F�*�n@�7��1�i@�zb&�@����E�@�mwg@�c ��=r@˯���E�@�)�e	Kq@Ҩg��u@�TG�8�@�.G��c@�7��5��@�r��g�a@��.nwM@��{d~;�@�E�{��@混�]8@�����@�%T�@틪�̾@�	g��q@�]�@RS�@���n�c�@�8諭��@������@�Xbo�͞@����'L@���8�7�@���r�v�@�b���0A '3�273A%#�K�A*�{�~-A8L��<AM(C��
AiK̔ǿA�����OA���JݢA�$���A
 h�7�|A_��~�A�b�!hmA�yu-�AJG���AT��E�A�4��pA�c��qAy<iК�A8��\�#A�%�i%DA�� e�6A��j��A_f�~\5A3LǪ
|AA+X�A�C�Vr�A�U(m:�        ?���S�w�?�je]b�J?�C"q�U2?���T��?��Wb"�{?��B��`@!�ij�@����7@�I3�.�@�jt��@ �D���@$M-rK��@(a�M�A@,��'N@0�R)�@3���@6�j����@9�����@=Q���@@`���u@BS��h@Df[��@F��6�@H�����@Kk/tv��@NV;�v@PcE�s1l@Q�~��@SWn�'X,@T�8�8w@V�~�~�@XL'���9@Z�w�
@[�s�� �@]�>����@_�z���
@a..��@b�%���@c:��@dd���@e���>y�@f�F��f�@h'I�G��@i~��.�W@j�{$��@lR	�?v�@mͶ��&u@oU�	@IK@pt�|p�@qD��m�@r.Sp�@r�3;��C@s�W�cx�@t�hr��@u�c��9�@v�^~�gS@w���@x��~e�@y��fG�^@z�~�z@{ċ@ޥ@|ݵn�u@}�
K 1o        ?zuWN�zV?�)�H�?ɏ����<?�ݨB%�?�-�C2�`?����aC@�3f��@��|Q��@���v@$����l�@-�$�1��@5':>�j�@=�� �@DE(�D5@Kl͇�\�@RF�X�s@X�(Q@_=[~{�@c�3no�|@i�p��2@o%~z�TU@s'/c�9@wJ#u�@|>����@��oɞ8@���<��@� iB��@��q��<@���S�p"@���L�^&@��v���`@�j�Q�@�%rh~`@��.�h�@�.�8���@�A9�S��@���Ub@���s�U@�鑥@v#@�	�°��@�K�.��?@���3{�@��e{�@�t�k�4�@����i�@�b����'@���E	h@��x�.Z@�sM	_�@�V����@�U�&b�@�q�Tl�@�ֆ�x��@��E�g@�B]�v�K@đ�w��@����d@�gІ���@��N���@ʊ��~��@�:�J�,h@������:@��S�Z�.        ?o�7།d?��{Ҭ�?�\E�in?�
3P�?�-N���?�?m:!@��i�X@������@d����@���u|M@$��H7i�@+���}��@2\Z�d-B@8���k@? 	řO�@C�.�޿�@I5TN���@O�hF���@S��@��@X
ʹ��@]A,�z@a�p&�@e�|s�a@i	�(�@my�
��@q9	�^@s�1�*[�@w�3½&@z`�W\@~8���@��w�ʭ@���O@�h��M��@�ڷ�*{@�u1ǰ�4@�8,?���@�ㆄ1@��;�x@�:�+g��@��Źm\d@��O�μ�@��> ��H@��u��PC@��ҙZ a@��'�y�@�e!G���@���W+�	@��l��"g@��e��d@��D�3@�c>��}H@���DE��@�	G0X5Q@�i�°7S@��,i��@�D��Z<@��i`���@� ���z�@�慊٧@���N���@�\�2~R@�Rq�mǓ@�*R	S        @3H8<��@b�QVt�@�]A*[W�@��a�Vd�@�YƓt��@���F�0@�.%���'@���D�@�?/��>�@�E��(�%@��]��P@ѱ����^@�G��[o�@�E����@ݱ ����@�H��y��@������@�����8r@��&ɫQ@�!L��@��Z�u@�šHH�@��/F��@�lm{��@�淟@������@����ބA��$�LA=Z��-�A���
%A�F�A	G�Z�AFH�b�A���7KAvM}�AR
I)#A��d-�&A�8>uA�f�C�4A8�O/9A�4r�A���hAx^���Ad��7h�A 4�+�� A!C�`/{�A"_����A#�|dtf�A$�U7��aA&���9A']袝bA(����A�A*5�l�A+���e˚A-I�YԑQA.�)CI��A0L�7(�A1,[d�RA2��"A3 ��Ǣ�A3�t�-%�A4��%��A5�gY��{        ?c��'�,?��Y~�D?�'�{��?�?'�.��?ԓ��Х?�����G?�ZF<��6?����?�-��?�$?�J����@�'�[��@d���u@	��!\7@.�8�9@�H�Z�@H�s��@4/g9`@[�$��@ª7^[�@ �`�| @"�瘂�k@$ȩ6S@'t����@)k7#�p@+��O�@.�X�J�(@0�VA�\c@2B��hVf@3ۨR�U@5�����G@7S�y<�Z@95[��3@;1��:>^@=Iۦ%8t@?����@@��mK�@B!f�f�1@Ci.��@D��5�}l@F'����@G�2�[@I'=��@J�U��U�@Lj��8�@N'tV&_i@O�F�k�&@P���A�@Q�*s�?@R�/���@S�+��L@Ua1��@V3-7��@Wa.�B9@X�n�@Y��}�@[2��̲@\�'�T@]��.�l@_x7-���@`�|��i�@aLA�5�@b��+�@b�Ec�<�        ?fQ:D��?�`'�j`�?�`yl�#?�5��&�?�}3�<?����?�q>�h`�@��C��@L�Z=�@�i[�FX@��,C~@$�נ#2�@+�=n��>@2a`��7@8aK���@?$M���@C�^!@I�M=�@O(��n�e@S-��#�@WZ�����@\)���;@`ӹ.>�@c�.�V�@groMCTd@k`?��@o�}Ύ�U@rN�KM@t��[�i@w�9��@{3����@~�z��@�P�Cidf@�l�)��_@��a�8@�/Y?E1@������k@����E�@�h��4C@����W�@�ַ<(An@����V�@���e�%5@������@�1Mc��@����۞@���N��U@���Ԁ�@�f�-�T@��r�= �@���"��@�:��;@�~ S�@��Ny^�@��VB��@��w�zɉ@�ɐ�4e@�8»��@�m�?�H@��1"�<@�����@�d�� ��@�ֵ�P         ?;r�'��?t�Wǆ�?�V�o�t�?���
�%?ǭ��2��?؇�d
?�)�f[݄?����@h��0��@W�b%��@@JU�3@ �^��+@(�����@1�U�$c@8h�H�M@@o<���@E���Y��@K��i%@Q�!g^%�@U����t�@Z|n� ��@_�ɀp�e@b�mK]�@f_�垱|@j#Y̪�>@nL���C@qqZ,mW@s���"��@v����
#@y�v��x�@|�ҩd��@�Eg�_�l@�0Kn�7�@�A���
@�{W�$��@���N��@�n�}��@�-#�ԗ@�����k@��6�Y�@��RJ�k�@��5�ω�@�5�Z@�����ҝ@��YP�R@���]@�@Q~j�@��z3d@����#%�@�we�ۉ�@�Z�p@���B��m@���:U>�@�rA�w��@�w�C�u�@���;���@�������@�"�=��@�g�p�J@��^5t�@�&Dű�U@��s�4��@�2���8        @h��z@8CYr',@W���E@l�_ڥ�Z@{��~'TZ@�(�Bh�c@��=�?2@�ӿ�c�@���	a�q@��s�<t@���1���@�6-�@��-$r�@����g��@��~�J�@�Wl�2��@�!�*�@f@�0�oצ�@ʇӏ��A@�*���o�@����p@�/j��
�@�z�ɽ��@���]�@ڔm�%w@�d��*7D@�2��C��@���|�%@�|E���Z@�G�%�H@�+��i@�+i{��(@�FĚ��@�|[��b@�Δ"��r@���׼�@�d&<���@�r�O5
@��q/z@����߱�@��S��Q@��.��<3@�I���E@� !b��@�Ȳe��A R�(AI����AK��CAW,�
*Am��0ZOA�˵@FA�dw�R�A��y�7A	=z����A
� ���A�4�K��Aa��>e�A߸��*�A6�$D�<A/2�A��ݠHA��q�\yA��(�        ?m��_|�?�Z�����?���Ƥ	_?�y�=Y��?�KA;�g�?�~��y$?��ũ�W?��h�9@_���+@�g�5�@kd��J�@�;k��@jGǏV@1m���G@?� �	Y@ ���Y�@#��5p:@%�u�c��@(#�<��!@*�-�	w@-�!����@0e<��xM@1��a�Q@3����@5i��x��@7@�hY��@9-�Ƽ��@;2�[F� @=Q�FK@?�"���@@�|�F�@B(z��b@Cn�mv�@D�W�6��@F%�%s��@G����5@I̊_�@J���y@L<Ã�N|@M��U�U@O�Ա�5�@P�����@Q����%@R�)��?�@S�8�x@T��ʐ�@U���e�@V�ͣ�ϙ@W���}�@Y-8���8@Zct+���@[�0���\@\�H�#C�@^8���[@_��:�l�@`w����@a+!D�@a�~T�@b���آ@c\�)�e�@dld{5�@d��<6�@e������        ?#C߀�_?d���{�?�c�z$��?�f7]a5]?�y��� #?��\dN�?�ח#m�?߭�q�_5?��+�/g�?�)�B$9�@����@�`j\@�9Y��@0xa=~@%p�I��@-�W�{1@4���x�@:�F���L@Ak�����@F_#"�M�@LU�.�@Q� LFi�@U��\6��@Zڀ��t�@`KX}�$�@c����eD@gi#�꧌@k�j�Y5@pU��@ss��xY@v5��,�@y��K��@}�z�u^�@���gu�@�<�|2
@��$���@��`qH�@����pe�@��\_7��@�KY�/V@�;���e@�P=�@��C� t@����@�|D>�PE@�3�k�p@�
�?�z@����z�@�/��%K�@�����H4@����L
@���9���@�� v���@���pE�G@��ۛ��@@�2 �:�@�J��N>@������@��f�aכ@�9m"�'@������@�!8�3�o@��]N�        ?@��E��?q{o�6�f?�!�ᆪ?�@��Օ?����y��?Æ�(�l?яgN��?޲?Q��?�,��7D�?���a/v�@��쓔�@���@�f>��@��Y�b;@&@�Kjt@/<�^[K@5mт/�@<ɺ�\F@B���ޔ{@H�LgR~@OJ~Ump@S�2�|��@XS���,@]���	@a�($��*@e�g���@i��h.�@m�U뻍�@qzQo�@t9c��@w=�fΚ@z�j�a6@~&mʏ�@�t>m�%@�$}�Sh`@�kR@���@���=)�&@�zm����@�Dnb�i�@����@��tD���@�ZN��"�@��JG�@������@��V�$��@��A��_�@�zŇ@�OI�1�@�ҫV�@�
�3�o@�P��F�@��X��@������@�u�C)S@��a�X2�@��6]�4�@�{>+'�@�̍�t�@��̝�t�@�����1@��8O�O@��Xh�@��k�5        @F9��(�@6 /��@T��vH�@h�!���@wC2C���@�G�Q�$@�NCT1r�@��x�|/@���_�8@��˭l@����@�&9_U�@��2̞�@��O����@�k��m{@�s`1~�@���:��@�-6��Tv@��f�R�@��5ؙ?-@�PZ�@�J�QM?Z@ɮ?� ��@�6�0�|5@��>�Vn@�����}@�]����@���>��@ա����@�g���:@�H���K@�D^M��r@�[�kq��@ߏ�6�^@��B*��^@�'���T@�n��B'@����{A@�07�Z��@���4�@�:ͧ�@��:�+e�@��#�ˠ@�_No�,@� ��@5@���r��@�"n���@�4�3V��@�S��+W@�}/SW�w@����Vz�@���I6@�E~�i�@��E_i�@���~�@�{mxr��@�����UA CB�5Aŏ�A��P\:�A��M�gA�i��AsK���[        ?s=��g?�?�7��?� �� ./?��L)���?�yj`PF�?��(me
?��4b!�@�+M"��@!+ϻ�,@����%@�$�s_�@�����@�����@!���#-�@$�����@'a���k[@*]�� u�@-�.�T@0c�r��@2,` �@3�M��W�@5�
���@7��[��@9�/�,�@;�)�g��@=��C2@?��K+�{@A[�.�@BF�Y��A@Cw�
�)@D�"��w@E��m��@GC�ǂY@H��8-!�@I�S=J�@Knejzo�@L������@NrM�L�]@P:	^M@P�qp�k@Q�^)��@R�<,�g@Sz �Q¾@Tj�a�@UcVf��@Vc�E�w�@Wl�AO@X|L[:	 @Y���y@Z�Ǡ�I@[���D��@]����M@^H��=�@_���զ@`k!����@a,��d�@a�ʂ��q@bw� ]@c/LM��@c�����@d���q)�@ev� Mn@fC҄X��        ?J}�� �?�M�{�	?���t	ͯ?��MJ���?�;xy��?�Y6���?���Fyf?��V���x?��gwd�@���;_�@
ٽJ���@���Ψ@q}#��@$pժ�@+֩cb�R@2����q@9+�ʺ��@@v>S\�@E+@����@J˳i�6�@P��emy8@T����m�@Y!�'�@^��L_@a�0��`H@e���_�@h�t_�<@l��:��@p|�D�,	@r�Ynĝ@u��I֦@x\b��٘@{x6�#%@~�0��@�>O:�l@�5�[��@�T�4�@���Dm�@��1��@��7�&��@�{����`@�=��=c�@���~�@���=�_	@�]�D%�@�L7�n@�X��
*@����#@���]�>�@��*�uD<@���k�@�@�@*W�@��t0�S9@�*�U���@��eP1X�@�a���@���­@����uH{@����i@�b��/�@�jA�+�a@�}m*d@��a�;�        ?UZG`�C.?������?�D?��lm{{�?�N[�XS?��I#|�L?�`+ؕ�S@�V�'�@{�K?Sv@���lw�@&
[(�D�@0�
h1�@8��} �@A�o�z~�@H�u�r�@P���O@U���|�@[��X��@a��%K�@eäh�@j��I߸@p�{T@s$f׿@v��nI@zu�jiT�@~����pZ@���N��@�K���@����#�@�6L��'�@��� /�@���\)@��:�'��@������+@��T���@���'
79@�O�D�e@�<�a	��@�1?qN#q@��&�l�@���>%Sy@����je2@��c]1��@���U�Z@�1��dw@���G�j�@��Դ@�y��j�>@��w���B@�d��@��	���@�����Cn@�AuKk:@�ֈpC0@�Ҷ�d�"@���/@���@59X@������@��6�VE@��8<�@�ke�
h@�*^�|��@�T��ŋ�        @���_c@T^��VY@stX=���@�	X����@�2�6<a@��f�en@�Ju0 �@�uX|���@�O��C�p@���*�n@�Cʣ�w�@�m��Z�@����{�@�p�#� �@�E�K͜�@�(�b�P@�H�}D�_@Ղ�[6�F@��W��t@�E�ga(�@�Θ�_��@�qy��@�@�K69�@��tK%@���Q��H@�__H�@��c��(@��T�΋@�e��J�@�"�`�-[@��-�)i<@���v�H@��N*��@��BS[L�@���K�*@�����m@��D#��M@�.�E -@�:�z��@�i�n�@����@��i�r�@�.,�ÇO@��6t2|@��}�bZ�A "��eg�A ����CA�?�xAXf\�/PAiV���A�s|yQ�A��w���A���;-Ai���j�AI!���#A-�boPA	�TۋA
ֈAA
�F-�A����3A�Ǚ�A�M�-�A�¸=        ?Z�v���e?�	��'��?����=?��n�+�?�D	H��?����?�y��?�޲%wy?�K����g?��X��;@ �9��@w��xh@D�E�\@n��?d@�J���@r����@q�f+@�6�9��@[��Pq@u�8�d@!	XWO,@"�:��/@%_X�8@'_ ,�p@)��=���@,�@"�K�@/oD��H@1K�����@3��at@4�pv2@6���_�@9�h5<V@;d��;v�@=�����@@KH�>-�@A��lP	@CB,�n@D�a�T�@F�{��z@Hp� �{@J`��T�@Lj����[@N���"@Pj�nah�@Q��x�L@R�^,��@T&_��G@U��Mŀ@V�7�w?G@Xe$��E�@Y���^��@[����P�@])o�+�@^��N�ޣ@`R<��o�@a=���@b05����@c+�����@d/j��@e;���t @fPG�8`0@gm��%��@h��a�Q�        ?]�\=?^�Y�<̝?��(��8�?�
պJ��?�'l��?��h��A?�M~�c]�?�%��b�?�	�VK��@ Z�&⩨@
��1F@L/�g�*@ B���yJ@(
��b��@1D�w�x@8)C{��@@�;��^@FqA��@M�;��Q@R���F,�@W�h/U;@]�L1U5~@bk:��e�@f�*�D�@k.B�{@p@6"1<@s@	N���@v��D�/�@zS��zS@~n����@�wL�j�-@��:�M@��R����@�oP*7�@��FgV�d@��۩���@��V�l(�@������@�{2יq@��@TL�@��$ٕ`@�=*ҡ@�}�6l@��WD'�@������"@�=(��@��!�q�@�53��w�@�ɭ�b��@�n�"p�6@�%6M�y[@��=ųl@����5�@�Yv�	�x@�Yt�}@�bQ�D�$@�u��A}3@��z>�7d@��'�,�@��g���@�.���&@�yx�ێ�@��><�݊        ?b�z��.)?� ����?�������?�<��/0 ?�ap���c?�2?Ʌ��?����?����b�<@u~sP(�@ڎB#�@t���k@0nU�X@&I�f���@/Fz?�q@5������@=�^��@CL�0.^@I&E�s	@PB -@TO�CO��@Y9{�w��@^�أء@b�<�uk@fN�7!�B@j\{��;@n؊"�{�@q�u�j��@t��;{��@w{�/n��@z��b�Y?@~"e��@�����@��+��Y�@��j}�@���m�)@�\d����@���C���@�t$��@�����S@�˖�/�@��?]��>@�5�r��@��rU���@��)�)��@��d�Lۀ@�x��:e@��T1�@�P�oH�@�m�s�g=@��}a�@��QL��@�����_@�i�J�@�΋� �h@�C����@��֬^�g@�a���@�����@��3��^(@�����=@��k�@��1
��@���e�,        @�(6�@9ƁѾ�3@XTa)��@l�SQ%�@z;��@���U�X�@�+쎟Y @���5��@��pѹ�B@���h@��C�
�E@�Sb4�V@��'�>�@��E�@�K�+$T#@�S�"��@����[�@��|	��@�����p@�� 
�@�)M��y�@ǁ62�@����0@̿�>���@ϱ��>u�@�q�@�@�-$*n&?@��.�J@��7���@�J^���?@۩��"$@�6��ehJ@�x�#H��@��cҿ]@�y�ߨE@���.�>@����Jg@��1@�ȗ�/�@�V`�k@��T�Ǟ�@��+kR@�u	���@���$(��@�9�zN��@��
��<�@���6�9�@�qd
�zK@��E����@���o��h@�;�ݩO@��Bt-�A bpYO1�AR�00��AL'	;�=AOq����A\��As�u��A�����A�����A�_V��A
5i��AAؔ�        ?O�X'�l?�g!L��?��V����?��J�R�]?�R�����?�ZG��G�?٣�XV,�?�8J;�b?�h��?��1�u�?�~V�v��?�r�4��?�ɗ�W�?����	Z}@U���u�@ ����@%UR�/X@gW�6�@��Wg0s@Wݿ�T@]�S9@�Bl��:@�\&s+�@f��)�@(�@��.j@!��w�?�@#1�N��@$�̏�@&Өk��Z@(�<�,�@*��J)��@-*�QN:�@/�?F���@15)>h�@2W� �d@3�xU-�;@56�n�P�@6�έ�9�@8e�z?�@:B��ٴ@;�2�d@=ή���@?�Լ�@@�U~~�@B��WJ@C%�+�7@DTvI��@E�"e��@F�+�Y�@H/�F�d@I��J���@K1@��H@L�dhL�"@N��	ڧ@O��1<��@P�u ���@Q��64��@R~�$ѵ_@Sn⡁ܚ@Tg0ߵ�@Ug�پ0E@VpxA�dU        ?ey.�i?��̔V.?��&�J?�����x?��i���?��n"q�?�1��ו@c�d��@<����@�@:(�@���$�t@#M���
@)�%^�@1Ii���|@6�̬r��@>�ܤ<@C����o@Ix*@8@O�(	�@T&��+n@Y$R3�T@_�m3@b�M֤+h@g���T@k��O0k�@p�4;�I�@s�/i�@v�%��Pm@z�N��@,w���I@��l�]�@����6��@������@��X�}�@�_�;ۻ�@�ǅ���@�6����@�{���(�@��/��N@�����j�@�g����@�7�*h��@�ա�@p�@��}Lk��@�b�fe��@�Ss�f��@�`ßo`@��aT�`3@���+Z4�@�L���e@�`�o@���W��z@�ƃRH@��QaW@�	�o�E@�����>�@�@����@��W6�s�@��L�"��@���QR�\@����{�0@�����@�§K4G        ?I���ҍv?���"1?�+�#��?�>��d?�?�Rj	�K?����?�
roF�?���t?��Bn��@\�>��@[l�/@@�H����@��kyw@!F�w�@&�Nѡl�@-��h�ު@2�fi鮚@8=��e@>(��}�@B�l��U�@F�F��a�@K�]p�S@P�sd���@S��X�@Wd볖$�@[s�]C��@_�����@b�N*�u@eP� ��I@hd�;��B@k��&R�5@ot��S��@q�ǜ�#�@s�aq}ۆ@vA��m@x�'M9�@{����!@~m>�BW@�����{@�pD�(d�@�6|�r�m@���*(z@�ʛ�}z@�;�<
�@�{���V@�ݲ:�Uv@��L:u}@�Ҍc9�@�m�49@���,4��@�v�à��@��ip�@�Ԩ��@���V;2@������@���QJ�@���m�\R@��2�{v@��2�a~@�H��A#�@��܆���@���PH�;@�?fţ�        ?��2�D|@4�o)��@TbS�@i��1�h�@y�;�d-@���Z���@����+�@�Qo�ؐ@��ZD@��(>�8�@�잖��@�p;���@�T� N@�Mބ���@�$3���A@�.��1@�o�y���@�����@�NU����@�F�I"��@�_��58�@ǚWά@���A<J�@�|nh��T@�&�-���@��g2UIL@�y��2��@�� �Q�@ղmA=�@�n嵑ϸ@�A�Q�@�*�Ҧ�
@�+��k0j@�Dȑ�Xq@�q`[�+@��cNM�}@���tH/@�UY@q�h@���@� ���1F@�l����@��;�9�@�qSU}@�;c���@�Q���@�7�#x�k@��UX��@�-�e��@��t��@��*M@����c@�!@��l@�>D�V�@�d����@�������@���Ϸ�@�cw�=@�fZ�)��@�����A D�;hA ˔c9(A����RAMCbȎw        ?b6����?�o��'#1?����`P?˻��V/?�i�:��?妒����?�Qc�"?��[�nT?�����Ei@L�!*"@.{,$��@�0��?@�J�L�@<�t�r@��=;�@�Ӆ�U�@ ��Th�@#�x��V@%��� d�@(kx#�@+m��-U�@.�
X^u@@1�/g�@2���B;@5��Fܞ@7J��}�@9� X3U�@<Vb����@?+��T�@A�S��@B�w]Y�0@D����K�@Fg� X]�@Hj�z?"@J�w\��q@L�At���@O@}\f��@P�3n�@RB!ð�@S�Z�k�@U2��l
@V�ɲ�Qz@Xt��h
k@Z7��Q4�@\�Ö�$@^W�=:%@`p�T�@a:.	�@b>X��@cnV!�c�@d�W��@e�PL1��@gX!�*�@h�5	�#�@jA�ZZBg@k�����U@mm�0�@oЎ[P�@poLS� �@qYl�bYu@rL���@sI�)�\�@tP��^��        ?[�K���3?���"�F?��:��^�?��/�+��?�I�q��)?�s�_��?�OJx�P?�5q#�n�@�覚��@b�/A�@U3�y^�@ NQSL�@&d%]��@.;�����@4e���@:AO�'q�@@�؝ �@Ez��@J�5�A�@P�6�l?@Tllo�&�@XĄ���@]��R�	@a��
�@d�>��L�@h��Wb'`@l��&�ѱ@p�^�w�@s@(��T@vm�4e@yA��9��@|����@@�FS���@�\L��.&@��Җ:[�@� }��@�ʩ墺�@���Q��@��EG�VJ@��"V�)�@�e+p_��@�S�>��N@�d�a�ʅ@���*9͋@���.��@�p[�Z�)@��$}�q�@��c�9.L@�n�
�@� S5"Q@��JW���@�g1ݛ�@�=_��a"@�+���L@�2�Q9@�)��"��@�F�(��@�p�^��@���^h=i@��$@�A�i���@��m����@���6{�        ?RFJִ��?�,��}�?�W���S�?��8��*?�}�:)�?��O��9?��GLN?��	�n�@D��E�\@
x�`f@�x��Z@��8j��@$�����?@-���xP@3鮓�r�@:�ڝ���@A�M���&@F�}�Dq�@M@��O	�@RmZf.�b@V�.l��@\4����@a,���@d�W���e@h�f�`�i@mr@�U�@q[����?@tT��r�i@w���ׯ�@{bF��J�@�P��@�O��Ը@���o�@�StN�
.@�Y4`�)@����ou�@��ek�Я@���0�x�@��-�5��@��:iQ�@�O^��t@��_�"�@����O�	@����=�@�Z�Y���@��~�u@��K���@���kͩ�@���t�h@�����Z@��&��@��ƣ2�@�w��c@�R���U@��n]5l�@�䐮���@�@Y�>�@���\��@��,�}�@��y]2�@�-�|A�`@��N�@<�@�ol��+&        @
�����?@A����L@a:��o�@u�$Q_@��Ҭ�Z@��'��s@�e����@�I��9@�!H���@���J{bN@���%U��@�*���@��;�O�@�\�s��@��N���r@�����@��s{�0@�Ҷ��~�@�Q"x�@ώN@@ѩ��ą�@ӱ�݂g@���If��@�@�����@�����@ݖ�)&2@�Kޤ�A�@��`}��@�p�U@�m	r-@�Qz�k�@�Ļ��i�@��[�u@�uǂ�@��|�J#@���]�O@�h�D�@��5�DD@��_���@�@�[WQ�@�<3��@�����O�@��>C�i@�咚u�mA<��̉A!�4�K:AK�z_}A�����A�=���vA�^}�WAs�6l�A	�Y����AY_6�ŒA�ji�Ay��yu3A{@f�A��0�Aϫ7R��A��ӧ�A�:K�%A��,��A��7N]uA���c        ?|:���?�7X����?��`�aX?�G��\�?�k3���?�qƮד@ވ�P�@�Z�z@4��AD@�ď���@�_0���@Y��0�@"�94�B@&>̟���@*)y =@.*оě@1E��L@3�SO&'�@6=��ר�@9j���@<�Gx�@?>��br@AZ���@C3�KT��@E,���r@GF�"�1�@I�F��@K�R4�,�@Nh�ι��@P���;��@Q�����@Sl���� @T�0� �@V����@@XNAez��@Z���*@[��v�o@]�i�4@_��@�@`�6�gmE@b�4hqz@c97a��@dgZX'T�@e��o���@f�~��@h<t�P�@i�ߥ��Z@k|	��@l�m_��U@nP�j��@o�%t�&@p��{:l@q�>J�h@rnuڐ��@sZ���@tL�B^@uF�����@vG)ѽNv@wM�v��@xZ���r@ym����F@z�Z�Tpv@{��;�z�        ?B�ӕ�4�?}2�f�?�$\�<�?��3�.W ?�����?є'��?ް�,�Z?�[�vϖ?��P�q@t����@��թ�~@!n���@��흿�@&��]�@00���.�@6W{,	x}@>!�p|vd@C庞��m@I��24?@PhO���X@T�f�m�@YbXV_��@^�J�v@b�P�@f8M�}�@j?�j��@n��5^P�@q�*��=@t����W@w��8t"�@{��j�M@~����t-@�Pc��M�@�w���@@�����\@�Q�j��@�����@��=ò1�@��R88�@�5�j��V@����@������2@��/K���@�?@)�'@�kw�\�@��;~Qט@��w|K�J@���:��@��įWU@�,���@���a
�@�s�c�@�DiA��@�08�F��@�7����@�.����@�P����@��iI�w@��D�i��@�Ti��@���S,j@��N(�8@��c�`�        ?Rc�%�ݥ?���;�T�?�áH��?�&����?�x �"t�?ݶ���9?�( F��?��{~��@ l�9�܋@	��_$��@�B��@�<VS@%�Ke#�@-�� @4z���5@;��f�E@B���O@GT >&�@M��'�4@R`En@V��}���@[I�91�+@`SD?�g@cT��wb�@f�7*�@jb/�>ۨ@nx��ir�@q{	���@s�5�TWB@v��k�i@y�_X��\@|����!@���d��@�����G@���`&x_@�t�p `@�i�rT`@���i�@���+k@�8���@���h��@�c/��6@�!�)'�@����@�����@���s҇@�K���3�@��EvI�x@�H��j@�i5��Y$@�Џ #�m@�LT��@��O�T��@��I�h@�B.y�@�N��c@�کo�9@��@��@�Κ���@�3Q@�]�e{e@��md֭@���fC�        @+��%t`@N;6����@l^����8@���t�RH@�<Ob��@��m���@�NN�Ȓ@�<���,:@��_)g�@�4u��{�@�V����@�$rt#�@�,�k�@ƟI2`�@�a�W�@�s��W@�l����@��)��@@�P�H�-�@�z�e6�@��7�^�@���L(h@��\��@�۟1 �
@���W�@�N�~;�@�2��@���qH�@�$3���w@"�Vy@���<W(@�Y_�-�@󹺭��&@�)�� j@��'A�C|@�8\��ۜ@�ׄ���O@�����~J@�F��|�@��V�A |n��_Au��>�Aw����EA���#��A��.�"�A��[�A�S����A�����A	Z��ϓ�A
���eJ�A n��֔Aeb���Aֲ�c�DA*<~�Q�A�`*��#A����v�A�C.O�Ac�����AAE`�RA$�lqwA~�~0A����<A�?�1        ?\݂7p�?�hb�6B?�#��]@�?�h'�e�.?н5#��?ۓ57=�?�)猻?�gsw.V?��.��?�B(��N�?�Bw�� @}f�8�@:�[��@
]��w��@�;_��@�A��@�����C@��Ʊ�@�T���@CkE ��@ ��`V��@"�{9�N�@%y~�s*@'H[�X�a@)���G
@,'��ACy@.˽!2�@0�Z�ޘ@2>6�=�@3�INw��@5[tY"?%@7�����@8����H�@:����z@<c���]@>R-4�� @@)�i��@A4<�!�
@BIf���s@Ci�1G�@D����@E�J�3�@Gͬ��	@Hk7���@I͇DR>%@K=��Ǭi@L���|��@NGse�@O�5G�]@P��:0^2@Q��	?[@Rz�Ҥ�@S_�ο�*@TJtٽʖ@U;7�f��@V1���8y@W.�@�#@X1��7��@Y;E�4��@ZKO��@[a^���8@\~Z��w�@]��:�        ?=�`YE�$?{:';?��9�D�?������b?��\��	�?�p�JS`�?���Ԉ�?��VI���?����	�T@����+
@�.���@d���1�@!Z]���@)Sت��@1�~SZ�3@8x
l�K@@��O�N@E�_Kv��@L��O@RIm�0:@W�G�@\�0樍@a�h�1�^@ey=�i�=@i�5r���@n�df�P�@r)C�y@uB�!z@x�(��X@|z�T�q@�O3�B@����͊�@���L4Y@����u@�o�<�f@�q/K�T@�Q���=@��$3�@��ԅ���@��Qm�[@�����@�����@��{�8�@�K%G.8�@�ZlJ�Ws@��QD��@���K��@�NV>
�O@����$�@�:��Q��@�ȀW5�@�e�s~q�@��qAڧ@��Wl���@��Q8�v@���c�cr@����!@������@�ɍ�$A:@���g0��@���h@�&ȉ+jm@�Y�M�4�        ?2AA�T�?c����~f?��^MS�V?�/�<���?��M,��#?���ɸ��?�'D7��?�M4��k�?�w���?�CyC�@��P!Q@
�'��@��W�@��!@$�*m�@,}�ۭ��@3KӺ�+@9�ۈ@��@@�G,v@Ei�ۺ�@KX�+Q@PܾE`�@T���@YEɋ�ӷ@^s��y�@b,�Tq5M@e�u<��@iABg�@"@mqH��cy@q�Q�@s�5E��@vw�I�x@y���|�"@|�mq
O1@�ZJ���@�_��,�@���@M�@��R��@�vQ�]u�@�1Pb��+@����?E@�^��
)@�ǹ#�nY@��SZy�@�it��%b@�bEY��@�u�����@���?��@��x��i@���ڠ@��ݴ��B@�0�E3��@���fP��@����N@�]z_�G@�٧��p@�bf���@��=a��{@��2�w��@�E_�rc@�x����@�b�e��@�L1i��        @<x�W�@3��Y!�@S)�Gb�@g��C	K@v�F�Ѿ@��JuˌA@����È�@�2���@�N�R*��@��qp@���w$7@�$� c(@����O�@�ܡ$��+@����@�m`΁�@��;�s b@��X,\�@�!���f�@��X�ي
@��L��W�@��pi�Y_@�+u�;@�u�Fw�@��bu::�@�d��4�@��K[I8@�fT�F�@���s@�V;���@���Y@؂'�b�@�.�c�w�@��V�{C@ݶ:���#@ߑ�) )@�0��l@�K�K��@���N�Hj@�ٻ�.E@��r~)�\@� �8�n�@�UH��@���|H�@��.Q�@�;��_!@젲���@�륻@��rO@���[�@�Wd���:@�(3h�@�����Th@��8�P@���3D!@��0����@���D��@����@����Ѓ�@��r���p@����&V@���,��@����Z[        ?�>AWF}{?�	��T@���@�س���@$ Y��`@/����@73$��/
@?��V��@D�R}�ҧ@J=�^0��@P's�|�m@Sw��� @W�2F��@Z��3�p@^�,y譿@a��DǊ@c����C@fTgy���@hԠX���@koèN�@n%����@pz	s��@q�*F\��@sn�Çi@t��(@v����@x<N���@y�8� @{����@}|��P�2@W<��@�����@��:����@��0d�(@��(�_�@������o@�İ�AH@��K`b7@���|=�@���g�O@�7S>���@�]q��x�@���j��@��Ex�@���Z|@��o�4@��D�(�@�G���aY@��9K̘@��YH F�@�1wM�@��=���@������@�1PWDC�@���ҝd:@�� ���@�Gi �;
@��g�G�@��=]�Q�@�u�Z�@�4�*얍@���|M�@���;L�?        ?���?�+?� �^�3?��bμ��?��mc/J#@ ?c�Q�@
XG�)!�@n{�wP@[d�+?�@%ѨGh�@-��4� 7@4�Ё��@=	����U@C�,�.g^@J��J�@Q�H�	�%@WvAu���@^_e�@ce�^A�8@hvy8R�-@n|�ފ"@r����@v��W%��@{�Ѵz��@��H;��@��w�@�5�v�)�@�"����@�~c(T��@�$�o,�u@���L@��Zxv@�����m�@���$ej@��j}� 
@�s%�K�@�Q<p�+@�?8�{��@�:C�ӭ{@�?��7�@�M>��u�@�`�5�u�@�<���@�KR>\�@�[��t��@�n�1o{)@��%�Σ8@���=s�@��Un��Z@��u�Y�@�F�I�c@�J �Y�@����o�G@�։Գ��@�.6���@������p@���o�@�A����j@���uY�@��b�.@í�w��@Ċ��:@�p ����@�]���        ?���$HB@P{No��@" 9wy�@4������@B�v�d6�@Mo�i\@T�C�@[iK[�M�@apvFo@e{kX�ȧ@i��&3�f@nw)����@q���@tW�/S�t@w%�>��@z!��6��@}O����@�X*�'G@�$�q�2@�DA�F�@��h+@�@�G`K4�l@��G�iS�@��Rs��@��R���@�J ��r�@����w��@�n�#��@�*�#��@�p�R�6@��;5�g�@����;@�HO��@�N�:��l@���?F@��T!�ؒ@�2����I@��2����@�$tRۍ@��-{Ṯ@�d/��T^@�#g��uy@���JPa�@����@���3��@�e4؋@�"񢙜�@�O����@����;|@��;�)��@�3_X0@����~,@�$#���@��Eh��@�e=�u�t@�9��@��Q
Iö@��Ww���@���ʈ�3@���$6@�+2����@�W�U�O@ǐ�9��        @ẗ́���@���$�@��t��@��I<i�@��e�1�@�s����@���^*>@��@�w��A����|A��\8keAM/̱;�A����AFL�G�A�|�(�A9Jٗ5)A�Y��ioA!���5�A$��J��A&(pQ%{A(_'i��A*�cOt܅A-Ǖ�A/t��~�A0�;@-�%A2B��@��A3��9!�A4��d9��A6N_d�A7���^ٽA9)d���A:�Fl���A<&��X@�A=�T�7�A?KFwoA@u"���AAHF�
�AB&�\�AB�Nx8AC��'7��AD��N���AE�P�wS�AFw�C�.PAG_Ǽ��AHIg�HsAI5�� ]�AJ%�"씞AKE���ALĈcQ�AM>��ڱAN���AMAO UA��?AP ��2�AP�I�@�xAQ
J���AQ�- *��AR���zAR�nU�!�AS#�n�u�AS�+}��AT9��}akAT�(��!AUU����AU����        ?_`e!o?�-a5>�?��p|��G?ͰJ
�o�?۹����\?�[��|��?�p�B?��?��2|J`�?��.fԑ�@;*�UK@���@�{k@L�67�s@nc_�N@�K�0cA@��ċ;�@���(@"	�O�K@$l@��dY@&�� ��$@)�^u�b�@,��)�@/��J@1�����@3t�C�%@5_��n)@7h9�d��@9�'QQ}@;Փ6���@><��H@@@cD7���@A�3��>@C$
��E�@D�xT8SZ@F3��~d@G�+B�9@I�6�Cc�@Kd�G�@MJ���T@OGD&,��@P��(a�@Q��H��@R�RXE@T�����@UG�v��@V��g�h:@W݃_�@Y<+&���@Z�M�t��@\"O��9@]���?�}@_A��ܘ�@`s�P%`�@aN���V@b1U8f @cp{șQ@d46J�8@e���K�@f0-_2�@g#$i��@h=.��G�@ia���@j��6�         ?2	����?o�n��?���U��?�+��T�?�T� w	?̋����|?�[�5�w?�薸	�?�e3���	@�>�p��@F�X @����2@!
��k@(�:�[�n@1�Щ��@8��&�-@@�o�ܽ@F'����'@L��\��a@R���_@W������@]r��8@b0�n���@f:�w��@j����Z�@p�tA�@s#K���@v��٠��@z`���Z@~�$�f�@���9��@�D���@�m�<K@�5܈ ��@���.@���oЧ@���'�{�@��f���@���57@�]��'��@��@�@���.mU�@��p��"@�W>�:�@���]�i@���)�@������K@�nPD��D@�s�>@���K�#�@�ζ��Zp@�煞�C@�O�B��@��U�t��@�����_*@�e/ùp@���5�u�@�w�{�6K@�`d�@���(�@��NG֥@�I����2@�I��g]�        ?$Y�3�?]\�d�?�6��T�?���	v:�?��K��=�?ª�m8M?���ȫn?�;x&s�G?�e�U��?���p8�.@�E����@�׮���@I���	@"����g@*�)	�@22ZF8�@8N�`*^@?��8.�[@Dt���\v@I��0�@P"�P���@S���hB@X'���t@]I1{�@aQ�y��@ds���K@g���@k�Ǹ��@p���-@rq�gl�@u	-�aR@wܓ�D�m@z��)o�@~BNV�X�@��,í9@���ʞ��@��.��`�@�.��`L�@���<@�#���@�߹�"��@��� ��@�q��c�@�r��$�@��3�}h[@���%��@��"��#o@���!'@��	����@��Q'a@�C5���@��n��6@�����@�5�d�@��4�O�9@�';d�@��҆�g�@�]�]�?@�Q-�:�@��cn��K@�[&��Z�@�RE͈�n@�SO�LZ        ?��f��l�@72vN>@W;��8E@l0t�qww@zb唏�'@�B�H8yV@�5��J(�@���Ef��@�[�����@��
M�@�v�>�M�@�\�SN�@�e�M��@�e����@��?�#K@�JX�H{�@�7A\�1�@�=
ޫ��@Ë���@�����@ȴy#��Y@˓nm��@Φ)��@��\=�@Ҷ;d*�@ԑ#��@ֈJ�w�@؜J:��@���D6�@�(m@�@ߎ;���U@���Vʙ@�im;Z��@�԰9��@�Q�Ξ3@�ౢSs@聭G\x@�4� s[@��	�S@�ђO�|�@��:�@���Wrk�@��Ta,:@���i��@�ƴ�&�@�4�E�A@�c�wYΒ@����@��G�1oK@�0}�7�@�����@��Sz�Mx@�c�<R#�@��t�!A �%�C��A��gC�AW^���A25���A�*/H%A���Gs�A�i���A�QZZ�A�[���}        ?[�eI��Q?�Ez'�B�?���^I�?��=�+s?�\�'�?���B���?�nz���?�wCO�?�X"��I�?�zh�<?�3k2e�?�h8���@ �	��b@KN�@��CYq@?��-p�@�t/sz@_KS�!�@}N���g@�,v"�@�MF�@!�|+�Q@#P�0ڃ@%��	��@(�9���@+u>1W@.��3��F@0��#�@2�c���@4��ִ3�@6���$�e@8�v����@;7�	�(@=�G�	�@@��Y�U@Ar����@B�pJ;�G@DZuFE�@E�;~�@G�y���t@IE	�$@K5�Ӯ@L��.�@N�%���b@P�l:���@Q��h��@R�����@S�"
@�@U)V�)q�@Vs�q�E@W�T|���@Y0K�Vq�@Z������@\"�:n>�@]��|@_J� ʤ@`yf�t��@aS��@b4�v��@cЏi��@d���I�@d�"�:�@e� *Z        ?S����/?��ȳ�-�?�՟�?�&l�H�?֋����|?��Kg�1E?�L�I/��?��1�W*O?�Ĭ�-��@����Ɇ@;�'.��@�Y"�NX@�|(�@#����BP@*�d5�|@2���@8	;ԄX@?��F�v@Dy;� X@J<���d@P�MmTz�@T�n���@Y�����'@_�M�\B�@c ՍIO�@f��޽@ki�?d�k@p5��w�@sg+�L�@v/�ia�@y��!5f'@}�n#`@��%@pP�@�PfT/@��55ﯢ@���I�@���O�@�����d@�[k���@�K2���@�`�Q��n@����p�@� �u�l!@��_�TQ-@�F�����@��}r��@��`I#v�@�>�Ϊ�@���l�Y�@���3�eV@��X�<�q@����e/@���d p@�
M,@�3(&O8@�lt`��@��Dv��@�
���r@�p�����@���i��@�j����6@� �g��@����p�        ?=�!	��?l.�
|��?�C��u?�U�4���?�.�2�o??��籷�?ض�n��d?�
�t[��?��ݺ��?��ϗ���@1�ڀ7�@|���V%@jW���!@#�8@
W�@+�E9�s]@2�s���@9Z�T@@����@E?�+_{@J��O��@P�K��0l@T6���d@XY��M�@\�vC�@a�0��@c���9�@g�j71b@j���,my@nq��9߳@qR1_�*@s�w�C�@v!�b�}�@x�a �5*@{�wP�q@$S��]@�Z`�B��@�Kx��r@�h�A�&�@���M�	�@�5�U�;�@��o�@�����^�@��載�<@�?�<��d@�����j@��Ah�@�E����@���tA@�;��By@�]ɪ�_@��Y�{�@�O3�W@@�� �I@��k�9�@�~�U[&@�qV H��@��%�+`@����Vs@���ʎ*�@���;��@�
EB�d�@�h�BZ�@�����?}        @�R���@5���˷`@U}�UH�]@j�\ܒ�F@y��t(�@��D����@�4�D6�>@���1ӡ�@�ЮE6�@�qӃ���@���\�+@�2��@�ȥf�'�@�ڵ,�c@�=���l@��@h']@��o�>�@���A��@�ME�?E�@�KG�@�d����@�D�À/@�f)D��@�O\��7�@�_���
q@֙�@�K�@���ۀ�@ۓ\��0@�W0L��@ি&z��@�<>��l@������@�S`�X�@示���3@�/�0@�Ԑʡu@�� |P�@�Aߜ62@��da�+@��U�@�F$�W�@��f�0{@�Q�%�e@��¥���@�����p@�}0��`@�`��{��A -;Q3��A4�N�AxAGOi(;Ad����A������A���`�A��7���AB��	�A	���~(CA
�`��AR���SA��_0��A5�l���AZd�}Al���%A�ř&s�        ?s�)�u��?����/�?őuU�xX?س<�C�?�T�e.?��:��?�c��8<d@@���@qj�Etm@>��|'b@QV�u��@�%0�	@�l���@�g<7-@ m�9�G�@"�/�A@%hf��n@'��sSm@*<χ��@,�L�*��@/���^�@1r�
G@3�cH��@4�A�Hr�@6a!�j�c@8+
���@:��J�@;��F���@>lIB��@@��z|@A'�Gt�@BL],s��@C|T1ݭ�@D�*��>�@F ,��@GT��^̌@H��#͌^@J$<���@K�����@M)��Rh@N��� D�@P4z�kʷ@Q  A�@Q�4]`�@R� �Mi�@S�N^��@T�,bA[@U�1�Z-�@V��؜�@X�(žW@Y@�n�EK@Zw��ڬ`@[�V,���@]@b��@^h	��Z�@_���|@`����� @agS��6�@b0�E_A�@c���s@c�d���@d��in@u@e��•        ?4h�(���?q;��cz�?�O%Z g�?����^~?�=X���0?�9�p�%T?�%�)߷�?�2B��?����&@�D�Uw@k�\�@ 8�  @(Q�l�V@1���Ǖ�@9\���(@A����
@G��W'�@O�%�2ZD@T�x��y�@Z�h�@`�)F3	�@d����z�@i��LD@o�̦ݦ@s�'u�s@v�z���@{$�pg�@�Gꘆ@��wXض�@��3�i�_@�2����@��j��e@���b�@��C���@�I��_Q�@��Зh��@��*P�� @��gͳ;@���w�� @�v5ڳQ=@�^�s��?@�ezb�K�@��83��@��2{d@�4���X\@��4�q{�@�.�T"r�@���p��{@�e�eY�@�����[�@�b�.�@���g�ԃ@�t*��y�@�9Ju�D�@���4�@��_vo�@��ϪP�@��Y���@�!+k�4@�$
��j@�5a��@�YۃˑD@ǆ�D.?Y        ?@Ե��?s��\�~?�����?��T�q�x?�J`�B��?��:��SA?�-Zz�6�?�����?�� M�d@iL("�@����H@_���e�@pEը@$^ʴo@+��'@1���@7ֺ'8�@=J}�u�@BQ�� �@F�:@�@K�+��T@P�F�e�2@S�Y��@W����@[���#�@`7a���)@b�X΁u@e���_;�@hٍ1��D@lS���@p)����@r$s��@tf@	m�@v�P��[@y}sF�m�@|W���I@i�����@�Z���+�@�-J��@� �o�N�@����=@�%�}��@�i���@���Z&�S@�,�U�z@�����[@��{�Q�@�f{���@��PN�k@��Q�؈@�I�P�>	@�G	HY@���U���@��3�<�@�s7�cY�@�� �\��@�����;�@��MO�<@��(6r��@�&\����@�lMIa@��gs)�m@��:v2        @
4��J�`@@r7��@]��M���@q%����@4Ԓ��V@����q�@�����@��e��3�@���AI@�[¬F�I@�'�P��@�u�e�L@�#��3O�@�N5�̃@���)��	@�i�lleH@�-��S�B@�H��F@ćU;��@��H�p"�@�sW=�O�@�$9f�H@����S�l@���T��@ҝ�m���@�P���Q�@�F�c3@��wb<�@�H��U@�(���$)@�g���@�c��H@�])=�O@��1��d;@�R�Q��@�ĸ��@�G��n��@�� 9��O@���K��@�8�8,�@�j ſ�@���d���@��A��@����Z@�����@� �2I@���݃@�C�ft��@�t~���@����d�@��.��G@�E�ys9@��O9��6@�����E@�s��1�A vDU��'A85�� �A�X)Z,hA˨2��A�!ȹGkAs�)���AO�zl@A0�1Kl�        ?���~�)�?�������?�.�ϡ��@
e�H@�-e7/�@!��ŦO�@)�]�jd@0��J@5���)�@;�<w!@@�
�Z�@Da���|@H"=�
�@L/$���@PC����3@R� ��@U-v::@W����̤@ZbNr��@]B� @`"��E
@a����@@cXg[P�f@e�ӝ�C@f�(�X@h���-U@j��]�V�@l��u׽z@n��|��@pZn��2�@qq��Ò@r�ݓ	;@s�����7@t�Ȁ}:X@v%��O�@wg�Zǚ	@x�����w@z$�ၽ@{a�ď�3@|�#�u��@~0R�̨{@��ضw�@��]1ԝ@�N���|;@�� xdo@�٦s5�W@����^�
@�qL\�Ӎ@�A�/�s@��m�@��D��5r@��]�bԴ@��<_�@�~ɳ$٬@�_�0��@�C��M��@�)2 �Z@����U�@��lؑ
@��c��i�@���8r�e@�eMa���@�߀a�*        ?��;qe�a?��]	Ϡ�?�蕕U?��$W���@V��+!@�Z�֝@v�e�?@%���)�h@,���o�@2C����v@6�	�~W@<�㙫�@@�Z��@DC6z�@G��z���@L0`'���@Pr �&?j@Sl�B�	@Vk�V�@YIKL*A�@\��'@`z�����@b��9�1#@e+y��=@g�JZHX3@j�oo_I�@nL/Ս�@p�(sB�`@r�{N��J@t�]Sj��@w���@y��`d,�@|9�R��'@�S)��@���m+_@����
��@�s���8�@�QHo�m�@�Mh�%�@�i=�9��@��Ѣ���@�%a%Z�@�Cl@����@�y�c�$R@�����F@�{|7��@�����@��;���,@��le�"�@�oڒ�Y@�b
��f@��?b���@���R���@��	79#>@�sA{�@�9����@�y����@��a{�H�@�w�u�@��@V��J@��J��@�n�b���        ?�o�hV�}?�I:4+n�?�a��2Z?Ը5�{]?���{�}_?���J�?�������@�4��@
Z(���@�-�:�@6&��B�@#�4�<�@*k.��5�@1�[��F�@7�ů��U@?`�K�@D:����@I��@��x@Pk�G 0@S�׋7k�@XA�uD�@]T&�:*�@a�Ȅ���@d�)�@h�M�V�@l����@p�S��X�@ssRR��E@vd��(@y����<�@};��Z@��;f�H�@����>ru@��y��@��2H2X�@�c�]�1@�a�Ot@�N�&��,@�o�m}�@��	���<@����� �@�#��)@�{go!:(@��G��'�@���%�z@�J�*�!|@�֏�5�@�}�z��:@�A��L@�"u�pߩ@�#hP@�DAz}�"@��[4�@�v߰NV�@��g���_@��T�@��7�P,U@��tR.@��g��@�B�:�.@�����@��*���@�ɇ��        @T�a9F@���h~"�@��}�4@��� �?@�e.�`u�@�\��YH2@�4�lZξ@�,`�j8&@��7(��@�y'Q>�@��(�)3@��Lǣ!@��M����@�y�A0��@���ph�0@�_�{w@����ӢA ��MWoA�$��q�A�b�v4A5g#��A	�<Ѥ}�A�ٖ�A���w"A��8��A+^̊�A�_ e�A6���`!A҅L+��A|̅�[�A4�۪>A�̂��A�=���A�~Q���A �~]u�A!�O!�A"���U��A#�]a�4*A$̒1Y�:A%�2?)8A&���qAA'��TKl�A)���SA*3�5��3A+S{e��A,vl(�PeA-�ov*�fA.�\��A/�b_��A0����CA1(Zv҈A1��6�%�A2\L�s:A2����WA3�����LA42DbB��A4�Ў�ŌA5pJj@*�A6��g�A6�N�X�A7Tw*�]nA7��u��A8�]
���        ?�?�4��?��%q�
?�����\?�.���d@M�.��@37��G�@
jL���@eE��Y,@"ͨ)*@'P��Ӫ@,7����6@0��N�-+@3�qQw��@6��֋r@9���[ô@=���<�@@L���O@B"2����@D�%u|P@F	���� @H��%�@JB� ��@L|/���@N�tۯ��@P����;.@Q�Qc�d�@Sӄ��`@Tjv���r@UǮ�&
@W1��@X�� ��v@Z*
b	?�@[���l�x@]X��E�@_J��M�@``��S�@aD�*L� @b1r�Z�@c%�|fE@d!��9�@e%Q"�a�@f2��+@gGy��e@he��B@i��P��j@j�4�U�@k���~�@m@dd'XB@n�滨W@o���O�@p��g��@qcr�ql�@r#0��g�@r�N�lz�@s�q%�@t�����@ud'��} @vF�G@w/��T`�@x!��q�@y�:I@z�P�\�@{'0��P�        ?pq3�?��r9�t?ȜM�6?�w@�s��?���;O�V?�	��|\@!��<�@<�Ⱦ�@�B�W�@"�Dq*9�@*���-}@1�ϐ��M@85���@@/f]˾@E`�Y+0�@K�aU+U @Q�>�AE?@V�'4�e�@\��D��@a�����@e�+�D��@jg����r@o�υ�@r�./��@v~��@y���@}���_V@�8a4@�}��݃�@�� UTw@��OI�m�@��:d�@��g�@�@���^@���^�@���Xq��@��o�:��@��Zm��@�[S���@����>R@��� @�`L���@���w	ǘ@�%�Ym)@��J�Ek@�0��c>@������r@������@�P�V�@�.�>	�1@�����@����@�)���@�H^#��@�t9ԥ�@����H=@��,�K�@�M��~��@��Y�}��@�-��@��b�G�i@�U�ƀz@�E�A�A        ?��s��?��:&?��T�d�6?���%^?�Wyi�w�@�%t��@F"���@)�5JHH@�ȇ~��@%s�ev@,��b2Fo@3�e��9@:�����^@A��Z�@H}@O�'_�@T�b}H#�@Z�4(ө�@a!���<@e~`�#�>@j�l4@O�@p6�J�@s�:կ��@w3ow ��@{B��G�3@����M@�;��<OR@���[?�@��!�4n�@�e�E:�:@�n���JZ@�N��;�@��8�{��@��9.�k@���{Y�A@�h)�a e@�]O���@�e�3N��@�����@��׎cE�@��� �<@�*U8�G@�d{Ȭ{@��(�6�l@�%=��$@�g�8an@��ҝM3.@�e���@��`@��i�8��@�t�
M�9@��� ���@��|�S�@��4��ӱ@��EH�=�@��M�<�@��]S�@�7x�aA�@�}�n�J�@���x�@�5�p�-p@��:���$@�)�r� a        @B~$fگ@u�8��|@�����i�@�%B��\@����7 @�գ�]��@�o��;�#@�M��=�@�z�6�BG@կ*g#��@�@�Й��@�,`(��@�7����@�kvش�@����GY@�@c �F@�ZZ�l��@����Vb@��j�l@�{�x@�a�є`@�WľI�@�\|�f�@�p K�8@�����>�A c?#�7A��i�?A�ӕ~�XA���OAu#oR`AeO/C;A��gMA	:S�A
}x��]RA�V���{Avnߜh�A`�D��ASi�p�tA*��k�A	����A�q:ֶlA�K��Aڱ[DMA�3W�i�A��qA 	r���A!B�,AM�*Bb A���\��A��&�AآW�Ay|�3�A r��
�A!0O� �sA!�Lq�:/A"�/���A#�RJX�A$uɖ@cA%[ �|%A&Kʝ���A'E��|EA(IO*o�WA)W�Tb�h        ?{�#NO
?�O�3�2?��D�!�?��=��.@ X:_>�V@M��`@D�>:7�@m(����@#'�3�_@(��푙@.�Vs�p�@3����@6����(�@;a�SA@@M�>z@B���6Q@EtC΄ik@HeB�|?]@K}X��t@N�-�ۓ�@Q	�CPc�@R���
@T�y$/@@Vk���U@XR$�s��@ZE��r�@\F�,�@^S�����@`7tTv�(@aK�kJ��@bgxh{@c�R�k�@d���ٝN@e�����@g!��}m\@hd��s�@i����{-@k���@leTY�C�@m���A{e@oB���0s@pa�2|�@q&D�{�@q�#g�.�@r���	@s� � ��@tto�@uU�S�O@v=�0��m@w+���{@x*$E��@y�y
[@z��v@{׹��@|'=��^�@}7�cy�@~L-�;@f�_�]�@�Cj�{@��Z���@�j�n��@�<oS&�@���4i��        ?���)ہ?̙`EtG�?� $LÝ@�p�7�@�ms�d�@ c%n�@(�1����@1�6;�q@7��b,�@>�]��/U@C��tFm@H�!�7�@N��}�	@R�wWF@V�V_U�
@[)�6�D�@`=���WT@cVw��Z�@f�N� }@kC��%{@o���@r�/>�E@u�sw��@yV��Z@}F��;t�@��)��m@�C��I�P@�����@���gh��@�M���@���A[G�@��DJ�@���ި"@� �}+1
@�fg�Ȝ@��UŃ��@��n�K�4@�U��R�&@��ě���@��6kkl@�[�2���@�?�Fޝ�@�A3++x�@�`�$G@���v�^�@���,�ܸ@�@���J@�����6�@��ok��X@�n����@��s~G@��O�T��@�K���iu@��4+�@��=��$@��4qM�h@���>N@���?|t@�-���@�Yz��H�@ŒG�8i@��^R-Dq@�,Р        ?r��x�?�����?��gX��?�9��� D?�fx=t}?����HH@��8�B@��!=@�MN@!�qq]�@'�H��d@0�'~i<@6y��-0�@>z�^Z@C�
���@I�b�vf�@Ps�O�@T��h%@Y�χ&k�@_m���џ@c ًM@R@f����&�@j�e7'@o���f6@rO8�,��@u���ٻ@x!� @{g�"�I@~���Z��@�UY��@�RM0��@�luA��?@���7@��r�۔�@�c�nʫ@����hOi@�����@�+Z5��[@�����;X@��ㆰ=@��t�g<@�L23��/@��n,��z@��֢ԉ7@��ź�@���z3P@����X%�@�ˊǯ|@���|��@�����c�@�(�s	eO@�]z��@��SpMi@��9#���@�>+M��@�����N@�ga�;@����{*�@���+�@�Ǖ0�b@���`�,D@�c�IO�@�8PuO@        @5;h�xc�@sH��n@�/�3�{@�*�U��@���
��@Ë��5>m@�⿽@���*l �@�i%2�E�@�ܞ�itK@��߳��@醻9��1@�2H��@���Y{�^@��ZN��@��r���@�Q ��p�@����g�A)%	)jA ��|)A�+AW�A՘(�WrA�O��"�A
�N�G+�A�~T
I�A�(��A�Ԭ�A�t-��A��"\�A�.=�A�MePA���i�A�R��Aŕ`cvAB^��pAk�c�9:A��8��A�s�a"A���AGI�;܌A G8�Ð�A �όg�A!����A"H��[�!A"�4��I�A#����G�A$o��t�A%/���1�A%��9TA&����q�A'������A(Z�usL�A)/��6�A*��x��A*�q/�oA+���x�A,��ڕ'�A-�ef-�zA.zD�e}A/f�:
/�A0+>�\A0����A1��[e�        ?^9}x-��?��(?�>M�)3m?ǝ"d��?կ'(��?�V�[��X?�k� 役?��תu?�YDw��^?��E�O�@�鮆18@p[^�z�@����@<�IBv�@�nLf�@]�$�H@��wF��@ �%c�4@#K�af~@&/����@)X��^n@,��q��@0?�}N@2=[���@4\��pu@6�7���@8���'�@;v�(��@>�vwq�@@c��Q@A͋2�׿@CF��a�@D��T��@Fj)�$�@H�L�L5@IӣB�v0@K�w�M@M�2��5V@Oxt�Ǿ�@P�g��2�@Q���P�@R��c8�@S����a@U���F~@VF�BKb�@Wz�ჭ�@X�h��e�@Y�����@[J�O*�@\��T\x�@^	6�U@_l�4��@`o�_��@a.N�D�@a��&�r@b�m�O�@c���K�@dWY���@e-���:@f	:��@f��C@gХ��.�@h�?=�5        ?R�����'?��2�q�?����([F?�:�0�"?зB�8�?�_�ؒ"�?���̌�?�J��JbG@��WG@
��Ӊ�M@K��.�@,���	@%��S��2@/p��e@5���K`K@=N�����@C��RRx�@I��R�J@P������@U%�a���@Z�];P�3@`�4�RS�@dHɼ3�w@h��9�^@m�@��@q�Z~<�&@t�� �UE@x�l���@|�{[�
@�����,@�: V@���1��@���Ⰵ�@��;�+{�@�Q<��(�@�x5��%6@�c��!�f@�j��A?@��G��H�@��S�{O@��ҠX�@�{"`��@�{ښ�"�@��Z9Fdg@��L�2@�r+���r@����>�@�D.�{q@��^�8�@�9o�6Y@���Fc�@�S]�@U@��/�gɪ@�J���@�#����@�1��5@�� ���o@��;���@��G��@���p��@���h�l*@���`x�`@��Ϟ�~�        ?9Ƴ����?q�*׬��?�Kd��`R?�`�ϒ߭?�\�`K��?ɬ=�#?זц�UR?��=���?�洲e?�0OV��W@5�q#@���t~@���P��@#>�Xn�@+���%R@2�G.�Er@9��H��@@�@��*@Ec�~�+@KB����@Q�Z�@U;9�[@Z�N^�@_��Ĺ\p@b�5��[�@ft�_/w�@js��ɝ@n��(}�@q쓲B��@t�r�u��@w�2cp�8@z۪p�1C@~^�^�0	@��㟺@��@o4@�JZ7��@���|���@�&^ce@����:�@�r�c�>�@�-��@��$̛|@�K�j�<@��Q�Z@�����'l@���BZ!�@�`*O$��@�P�L�B)@�Rq���Z@��S�!N�@�ßVz�	@���4�U�@��^M{�@@�'���!�@�X���K@��J2(P@����'@��Ϣ�@�pPP��@�����@�0�%�(q@��b|:��@��+GD        @��%��@;��'Z��@Z�?���@n��85��@{�����@�8��]o@�&�TN@�!Fh�x�@���D@��I��	'@��ce��@�5�j@�.@�����@�V�F-#�@�ˍ���@�hj���@��s3<�@�jܵ$�b@ƍQ��B@�ھ[��@����L@�>^���@ӵ)����@�m�~�H@�f&E�Ӻ@ܞ��yy@�
�@��T�]�@�҃p2�{@��?K���@��g �r7@�1*�� 5@�x��hJ@��l;���@𜼶��z@�ת��u@��=��@�_����6@��zV���@��^�,"�@�Rdr ��@��/�,�@��"�@�yK��Mu@��cR�C@�c�C��A sPr���A9_PO�Ab���AԒ�f&�A�$�h�A�G�8�Afop�AL����A97��jtA+��GA	$���zA
"�Q�A'�a��NA3Q�z�tAE�rZA_�M�IaA���N�P        ?J$���Bl?}d��,?� Xo���?�S�'�v�?��:����?�:����J?��M��(�?�=�x�hM?���-e�?构ԭ�?�u�u|V�?�Z��� ?�A�A╺?�d�E�N�?��Ce��@~3`��Y@<����@;p�_r@
~h�#�@_hH�P@��z}ͪ@KZO�@Q��F�@�)B(@gE�l@;�+��@ "yC�@!�j͍v�@#S�l�@%[CҚ@'XV��@)yl���j@+j�@.5�ь|@0j)�┚@1ύ�X�6@3K[W�\�@4����#@6�t��\�@8H���@:!��ޘ(@<QU�>@> �����@@$M���@AE��N1@Bu���I@C���-U�@E *d�[�@F[-�T��@G����h�@I=Jo�}:@JĦq��@L[$��K�@N% l�@O��x���@P���w�@Q��JP�@R�2��b�@S���y�@T��~���@U��oW6 @V�.WY��@Wܚ�z�D        ?`'.�?Mߞ�^0?ya��!j?�)��	��?������:?����2í?������?��m8�?���\�=�@	`\@5��r@d�tB�@%����@/&�^�-@5�]]�Ǿ@=���h�i@C��{@I���v� @Py���@T�t��D@Y����@_��mV�@c	�t���@f��dǷ�@j��C\�@o�m9���@rj)�~�@uKglSw�@xx]�	w�@{��'�|@������@��[�S@�?x��bg@���:LZ@�b�~mV@�E�Y��k@�b���p�@�]�"Ŀ@�)��	O @��;ٓ�@�%A��@�@�W-��&�@���Ȕw�@�*qJ��}@�ghK��@��E�Y�@�J�����@�ݡ�@����Y�@�J�ނ�@�'(Ƴd@���x��@�/��0�S@�/(�r��@�T�O|��@���rU@�ͣ�C��@�!W���@�����@����*@�}>X���@�5�%�@����6�        ?���E!?J2(�>x�?p��Gvܭ?��}�T?��.n�?��:���?ͷ��Q�?�������?�܇tg�?��˕&�@�!Z��'@MwW5��@%����"@$�f3*j@-�	���@4�p[a�K@;���a[@Bt2l@��@G�O�y�@Np��J�g@S�x�@W��He;�@\�z-�!�@aX��+l@d��-�<@h{�T���@l��E�@@p�S��x;@sB$����@v6]��U@y'�9�@|h�}�@��ZR0&@�Н�q@���_F�@�Z�J@��|(��F@�RZ���@�ٔ�@�y�^yؕ@�P*J�@���~]1X@�[@�L�>@�*��.�@��Dm�&@����T�@�*i�F�@�\*A��@�ӳ_�ϋ@�B�P�z@�E�r[i@��-�q�]@��"�@�W>t��@�����@�U�ڻ�@��'�E6@����1@z@�JO/\}�@���7���@�w7ֆ��@�n*���@�n�)���        ?�Si�V�@���@0\B)&=@C�V;,Y@S)��.��@_�!�m@h�����@p�5#,<H@v�K�3��@~"`�l@�+}�Lb@��tD��@�bj>x��@��.�4D�@�4����J@�A=�6@�@@��@��MZ�@�~���@�Ib�x��@�V>;�9#@����א@�#�-h��@�N5���@�7)��-�@�~����@��L�{@���<��V@�h��Z�@��ʏW�@�Z�b�@����@��
�c�7@�|���@�2�ƥ��@̇",�c�@�L��P@�էR5�@�?2�W�@ӿ�{<� @�XH�O@�	�C�X�@��9���W@ڻ�:�K�@ܾ���Cn@�ݕhI�@���_߸�@�tǳ��@���n��@�?����@�Q��P}@�Z�t�@�z�d�@�iv�O@��l��@�C`=��@����s@�b�i�@�O���q�@�E�d�W�@�D���8W@�L�,��
@�]���A�